# Require

require is a keyword in Solidity that is used to check if a certain condition is true. It is often used to ensure that certain conditions are met before executing certain code.

## Syntax

```solidity
require(condition);
```

where `condition` is a boolean expression that evaluates to true or false. If the condition is false, the code following the `require` keyword is not executed and the transaction is reverted.

## Example

```solidity
contract MyContract {
    uint256 public counter = 0;

    function increment() public {
        require(counter < 10, "Counter is already at 10");
        counter++;
    }
}
```

In this example, the `require` keyword is used to check if the `counter` variable is less than 10. If it is not, the transaction is reverted with an error message.

## Example 2

```solidity
contract SimpleToken {
    uint256 public maxPerMint = 10;

    function mint(uint256 amount) public {
        require(amount <= maxPerMint, "Amount exceeds max per mint");
        // ...

        _mint(amount);
    } 
}
```

Now since we have learned about `require`, why not limit our tweet length in our [Tweet contract?](../../contracts/Limit-Twitter.sol)
