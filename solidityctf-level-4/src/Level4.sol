// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Level4 {
    function solution(uint256 number) external pure returns (uint256) {

           uint256 result;

        for(uint256 index = 0; index <= number; index++){

            if(index == 0){
                assembly {
                    result := 1
                }
            } else {
                assembly {
                    result := add(result, result)
                }          
            }

            if(result > number) {
                return result / 2;
            }
        }
    }
}
