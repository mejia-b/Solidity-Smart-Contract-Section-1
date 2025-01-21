// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// A better way to import since the file we import from can have several
// contracts and thus importing only those needed is more efficient.

import {SimpleStorage} from  "./SimpleStorage.sol";

contract StorageFactory{
    // type visibility name
    // An array that will hold instances of type SimpleStorage
    SimpleStorage[] public listOfSimpleStorageContracts;
    // Function is in charge of creating SimpleStorage Contracts and placing them in a list
    function createSimpleStorageContract() public {
        // Able to deploy SimpleStorage contract
        // The new keyword allows solidity to know to deploy a contract
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    // This funtion is able to take a specific index where an instance of a SimpleStorage contract could exist,
    // and then take in a new number.
    // Once the instance of that contract is retrieved it can then use the functions from SimpleStorage Contract
    // such as store() as used below. 
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorgeNumber) public {
        // Address
        // ABI - Application Binary Interface
        // retrieving a particular contract of type SimpleStorage from the given index
        listOfSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorgeNumber);

    }
    // In order to actually get the value that was stored we must use the retrieve function created over on 
    // SimpleStorage contract.
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}