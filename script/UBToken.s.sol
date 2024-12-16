// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script,console} from "forge-std/Script.sol";
import {IERC20} from "../src/interfaces/IERC20.sol";
import {UBToken} from "../src/UBToken.sol";

contract UBTokenDeploy is Script {
    
    address recipient = 0x9965507D1a55bcC2695C58ba16FB37d819B0A4dc;

    function run() external {
      
        vm.startBroadcast();

        // Deploy the UBToken contract
        UBToken token = new UBToken("University of Bridgeport Token","UBT",18,1_000_000 * 10 ** 18);
        uint256 amount = 100 * 10 ** 18;
        token.transfer(recipient, amount);
        vm.stopBroadcast();
    }
}
