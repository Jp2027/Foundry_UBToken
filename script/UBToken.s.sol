// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script,console} from "forge-std/Script.sol";
import {IERC20} from "../src/interfaces/IERC20.sol";

contract UBTokenDeploy is Script {
    
    address constant USDD=0x0C10bF8FcB7Bf5412187A595ab97a3609160b5c6;

    function run() public view{
        IERC20 usdd = IERC20(USDD);
        console.log(usdd.totalSupply());
    }

}