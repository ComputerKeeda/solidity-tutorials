// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Twitter {
    struct Tweet {
        uint256 id;
        string content;
        address author;
        uint256 timestamp;
    }

    mapping(address => Tweet[]) public tweetsByUser;

    function postTweet(uint256 _id, string memory _content) public {
        Tweet memory newTweet = Tweet(
            _id,
            _content,
            msg.sender,
            block.timestamp
        );
        tweetsByUser[msg.sender].push(newTweet);
    }

    function getTweets(address user) public view returns (Tweet[] memory) {
        return tweetsByUser[user];
    }

    function getSingleTweet(
        address user,
        uint256 index
    ) public view returns (Tweet memory) {
        return tweetsByUser[user][index];
    }

    function getTweetLength(address user) public view returns (uint256) {
        Tweet[] memory tweets = tweetsByUser[user];
        uint256 length = tweets.length;
        return length;
    }
}
