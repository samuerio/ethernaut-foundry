pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Destructive.sol";

contract DestructiveScript is Script {

    function run() external{
        vm.startBroadcast();
        Destructive des = new Destructive();
        console.log(address(des));
        vm.stopBroadcast();
    }
}
