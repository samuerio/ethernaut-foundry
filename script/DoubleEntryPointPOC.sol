// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "../instances/DoubleEntryPoint.sol";
import "../src/AlertBot.sol";

contract POC is Script {

     DoubleEntryPoint target = DoubleEntryPoint(0xA6cd586D919BE276Bf08abCDA70613129064D54E);
    function run() external{
        vm.startBroadcast();

        AlertBot bot = new AlertBot(target.cryptoVault());
        target.forta().setDetectionBot(address(bot));

        /* CryptoVault vault = CryptoVault(target.cryptoVault()); */
        /* address DET = address(vault.underlying()); */
        /* address LGT = target.delegatedFrom(); */
        /* vault.sweepToken(IERC20(LGT)); //calling sweepToken with LGT address on the CryptoVault */
        
        vm.stopBroadcast();
    }
}

