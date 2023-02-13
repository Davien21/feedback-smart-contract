// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract Feedback {
    uint256 public feedbackCount = 0;
    mapping(uint256 => FeedbackItem) private idToFeedbackItem;

    struct FeedbackItem {
        string message;
        address sender;
    }

    function addFeedback(string memory message) public {
        feedbackCount = feedbackCount + 1;
        idToFeedbackItem[feedbackCount] = FeedbackItem(
            message,
            msg.sender
        );
    }

    function getAllFeedback() external view returns (FeedbackItem[] memory) {
        FeedbackItem[] memory items = new FeedbackItem[](feedbackCount);
        uint256 Index = 0;
        for (uint256 i = 0; i < feedbackCount; i++) {
            uint256 Id = i + 1;
            FeedbackItem storage Item = idToFeedbackItem[Id];
            items[Index] = Item;
            Index += 1;
        }
        return items;
    }
}
