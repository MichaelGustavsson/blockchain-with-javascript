// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

/*
    Solidity har inbyggda funktioner för att kryptera(skapa hash värden)
    keccak256(SHA3)
    sha256
    ripemd160

    keccak är den ledande hash funktionen idag är ett alternativ till SHA-256 båda returnerar en 32bytes hash.
*/

contract RandomGenerator{
    Oracle _oracle;

    constructor(address oracleAddress){
        // Vi konsumerar en redan skapad instans...
        _oracle = Oracle(oracleAddress);
    }

    function Randomize(uint range) external view returns(uint){
        return uint(keccak256(abi.encodePacked(_oracle.Random, block.timestamp,block.difficulty,msg.sender))) % range;
    }
}

// Ett orakel utanför vårt kontrakt. Som tillför ytterligare en nivå av komplexitet.
contract Oracle{
    address _admin;
    uint public Random;

    constructor(){
        _admin = msg.sender;
    }

    function feed(uint rand) external{
        require(msg.sender == _admin);
        Random = rand;
    }
}