// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/////////////////// ☆☆ extropyio ☆☆ /////////////////////
//     -漫~*'¨¯¨'*·舞~ solidity ctf ~舞·*'¨¯¨'*~漫-     //
/////////////////////////////////////////////////////////

/* 
  interface Isolution2 {
    function solution(uint256[10] calldata unsortedArray) external returns (uint256[10] memory sortedArray);
  }
*/

contract Level2 {
    function solution(uint256[10] calldata unsortedArray) external returns (uint256[10] memory sortedArray) {
        sortedArray = unsortedArray;

        assembly {
            for { let line := 0 } lt(line, 9) { line := add(line, 1) } {
                for { let line2 := 0 } lt(line2, 9) { line2 := add(line2, 1) } {
                    if lt(mload(add(sortedArray, mul(0x20, add(line2, 1)))), mload(add(sortedArray, mul(0x20, line2))))
                    {
                        let item := mload(add(sortedArray, mul(0x20, add(line2, 1))))
                        mstore(add(sortedArray, mul(0x20, add(line2, 1))), mload(add(sortedArray, mul(0x20, line2))))
                        mstore(add(sortedArray, mul(0x20, line2)), item)
                    }
                }
            }
        }
    }
}
