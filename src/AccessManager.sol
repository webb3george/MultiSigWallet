// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "./Roles.sol";

contract AccessManager is AccessControl {
    using Roles for bytes32;

    /// @dev Initializes the contract setting the deployer as the initial admin.
    constructor() {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);

        // Set role admin relationships
        _setRoleAdmin(Roles.ADMIN_ROLE, DEFAULT_ADMIN_ROLE);
        _setRoleAdmin(Roles.MULTISIG_ADMIN_ROLE, DEFAULT_ADMIN_ROLE);
    }

    /// @dev add Admin management functions
    function addAdmin(address _admin) external onlyRole(DEFAULT_ADMIN_ROLE) {
        _grantRole(Roles.ADMIN_ROLE, _admin);
    }

    /// @dev remove Admin management functions
    function removeAdmin(address _admin) external onlyRole(DEFAULT_ADMIN_ROLE) {
        _revokeRole(Roles.ADMIN_ROLE, _admin);
    }

    /// @dev add Multisig Admin management functions
    function addMultisigAdmin(address _multisigAdmin) external onlyRole(DEFAULT_ADMIN_ROLE) {
        _grantRole(Roles.MULTISIG_ADMIN_ROLE, _multisigAdmin);
    }

    /// @dev remove Multisig Admin management functions
    function removeMultisigAdmin(address _multisigAdmin) external onlyRole(DEFAULT_ADMIN_ROLE) {
        _revokeRole(Roles.MULTISIG_ADMIN_ROLE, _multisigAdmin);
    }

    /// @dev check admin role
    function isAdmin(address _address) external view returns (bool) {
        return hasRole(Roles.ADMIN_ROLE, _address);
    }

    /// @dev check multisig admin role
    function isMultisigAdmin(address _address) external view returns (bool) {
        return hasRole(Roles.MULTISIG_ADMIN_ROLE, _address);
    }
}
