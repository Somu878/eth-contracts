// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract Will {
    address owner;
    address payable beneficiary;
    uint amount;
    uint startTime;
    uint public  lastVisited;
    uint ten_years;

    constructor(address payable _receiver) {
        owner = msg.sender;
        lastVisited = block.timestamp;
        startTime = block.timestamp;
        ten_years = 10;
        beneficiary = _receiver;
    }
    modifier onlyOwner(){
        require(msg.sender==owner);
        _;
    }
        modifier onlyReceiver(){
        require(msg.sender== beneficiary);
        _;
    }

    function ping() public onlyOwner{
        lastVisited = block.timestamp;
    } 

    function deposit() public onlyOwner payable {
        lastVisited = block.timestamp;
    }
    function claim() public onlyReceiver  payable {
        require(lastVisited<=block.timestamp-ten_years,"10 years not yet passed");
        payable(beneficiary).transfer(address(this).balance);
    }
}