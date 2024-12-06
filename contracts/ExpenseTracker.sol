// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExpenseTracker {
    struct Expense{
        address user;
        string description;
        uint256 amount;
    }

    Expense[] public expenses;

    constructor() {
        expenses.push(Expense({user: msg.sender, description: "Dining out", amount: 1000}));
        expenses.push(Expense({user: msg.sender, description: "Groceries", amount: 500}));
        expenses.push(Expense({user: msg.sender, description: "Gas", amount: 100}));
        expenses.push(Expense({user: msg.sender, description: "Entertainment", amount: 100}));
    }

    function addExpense(string memory description, uint256 amount) public {
        expenses.push(Expense({user: msg.sender, description: description, amount: amount}));
    }

    function getTotalExpenses(address user) public view returns (uint256) {
        uint256 total = 0;
        for (uint256 i = 0; i < expenses.length; i++) {
            if (expenses[i].user == user) {
                total += expenses[i].amount;
            }
        }
        return total;
    }
}