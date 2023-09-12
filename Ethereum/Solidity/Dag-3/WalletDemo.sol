// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract WalletDemo{
    mapping(address => uint) public Balance;

    function Deposit() public payable {
        Balance[msg.sender] += msg.value;
    }

    function GetBalance() public view returns(uint){
        return address(this).balance;
    }

    function WithDrawAllThereIs(address payable to) public{
        // Naiv överföring/uttag
        /* to.transfer(Balance[msg.sender]);
        Balance[msg.sender] = 0; */

        /* Vi bör kontrollera så att det finns tillräckligt med tillgångar på kontot */
        uint availableFunds = Balance[msg.sender];
        Balance[msg.sender] = 0;
        to.transfer(availableFunds);
    }
}