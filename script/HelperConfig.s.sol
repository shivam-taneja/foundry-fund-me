/**
 // TODO:
 * 1. Deploy mocks when we are on a local anvil chain
 * 2. Keep track of contract address accross different chains
 */

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";

contract HelperConfig {
    // If we are on local anvil, we deploy mock
    // Otherwise, grab the existing address from the live network
    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address priceFeed; // ETH/USD price feed address
    }

    constructor() {
        // Sepolia chain id
        if (block.chainid == 11155111) {
            activeNetworkConfig = getSeopliaEthConfig();
        } else {
            activeNetworkConfig = getAnvilEthConfig();
        }
    }

    function getSeopliaEthConfig() public pure returns (NetworkConfig memory) {
        // price feed address
        NetworkConfig memory seopliaConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });
        return seopliaConfig;
    }

    function getAnvilEthConfig() public pure returns (NetworkConfig memory) {
        // price feed address
    }
}
