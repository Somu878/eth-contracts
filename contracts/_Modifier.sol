//
pragma solidity ^0.8.0;


contract Modifier{
    uint public sum;
    address public owner;
  constructor(uint _num){
    sum = _num;
    owner = msg.sender;
  }
  modifier  onlyOwner(){

    require(owner == msg.sender,"you are not the owner");
    _;
  }

  function add(uint _num) public onlyOwner{
    sum += _num;
  }


  function sub(uint _num) public onlyOwner{
    require(sum >= _num,"not enough balance");
    sum -= _num;
  }

function getNum() public view returns(uint){
    return sum;
}

    


}