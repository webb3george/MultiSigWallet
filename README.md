# MultiSigWallet

> A role-based smart contract for managing crypto assets requiring multiple approvals for transactions.

## Overview

**MultiSigWallet** is a secure, role-based smart contract written in Solidity that enables multi-signature control over cryptocurrency assets. It implements a governance model where critical operations such as fund transfers or access management require approvals from multiple trusted parties before execution, eliminating single points of failure and enhancing security.

Built using the **Foundry** framework, this contract is designed for deployment on Ethereum and other EVM-compatible blockchains.

## Key Features

*   **Role-Based Access Control**: Manage participants with different permission levels (e.g., Admin, Signer).
*   **Multi-Signature Authorization**: Critical operations like fund transfers require confirmations from multiple trusted parties.
*   **Flexible Configuration**: Set configurable approval thresholds (quorum) for different transaction types.
*   **Foundry-Powered**: Utilizes Foundry for fast development, comprehensive testing, and efficient deployment.

## Tech Stack

*   **Solidity** - Smart contract language
*   **Foundry** (Forge, Cast, Anvil) - Development, testing, and deployment toolkit

## Quick Start

### Prerequisites

*   [Rust](https://www.rust-lang.org/) (Required for Foundry)
*   [Foundry](https://book.getfoundry.sh/getting-started/installation)

### Installation

1.  Clone the repository:
    ```bash
    git clone https://github.com/webb3george/MultiSigWallet.git
    cd MultiSigWallet
    ```
2.  Install dependencies:
    ```bash
    forge install
    ```
3.  Set up environment variables (optional, for deployment):
    ```bash
    cp .env.example .env
    ```
    Edit the `.env` file with your private key and RPC URL.

### Basic Commands

*   **Build the project:**
    ```bash
    forge build
    ```
*   **Run tests:**
    ```bash
    forge test
    ```
*   **Format code:**
    ```bash
    forge fmt
    ```
*   **Generate a gas snapshot:**
    ```bash
    forge snapshot
    ```

### Deployment

To deploy the contract to a testnet or mainnet, use the scripts in the `script/` directory.

Example deployment command using Foundry:
```bash
forge script script/VaultMultisig.s.sol:VaultMultisigDeploy --broadcast --rpc-url $RPC_URL --sig "run(address[],uint256)" "[0xsome1stAddress, 0xsome2ndAddress]" 2
