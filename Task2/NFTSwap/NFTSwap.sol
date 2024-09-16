// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTSwap is Ownable {
    constructor() Ownable(msg.sender) {
        nftContract = ERC721(msg.sender);
    }

    struct Order {
        uint256 tokenId;
        address payable seller;
        uint256 price;
        bool sold;
    }

    ERC721 public immutable nftContract;
    mapping(uint256 => Order) public orders;

    modifier onlySeller(uint256 _tokenId) {
        require(msg.sender == orders[_tokenId].seller, "Not the seller");
        _;
    }

    modifier onlyOwnerOf(uint256 _tokenId) {
        require(nftContract.ownerOf(_tokenId) == msg.sender, "Not the owner");
        _;
    }

    function list(
        uint256 _tokenId,
        uint256 _price
    ) public onlyOwnerOf(_tokenId) {
        require(orders[_tokenId].seller == address(0), "Order already exists");
        orders[_tokenId] = Order(_tokenId, payable(msg.sender), _price, false);
    }

    function revoke(uint256 _tokenId) public onlySeller(_tokenId) {
        delete orders[_tokenId];
    }

    function updatePrice(
        uint256 _tokenId,
        uint256 _newPrice
    ) public onlySeller(_tokenId) {
        orders[_tokenId].price = _newPrice;
    }

    function purchase(uint256 _tokenId) public payable {
        Order memory order = orders[_tokenId];
        require(!order.sold, "NFT already sold");
        require(msg.value >= order.price, "Not enough ether sent");

        orders[_tokenId].sold = true;
        nftContract.transferFrom(order.seller, msg.sender, _tokenId);

        // Transfer the ether to the seller
        (bool success, ) = order.seller.call{value: msg.value}("");
        require(success, "Transfer failed");
    }

    function withdraw() public onlyOwner {
        (bool success, ) = msg.sender.call{value: address(this).balance}("");
        require(success, "Transfer failed");
    }

    receive() external payable {}
}
