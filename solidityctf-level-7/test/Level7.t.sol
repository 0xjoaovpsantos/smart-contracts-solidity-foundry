// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Level7} from "../src/Level7.sol";

contract CounterTest is Test {
    Level7 public level7;

    function setUp() public {
        level7 = new Level7();
        // counter.setNumber(0);
    }

    function solution() public {
        assertEq(level7.solution(0xcAB40A0022B848D7a2D2F40D05C76da8F90260F8), 32);
    }

    // function testSetNumber(uint256 x) public {
    //     counter.setNumber(x);
    //     assertEq(counter.number(), x);
    // }
}
