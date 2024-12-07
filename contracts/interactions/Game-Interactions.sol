// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IUser {
    function createUser(string memory userName, address userAddress) external;
}

contract Game {
    uint public gameCount;
    IUser public userContract;

    constructor(address _userContractAddress) {
        userContract = IUser(_userContractAddress);
    }

    function startGame( string memory userName) external {
        gameCount++;
        userContract.createUser(userName, msg.sender);
    }
}