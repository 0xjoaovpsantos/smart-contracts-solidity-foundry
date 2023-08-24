// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract ETHPool {

    address owner;
    uint totalStaked;
    uint totalRewards;
    mapping(address => uint) totalStakeByUser;

    constructor() {
        owner = msg.sender;
    }

    function getContractBalance() public view returns (uint){
        return address(this).balance;
    }

    function stake() public payable {
        totalStaked += msg.value;
        totalStakeByUser[msg.sender] += msg.value;
    }

    function depositRewards() public payable {
        totalRewards += msg.value;
    }

    function withdraw() public payable {
        uint userStakedAmount = totalStakeByUser[msg.sender];
        uint userWithdrawAmount = calculateStakeAndRewards();
        //TODO: Update totalStaked and totalRewards new values

        (bool success, ) = payable(msg.sender).call{value: userWithdrawAmount}("");

        require(success, "Aborting");
    }

    function calculateStakeAndRewards() public returns (uint){
        uint percentageUserRewards = ((totalStakeByUser[msg.sender] * 100) / totalStaked);

        uint userRewards = ((totalRewards + totalStaked) * percentageUserRewards) / 100;

        return userRewards;
    }
}
