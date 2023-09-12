// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract VerySimpleMappingDemo{
    // Hash Map
    mapping(uint => bool) public superSimpleMapping;
    mapping(address => uint) public addressMapping;

    function SetValue(uint index) public{
        superSimpleMapping[index] = true;
    }

    function SetAddress(uint value) public {
        addressMapping[msg.sender] = value;
    }
}