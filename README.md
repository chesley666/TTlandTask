# TinTinLand课程作业  
[课程介绍](https://attractive-spade-1e3.notion.site/3c55c15d535c43f7a236183af40cf76b)
[视频链接](https://www.youtube.com/playlist?list=PLCv99tqIzSwk25zjcb9tJo9RX2anLfPsN)

# 第一课  区块链101
后续补充

# 第二课  solidity入门  
[第二课作业](https://wj.qq.com/s2/15328895/mr9v/)
## task2-1 插入排序  
使用 Solidity 实现一个插入排序算法  
排序算法解决的问题是将无序的一组数字，例如[2, 5, 3, 1]，从小到大依次排列好。  
插入排序（InsertionSort）是最简单的一种排序算法，也是很多人学习的第一个算法。  
它的思路很简单，从前往后，依次将每一个数和排在他前面的数字比大小，如果比前面的数字小，就互换位置。  

## task2-2 简易的NTF Swap  
使用 Solidity 实现一个 NFT Swap  
利用智能合约搭建一个零手续费的去中心化 NFT 交易所，主要逻辑：  
- 卖家：出售 NFT 的一方，可以挂单 list、撤单 revoke、修改价格 update。  
- 买家：购买 NFT 的一方，可以购买 purchase。  
- 订单：卖家发布的 NFT 链上订单，一个系列的同一 tokenId 最多存在一个订单，其中包含挂单价格 price 和持有人 owner 信息。

当一个订单交易完成或被撤单后，其中信息清零。  

# 第三课  
[第三课作业](https://wj.qq.com/s2/15368767/0g3d/)
## task3-1 实现weth  
实现一个 WETH，将 ETH 包装成 ERC20

WETH (Wrapped ETH) 是 ETH 的包装版本。由于以太币本身并不符合 ERC20 标准，导致与其他代币之间的互操作性较弱，难以用于去中心化应用程序（dApps）。

本练习要求实现一个符合 ERC20 标准的 WETH ，它比普通的 ERC20 多了两个功能：存款和取款，通过这两个功能，WETH 可以 1:1 兑换ETH。

## task3-2 实现uniswap  
实现一个基于常数乘积的 AMM 流动性池

自动做市商（Automated Market Maker，AMM）是一种智能合约，它允许数字资产之间的去中心化交易。AMM 的引入开创了一种全新的交易方式，无需传统的买家和卖家进行订单匹配，而是通过一种预设的数学公式（比如，常数乘积公式）创建一个流动性池，使得用户可以随时进行交易。

本练习只要求实现一个 WETH 的流动性池，初始化时确定另一种 ERC20 代币。

PS：可以参考 Uniswap V2 版本

# 第四课  
## task4  


