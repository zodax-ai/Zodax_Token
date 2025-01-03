// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0

//  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.
// | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
// | |   ________   | || |     ____     | || |  ________    | || |      __      | || |  ____  ____  | |
// | |  |  __   _|  | || |   .'    `.   | || | |_   ___ `.  | || |     /  \     | || | |_  _||_  _| | |
// | |  |_/  / /    | || |  /  .--.  \  | || |   | |   `. \ | || |    / /\ \    | || |   \ \  / /   | |
// | |     .'.' _   | || |  | |    | |  | || |   | |    | | | || |   / ____ \   | || |    > `' <    | |
// | |   _/ /__/ |  | || |  \  `--'  /  | || |  _| |___.' / | || | _/ /    \ \_ | || |  _/ /'`\ \_  | |
// | |  |________|  | || |   `.____.'   | || | |________.'  | || ||____|  |____|| || | |____||____| | |
// | |              | || |              | || |              | || |              | || |              | |
// | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
//  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'

// NAME: ZODAX
// TICKER: ZODX
// DECIMAL: 18
// SUPPLY: 1 BILLION
// CHAIN: POLYGON

pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

/// @title ZODAX ERC20 Token Contract
/// @notice Implements an ERC20 token with pausing, burning, and permit functionality.
/// @dev Inherits from OpenZeppelin's:
///      - ERC20: Standard ERC20 implementation
///      - ERC20Burnable: Allows token burning
///      - AccessControl: Role-based access management
///      - ERC20Permit: Permit-based approvals
contract ZODAX is ERC20, ERC20Burnable, AccessControl, ERC20Permit {
    uint256 public maxTotalSupply = 1000000000 * 10 ** decimals();

    event EmergencyWithdraw(address token, address recipient, uint256 amount);

    /// @notice Initializes the Zodax token contract.
    /// @param defaultAdmin Address assigned the DEFAULT_ADMIN_ROLE.
    /// @param owner Address receiving the initial max token supply.
    /// @dev Mints the max token supply to the owner.
    constructor(
        address defaultAdmin,
        address owner
    ) ERC20("ZODAX", "ZODX") ERC20Permit("ZODAX") {
        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
        _mint(owner, maxTotalSupply);
    }

    /// @notice Fetches the maximum total supply of the token.
    /// @return maxTotalSupply The maximum total supply of the token.
    function maxSupply() public view returns (uint256) {
        return maxTotalSupply;
    }

    /// @notice Enables an admin to recover tokens sent to the contract.
    /// @param _token Address of the token to be withdrawn.
    /// @param _recipient Address receiving the withdrawn tokens.
    /// @param _amount Amount of tokens to withdraw.
    /// @dev Callable only by accounts with the DEFAULT_ADMIN_ROLE.
    /// @dev Reverts if `_recipient` is zero or `_amount` is invalid.
    function emergencyWithdraw(
        address _token,
        address _recipient,
        uint256 _amount
    ) external onlyRole(DEFAULT_ADMIN_ROLE) {
        require(_token != address(0), "Invalid token");
        require(_recipient != address(0), "Invalid recipient");
        require(_amount > 0, "Invalid amount");

        IERC20Metadata token = IERC20Metadata(_token);
        require(token.transfer(_recipient, _amount), "Transfer failed");

        emit EmergencyWithdraw(_token, _recipient, _amount);
    }

    /// @notice Updates the token transfer state
    /// @param from Address of the sender
    /// @param to Address of the recipient
    /// @param value Amount of tokens to transfer
    /// @dev Overrides required by Solidity
    function _update(
        address from,
        address to,
        uint256 value
    ) internal override(ERC20) {
        super._update(from, to, value);
    }
}
