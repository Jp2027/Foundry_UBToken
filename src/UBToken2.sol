// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";


contract UBTokenEasy is ERC20{
    
    constructor(string memory name, string memory sysmbol, uint256 initialSupply)ERC20(name,sysmbol){
        _mint(msg.sender, initialSupply);
    }
}