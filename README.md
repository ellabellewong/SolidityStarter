# SolidityStarter
This is a basic Ethereum smart contract written in Solidity, representing a simple store called `SarisariStore`.  It demonstrates essential Solidity features such as ownership control, error handling (require, assert, and revert), and basic state management.

**Features**
- Ownership: The contract enforces that certain critical functions can only be executed by the contract owner.
- Stock Management: The owner can set the product stock level, which must be positive. The contract also includes a function to assert that the stock level remains below a specified threshold.
- Product ID Validation: Demonstrates the use of the revert function to reject certain product IDs.
- Ownership Transfer: The contract allows the owner to transfer ownership to a new address.

**Contract Functions**

`constructor`
: Sets the initial owner of the contract to the address that deploys the contract.

`onlyOwner` modifier
: A modifier that restricts access to functions only to the contract owner.

`setValue(uint256 _stock)`
: Sets the produc stock level, but only if the stock level is positive. Can only be called by the contract owner.
Parameters:
`_stock`: The new stock level to be set.
Error Handling: Requires _stock > 0.

`checkStockInvariant()`
: A function to check the product stock by asserting that the current value is less than 1 million. If the assertion fails, the transaction is reverted.

`validayeProductID(uint256 _prodID)`
: Validates the given product ID. It uses revert to reject the product ID 150 (Soap), which is restricted.
Parameters:
`_prodID`: the product ID is to be validates

`transferOwnership(address newOwner)`
: Allows the current owner to transfer ownership to a new address.
Parameters:
`newOwner`: The address to which ownership is being transferred.
Error Handling: Requires newOwner not to be the zero address.

**Error Handling**
The contract uses the following mechanisms to handle errors:
- require: Used to validate user inputs and conditions before proceeding. If the condition is not met, the transaction reverts with an error message. Example: Ensuring the stock value is positive.
- assert: Used for internal checks that should never fail. If the condition is violated, it indicates a serious issue, and the transaction is reverted with a panic error. Example: Ensuring that the product stock is below 1,000,000.
- revert: Used for explicitly reverting the transaction with a custom error message. Example: Rejecting product ID 150 (Soap) to prevent its sale.
