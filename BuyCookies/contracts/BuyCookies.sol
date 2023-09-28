// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract BuyCookies{
  // Event som skickar ett meddelande när någon köper kakor...
  event NewMessage(
    address indexed from,
    uint  timestamp,
    string name,
    string message
  );

  // Struct för att definiera ett meddelande...
  struct Message{
    address from;
    uint  timestamp;
    string name;
    string message;
  }

  // Address till ägaren som är payable...
  address payable owner;

  // Array med meddelanden ifrån kunder...
  Message[] messages;

  // Constructor...
  constructor(){
    owner = payable(msg.sender);
  }

  // Funktion som returnerar meddelandena...
  function getMessages() public view returns(Message[] memory){
    return messages;
  }

  // Funktion för att kunna köpa kakor, tar argument name och message...
  function buyCookie(string memory _name, string memory _message) public payable{
    // Kakorna kosta mer en 0 ether...
    require(msg.value > 0, "Cookies aren't that cheap!");

    messages.push(Message(
      msg.sender,
      block.timestamp,
      _name,
      _message
    ));

    emit NewMessage(msg.sender, block.timestamp, _name, _message);
  }

  // Funktion som gör att jag som ägare kan få tag i betalningarna...
  function withdrawPayment() public{
    require(owner.send(address(this).balance));
  }
}