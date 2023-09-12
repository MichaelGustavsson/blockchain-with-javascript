// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Wallet{

    struct PaymentInfo{
        address from;
        uint amount;
    }

    PaymentInfo public Payment;

    function Deposit() public payable {
        /* Payment = PaymentInfo(msg.sender, msg.value); */
        Payment.from = msg.sender;
        Payment.amount = msg.value;
    }
}

/* contract Payment{
    address public Sender;
    uint public  Amount;

    constructor(address from, uint amount){
        Sender = from;
        Amount = amount;
    }
} */