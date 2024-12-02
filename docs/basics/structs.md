# Arrays

An array is a collection of elements of the same type.

```solidity

contract MyContract {
    uint256[] public numbers;
    uint[] public numbers2 = [1,2,3,4,5];

// Fixed Array all elements initialize to 0
    uint256[10] public myFixedArray;
    uint[10] public myFixedArray2 = [1,2,3,4,5];
}
```

## How It Works

```solidity
contract ArrayExample {
    uint256[] public numbers;
    uint256[5] public myFixedArray;

    function addNumber(uint256 num) public {
        numbers.push(num);
    }

    function getNumber(uint256 index) public view returns (uint256) {
        return numbers[index];
    }
}
```

