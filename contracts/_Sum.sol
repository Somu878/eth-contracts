//
pragma solidity ^0.8.0;



contract Sum{
  constructor(uint _num){
    sum = _num;
  }

  uint sum;
  function add(uint _num) public {
    sum += _num;
  }
  function sub(uint _num) public {
    sum -= _num;
  }
  function mul(uint _num) public {
    sum*= _num;
  }
  function div(uint _num) public{
    require(_num!=0,"Number should not be a zero!!");
    sum = _num/sum;
  }


  function getSum() public view returns (uint) {
    return sum;
  }

}