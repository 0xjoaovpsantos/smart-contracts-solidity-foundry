// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {DepositWithdrawBalanceStudy} from "../src/DepositWithdrawBalanceStudy.sol";

contract DepositWithdrawBalanceStudyest is Test {
    DepositWithdrawBalanceStudy public depositWithdrawBalanceStudy;
    uint ethereumDecimals = 10**18;
    address sender;

    function setUp() public {
        depositWithdrawBalanceStudy = new DepositWithdrawBalanceStudy();
        sender = vm.addr(1);
        vm.deal(sender, 10 ether);
    }

    function testDeposit() public {
        vm.startBroadcast(sender);

        assertEq(0 / ethereumDecimals, 0);

        depositWithdrawBalanceStudy.deposit{value: 1 ether}();

        uint balance = depositWithdrawBalanceStudy.getContractBalance();
        assertEq(balance / ethereumDecimals, 1);

        assertEq(sender.balance / ethereumDecimals, 9);

        vm.stopBroadcast();
    }

    function testWithdrawAll() public {
        vm.startBroadcast(sender);

        depositWithdrawBalanceStudy.deposit{value: 1 ether }();

        assertEq(sender.balance / ethereumDecimals, 9);

        address payable to = payable(sender);
        depositWithdrawBalanceStudy.withdrawToAdress(to);
        
        assertEq(sender.balance / ethereumDecimals, 10);
        vm.stopBroadcast();
    }

    function testGetContrctBalance() public {
        vm.startBroadcast(sender);

        depositWithdrawBalanceStudy.deposit{value: 1 ether }();


        assertEq(depositWithdrawBalanceStudy.getContractBalance() / ethereumDecimals, 1);

        address payable to = payable(sender);
        depositWithdrawBalanceStudy.withdrawToAdress(to);
        
        assertEq(depositWithdrawBalanceStudy.getContractBalance() / ethereumDecimals, 0);
        vm.stopBroadcast();
    }
}
