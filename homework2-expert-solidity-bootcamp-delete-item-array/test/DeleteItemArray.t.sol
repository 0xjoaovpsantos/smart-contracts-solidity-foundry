// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {DeleteItemArray} from "../src/DeleteItemArray.sol";

contract DeleteItemArrayTest is Test {
    DeleteItemArray public deleteItemArray;

    function setUp() public {
        uint256[] memory myArray = new uint256[](7);
        myArray[0] = 0;
        myArray[1] = 1;
        myArray[2] = 2;
        myArray[3] = 3;
        myArray[4] = 4;
        myArray[5] = 5;
        myArray[6] = 6;
        deleteItemArray = new DeleteItemArray(myArray);
    }

    function testRemoveItemAtIndexWithOrder() public {
        deleteItemArray.removeItemAtIndexWithOrder(3);

        uint256[] memory myArray = deleteItemArray.getMyArray();

        uint256[] memory expectedArray = new uint256[](6);

        expectedArray[0] = 0;
        expectedArray[1] = 1;
        expectedArray[2] = 2;
        expectedArray[3] = 4;
        expectedArray[4] = 5;
        expectedArray[5] = 6;

        assertEq(myArray, expectedArray);
    }

    function testRemoveItemAtIndexWithoutOrder() public {
        deleteItemArray.removeItemAtIndexWithoutOrder(3);

        uint256[] memory myArray = deleteItemArray.getMyArray();

        uint256[] memory expectedArray = new uint256[](6);

        expectedArray[0] = 0;
        expectedArray[1] = 1;
        expectedArray[2] = 2;
        expectedArray[3] = 6;
        expectedArray[4] = 4;
        expectedArray[5] = 5;

        assertEq(myArray, expectedArray);
    }
}
