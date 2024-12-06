// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MultiplayerGame {
    mapping (address => bool) players;

    function join() public virtual {
        players[msg.sender] = true;
    }
}

contract Game is MultiplayerGame {
    uint256 public playerCount = 0;
    string public gameName;

    constructor(string memory _gameName) {
        gameName = _gameName;
    }
    
    function joinGame() public {
        super.join();
        playerCount += 1;
    }
}