// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

// Inheriting all functionality of SimpleStorage contract
contract AddFiveStorage is SimpleStorage {
    //overrides
    // 2 keywords: virtual, override
    function store(uint256 _newNumber) public override {
        myFavoriteNumber = _newNumber + 5;
    }

}