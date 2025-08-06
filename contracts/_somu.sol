// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract SOMU {
    uint public  totalSupply;
    address owner;
    mapping(address=>uint) public  balances ;
    constructor(){
        owner=msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender==owner,"not owner");
        _;
    }

    function mint(uint amount) public onlyOwner {
        totalSupply+=amount;
    }
    function mintTo(address to,uint amount) public onlyOwner {
        // require(balances[msg.sender]>=amount,"insufficient balance");
        balances[to]+=amount;
        totalSupply-=amount;
        // balances[msg.sender]-=amount;
    }
    function transfer(address to,uint amount) public{
        require(balances[msg.sender]>=amount,"insufficient balance"); 
        balances[msg.sender]-=amount;
        balances[to]+=amount;
    }
}