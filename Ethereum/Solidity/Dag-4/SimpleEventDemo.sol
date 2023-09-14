// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SimpleEventDemo{
    // Event/Händelse deklaration...
    event SentConfirmationEvent(address from, address to, uint amount);

    mapping(address => uint) public Balance;

    constructor(){
        Balance[msg.sender] = 100;
    }

    function Deposit(address to, uint amount) public returns(bool){

        require(Balance[msg.sender] >= amount,"You haven't enough to spend");
        Balance[msg.sender] -= amount;
        Balance[to] += amount;

        emit SentConfirmationEvent(msg.sender, to, amount);

        return true;
    }
}