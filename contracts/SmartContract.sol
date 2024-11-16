// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract SmartContract {
    address public owner;
    uint256 public value;

    constructor() {
        owner = msg.sender; // Set the deployer as the owner
    }

    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    // Function to set a new value with a require statement
    function setValue(uint256 _value) public onlyOwner {
        // Require the value to be positive
        require(_value > 0, "Value must be greater than zero");
        value = _value;
    }

    // Function to test the assert statement
    function checkInvariant() public view {
        // Assert that the value is always less than 1 million
        assert(value < 1_000_000);
    }

    // Function to demonstrate revert
    function revertExample(uint256 _value) public pure {
        // Revert if the value is equal to 42
        if (_value == 42) {
            revert("The value 42 is not allowed");
        }
    }

    // Function to transfer ownership
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner cannot be the zero address");
        owner = newOwner;
    }
}