// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

/*

    RESTRICTED ACCESS PATTERN...
    Modifiers för att begränsa vad som kan och får göras med funktioner samt vem som får göra.

    1.  OnlyBy
    2.  OnlyAfter
    3.  Costs
*/

contract RestrictedAccessDemo{
    address public Owner = msg.sender;
    uint public BlockCreationTime = block.timestamp;

    modifier onlyBy(address account){
        require(msg.sender == Owner, "Sender is not authorized!");
        _;
    }

    modifier onlyAfter(uint time){
        require(block.timestamp >= time, "It is absolutely to early!");
        _;
    }

    modifier onlyIfPayedFor(uint amount){
        require(msg.value >= amount, "Not enough payment");
        _;
    }

    function ChangeOwner(address newOwner) onlyBy(Owner) public{
        Owner = newOwner;
    }

    function RemoveOwner() onlyBy(Owner) onlyAfter(BlockCreationTime + 10 seconds) public{
        delete Owner;
    }

    function ForceChangeOfOwner(address newOwner) onlyIfPayedFor(5 ether) public payable {
        Owner = newOwner;
    }
}