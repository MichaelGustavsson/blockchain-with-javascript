// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// Base contract...
contract ContractOne{
    address internal sender;
    address internal contractAddress;
    uint internal _balance = 100;

    constructor(){
        sender = msg.sender;
    }

    
    function SetSender(address contract_address ) public {
        contractAddress = contract_address;
    }
}

// Derived contract...
contract ContractTwo is ContractOne{

    function GetSenderInfo() public view returns(address){
        return ContractOne.sender;
    }

    function GetBalance() public view returns(uint){
        return ContractOne._balance;
    }

    function SetBalance(uint value) public {
        ContractOne._balance = value;
    }
}
