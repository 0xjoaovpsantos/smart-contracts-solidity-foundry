//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./Owned.sol";
import "./LibraryLock.sol";
import "./Proxiable.sol";

contract MyContract is Owned, LibraryLock, Proxiable {
    uint public count;

    function construct1()  public{
        initialize();
        setOwner(msg.sender);
    }

    function updateCode(address newCode) public onlyOwner delegatedOnly() {
        updateCodeAddress(newCode);
    }

    function increment() public {
        count++;
    }

    function decrease() public {
        count--;
    }
}