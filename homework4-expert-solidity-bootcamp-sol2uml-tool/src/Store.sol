// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Store {

    struct payments {
        uint256 amount;
        uint256 finalAmount;
        uint256 initialAmount;

        address sender;
        bool valid;
        uint8 paymentType;
        bool checked;
        
        address receiver;
    }

    uint256 public number;
    mapping (address=>uint256) balances;

    uint8 index;
    bool flag1;
    bool flag2;
    address admin;
    bool flag3;
    
    address admin2;

    payments[8] topPayments;


    constructor(){

    }


    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}