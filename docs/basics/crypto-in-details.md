# **Crypto Coins in Detail**

Crypto coins are digital assets that operate on a blockchain. They can serve as:

1. **Stablecoins**: Pegged to a fiat currency (e.g., USDC, USDT).
2. **Native Tokens**: Issued by the blockchain itself (e.g., ETH for Ethereum).
3. **Utility Tokens**: Used within a specific ecosystem (e.g., MANA in Decentraland).

---

## **Ethereum Standards for Crypto Coins**

1. **ERC-20**:  
   The most popular standard for creating fungible tokens on Ethereum. It defines rules and functions for token creation, transfer, and interaction.

   **Key ERC-20 Functions**:

   - `totalSupply()`: Returns total supply of tokens.
   - `balanceOf(address)`: Returns token balance of a given address.
   - `transfer(address, uint256)`: Transfers tokens from sender to recipient.
   - `approve(address, uint256)`: Approves a spender to use tokens.
   - `transferFrom(address, address, uint256)`: Allows a spender to transfer tokens on behalf of the owner.

   **Code Example**:

   ```solidity
   // SPDX-License-Identifier: MIT
   pragma solidity ^0.8.0;

   interface IERC20 {
       function totalSupply() external view returns (uint256);
       function balanceOf(address account) external view returns (uint256);
       function transfer(address recipient, uint256 amount) external returns (bool);
       function approve(address spender, uint256 amount) external returns (bool);
       function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
   }

   contract MyToken is IERC20 {
       string public name = "MyToken";
       string public symbol = "MTK";
       uint8 public decimals = 18;
       uint256 private _totalSupply = 1000000 * 10 ** uint(decimals);
       mapping(address => uint256) private _balances;
       mapping(address => mapping(address => uint256)) private _allowances;

       constructor() {
           _balances[msg.sender] = _totalSupply;
       }

       function totalSupply() public view override returns (uint256) {
           return _totalSupply;
       }

       function balanceOf(address account) public view override returns (uint256) {
           return _balances[account];
       }

       function transfer(address recipient, uint256 amount) public override returns (bool) {
           require(_balances[msg.sender] >= amount, "Insufficient balance");
           _balances[msg.sender] -= amount;
           _balances[recipient] += amount;
           return true;
       }

       function approve(address spender, uint256 amount) public override returns (bool) {
           _allowances[msg.sender][spender] = amount;
           return true;
       }

       function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
           require(_balances[sender] >= amount, "Insufficient balance");
           require(_allowances[sender][msg.sender] >= amount, "Allowance exceeded");
           _balances[sender] -= amount;
           _balances[recipient] += amount;
           _allowances[sender][msg.sender] -= amount;
           return true;
       }
   }
   ```

---

### **How the Value of Crypto Coins is Decided**

The value of a crypto coin is influenced by multiple factors:

1. **Market Demand and Supply**:

   - Higher demand for a coin increases its value, while oversupply decreases it.
   - For stablecoins like USDC/USDT, supply is pegged to fiat reserves.

2. **Utility and Adoption**:

   - Coins with real-world use cases (e.g., ETH for gas fees) tend to hold more value.
   - Broad adoption in DeFi, payments, or apps boosts demand.

3. **Speculation**:

   - Price fluctuations are often driven by market speculation, influenced by news, trends, and social media.

4. **Scarcity**:

   - Coins with fixed or decreasing supply (e.g., Bitcoin) often gain value over time due to perceived scarcity.

5. **Underlying Mechanism**:

   - Stablecoins: Pegged to reserves, backed by USD or other assets.
   - Utility Tokens: Value increases with the growth of the underlying ecosystem.

6. **Network Effect**:
   - Coins with widespread developer and user adoption (e.g., ETH, BNB) are more valuable.

---
