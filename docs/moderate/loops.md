# **Loops in Solidity**

Loops in Solidity allow you to repeat a block of code multiple times, either a set number of times or as long as a condition is true. Solidity supports two types of loops: **`for`** and **`while`**.

---

## **1. For Loop**

A **`for` loop** repeats a block of code for a specific number of iterations.

### Syntax

```solidity
for (initialization; condition; increment/decrement) {
    // Logic to execute
}
```

### Example

```solidity
function countUp(uint256 limit) public pure returns (uint256) {
    uint256 count = 0;
    for (uint256 i = 0; i < limit; i++) {
        count += 1;
    }
    return count;
}
```

### **Explanation**

1. **Initialization**: `uint256 i = 0` - Starts the loop with `i = 0`.
2. **Condition**: `i < limit` - Runs the loop until `i` is less than `limit`.
3. **Increment**: `i++` - Increases `i` by 1 after each iteration.
4. **Logic**: `count += 1` - Adds 1 to the `count` variable on each iteration.
5. **Return**: Once the loop completes, the function returns the final `count`.

---

## **2. While Loop**

A **`while` loop** repeats a block of code as long as a condition is true.

### Syntax

```solidity
while (condition) {
    // Logic to execute
}
```

### Example

```solidity
function countDown(uint256 start) public pure returns (uint256) {
    uint256 count = 0;
    while (start > 0) {
        start--;
        count++;
    }
    return count;
}
```

### **Explanation**

1. **Condition**: `start > 0` - The loop continues until `start` becomes 0.
2. **Logic**:
   - `start--` - Decreases `start` by 1 in each iteration.
   - `count++` - Increases `count` by 1 for every loop.
3. **Return**: Once the condition fails, the function returns the total count.

---

## **Key Differences Between `for` and `while`**

| Feature         | `for` Loop                                         | `while` Loop                                 |
| --------------- | -------------------------------------------------- | -------------------------------------------- |
| **Use Case**    | Known number of iterations.                        | Unknown iterations until condition is false. |
| **Syntax**      | Combines initialization, condition, and increment. | Only has a condition.                        |
| **Readability** | More concise for fixed iterations.                 | Flexible for complex conditions.             |

---

## **Practical Example: Looping in Solidity**

### Contract: Expense Tracker

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExpenseTracker {
    uint256[] public expenses;

    // Add a new expense
    function addExpense(uint256 expense) public {
        expenses.push(expense);
    }

    // Calculate total expenses
    function totalExpenses() public view returns (uint256) {
        uint256 total = 0;
        for (uint256 i = 0; i < expenses.length; i++) {
            total += expenses[i];
        }
        return total;
    }
}
```

### **How It Works**

1. **`addExpense` Function**: Adds a new expense to the `expenses` array.
2. **`totalExpenses` Function**:
   - Uses a `for` loop to iterate through the `expenses` array.
   - Adds each expense to the `total`.
   - Returns the total sum of expenses.

---

### **Best Practices**

1. **Gas Optimization**: Avoid large loops to reduce gas costs.
2. **Bounds Checking**: Always ensure loop conditions prevent infinite loops.
3. **Use `view` or `pure` Modifiers**: When loops do not modify contract state.

---

### **Exercise**

Try exploring the [ExpenseTracker.sol](../../contracts/ExpenseTracker.sol) to see how loops can be applied in real-world use cases.
