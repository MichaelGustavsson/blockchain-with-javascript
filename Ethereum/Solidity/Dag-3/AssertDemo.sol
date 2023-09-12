// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

contract AssertDemo{
    mapping(address => uint8) public Balance;

    function Deposit() public payable {
        assert(msg.value == uint8(msg.value));
        Balance[msg.sender] += uint8(msg.value);
    }

    function WithDraw(address payable to, uint8 amount) public{
        require(amount <= Balance[msg.sender], "Forsok inte du har inte tillracklig med tillgangar");

        Balance[msg.sender] -= amount;
        to.transfer(amount);
    }
}