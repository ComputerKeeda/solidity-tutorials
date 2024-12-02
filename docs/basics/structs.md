# **Arrays in Solidity**

An **array** is a collection of elements of the same data type. Solidity supports both **dynamic** and **fixed-size** arrays.

---

## **Types of Arrays**

1. **Dynamic Array**:

   - Can grow or shrink in size.
   - Example: `uint256[] public numbers;`

2. **Fixed-Size Array**:
   - Has a predefined size.
   - Example: `uint256[5] public myFixedArray;`

---

## **Array Declaration**

### **Dynamic Arrays**

```solidity
contract MyContract {
    uint256[] public numbers; // Dynamic array
    uint[] public numbers2 = [1, 2, 3, 4, 5]; // Dynamic array with initial values
}
```

### **Fixed-Size Arrays**

```solidity
contract MyContract {
    uint256[10] public myFixedArray; // All elements initialized to 0
    uint[10] public myFixedArray2 = [1, 2, 3, 4, 5]; // Partially initialized
}
```

---

## **How Arrays Work**

### **Example Contract**

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayExample {
    // Declare a dynamic array
    uint256[] public numbers;

    // Declare a fixed-size array
    uint256[5] public myFixedArray;

    // Add a number to the dynamic array
    function addNumber(uint256 num) public {
        numbers.push(num); // Adds the number to the end of the array
    }

    // Retrieve a number from the dynamic array by index
    function getNumber(uint256 index) public view returns (uint256) {
        require(index < numbers.length, "Index out of bounds");
        return numbers[index];
    }

    // Update a value in the fixed-size array
    function updateFixedArray(uint256 index, uint256 value) public {
        require(index < myFixedArray.length, "Index out of bounds");
        myFixedArray[index] = value;
    }
}
```

---

## **Explanation**

1. **Dynamic Arrays**:

   - Use `.push()` to add elements.
   - No predefined size—can grow or shrink dynamically.
   - Example:
     ```solidity
     addNumber(10); // Adds 10 to the array
     ```

2. **Fixed-Size Arrays**:

   - Cannot grow or shrink—size is fixed at declaration.
   - Example:
     ```solidity
     updateFixedArray(0, 42); // Updates the first element to 42
     ```

3. **Accessing Elements**:
   - Use the index to access array elements.
   - Example:
     ```solidity
     getNumber(0); // Retrieves the first element
     ```

---

## **Key Notes**

- Arrays are zero-indexed: The first element is at index `0`.
- Use `array.length` to get the size of an array.
- Always check array bounds to avoid runtime errors.
