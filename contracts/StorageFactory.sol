// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimpleStorage {
    // Basic Types: boolean, uint, int, address, bytes
    // visibility of this variable defaults to internal
    uint256 myFavoriteNumber;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // Person public brenda = Person(42, "Brenda");
    //Dynamic Array - no value in square brackets
    Person[] public listOfPeople;

    // Mapping or Dictionary 
    mapping(string => uint256) public nameToFavoriteNumber;


    // Static Array - contains a value in square brackets
    //Person [4] public listOfPeople;

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    // view, pure
    // keyword view is able to return the state of a variable 
    // keyword pure only returns values but not the value of a state variable

    function retrieve() public view returns(uint256) {
        return myFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

}


contract StorageFactory{
    // type visibility name
    // variable that will hold the instance of the deployed contract
    SimpleStorage public simpleStorage;

    function createSimpleStorageContract() public {
        // Able to deploy SimpleStorage contract
        // The new keyword allows solidity to know to deploy a contract
        simpleStorage = new SimpleStorage();

    }
}