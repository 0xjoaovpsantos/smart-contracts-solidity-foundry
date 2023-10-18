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

        // for (uint8 line = 0; line < 3; line++) {
        //     for (uint8 column = 0; column < 2; column++) {
        //         result[line][column] = x[line][column] + y[line][column];
        //     }
        // }

        result[0][0] = x[0][0] + y[0][0];
        result[0][1] = x[0][1] + y[0][1];
        result[1][0] = x[1][0] + y[1][0];
        result[1][1] = x[1][1] + y[1][1];
        result[2][0] = x[2][0] + y[2][0];
        result[2][1] = x[2][1] + y[2][1];

        return result;
    }
}
