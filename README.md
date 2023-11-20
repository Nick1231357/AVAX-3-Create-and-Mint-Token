# Project Create and Mint Token

This Solidity program is a simple "Create and Mint Token" program that demonstrates the contract owner able to mint tokens to a provided address and any user should be able to burn and transfer tokens.

## Description

This code defines an ERC20 token contract named Token. The contract has two main functions:
  
  2.mintTokens(address account, uint256 amount): This function mints new tokens to the specified account. Only the contract owner can call this function.
  
  3.burnTokens(address account, uint256 amount): This function burns tokens from the specified account.

The contract also has an Owner address variable that stores the address of the contract deployer. This address is used to control who can mint and burn tokens.

## Getting Started

### Executing program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:

```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";


contract Token is ERC20 {
    address public Owner;
    constructor(string memory name, string memory symbol, uint256 initialSupply) ERC20(name, symbol) {
        Owner =msg.sender;
        _mint(msg.sender, initialSupply);
    }

    function mintTokens(address account, uint256 amount) public {
        require(msg.sender == Owner, "Access Denied: Only the Owner can access this.");
        _mint(account, amount);
    }

    function burnTokens(address account, uint256 amount) public {
        _burn(account, amount);
    }
}
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile types-of-functions.sol" button.

After compilation, the contract can be deployed by clicking the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "types-of-functions" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, click on the "types-of-functions" contract first on the left-hand sidebar, you can interact with it by clicking the different variables to see different information about the created token. You can also mint, burn, and transfer tokens, simply select the appropriate accounts when executing these functions to avoid errors.


## Authors

Contributors names and contact info

John Dominic S. Contreras  
202010368@fit.edu.ph


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
