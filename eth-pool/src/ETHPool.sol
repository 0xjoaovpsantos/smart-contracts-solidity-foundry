// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract ETHPool {

    address owner;
    uint totalStaked;
    uint totalRewards;

    constructor() {
        owner = msg.sender;
    }

    function getContractBalance() public view returns (uint){
        return address(this).balance;
    }

    function stake() public payable {
        totalStaked += msg.value;
    }

    function depositRewards() public payable {
        totalRewards += msg.value;
    }
}
