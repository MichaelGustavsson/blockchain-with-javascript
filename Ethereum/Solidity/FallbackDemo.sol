// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

/*
    Vad är då en fallback funktion?
    1.  Anonyma funktioner(utan namn)
    2.  Tar inga argument
    3.  Returnerar inget
    4.  MÅSTE deklareras som external

    send, transfer och call
    send och transfer får 2300 gas
    call tar allt
*/

contract Fallback{
    event log(uint gas);

    fallback() external payable {
        // Ha aldrig för mycket kod här. Det kostar...
        // funktioner konsumerar all gas...
        // Send metoden så får vi 2300 gas att utnyttja. Räcker för att skicka ett event.
        // Call metoden så får all gas men all gas kommer att utnyttjas plus lite till.

        emit log(gasleft());
    }

    function GetBalance() public view returns(uint){
        return address(this).balance;
    }
}

contract Send{
    function TransferToFallback(address payable to) public payable {
        // Skicka ether med metoden transfer...
        to.transfer(msg.value);
    }

    function CallToFallback(address payable to) public payable {
        (bool sent, ) = to.call{value: msg.value}("");

        require(sent, "Couldn't send");
    }
}