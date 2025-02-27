// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Drop} from "./Drop.sol";
import {Clones} from "@openzeppelin/contracts/proxy/Clones.sol";

contract DropFactory {
    event DropCrafted(Drop indexed drop, address indexed owner);
    Drop dropImpl;

    constructor (Drop dropImpl_) {
        dropImpl = dropImpl_;
    }

    function craftDrop (bytes32 salt, string memory name, string memory symbol) external returns (Drop drop) {
        drop = Drop(predictDropAddress(salt));

        emit DropCrafted(drop, msg.sender);

        Clones.cloneDeterministic(address(dropImpl), salt);

        drop.initialize(msg.sender, name, symbol);
    }

    function dropImplementation () public view returns (address) {
        return address(dropImpl);
    }

    function predictDropAddress(bytes32 salt_) public view returns (address drop) {
        return Clones.predictDeterministicAddress(address(dropImpl), salt_);
    }
}