// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Level4} from "../src/Level4.sol";

contract Level4Test is Test {
    Level4 public level4;

    function setUp() public {
        level4 = new Level4();
    }

    function testIncrement() public {
        uint256 response1 = level4.solution(1);
        assertEq(response1, 1);

        uint256 response2 = level4.solution(10);
        assertEq(response2, 8);

        uint256 response3 = level4.solution(21);
        assertEq(response3, 16);

        uint256 response4 = level4.solution(2048);
        assertEq(response4, 2048);

        uint256 response5 = level4.solution(9223372036854775808);
        assertEq(response5, 9223372036854775808);

        uint256 response6 = level4.solution(0xffffffff);
        assertEq(response6, 2147483648);
    }

    // function testSetNumber(uint256 x) public {
    //     counter.setNumber(x);
    //     assertEq(counter.number(), x);
    // }
}
