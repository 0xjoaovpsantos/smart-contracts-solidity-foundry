// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Level3} from "../src/Level3.sol";

contract Level3Test is Test {
    Level3 public level3;

    function setUp() public {
        level3 = new Level3();
    }

    function testSolution() public {
        bytes memory packed = abi.encodePacked(uint16(14), bool(true), bytes6("joao"));
        (uint16 a, bool b, bytes6 c) = level3.solution(packed);

        assertEq(a, uint16(14));
        assertEq(b, true);

        assertEq(c, bytes6("joao"));
    }
}
