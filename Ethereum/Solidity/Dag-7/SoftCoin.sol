// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SoftCoin{
    address public minter;
    mapping(address => uint) public balances;

    event Confirm(address from, address to, uint amount);

    // Skapa ett felobjekt...
    error insuffientFunds(uint requestedAmount, uint availableAmount);

    constructor(){
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public{
        require(minter == msg.sender,"You are not authorized!");
        balances[receiver] += amount;
    }

    function transfer(address receiver, uint amount) public{
        if(amount > balances[msg.sender]){
            // gör något här!!!
            // Generera ett felmeddelande
            revert insuffientFunds({
                requestedAmount: amount,
                availableAmount: balances[msg.sender]
            });
        }

        balances[msg.sender] -= amount;
        balances[receiver] += amount;

        emit Confirm(msg.sender, receiver, amount);
    }
}