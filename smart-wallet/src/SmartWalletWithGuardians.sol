// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract SmartWalletWithGuardians {
    address owner;

    mapping(address => bool) isAllowedToSend;
    mapping(address => uint) allowance;

    mapping(address => bool) guardians;


    constructor(){
        owner = address(this);
    }

    function setGuardians(address _guardian, bool _isGuardian) public {
        require(msg.sender == owner, "You are not the owner, aborting");

        guardians[_guardian] = _isGuardian;
    }

    // function proposeNewOwner(address newOwner){
    //     require(guardians[msg.sender], "You are not guardian of this wallet, aborting");
    // }

    function setAllowance(address _for, uint _amount) public {
        require(msg.sender == owner, "You are not the owner, aborting");
        allowance[_for] = _amount;

        if(_amount > 0){
            isAllowedToSend[_for] = true;
        }else{
            isAllowedToSend[_for] = false;
        }
    }

    function transfer(address payable _to, uint _amount) payable public returns(bytes memory) {
        if(msg.sender != owner){
            require(isAllowedToSend[_to], "Your are not allowed to send anything from this smart contract, aborting");
            require(allowance[_to] >= _amount, "You are trying to send more than you are allowed to, aborting");

            allowance[_to] -= _amount;
        }

        (bool success, bytes memory resultData) = _to.call{value: _amount}("");

        require(success, "Aborting, call was not successful");

        return resultData;

    }
}
