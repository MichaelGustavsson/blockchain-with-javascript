// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract TryCatchDemo{
    // Named exception...
    error AuthorizationException(string message);

    function FunctionOne() public pure{
        // require(false, "Something bad happened");
        // assert(false);
        // revert("Det blev fel")

        // Gör saker
        /* try {} catch, catch, catch. */
        revert AuthorizationException("You are not authorized to do this...");
    }
}

contract CatchingException{
    event LogError(string reason);
    event LogErrorCode(uint code);
    event LogErrorBytes(bytes data);

    function FunctionTwo() public{
        TryCatchDemo demo = new TryCatchDemo();
        try demo.FunctionOne(){
            // Då har det gått bra, då kan vi göra något...
        } catch Error(string memory reason){ // för require...
            // Göra något med felet
            emit LogError(reason);
        } catch Panic(uint errorCode){ // för assert...
            emit LogErrorCode(errorCode);
        } catch(bytes memory data){
            emit LogErrorBytes(data);
        }
    }
}