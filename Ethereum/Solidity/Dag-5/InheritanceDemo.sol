// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// Base Contract
contract Movie{
    string title = 'Batman';
    uint length = 145;

    function GetMovie() public view returns(string memory){
        return title;
    }
}

// Derived child
contract ActionMovie is Movie{
    function GetMovieLength()public view returns(uint){
        return Movie.length;
    }

    function SetMovie(string memory title) public{
        Movie.title = title;
    }
}

contract RomanticMovie is ActionMovie{
    function IsItRomantic() public pure  returns(bool){
        return true;
    }
}

contract Company{
    string public Name = "Warner Bros";
}

contract ComedyMovie is RomanticMovie, Company{
    function IsItComedy() public pure returns(bool){
        return true;
    }
}

