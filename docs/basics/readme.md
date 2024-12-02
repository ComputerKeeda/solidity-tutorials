# **Basics of Solidity**

To learn Solidity, it's important to start with the basics. Let's begin with a simple contract, **Calculator.sol**, which is a basic calculator contract.

---

### **Calculator.sol**

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Calculator {
    uint256 result = 0;

    function add() public {
        result += 1;
    }
}
```

---

### **Explanation of the Code**

#### **1. License Identifier**

```solidity
// SPDX-License-Identifier: MIT
```

- This line specifies the license type of the contract.
- In this case, the license is **MIT**.

#### **2. Pragma Directive**

```solidity
pragma solidity ^0.8.0;
```

- This line specifies the Solidity compiler version required to compile this contract.
- Here, the version is **^0.8.0**, which means any version **0.8.x** or higher is compatible.

#### **3. Contract Declaration**

```solidity
contract Calculator
```

- This line declares the contract with the name **Calculator**.

#### **4. Variable Declaration**

```solidity
uint256 result = 0;
```

- This line declares a state variable named **result** of type `uint256`.
- The initial value is set to **0**.

#### **5. Function Declaration**

```solidity
function add() public {
    result += 1;
}
```

- This line declares a function named **add**.
- The function increments the value of the `result` variable by **1**.

---

### **What is a Function?**

A **function** is a reusable block of code that performs a specific task. In Solidity, functions are used to implement logic within contracts.

---

### **Structure of a Function**

```solidity
function add(uint256 a, uint256 b) public view returns (uint256) {
    return a + b;
}
```

#### Explanation:

- **`add`**: The name of the function.
- **`uint256 a, uint256 b`**: Parameters passed to the function.
- **`public`**: Access modifier, defines who can call the function.
- **`view`**: State modifier, indicates that the function does not modify the blockchain state.
- **`returns (uint256)`**: Return modifier, specifies the return type of the function.
- **`return a + b;`**: The function returns the sum of `a` and `b`.

---

### **Key Terms**

- **Access Modifier**: Determines who can call the function (`public`, `private`, etc.).
- **State Modifier**: Indicates if the function modifies the blockchain state (`view`, `pure`, etc.).
- **Return Type**: Specifies the type of value returned by the function.

> [!NOTE]
> We will learn more about functions in [functions-visibility.md](./functions-visibility.md)


# Pipeline

So far we have learned about solidity functions and how to create them. Now let's move on to the next step, 

- [**Mapping**](./mapping.md)