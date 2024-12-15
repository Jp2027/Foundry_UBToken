// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import{Test,console} from "forge-std/Test.sol";
import{UBToken} from "../src/UBToken.sol";

contract UBTokenTest is Test{
    UBToken ubToken;
    string constant NAME="University of Bridgeport Token";
    string constant SYMBOL="UBT";
    uint8 constant DECIMALS=18;
    uint256 constant TOTAL_SUPPLY=1_000_000 ether;

    address owner = vm.addr(uint256(keccak256("OWNER")));
    address user1 = vm.addr(uint256(keccak256("USER1")));
    address user2 = vm.addr(uint256(keccak256("USER2")));
    address user3 = vm.addr(uint256(keccak256("USER3")));

    function setUp () public {
        vm.prank(owner);
        ubToken = new UBToken(NAME,SYMBOL,DECIMALS,TOTAL_SUPPLY);
    }

    function testName() public view {
        assertEq(ubToken.name(),NAME);
    }

    function testSymbol() public view{
        assertEq(ubToken.symbol(),SYMBOL);
    }

    function testDecimals() public view{
        assertEq(ubToken.decimals(),DECIMALS);
    }

    function testTotalSupply() public view{
        assertEq(ubToken.totalSupply(),TOTAL_SUPPLY);
    }

    function testTransfer() public {
        uint amount= 100*10**18;
        vm.prank(owner);
        ubToken.transfer(user1,amount);
        assertEq(ubToken.balanceOf(owner), TOTAL_SUPPLY-amount);
        assertEq(ubToken.balanceOf(user1),amount);
    }

    function testApprove() public {
        uint amount= 100*10**18;
        vm.prank(owner);
        ubToken.approve(user1,amount);
        assertEq(ubToken.allowance(owner,user1),amount);
    }

    function testTranferfromPartial() public {
        uint amount= 100*10**18;
        uint transferAmount = 10 ether;
        vm.prank(owner);
        ubToken.approve(user1,amount);
        vm.prank(user1);
        ubToken.transferFrom(owner,user2,transferAmount);
        assertEq(ubToken.balanceOf(owner), TOTAL_SUPPLY-transferAmount );
        assertEq(ubToken.balanceOf(user1),0);
        assertEq(ubToken.balanceOf(user2),transferAmount);
        assertEq(ubToken.allowance(owner,user1),amount-transferAmount);
        vm.prank(user1);
        ubToken.transferFrom(owner,user3,amount-transferAmount);
    }

}