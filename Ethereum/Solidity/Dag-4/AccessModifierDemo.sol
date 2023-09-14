// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// Private = Endast åtkomlig inifrån kontraktet
// Internal = Endast åtkomlig ifrån kontraktet och dess härledda kontrakt
// External = Endast åtkomlig utifrån
// Public = Åtkomlig överallt externt och internt...

contract AccessModifierDemo{

    uint public data = 100;

    function One() internal {
        uint changedValue = 75;
        data = changedValue;
    }

    function Two() public {
        One();        
    }
}

contract AccessModifierChild is AccessModifierDemo{
    function Three() public {
        One();
    }
}