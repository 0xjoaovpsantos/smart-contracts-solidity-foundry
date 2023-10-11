// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console.sol";

contract DeleteItemArray {
    uint256[] myArray;

    constructor(uint256[] memory _array) {
        myArray = _array;
    }

    function verifyValidInput(uint256 index) private view {
        require(myArray.length > 0, "Array should at least one number");
        require(index >= 0 && index < myArray.length, "Index out of bounds");
    }

    function removeItemAtIndexWithoutOrder(uint256 index) public {
        verifyValidInput(index);

        myArray[index] = myArray[myArray.length - 1];

        myArray.pop();
    }

    function removeItemAtIndexWithOrder(uint256 index) public {
        verifyValidInput(index);

        for (uint256 i = index; i < myArray.length - 1; i++) {
            myArray[i] = myArray[i + 1];
        }

        myArray.pop();
    }

    function getMyArray() public view returns (uint256[] memory) {
        return myArray;
    }

    function consoleLogMyArray() public view {
        for (uint256 i = 0; i < myArray.length; i++) {
            console.log(myArray[i]);
        }
    }
}
