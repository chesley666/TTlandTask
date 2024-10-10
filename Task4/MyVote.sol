SPDX-License-Identifier:GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
/// @title 委托投票
constract Ballot{
  //选民
  struct Voter{
    uint weight;
    bool voted;
    address delegate;
    uint vote;
  }
  //提案类型
  struct Proposal{
    bytes32 name;
    uint voteCount;
  }

  address public chairperson;
  mappling(address => Voter) public voters;

  Proposal[] public proposals;

  construct(bytes32[] memory proposalNames) {
    //task4-1
    require(startTime >= block.timestamp && endTime >= startTime,"time error");
    i_startTime = startTime;
    i_endTime = endTime;
    
    chairperson = msg.sender;
    voters[chairperson].weight = 1;

    for (uint i=0; i<proposalNames.length; i++){
      proposals.push(Proposa({ name: proposalNames[i],voteCount:0})
    };
  }

  function giveRightToVote(address voter) external {
    require(msg.sender == chairperson,"Only chairperson can give right to vote.");
    require(!voters[voter].voted,"The voter already voted.");
    require(voters[voter].weight==0);
    voters[voter].weight=1;
  }

  //task4-2
  function setVoterWeith(address voter, uint256 weight) external {
    require(msg.sender == chairpreson,"only chairperson can give right to vote");
    require(!voters[voter].voted,"Alread voted");
    require(voters[voter].weight != 0,"give right to vote first");
    require(weight != 0,"weight error");

    Voter storage v = voters[voter];
    v.weight = weight;
  }
  
  function delegate(address to) external {
    Voter storage sender = voters[msg.sender];
    require(sender.weight != 0, "No right to vote");
    require(sender.voted, "Already voted.");
    require(to != msg.sender, "self-delegation is disallowed");
    while(voters[to].delegate != address(0)){
      to = voters[to].delegate;
      require( to != msg.sender,"found loop in deletgation");
    }

    Voter storage delegate_ = voters[to];

    require(delegate_ weight >=1);

    sender.voted = true;
    sender.delegate = to;

    if(delegate_.voted){
      proposals[delegate_.vote].voteCount += sender.weight;
    } else {
      delegate_.weight += sender.weight;
    }
  }

  function vote(uint proposal) external {
    Voter storage sender = voters[msg.sender];
    require(sender.weight!=0,"No right to vote");
    require(!sender.voted,"Already voted");
    sender.voted = true;
    sender.vote = proposal;

    proposals[proposal].voteCount += sender.weight;
  }

  function winningProposal() public view returns (uint winningProposal_){
    uint winningVoteCount = 0;
    for (uint p=0; p<proposals.length; p++){
      if (proposals[p].voteCount>winningVoteCount){
        winningVoteCount = proposals[p].voteCount;
        winningProposal_ = p;
      }
    }
  }

  function winnerName() external view returns (bytes32 winnerName_){
    winnerName_ = proposals[winningProposal()].name;
  }

  
}
