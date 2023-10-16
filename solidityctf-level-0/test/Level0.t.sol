// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import {Test, console2} from "forge-std/Test.sol";
import {Level0} from "../src/Level0.sol";

contract Level0Test is Test {
    function testSolution() public {
        Level0 level0 = new Level0();

        uint8 result = level0.solution();

        assertEq(result, 255);
    }
}
