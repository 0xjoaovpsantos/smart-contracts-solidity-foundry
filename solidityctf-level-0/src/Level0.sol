// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

/////////////////// ☆☆ extropyio ☆☆ /////////////////////
//     -漫~*'¨¯¨'*·舞~ solidity ctf ~舞·*'¨¯¨'*~漫-     //
/////////////////////////////////////////////////////////

/*
    interface Isolution {
        function solution() external pure returns (uint8);
    }
*/

contract Level0 {
    function solution() external pure returns (uint8) {
        assembly {
            mstore(0, 255)
            return(0, 32)
        }
    }
}
