// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import 'forge-std/console.sol';

contract SmartWalletWithGuardiansAndProposeNewOwner {
    address payable owner;
    address nextOwner;

    uint guardianResetCount;
    uint public confirmationsFromGuardiansForReset = 3;

    mapping(address => bool) isAllowedToSend;
    mapping(address => uint) allowance;

    mapping(address => bool) guardians;
    mapping(address => mapping(address => bool)) newxtGuardianVoteBool;

    constructor(address _owner){
        owner = payable(_owner);
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function setGuardians(address _guardian, bool _isGuardian) public{
        require(msg.sender == owner, "You are not the owner, aborting");

        guardians[_guardian] = _isGuardian;
    }

    function proposeNewOwner(address payable _newOwner) public{
        require(guardians[msg.sender], "You are not guardian of this wallet, aborting");
        require(newxtGuardianVoteBool[_newOwner][msg.sender] == false, "You already voted, aborting");

        if(_newOwner != nextOwner){
            nextOwner = _newOwner;
            guardianResetCount = 0;
        }

        guardianResetCount++;

        if(guardianResetCount >= confirmationsFromGuardiansForReset){
            owner = _newOwner;
            nextOwner = payable(address(0));
        }
    }

    function setAllowance(address _for, uint _amount) public {
        console.log(owner);
        console.log(msg.sender);
        require(msg.sender == owner, "You are not the owner, aborting");
        allowance[_for] = _amount;

        if(_amount > 0){
            isAllowedToSend[_for] = true;
        }else{
            isAllowedToSend[_for] = false;
        }
    }

    function transfer(address payable _to, uint _amount, bytes memory payload) payable public returns(bytes memory) {
        if(msg.sender != owner){
            require(isAllowedToSend[_to], "Your are not allowed to send anything from this smart contract, aborting");
            require(allowance[_to] >= _amount, "You are trying to send more than you are allowed to, aborting");

            allowance[_to] -= _amount;
        }

        (bool success, bytes memory resultData) = _to.call{value: _amount}(payload);

        require(success, "Aborting, call was not successful");

        return resultData;

    }
}
