// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract GlobalVariables{
    uint _value;
    bytes32 _blockhash;
    bytes _data;
    address _sender;
    bytes4 _identifier;

    function SetValue(uint value) public payable {
        _value =  value;

        // Kategori Block...
        // _value = block.difficulty;
        // _value = block.timestamp;
        // _value = block.number;
        // _value = block.chainid;
        // _value = block.coinbase;
        // _value = block.basefee;
        // _value = block.gaslimit;

        // Blockhash
        _blockhash = blockhash(block.number);

        // msg objektet...
        // _data = msg.data;
        _identifier = msg.sig;

        // Transaction info...
        _value = tx.gasprice;
        _sender = tx.origin;
    }

    function GetValue() public view returns(uint){
        return _value;
    }

    function GetBlockhash() public view returns(bytes32){
        return _blockhash;
    }

    function GetMsgData() public view returns(bytes memory){
        return _data;
    }

    function GetFunctionSignature() public view returns(bytes4){
        return _identifier;
    }

    function GetSender() public view returns(address){
        return _sender;
    }
}