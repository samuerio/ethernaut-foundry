// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "../instances/DoubleEntryPoint.sol";

contract AlertBot is IDetectionBot {
    address private cryptoVault;

    constructor(address _cryptoVault) public {
        cryptoVault = _cryptoVault;
    }

    function handleTransaction(address user, bytes calldata msgData) external override {

        address origSender;
        assembly {
            origSender := calldataload(0xa8)
        }

        if(origSender == cryptoVault) {
            IForta(msg.sender).raiseAlert(user);
        }
    }
}

