// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.5.0
pragma solidity ^0.8.30;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {VaultMultisig} from "../src/VaultMultisig.sol";
import {AccessManager} from "../src/AccessManager.sol";

contract VaultMultisigDeploy is Script {
    function run(address[] memory _signers, uint256 _quorum) public {
        uint256 deployPrivateKey = vm.envUint("DEPLOYER_KEY");

        vm.startBroadcast(deployPrivateKey);

        AccessManager accessManager = new AccessManager();
        console.log("AccessManager deployed", address(accessManager));

        VaultMultisig vault = new VaultMultisig(_signers, _quorum, address(accessManager));

        console.log("VaultMultisig deployed", address(vault));
    }
}
