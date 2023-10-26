// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Level5 {
    function solution(int256 a, int256 b) external pure returns (int256) {
        int256 sum = a + b;

        if (sum % 2 != 0) {
            sum = sum + 1;
        }

        int256 response = sum / 2;
        return response;
    }
}
