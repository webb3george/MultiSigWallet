// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "./Roles.sol";

contract AccessManager is AccessControl {
    using Roles for bytes32;

    constructor() {
        _grantRole(Roles.MULTISIG_ADMIN_ROLE, msg.sender);
    }

    function addAdmin(address _admin) external onlyRole(Roles.MULTISIG_ADMIN_ROLE) {
        _grantRole(Roles.MULTISIG_ADMIN_ROLE, _admin);
    }

    function removeAdmin(address _admin) external onlyRole(Roles.MULTISIG_ADMIN_ROLE) {
        _revokeRole(Roles.MULTISIG_ADMIN_ROLE, _admin);
    }

    function isMultisigAdmin(address _address) external view returns (bool) {
        return hasRole(Roles.MULTISIG_ADMIN_ROLE, _address);
    }

    function addMultisigSigner(address _multisigSigner) external onlyRole(Roles.MULTISIG_ADMIN_ROLE) {
        _grantRole(Roles.MULTISIG_SIGNER_ROLE, _multisigSigner);
    }

    function removeMultisigSigner(address _multisigSigner) external onlyRole(Roles.MULTISIG_ADMIN_ROLE) {
        _revokeRole(Roles.MULTISIG_SIGNER_ROLE, _multisigSigner);
    }

    function isMultisigSigner(address _address) external view returns (bool) {
        return hasRole(Roles.MULTISIG_SIGNER_ROLE, _address);
    }
}