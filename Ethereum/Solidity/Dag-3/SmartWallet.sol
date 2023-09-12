// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SmartWallet{

    // Properties...
    mapping(address => Balance) public Balances;

    // Data structures...
    struct Transaction{
        uint amount;
        uint timestamp;
    }

    struct Balance{
        uint total;
        uint depositIndex; // Initialt är 0
        uint withdrawalIndex;
        mapping(uint => Transaction) deposits;
        mapping(uint => Transaction) withdrawals;
    }

    // Övning 1.
    // Getter för att visa deposit information för en address samt index
    // Ska returnera en transaktion...
    function GetDeposit(address sender, uint index) public view returns(Transaction memory){
        return Balances[sender].deposits[index];
    }

    function Deposit() public payable {
        Balances[msg.sender].total += msg.value;

        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        Balances[msg.sender].deposits[Balances[msg.sender].depositIndex] = deposit; //depositIndex = 0;

        Balances[msg.sender].depositIndex++;

    }

    // Övning 2.
    // Som räknar ner saldot för avsändare
    // Skapa en transaktion med det som ska tas ut
    // Hantera hur vi skickar uttaget belopp till mottagare.
    // Uppdatera index för Withdrawals
    // Skicka överföringen till mottagaren
    function WithDraw(address payable to, uint amount) public{
        Balances[msg.sender].total -= amount;

        Transaction memory withdrawal = Transaction(amount, block.timestamp);
        Balances[msg.sender].withdrawals[Balances[msg.sender].withdrawalIndex] = withdrawal;
        Balances[msg.sender].withdrawalIndex++;
        to.transfer(amount);
    }
}