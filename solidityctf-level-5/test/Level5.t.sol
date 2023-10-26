// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Level5} from "../src/Level5.sol";

contract level5Test is Test {
    Level5 public level5;

    function setUp() public {
        level5 = new Level5();
    }

    function testIncrement() public {
        int256 response1 = level5.solution(5, 2);
        assertEq(response1, 4);


        int256 response2 = level5.solution(10, 30);
        assertEq(response2, 20);

        int256 response3 = level5.solution(13, 2);
        assertEq(response3, 8);

         int256 response4 = level5.solution(-5, 2);
        assertEq(response4, -2);
    }

}
