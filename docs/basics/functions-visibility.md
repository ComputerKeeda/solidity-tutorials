# **Functions and Visibility in Solidity**

In Solidity, functions are used to implement logic within contracts. Functions have different access modifiers to control their visibility and determine how they can be called. The main types of visibility are **public**, **private**, **internal**, and **external**.

---

## **1. Public Functions**

- **Access**: Can be called by anyone, including external accounts (e.g., via Metamask) and other contracts.
- **Use Case**: When the function needs to interact with external users or contracts.

### Example:

```solidity
function add(uint256 a, uint256 b) public returns (uint256) {
    return a + b;
}
```

---

## **2. Private Functions**

- **Access**: Can only be called by the contract where they are defined.
- **Use Case**: When you want the function logic to remain hidden and inaccessible outside the contract.

### Example:

```solidity
function add(uint256 a, uint256 b) private returns (uint256) {
    return a + b;
}
```

---

## **3. Internal Functions**

- **Access**: Can be called by the contract itself and contracts that inherit from it.
- **Use Case**: When a function's logic should be shared across inherited contracts but not accessible externally.

### Example:

```solidity
contract A {
    function add(uint256 a, uint256 b) internal returns (uint256) {
        return a + b;
    }
}

// Inherited contract
contract B is A {
    function subtract(uint256 a, uint256 b) internal returns (uint256) {
        return a - b;
    }

    function performOperation(uint256 a, uint256 b, uint8 operation) public returns (uint256 result) {
        if (operation == 0) {
            result = add(a, b);
        } else if (operation == 1) {
            result = subtract(a, b);
        } else {
            revert("Invalid operation");
        }
    }
}
```

---

## **4. External Functions**

- **Access**: Can only be called from external accounts or other contracts, not from within the contract itself.
- **Use Case**: To reduce gas costs when a function doesn't need to be called internally.

### Why Use `external` Instead of `public`?

External functions save gas because they cannot be called internally, reducing unnecessary computational overhead. 🚀

### Example:

```solidity
function add(uint256 a, uint256 b) external returns (uint256) {
    return a + b;
}
```

---

## **Key Differences Between Visibility Types**

| Visibility   | Accessible By                                | Use Case                                                |
| ------------ | -------------------------------------------- | ------------------------------------------------------- |
| **Public**   | External accounts, contracts, and internally | Functions that interact with users or other contracts.  |
| **Private**  | Only the defining contract                   | Encapsulation and restricting logic to the contract.    |
| **Internal** | Defining contract and inherited contracts    | Shared logic across inherited contracts.                |
| **External** | External accounts and contracts only         | Gas-efficient functions that don’t need internal calls. |

---
