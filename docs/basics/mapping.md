# **Mapping in Solidity**

A **mapping** is a special data structure in Solidity that maps keys to values. It provides a way to store, retrieve, and manage data efficiently using unique keys.

---

## **Analogy**

Think of a mapping like a **hanger** where:

- **Key** = The hanger itself (used to hold items).
- **Value** = The item hanging on the hanger.

### Example:

```plaintext
Key --------> Value
0   --------> 10
1   --------> 20
2   --------> 30
3   --------> 40
```

---

## **Basic Syntax**

```solidity
mapping(address => uint256) public myMapping;
```

### Explanation:

- **`address`**: The type of the key.
- **`uint256`**: The type of the value.
- **`public`**: Makes the mapping accessible from outside the contract.

### Example Mapping:

```plaintext
Key         --------> Value
0x1234...   --------> 10
0x5678...   --------> 20
0x9abc...   --------> 30
0xdef0...   --------> 40
```

---

## **Why Use Mappings?**

- **Fast Retrieval**: Mappings provide **constant time** (`O(1)`) access to values based on their keys.
- **Efficient Storage**: Data is stored compactly, making it memory-efficient.

---

## **Example Contract with Mapping**

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExampleMapping {
    // Define a mapping to associate addresses with balances
    mapping(address => uint256) public balances;

    // Function to set a value in the mapping
    function setBalance(address user, uint256 amount) public {
        balances[user] = amount;
    }

    // Function to retrieve a value from the mapping
    function getBalance(address user) public view returns (uint256) {
        return balances[user];
    }
}
```

### **How It Works**

1. **Set a Balance**:
   - Call `setBalance(0x1234..., 100)` to map the key `0x1234...` to the value `100`.
2. **Get a Balance**:
   - Call `getBalance(0x1234...)` to retrieve the value `100`.

---

Mappings are foundational to Solidity and are used extensively in decentralized applications for managing relationships between keys and values efficiently!

I will recommend you to check out the [`Twitter.sol`](../../contracts/Twitter.sol) to understand how mappings are used in real world applications.
