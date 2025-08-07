// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract FLIXCOIN {
    uint public  totalSupply;
    address owner;
    mapping (address=>mapping(address=>uint)) public allowances;
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
    function approve(address _spender, uint amount) public returns (bool){
        allowances[msg.sender][_spender] = amount;
        return true;
    }
    function transerFrom(address _from,address _to, uint amount) public{
        uint allowance = allowances[_from][msg.sender];
        require(allowance>=amount,"insufficient allowance");
        uint balance = balances[_from];
        require(balance>=amount);
        balances[_from]-=amount;
        balances[_to]+=amount;
        allowances[_from][msg.sender] -=amount;
    }
    function transfer(address to,uint amount) public{
        require(balances[msg.sender]>=amount,"insufficient balance"); 
        balances[msg.sender]-=amount;
        balances[to]+=amount;
    }
    function burn(uint amount) public {
        require(balances[msg.sender]>=amount);
        balances[msg.sender]-=amount;
        totalSupply-=amount;
    }
}