// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// Interface = kontrakt...
interface ITest {
    struct testStruct{
        uint id;
        string name;
    }
    function FunctionB() external view returns(uint);
    function InternalFunctionAbstract() external pure returns(uint);
}

interface ITest2{
    function NewFunction() external pure returns(uint);
}

abstract contract AbstractContract{
    uint x;
    function ChangeX(uint value) internal view returns(uint){

    }

    function ChangeY(uint value) public virtual view returns(uint){
        return value;
    }

//     function InternalFunctionAbstract() internal virtual  pure returns(uint);
//     function FunctionA() internal virtual pure returns(address);
}

contract DerivedContractA is ITest, ITest2, AbstractContract{
    function InternalFunctionAbstract() public pure returns(uint){}
    function FunctionB() external view returns(uint){}

    function AccessChangeX() public view returns(uint){

        return ChangeX(10);
    }

    function AccessChangeY() public pure returns(uint){
        return ChangeY(10);
    }

    function ChangeY(uint value) public override pure returns(uint){
        return value * 2;
    }

    function NewFunction() external pure returns(uint){
        return 45;
    }
}

contract DerivedContractB is ITest, AbstractContract{

    // Kommer ifrån interface ITest
    function FunctionB() external view returns(uint){}
    function InternalFunctionAbstract() external pure returns(uint){}

    function ChangeY(uint value) public override pure returns(uint){
        return value + 20;
    }

    function GetBalance() public view returns(uint){
        return address(this).balance;
    }

}

contract ConsumingContract{
    DerivedContractA derivedA = new DerivedContractA();
    DerivedContractB derivedB = new DerivedContractB();
    AbstractContract parent = new DerivedContractB();
    AbstractContract parent2 = derivedB;

    function Test() public view returns(uint){
        // return derived.InternalFunctionAbstract();
        // return derived.AccessChangeX();
        // return derivedA.ChangeY(2);
        // return derivedB.ChangeY(2);
        return parent2.ChangeY(2);
        // return parent2.GetBalance();
        // return derivedB.GetBalance();
    }
}

/*
abstract contract ContractA{
    function InternalFunction() internal pure returns(uint){
         return 10;
    }

    // Skapa ett interface...
    function InternalFunctionAbstract() internal virtual  pure returns(uint);
    
    // function InternalFunction(uint x) internal pure returns(uint){
    //      return x;
    // }

    function PrivateFunction() private pure returns(uint){
        return 20;
    }
}

abstract contract ContractA2{
    function InternalFunction(uint x) internal pure returns(uint){
         return x;
    }
}

contract ContractB is ContractA, ContractA2{
    function UseInternalFunction() public pure returns(uint){
        return InternalFunction();
    }

    function UseInternalFunction(uint x) public pure returns(uint){
        return InternalFunction(x);
    }

    function UsePrivateFunction() public pure returns(uint){
    //  return PrivateFunction();
    }

    function InternalFunctionAbstract() internal override   pure returns(uint){}
}

contract ContractC{
    ContractB b = new ContractB();
    uint _value;
    function FunctionC() public returns(uint){
        _value = b.UseInternalFunction();
        return _value;
    }
}

contract ContractC2{
    ContractB b = new ContractB();
    uint _value;

    function FunctionC2() public returns(uint){
        _value = b.UseInternalFunction(40);
        return _value;
    }
}

contract ContractD{
    function ExternalFunction() external pure returns(uint){
        return 30;
    }

    function TestExternalFunction() public pure returns(uint){
        // return ExternalFunction();
    }
}

contract ContractE{
    ContractD d = new ContractD();

    function ConsumeExternalFunction() public view returns(uint){
        return d.ExternalFunction();
    }
}
*/