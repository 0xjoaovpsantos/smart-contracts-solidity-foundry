// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Level4 {
    function solution(uint256 number) external pure returns (uint256) {

        for(uint256 index = 0; index <= number; index++){

            if( 2 ** (index + 1) > number){
                return 2 ** index;
            }
        }
    }
}
