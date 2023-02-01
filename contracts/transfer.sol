// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.10;
import "hardhat/console.sol" ;
// Declares a new contract
contract token {
    string public name = "Hardhat token";
    string public symbol= "HHT";
    uint public totalSupply = 100000;

    address public owner;
    mapping(address=> uint) balances;
    constructor(){
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    function transfer (address to, uint256 amount) external {
        console.log("**Sender balance is %s tokens", balances[msg.sender]);
        console.log("**Sender is sending %s tokens to %s address", amount, to);
        require (balances[msg.sender]>=amount, "You donot have enough money");
        balances[msg.sender] -= amount;
        balances[to] +=amount; 
    }

    function balanceOf(address account) external  view  returns (uint256 )
    {
        return balances[account];
    }
 }

 // Token address 0xd0f5a69aD07e33C2fa466a38367413469Bfc7456