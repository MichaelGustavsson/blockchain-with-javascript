// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// Som en definition av funktions signaturer.
// som måste implementeras av barnkontrakt
abstract contract ContractOne{
    address internal member;
    uint internal _balance;
    // Jag har skapat ett funktions interface...
    // Jag har skapat en abstrakt funktion...
    function One() public virtual pure returns(string memory);

    // En konkret funktion med implementering
    function Two() public pure virtual returns(string memory){
        return "Hej pa dig";
    }
}

contract ContractTwo is ContractOne{
    function One() public pure virtual override  returns(string memory){
        return "Halloj!!!";
    }

    function Two() public pure override returns(string memory){
        return "Kolla var jag finns!!!";
    }
}

contract ContractThree is ContractTwo{
    function One() public pure override  returns(string memory){
        return "Tjena mittbena";
    }
}