// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Level7 {
    // uint256 public number;

    // function setNumber(uint256 newNumber) public {
    //     number = newNumber;
    // }

    // function increment() public {
    //     number++;
    // }

    function solution(address addr) external view returns (uint256 codeSize) {
        assembly {
            let size := extcodesize(addr)
            mstore(0x0, size)
            return(0x0, 32)
        }
    }
}
