// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract Money {
    uint public totalMoney;
    address public owner;

    event Deposit(address indexed from, uint amount);
    event Withdraw(address indexed to, uint amount);

    constructor() payable {
        owner = msg.sender;
        totalMoney += msg.value; // Optionally, you can add the deposited value to totalMoney here
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function deposit() public payable {
        totalMoney += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function drain(address payable ad) public onlyOwner {
        ad.transfer(address(this).balance);
        emit Withdraw(ad, address(this).balance);
    }
}