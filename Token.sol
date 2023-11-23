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
    
    function transferTokens(address _from, uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "You do not have enough Tokens!");
        approve(msg.sender, _value);
        transferFrom(msg.sender, _from, _value);
    }

}
