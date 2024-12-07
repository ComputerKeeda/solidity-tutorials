# Solidity Learnings: Advance Level

> [!NOTE]
> **This is a work in progress.**

## Table of Contents

- [Contract to Contract Interaction](./contract-to-contract-interaction.md)

## Projects Ideas

Here are some **Solidity project ideas** to help you learn various aspects of Solidity programming, covering a broad range of topics like smart contract basics, gas optimization, security, and advanced design patterns.

---

### Beginner-Level Projects

1. [**Basic Voting System**](./projects/voting-system/readme.md)  
   - **Skills Covered**: Structs, mappings, events, modifiers.
   - **Goal**: Create a simple voting system where users can:
     - Propose options.
     - Vote for their preferred option.
     - Retrieve the winning option after the voting period ends.

2. **Decentralized To-Do List**  
   - **Skills Covered**: CRUD operations, mappings, dynamic arrays.
   - **Goal**: Allow users to:
     - Add, update, and delete tasks.
     - Mark tasks as completed.
     - View tasks stored on the blockchain.

3. **Basic Token (ERC-20)**  
   - **Skills Covered**: Interfaces, events, transferring tokens.
   - **Goal**: Implement an ERC-20 token contract with:
     - Minting and transferring functionality.
     - A capped total supply.

---

### Intermediate-Level Projects

4. **Crowdfunding Platform**  
   - **Skills Covered**: Contract lifecycle, payable functions, withdrawal patterns.
   - **Goal**: Create a crowdfunding platform where:
     - Users can create campaigns.
     - Contributors can pledge funds.
     - Campaign creators can withdraw funds if the goal is met.

5. **Decentralized Marketplace**  
   - **Skills Covered**: Structs, mappings, modifiers, payment handling.
   - **Goal**: Build a marketplace for buyers and sellers where:
     - Sellers can list items.
     - Buyers can purchase items using ETH or tokens.
     - Funds are locked in escrow until delivery confirmation.

6. **Time-Locked Wallet**  
   - **Skills Covered**: Time-based conditions, withdrawals.
   - **Goal**: Create a wallet that locks funds until a specific timestamp.

---

### Advanced-Level Projects

7. **NFT Marketplace (ERC-721)**  
   - **Skills Covered**: ERC-721, royalties, events.
   - **Goal**: Build a platform for minting, buying, and selling NFTs. Include:
     - Royalty payments to the original creator.
     - Auction functionality.

8. **Decentralized Autonomous Organization (DAO)**  
   - **Skills Covered**: Governance, voting mechanisms, time delays.
   - **Goal**: Implement a DAO where members:
     - Propose actions.
     - Vote on proposals.
     - Execute actions if a proposal passes.

9. **Multi-Signature Wallet**  
   - **Skills Covered**: Access control, multi-signature approval.
   - **Goal**: Create a wallet requiring multiple owners to sign off on a transaction before it is executed.

10. **Decentralized Lottery System**  
    - **Skills Covered**: Randomness (using Chainlink VRF), payouts.
    - **Goal**: Create a lottery system where:
      - Users can buy tickets.
      - A random winner is selected after a specific time.

---

### Expert-Level Projects

11. **Yield Farming Smart Contract**  
    - **Skills Covered**: Liquidity pools, staking, rewards distribution.
    - **Goal**: Implement a DeFi protocol allowing users to:
      - Stake tokens to earn rewards.
      - Withdraw rewards periodically.

12. **Lending and Borrowing Protocol**  
    - **Skills Covered**: Collateral, interest rates, liquidation.
    - **Goal**: Build a protocol where:
      - Users can lend assets to earn interest.
      - Borrowers can take loans against collateral.

13. **Rollup/Sidechain Implementation**  
    - **Skills Covered**: Layer 2 concepts, Merkle proofs, cross-chain communication.
    - **Goal**: Build a minimal rollup system for batching transactions off-chain.

14. **ZK-Proofs Integration (using zk-SNARKs)**  
    - **Skills Covered**: Zero-Knowledge Proofs, privacy.
    - **Goal**: Create a private voting or transfer system using zk-SNARKs for confidentiality.

---

### Bonus Projects for Mastery

15. **Decentralized Identity (DID) System**  
    - **Skills Covered**: Verifiable credentials, DID standards.
    - **Goal**: Build a system for issuing and verifying decentralized identities.

16. **GameFi Project (e.g., Battleship)**  
    - **Skills Covered**: Game mechanics, NFTs, payments.
    - **Goal**: Create a simple on-chain multiplayer game with an NFT reward system.

17. **Upgradeable Smart Contracts**  
    - **Skills Covered**: Proxy patterns, EIP-1967.
    - **Goal**: Implement a contract that can upgrade its logic without changing its address or storage.

---

### Tips for Learning While Building

1. **Start Small**: Focus on functionality, not complexity. Gradually add features.
2. **Leverage Tools**:
   - Use **Hardhat** or **Foundry** for testing and debugging.
   - Use **OpenZeppelin** libraries for standards like ERC-20 or ERC-721.
3. **Experiment**:
   - Test edge cases to understand how the EVM behaves.
   - Use Remix for quick prototyping.
4. **Dive into Security**:
   - Add checks for overflows, reentrancy, and access control.
   - Test using fuzzing tools like **Echidna** or **Slither**.
