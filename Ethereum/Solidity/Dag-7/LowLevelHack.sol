// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract ContractA{
    address public senderAddress = msg.sender;

    function IsContract() public view returns(bool){
        uint32 size;
        address sender = msg.sender; // kan vara konto eller kontrakt

        assembly{
            size := extcodesize(sender)
        }

        return (size > 0);
    }
}

contract ContractB{
    bool public hacked;
    ContractA A;

    constructor(address fakeAddress){
        A = ContractA(fakeAddress);
        hacked = !A.IsContract();
    }
}

/* contract ContractC{
    address instantiater = msg.sender;
} */

/*
    När vi använder en constructor att injicera en adress för ett kontrakt
    så registeras inga bytes...
*/