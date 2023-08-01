// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Destructive {
    function killed() external {
        selfdestruct(payable(address(0)));
    }
    
}

