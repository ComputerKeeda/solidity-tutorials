# Loops

Loops are a way to repeat code. In Solidity, there are two types of loops: `for` and `while`.

## For Loop

The `for` loop is used to repeat a block of code a certain number of times.

```
//  initialization      condition   increment
for (uint256 i = 0;     i < 10;     i++) {
    // Logic
}
```

## While Loop

The `while` loop is used to repeat a block of code as long as a condition is true.

```solidity
while (condition) {
    // Logic
}
```

## Example

```solidity
function countUp(uint limit) public pure return (uint256) {
    uint256 count = 0;
    for (uint256 i = 0; i < limit; i++) {
        count += 1;
    }
    return count;
}
```

## Explanation

In this example, we have a function called `countUp` that takes a limit as input and returns the count of numbers from 1 to the limit.

The `for` loop is used to iterate through the numbers from 1 to the limit and add them to the count variable.

The `return` statement is used to return the count variable.

The `countUp` function is a pure function, which means it does not modify the state of the contract and returns the count value.

### Exercise

so for this we have written a Looping contract called [ExpenseTracker.sol](../../contracts/ExpenseTracker.sol)