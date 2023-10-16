// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/////////////////// ☆☆ extropyio ☆☆ /////////////////////
//     -漫~*'¨¯¨'*·舞~ solidity ctf ~舞·*'¨¯¨'*~漫-     //
/////////////////////////////////////////////////////////

/*
  interface Isolution {
    function solution(uint256[2][3] calldata firstArray, uint256[2][3] calldata secondArray) external pure returns (uint256[2][3] memory finalArray);
  }
*/

contract Level1 {
    function solution(uint256[2][3] calldata x, uint256[2][3] calldata y)
        external
        pure
        returns (uint256[2][3] memory)
    {
        uint256[2][3] memory result;

        for (uint8 line = 0; line < 3; line++) {
            for (uint8 column = 0; column < 2; column++) {
                result[line][column] = x[line][column] + y[line][column];
            }
        }

        return result;
    }
}
