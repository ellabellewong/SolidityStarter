// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract SarisariStore {
    address public owner;
    uint256 public productStock;

    constructor() {
        owner = msg.sender; // Set the deployer as the owner
    }

    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Access restricted to the owner only!");
        _;
    }

    function setStock(uint256 _stock) public onlyOwner {
        // Require the value to be positive
        require(_stock > 0, "Stock must be greater than zero");
        productStock = _stock;
    }

    function checkStockInvariant() public view {
        // Assert that the value is always less than 1 million
        assert(productStock < 1_000_000);
    }

    function validateProductID(uint256 _prodID) public pure {
        if (_prodID == 150) {
            revert("Product 150 is restricted and don't sell it!");
        }
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner cannot be the zero address");
        owner = newOwner;
    }
    function getStock() public view returns (uint256) {
        return productStock;
    }
}