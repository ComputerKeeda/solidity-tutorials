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

