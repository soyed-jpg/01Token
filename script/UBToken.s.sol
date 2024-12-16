// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/UBToken.sol";

contract UBTokenDeploy is Script {
    function run() external {
        // Start broadcasting with the specified private key
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        // Deploy UBToken contract
        UBToken ubToken = new UBToken(
            "University of Bridgeport Token", // Token name
            "UBT",                            // Token symbol
            1_000_000 * 10**18                // Initial supply (1,000,000 tokens with 18 decimals)
        );

        // Transfer 100 tokens to the specified address
        ubToken.transfer(
            0x9965507D1a55bcC2695C58ba16FB37d819B0A4dc,
            100 * 10**18
        );

        // Stop broadcasting after the transaction
        vm.stopBroadcast();
    }
}
