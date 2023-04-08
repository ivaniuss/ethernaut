// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/HelloEthernaut.sol";

contract HelloEthernautTest is Test {
    Instance public target;

    function setUp() public {
        target = new Instance("10");
    }

    function testAttack() public {
        target.authenticate(target.password());
        bool value = target.getCleared();
        assertEq(value, true);
    }
}
