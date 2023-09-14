
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract AuthorizedOwner{
    address owner;

    constructor(){
        owner = msg.sender;
    }

    modifier OnlyOwner(){
        require(msg.sender == owner, "Ooop, You are not authorized!");
        _;
    }
}