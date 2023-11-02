// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Level4 {
    function solution(uint256 number) external pure returns (uint256) {

           uint256 result;
           uint256 inputNumber = number;
            uint256 test = 115792089237316195423570985008687907853269984665640564039457584007913129639935;

           if(number == 1){
            return 1;
           }

        assembly {
            for{let index := 0} lt(index, test) {index := add(index, 1)}{
                if eq(index, 0){
                    result := 1
                }

                if gt(index, 0){
                    result := add(result, result)
                }

                if gt(result, inputNumber){
                    mstore(0x0, div(result, 2))
                    return(0x0, 32)
                }
            }
        }

        // for(uint256 index = 0; index <= number; index++){

        //     if(index == 0){
        //         assembly {
        //             result := 1
        //         }
        //     } else {
        //         assembly {
        //             result := add(result, result)
        //         }          
        //     }

        //     if(result > number) {
        //         return result / 2;
        //     }

        //     assembly {
        //         if gt(result, inputNumber){
        //             mstore(0x0, div(result, 2))
        //             return(0x0, 32)
        //         }
        //     }
        // }



    }
}
