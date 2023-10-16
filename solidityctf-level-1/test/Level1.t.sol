// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Level1} from "../src/Level1.sol";

contract CounterTest is Test {
    Level1 public level1;

    function setUp() public {
        level1 = new Level1();
    }

    function testSolution() public {
        uint256[2][3] memory arg1 = [[uint256(1), 16], [uint256(20), 13], [uint256(4), 300]];
        uint256[2][3] memory arg2 = [[uint256(32), 65], [uint256(80), 200], [uint256(23), 1]];

        uint256[2][3] memory response = level1.solution(arg1, arg2);

        assertEq(response[0][0], 33);
        assertEq(response[0][1], 81);

        assertEq(response[1][0], 100);
        assertEq(response[1][1], 213);

        assertEq(response[2][0], 27);
        assertEq(response[2][1], 301);
    }
}
