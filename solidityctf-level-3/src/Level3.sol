// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console.sol";

contract Level3 {
    function solution(bytes memory packed) external returns (uint16 a, bool b, bytes6 c) {
        assembly {
            a := mload(add(packed, 0x02))
            b := mload(add(packed, 0x22))
            c := mload(add(packed, 0x23))
        }
    }
}
