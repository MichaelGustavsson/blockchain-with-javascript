// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity >= 0.8.0;

contract DumbMessage{
  event UpdatedMessage(string oldMsg, string newMsg);
  string public message; // Tillståndet i kontraktet...

  constructor(string memory initMessage){
    message = initMessage;
  }

  function SetMessage(string memory newMessage) public{
    string memory prevMsg = message;
    message = newMessage;
    emit UpdatedMessage(prevMsg, newMessage);
  }
}