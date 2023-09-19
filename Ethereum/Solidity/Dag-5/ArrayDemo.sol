// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract ArrayDemo{
    address[] public members;
    uint[3] public myArray;
    function AddMember() public {
        members.push(msg.sender);
    }

    function GetMembers() public view returns(address[] memory){
        return members;
    }

    function GetMembersLength() public view returns(uint){
        return members.length;
    }

    function RemoveMember(uint index) public {
        // delete members[index];
        // Strular till ordningen i listan...
        // members[index] = members[members.length - 1];
        // members.pop();

        // Remove an element but keep the list ordered
        for(uint i = index; i < members.length - 1; i++){
            members[i] = members[i + 1];
        }

        members.pop();
    }

    function RemoveLastMember() public{
        members.pop();
    }
}