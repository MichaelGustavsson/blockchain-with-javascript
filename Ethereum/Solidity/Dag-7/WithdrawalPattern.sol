// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract WithdrawalPattern{
    mapping(address => uint) _balances;

    // Sätta in pengar
    // Titta på min balans

    // Funktion som låter mottagaren av resurser/pengar själv göra detta aktivt
    // Withdrawal Pattern...

    // function Withdraw(uint amount){}

    function Refund(uint amount) public returns(bool){
        // 1.   Upfront guard
        require(_balances[msg.sender] >= amount);
        // 2.   Optimistic accounting
        _balances[msg.sender] -= amount;
        // 3.   Överföra tillgångarna
        payable(msg.sender).transfer(amount);
        // 4.   Om allt går bra returna ok.
        return true;
    }
}