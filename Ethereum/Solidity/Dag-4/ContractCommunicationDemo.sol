// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract One{
    mapping(address => uint) public Balances;

    function Deposit() public payable {
        Balances[msg.sender] += msg.value;
    }

    receive() external payable {
        Deposit();
    }
}

contract Two{
    receive() external payable {}

    // function Deposit(address payable  contractOne) public {
    function Deposit(address contractOne) public {
        // 1.
        // Enklaste sättet att kommunicera mellan olika kontrakt.
        /* One contractVar = One(contractOne);
        contractVar.Deposit{value: 20, gas: 50000}(); */

        // 2.
        /* (bool success, ) = contractOne.call{value: 10, gas: 75000}("");
        require(success); */

        // 3.
        bytes memory payload = abi.encodeWithSignature("Deposit()");

        (bool success, ) = contractOne.call{value: 30, gas: 100000}(payload);
        require(success);

    }
}