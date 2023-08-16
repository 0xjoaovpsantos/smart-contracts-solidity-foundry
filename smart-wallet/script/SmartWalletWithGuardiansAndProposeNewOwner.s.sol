// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";

import {SmartWalletWithGuardiansAndProposeNewOwner} from "../src/SmartWalletWithGuardiansAndProposeNewOwner.sol";

contract ScriptSmartWalletWithGuardians is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        new SmartWalletWithGuardiansAndProposeNewOwner();
        vm.stopBroadcast();
    }
}
