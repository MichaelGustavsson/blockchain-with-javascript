// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SimpleExceptionHandling{
    mapping(address => uint) public Balance;

    function Deposit() public payable {
        Balance[msg.sender] += msg.value;
    }

    function WithDraw(address payable to, uint amount) public{
        /* if(amount <= Balance[msg.sender]){
            Balance[msg.sender] -= amount;
            to.transfer(amount);
        } */

        // Validering av inmatning/input...
        require(amount <= Balance[msg.sender], "Forsok inte du har inte tillracklig med tillgangar");

        Balance[msg.sender] -= amount;
        to.transfer(amount);
    }
}