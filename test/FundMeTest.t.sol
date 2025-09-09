// SPD-License-Identifier: MIT

pragma solidity ^0.8.19;

import {FundMe} from "../src/FundMe.sol";
import {Test, console} from "forge-std/Test.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    function setUp() external {
        fundMe = new FundMe();
    }

    function testMinimumDollaIsFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public view {
        // Not checking msg.sender cause FundMeTest is the one deploying the FundMe contract
        // The flow is this: we call -> FundMeTest -> which deploys FundMe
        assertEq(fundMe.I_OWNER(), address(this));
    }
}
