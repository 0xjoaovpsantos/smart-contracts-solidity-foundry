// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract DepositWithdrawBalanceStudy {
    uint public balanceReceived;

    function deposit() public payable {
        balanceReceived += msg.value;
    }

    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawToAdress(address payable to) public {
        to.transfer(getContractBalance());
    }
}
