// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";

import {SmartWalletWithGuardians} from "../src/SmartWalletWithGuardians.sol";

contract ScriptSmartWalletWithGuardians is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        new SmartWalletWithGuardians();
        vm.stopBroadcast();
    }
}
