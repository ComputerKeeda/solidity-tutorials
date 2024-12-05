// SPDX-License-Identifier: MIT

/* 
    1. Add a function called changeTweeLength to change max tweet length -> done
    2. Create a constructor function to set an owner of contract -> done
    3. Create a modifier called onlyOwner -> done
    4. Use onlyOwner on the changeTweetLength function
*/

pragma solidity ^0.8.0;

contract Twitter {
    uint16 public MAX_CONTENT_LENGTH = 250;

    struct Tweet {
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    mapping(address => Tweet[]) public tweetsByUser;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner is allowed");
        _;
    }

    function changeTweeLength(uint16 newLength) external onlyOwner {
        MAX_CONTENT_LENGTH = newLength;
    }

    function postTweet(string memory _content) external {
        require(
            bytes(_content).length <= MAX_CONTENT_LENGTH,
            "Tweet content must be less than 250 bytes"
        );

        Tweet memory newTweet = Tweet({
            id: tweetsByUser[msg.sender].length,
            author: msg.sender,
            content: _content,
            timestamp: block.timestamp,
            likes: 0
        });
        tweetsByUser[msg.sender].push(newTweet);
    }

    function likeTweet(uint256 id, address author) external {
        require(tweetsByUser[author][id].id == id, "Tweet does not exist");
        tweetsByUser[author][id].likes++;
    }

    function unlikeTweet(address author, uint256 id) external {
        require(tweetsByUser[author][id].id == id, "Tweet does not exist");
        require(
            tweetsByUser[author][id].likes > 0,
            "Sorry that's not possible"
        );
        tweetsByUser[author][id].likes--;
    }

    function getTweets() public view returns (Tweet[] memory) {
        return tweetsByUser[msg.sender];
    }

    function getSingleTweet(uint256 index) public view returns (Tweet memory) {
        return tweetsByUser[msg.sender][index];
    }

    function getTweetLength() public view returns (uint256) {
        Tweet[] memory tweets = tweetsByUser[msg.sender];
        uint256 length = tweets.length;
        return length;
    }
}
