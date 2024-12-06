
# **Inheritance Patterns in Solidity: ERC Standards and Advanced Insights**

Solidity inheritance is often used in conjunction with **Ethereum Request for Comments (ERC) standards** to create interoperable and extendable smart contracts. Below, we’ll explore **ERC standards**, common inheritance patterns, and how they’re implemented.

---

## **ERC Standards**

### **1. ERC-20: Fungible Token Standard**

The ERC-20 standard defines a blueprint for fungible tokens, where each token is identical and divisible.

### Key Functions

- `totalSupply`: Returns the total token supply.
- `balanceOf`: Returns the balance of an account.
- `transfer`: Transfers tokens between accounts.

### Example Implementation

```solidity
pragma solidity ^0.8.0;

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
}

contract MyToken is IERC20 {
    mapping(address => uint256) private balances;
    uint256 private _totalSupply;

    constructor(uint256 initialSupply) {
        _totalSupply = initialSupply;
        balances[msg.sender] = initialSupply;
    }

    function totalSupply() external view override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) external view override returns (uint256) {
        return balances[account];
    }

    function transfer(address recipient, uint256 amount) external override returns (bool) {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        return true;
    }
}
```

---

### **2. ERC-721: Non-Fungible Token (NFT) Standard**

The ERC-721 standard defines non-fungible tokens, where each token is unique.

### Key Functions

- `ownerOf`: Returns the owner of a specific token.
- `transferFrom`: Transfers ownership of a token.

### Example Implementation

```solidity
pragma solidity ^0.8.0;

interface IERC721 {
    function ownerOf(uint256 tokenId) external view returns (address);
    function transferFrom(address from, address to, uint256 tokenId) external;
}

contract MyNFT is IERC721 {
    mapping(uint256 => address) private tokenOwners;

    function ownerOf(uint256 tokenId) external view override returns (address) {
        return tokenOwners[tokenId];
    }

    function transferFrom(address from, address to, uint256 tokenId) external override {
        require(tokenOwners[tokenId] == from, "Not the token owner");
        tokenOwners[tokenId] = to;
    }
}
```

---

## **Inheritance Patterns**

### **1. Single Inheritance**

Used when a contract derives from one base contract.

```solidity
contract Parent {
    function foo() public pure returns (string memory) {
        return "Parent Function";
    }
}

contract Child is Parent {
    function bar() public pure returns (string memory) {
        return foo();
    }
}
```

---

### **2. Multiple Inheritance**

Used when a contract derives from multiple base contracts. Solidity resolves conflicts using **C3 Linearization**.

```solidity
contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

contract B {
    function foo() public pure virtual returns (string memory) {
        return "B";
    }
}

contract C is A, B {
    function foo() public pure override(A, B) returns (string memory) {
        return "C";
    }
}
```

---

### **3. Abstract Contracts**

Used to define partially implemented contracts that must be inherited and completed.

```solidity
abstract contract AbstractContract {
    function foo() public virtual returns (string memory);
}

contract ConcreteContract is AbstractContract {
    function foo() public pure override returns (string memory) {
        return "Implemented Function";
    }
}
```

---

### **4. Interface Inheritance**

Interfaces can inherit from other interfaces to extend functionality.

```solidity
interface IBase {
    function baseFunction() external;
}

interface IDerived is IBase {
    function derivedFunction() external;
}

contract Implementation is IDerived {
    function baseFunction() external override {
        // Logic
    }

    function derivedFunction() external override {
        // Logic
    }
}
```

---

## **Advanced Use Case: Access Control with Inheritance**

### **Base Contract for Access Control**

```solidity
contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }
}
```

### **Derived Contract Using Ownable**

```solidity
contract MyContract is Ownable {
    uint256 public data;

    function setData(uint256 _data) public onlyOwner {
        data = _data;
    }
}
```

---

## **ERC-1155: Multi-Token Standard**

A standard for managing multiple token types (both fungible and non-fungible).

### Key Features

- Batch operations.
- Shared metadata for token types.

### Example

```solidity
interface IERC1155 {
    function balanceOf(address account, uint256 id) external view returns (uint256);
    function transfer(address to, uint256 id, uint256 amount) external;
}
```

---

## **Key Benefits of Inheritance in Solidity**

1. **Code Reuse**: Avoid duplicating functionality.
2. **Extensibility**: Easily extend base contracts for new features.
3. **Modularity**: Organize code into logical components.
4. **Standardization**: Implement widely accepted standards like ERC-20 or ERC-721.

---
