// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {Helper} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    FundMe fundMe;

    function run() external returns (FundMe) {
        Helper helper = new Helper();
        address pricefeed = helper.activeNetworkConfig();

        vm.startBroadcast();
        fundMe = new FundMe(pricefeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
