
// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

interface StorageInterface {
    function store(uint256 num) external;
    function retrieve() external  view returns(uint256);
}

contract crossContract{
    constructor(){}
    function getNum() public view  returns (uint){
        uint _val =  StorageInterface(0x4a9C121080f6D9250Fc0143f41B595fD172E31bf).retrieve();
        return  _val;
    }

    function setNum(uint _num) public {
        StorageInterface(0x4a9C121080f6D9250Fc0143f41B595fD172E31bf).store(_num);
    }
  
}