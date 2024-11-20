# Minimal Smart Contract Security Review Onboarding

# Table of Contents

- [Minimal Smart Contract Security Review Onboarding](#minimal-smart-contract-security-review-onboarding)
- [Table of Contents](#table-of-contents)
- [About the project / Documentation](#about-the-project--documentation)
- [Stats](#stats)
- [Setup](#setup)
  - [Requirements](#requirements)
  - [Quickstart](#quickstart)
  - [Testing](#testing)
- [Security Review Scope](#security-review-scope)
  - [Commit Hash](#commit-hash)
  - [Repo URL](#repo-url)
  - [In scope vs out of scope contracts](#in-scope-vs-out-of-scope-contracts)
  - [Compatibilities](#compatibilities)
- [Roles](#roles)
- [Known Issues](#known-issues)

# About the project / Documentation

The ZODAX token contract is an ERC20 token with additional functionalities such as pausing, burning, and permit-based approvals. The contract is built using OpenZeppelin's libraries to ensure security and reliability.

# Stats

```sh
npm i cloc
```

```sh
cloc ./contracts/Zodax.sol
```

## Language files blank comment code

```sh
Result for the above command
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
Solidity                         1             15             47             54
-------------------------------------------------------------------------------
```

## Solidity

- nSLOC: 54

# Setup

## Requirements

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [hardhat](https://hardhat.org/)

## Quickstart

```
git clone https://github.com/Score11-io/Score11_Token.git
cd Score11_Token
npm i
```

## Testing

```
npx hardhat test
<!-- OR -->
npx hardhat coverage
```

# Security Review Scope

## Commit Hash

4c1500aafc857605f1fd1c2a4024f32f55dfc583

## Repo URL

https://github.com/Score11-io/Score11_Token

## In scope vs out of scope contracts

```
./contracts/
└── Zodax.sol
```

## Compatibilities

- Solc Version: 0.8.24

# Roles

- `defaultAdmin`: Address assigned the DEFAULT_ADMIN_ROLE and can call admin function: emergencyWithdraw().
- `pauser`: Address granted the PAUSER_ROLE, and can pause or unpause the contract.

# Known Issues

None
