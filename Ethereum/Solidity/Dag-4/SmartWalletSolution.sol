// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SmartWalletSolution{
    // State variables...
    address payable public Owner;
    address public SenderOfTransfer;
    address payable nextOwner;

    //Rösträknare...
    uint public constant ResetConfirmation = 2;

    // Lista av vilka adresser har vilken övre gräns att spendera
    mapping(address => uint) public SpendingLimit;

    constructor(){
        Owner = payable(msg.sender);
    }
    
    receive() external payable {}

    function SetSpendingLimit(address who, uint amount) public{
        require(msg.sender == Owner, "Ooops, You aren't authorized");

        SpendingLimit[who] = amount;
    }

    function TransferFunds(address payable to, uint amount) public {

        SenderOfTransfer = msg.sender;
        require(amount <= address(this).balance, "Ooops, You can't spend more than you have!");
        SpendingLimit[msg.sender] -= amount;

        to.transfer(amount);
    }

    function SetNewOwner(address payable newOwner) public{
        // Guarding logik för att kunna avgöra om vi är tillåtna att ge ägarskapet till ett nytt konto.
        if(newOwner != nextOwner){
            nextOwner = newOwner;
        }

        if(ResetConfirmation == 2){
            Owner = nextOwner;
            nextOwner = payable(address(0));
        }

    }
}