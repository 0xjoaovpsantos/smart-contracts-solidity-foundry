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

    function solution(uint256[10] calldata unsortedArray) external returns (uint256[10] memory sortedArray){

        sortedArray = unsortedArray;
        
        for(uint8 line = 0; line < 9; line++){
            for(uint8 line2 = 0; line2 < 9; line2++){
                if(sortedArray[line2] > sortedArray[line2 + 1]){
                    uint256 item = sortedArray[line2 + 1];

                    assembly {
                        mstore(add(sortedArray, mul(0x20, add(line2, 1))), mload(add(sortedArray, mul(0x20, line2))))
                        mstore(add(sortedArray, mul(0x20, line2)), item)
                    }
                }
            }
        }
   
    }

}
