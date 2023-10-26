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

        int256 response2 = level5.solution(4, 3);
        assertEq(response2, 4);

        int256 response3 = level5.solution(4, 4);
        assertEq(response3, 4);
    }

    // function testSetNumber(uint256 x) public {
    //     counter.setNumber(x);
    //     assertEq(counter.number(), x);
    // }
}
