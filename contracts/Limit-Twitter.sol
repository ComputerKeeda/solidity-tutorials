// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Twitter {
    uint16 constant MAX_CONTENT_LENGTH = 250;

    struct Tweet {
        uint256 id;
        string content;
        address author;
        uint256 timestamp;
    }

    mapping(address => Tweet[]) public tweetsByUser;

    function postTweet(uint256 _id, string memory _content) public {
        require(
            bytes(_content).length <= MAX_CONTENT_LENGTH,
            "Tweet content must be less than 250 bytes"
        );

        Tweet memory newTweet = Tweet(
            _id,
            _content,
            msg.sender,
            block.timestamp
        );
        tweetsByUser[msg.sender].push(newTweet);
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
