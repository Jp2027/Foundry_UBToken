// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {IERC20} from "./interfaces/IERC20.sol";

contract UBToken is IERC20{
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address=> uint256)) public allowance;

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _totalSupply){
        totalSupply = _totalSupply;
        balanceOf[msg.sender] = _totalSupply;
        name=_name;
        symbol=_symbol;
        decimals=_decimals;
    }


    function transfer(address recipient, uint amount) external returns(bool){
        require( balanceOf[msg.sender]>=amount,"Insufficient Balance");
        balanceOf[msg.sender]-=amount;
        balanceOf[recipient]+=amount;
        emit Transfer(msg.sender,recipient,amount);
        return true;
    }


   function approve(address spender, uint256 amount) external returns (bool){
        require( balanceOf[msg.sender]>=amount,"Insufficient Balance");
        allowance[msg.sender][spender]=amount;
        emit Approval(msg.sender,spender,amount);
        return true;

   } 

   function transferFrom(address sender, address recipient, uint256 amount) external returns (bool){
        require(allowance[sender][msg.sender]>=amount,"Insufficient Allowance");
        allowance[sender][msg.sender]-=amount;
        balanceOf[sender]-=amount;
        balanceOf[recipient]+=amount;
        emit Transfer(sender,recipient,amount);
        return true;
   }
}