// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/CoinFlip.sol";

contract MyScript is Script {
    function run() external {
        vm.startBroadcast();
        CoinFlip target = new CoinFlip();
        vm.stopBroadcast();
    }
}
