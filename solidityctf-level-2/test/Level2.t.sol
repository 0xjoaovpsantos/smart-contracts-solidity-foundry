// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Level2} from "../src/Level2.sol";

contract Level2Test is Test {
    Level2 public level2;

    function setUp() public {
        level2 = new Level2();
    }

    function testSolution() public {
        uint256[10] memory unsortedArray = [uint256(10), 8, 3, 54, 2, 1, 5, 10, 4, 5];

        uint256[10] memory expectedResponse = [uint256(1), 2, 3, 4, 5, 5, 8, 10, 10, 54];

        uint256[10] memory response = level2.solution(unsortedArray);

        assertEq(response[0], expectedResponse[0]);
        assertEq(response[1], expectedResponse[1]);
        assertEq(response[2], expectedResponse[2]);
        assertEq(response[3], expectedResponse[3]);
        assertEq(response[4], expectedResponse[4]);
        assertEq(response[5], expectedResponse[5]);
        assertEq(response[6], expectedResponse[6]);
        assertEq(response[7], expectedResponse[7]);
        assertEq(response[8], expectedResponse[8]);
        assertEq(response[9], expectedResponse[9]);
    }
   
}
