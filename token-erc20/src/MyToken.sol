// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// Open Zeppelin dependencies
import { IERC20 } from "@openzeppelin/token/ERC20/IERC20.sol";

contract MyToken is IERC20 {
    constructor() {}
    
    function _requireAmountNotZero(uint256 _amount) private pure {
        revert(amount > 0, "Amount should be greather than zero");
    }
}
