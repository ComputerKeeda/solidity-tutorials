# Structs in Solidity

In Solidity, a struct is a custom data type that allows you to group multiple variables together. This can be useful for creating complex data structures.

## Defining a Struct

You define a struct using the `struct` keyword followed by the name of the struct and its members enclosed in curly braces `{}`.

```solidity
struct Person {
    string name;
    uint age;
}
```

In this example, we have defined a struct called `Person` that has two members: `name` of type `string` and `age` of type `uint`.

## Using Structs

You can declare variables of the struct type just like any other variable.

```solidity
Person myPerson;

myPerson.name = "John";
myPerson.age = 30;

function getPersonName(Person memory _person) public view returns (string memory) {
    return _person.name;
}

function getPersonAge(Person memory _person) public view returns (uint) {
    return _person.age;
}

```

In this example, we have declared a variable `myPerson` of type `Person`. We then set the values of its members. Additionally, we have defined two functions that take a `Person` as an argument and return the name and age of the person.

## Structs in Arrays

You can also use structs within arrays to create more complex data structures.

```solidity
Person[] people;

function addPerson(string memory _name, uint _age) public {
    people.push(Person(_name, _age));
}

function getPeople() public view returns (Person[] memory) {
    return people;
}
```

In this example, we have defined an array `people` of type `Person`. We then added a function `addPerson` that allows you to add new people to the array. Additionally, we have defined a function `getPeople` that returns the entire array.

> [!NOTE]
> We have added some struct-related examples in our tweets contract to help you understand how they work.
> - [Tweets Contract](../../contracts/Struct-Twitter.sol)

## Summary

Structs in Solidity allow you to group multiple variables together into a single custom data type. This can be useful for creating complex data structures and organizing your code more effectively.