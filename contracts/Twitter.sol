// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Twitter {
    mapping (address => string[]) public tweets;

    function postTweet(string memory _tweet) public {
        tweets[msg.sender].push(_tweet);
    }

/* 
    Now notice here that we have used `memory` keyword before the `string` keyword.
    This is to indicate that the string is stored in the memory.

    This we have to do because the string is stored in the memory of the contract.
    We have to do this for most of the complex data types in Solidity like arrays, structs, etc.
*/
    function getTweet(address _owner, uint256 _index) public view returns (string memory) {
        return tweets[_owner][_index];
    }

    function getAllTweets(address _owner) public view returns (string[] memory) {
        return tweets[_owner];
    }
}   