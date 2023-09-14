// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

/* contract AuthorizedOwner{
    address owner;

    constructor(){
        owner = msg.sender;
    }

    modifier OnlyOwner(){
        require(msg.sender == owner, "Ooop, You are not authorized!");
        _;
    }
} */

import "./AuthorizedOwnerContract.sol";

contract ModifiersDemo is AuthorizedOwner{
    mapping(address => uint) public Balance;
    uint tokenPrice = 1 ether;

    constructor(){
        Balance[owner] = 100;
    }

    function CreateToken() public OnlyOwner {
        Balance[owner]++;
    }

    function BurnToken() public OnlyOwner {
        Balance[owner]--;
    }

    function SendToken(address to, uint amount) public {
        require(Balance[msg.sender] >= amount, "Not enough funds to spend");

        Balance[msg.sender] -= amount;
        Balance[to] += amount;
    }
}