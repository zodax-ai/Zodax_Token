# ZODAX Token Contract Audit Documentation

## Overview

The ZODAX token contract is an ERC20 token with additional functionalities such as pausing, burning, and permit-based approvals. The contract is built using OpenZeppelin's libraries to ensure security and reliability.

## Contract Details

- **Name**: ZODAX
- **Symbol**: ZODX
- **Total Supply**: 1,000,000,000 ZODX
- **Decimals**: 18
- **Compiler Version**: Solidity 0.8.24

## Features

### Burning

Token holders can burn their tokens, reducing the total supply.

- **Functions**:
  - `burn(uint256 amount)`: Burns a specified amount of tokens from the caller's account.

### Permit-Based Approvals

The contract supports permit-based approvals, allowing token holders to approve transfers via signatures.

- **Functions**:
  - `permit(address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s)`: Approves a spender to transfer tokens on behalf of the owner using a signed message.

### Emergency Withdraw

Authorized accounts can recover tokens sent to the contract by mistake.

- **Role**: DEFAULT_ADMIN_ROLE
- **Functions**:
  - `emergencyWithdraw(address _token, address _recipient, uint256 _amount)`: Withdraws tokens from the contract to a specified recipient.

## Roles and Access Control

The contract uses OpenZeppelin's AccessControl for role-based access management.

- **Roles**:
  - `DEFAULT_ADMIN_ROLE`: Admin role with full control over the contract.

## Deployment

The contract is deployed with the following parameters:

- `defaultAdmin`: Address assigned the DEFAULT_ADMIN_ROLE.
- `owner`: Address receiving the initial max token supply.

## Contract Code

The contract code is available in the `contracts/Zodax.sol` file.

## Tests

The contract has been thoroughly tested using Hardhat and Chai. The test cases cover all functionalities, including deployment, pausing, burning, permit-based approvals, and emergency withdrawals.

### Test Files

- `test/Zodax.ts`: Contains all test cases for the ZODAX contract.

### Test Coverage

The tests ensure that:

- The contract is deployed correctly with the expected initial state.
- Only authorized accounts can pause and unpause token transfers.
- Token holders can burn their tokens.
- Permit-based approvals work as expected.
- Emergency withdrawals are restricted to authorized accounts.

## How to Run Tests

1. Install dependencies:

   ```sh
   npm install
   ```

2. Run tests:
   ```sh
   npx hardhat coverage
   ```

## Conclusion

The ZODAX token contract is designed with security and functionality in mind, leveraging OpenZeppelin's libraries for robust implementation. The contract has been thoroughly tested to ensure its reliability and security.

For any further questions or clarifications, please refer to the contract code and test files.

**Note**: This documentation is intended for the contract audit process and provides an overview of the ZODAX token contract's features, roles, and testing procedures.
