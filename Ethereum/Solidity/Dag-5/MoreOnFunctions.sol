// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MoreOnFunctions{
    uint private _value;
    string private _title = 'Batman Forever';

    // Destructuring
    function One() public pure returns(uint, string memory, bool){
        return (10, 'Batman Begins', true);
    }

    // Destructuring function...
    function Two() public{
        (_value,_title,) = One();
    }

    function GetValue() public view returns(uint){
        return _value;
    }

    function GetTitle() public view returns(string memory){
        return _title;
    }

    // Function overloading...
    // Så länge som funktionernas signatur skiljer sig åt kan vi använda samma funktionsnamn.
    // Signatur är antalet argument, arguments eller argumentents typ.
    // RETURN TYP OCH NAMN INGÅR EJ I SIGNATUREN!!!
    function AddMovie() public{}
    function AddMovie(string memory title) public{}
    function AddMovie(string memory title, string memory director) public{}

    function Test(bool x) public {}
    function Test(uint x) public {}
    function Test(string memory x) public {}

    function AddNumbers(uint a, uint b) private pure returns(uint){
        return a + b;
    }

    function AddNumbers(uint a, uint b, uint c) private pure returns(uint){
        return a + b + c;
    }

    function TestAddTwonumbers(uint a, uint b) public pure returns(uint){
        return AddNumbers(a, b);
    }

    function TestAddThreenumbers(uint a, uint b, uint c) public pure returns(uint){
        return AddNumbers(a, b, c);
    }
}