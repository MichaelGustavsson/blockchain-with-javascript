// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// class
contract MoreOnMapping{
    /* mapping(address => uint) public members;

    function SetMemberTest(address addr)public view{
        members[addr];
    }

    function SetMember(address addr, uint key)public {
        members[addr] = key;
    }

    function RemoveMember(address addr) public{
        delete members[addr];
    } */

    /* A more realistic example */
    // internt tillstånd
    mapping(uint => Movie) private _movies;

    struct Movie{
        string title;
        string director;
        string releaseYear;
        uint16 length;
    }

    // Beteende...
    function AddMovie(uint id, string memory title, 
        string memory director, string memory releaseYear, uint16 length) public {
            _movies[id] = Movie(title, director, releaseYear, length);
    }

    function GetMovie(uint key) public view returns(Movie memory){
        return _movies[key];
    }
}