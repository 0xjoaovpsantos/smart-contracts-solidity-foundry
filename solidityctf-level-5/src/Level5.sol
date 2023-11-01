// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

contract Level5 {
    
    function solution(int256 a, int256 b) external pure returns (int256) {

        if(a % 2 == 1 || b % 2 == 1){
            return (a / 2) + (b / 2) + 1;
        }else{
            return (a / 2) + (b / 2);
        }

   
    }
}
