// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Test, console} from "forge-std/Test.sol";
import {Drop} from "../src/Drop.sol";
import {DropFactory} from "../src/DropFactory.sol";

contract DropFactoryTest is Test {
    DropFactory dropFactory;
    address dropAddress = 0x0A354919e037C2806D821619893493888b050d4C;
    Drop dropImpl = Drop(dropAddress);
    
    function setUp() public {
        dropFactory = new DropFactory(dropImpl);
    }

    function test_Initialization() public {
        assertEq(dropFactory.dropImplementation(), dropAddress);
    }

    function test_Deployment() public {

    }
}