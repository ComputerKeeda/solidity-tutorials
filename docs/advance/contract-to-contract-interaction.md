# Contract to Contract Interaction

Contract to contract interaction is a key feature in Solidity that allows one contract to interact with another contract. It enables **code reuse** and **modularity** in a decentralized environment.

---

## **What is Contract to Contract Interaction?**

> **Analogy**:  
> Let's suppose we have 2 Contract. Contract Game and Contract User.  
> Game contract will be used by User contract.

Contract to contract interaction allows the **Game contract** to call functions and variables of the **User contract**.

```solidity title="ContractA.sol"
pragma solidity ^0.8.0;

contract ContractA {
    uint256 public data;

    function setData(uint256 _data) external {
        data = _data;
    }
}
```

```solidity title="ContractB.sol"
pragma solidity ^0.8.0;

interface IContractA {
    function setData(uint256 _data) external;
    function data() external view returns (uint256);
}

contract ContractB {

    IContractA public contractA;

    constructor(address _contractA) {
        contractA = IContractA(_contractA);
    }

    function setDataInContractA(uint256 _data) external {
        contractA.setData(_data);
    }
}
```

Note Point here is what is interface?

Interface is a blueprint of a contract. It defines a set of function signatures without implementation. It is used to define a common standard between contracts.


## Exercise

We have created a User and Game Contract to understand this concept


So here is a wrong example of contract to contract interaction.
which helps us learn how address is called in the interactions

```solidity title="User-Interactions.sol"
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract User {

    struct Player{
        address playerAddress;
        string username;
        uint256 score;
    }

    mapping (address => Player) public players;

    modifier isNewUser() {
        // this address(0) is the zero address that means that the user who is using the function which is 
        // using this modifier should be a new user and not an existing user
        require(players[msg.sender].playerAddress == address(0), "User already exists");
        _;
    }

    function createUser(string memory username) external isNewUser {
        Player memory newPlayer = Player({
            playerAddress: msg.sender,
            username: username,
            score: 0
        });

        players[msg.sender] = newPlayer;
    }
}
```

```solidity title="Game-Interactions.sol"
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IUser {
    function createUser(string memory userName) external;
}

contract Game {
    uint public gameCount;
    IUser public userContract;

    constructor(address _userContractAddress) {
        userContract = IUser(_userContractAddress);
    }

    function startGame( string memory userName) external {
        gameCount++;
        userContract.createUser(userName);
    }
}
```

Now in this example if you see the User contract we have used `msg.sender` so here the address will always be the same and it will be of Game contract hence leading to logical error. 

The updated and correct code is written in the [User-Interactions](../../contracts/interactions/User-Interactions.sol) and [Game-Interactions](../../contracts/interactions/Game-Interactions.sol)