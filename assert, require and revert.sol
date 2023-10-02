// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    address owner;

    constructor() payable {
        owner = msg.sender;
        require (msg.value >= 1e18, "not enough love send");

    }
    function withdraw() public payable {
        
    //check if the caller of the withdraw function (msg.sender) is the same as the owner of the contract. 
    //If the condition is not met, the function will revert and the transaction will be reverted.
        require(msg.sender == owner); 

    // Transfers the balance of the contract (address(this).balance) to the msg.sender (the caller of the function). 
    //The payable keyword is used to convert msg.sender into a payable address, allowing it to receive Ether.
        payable(msg.sender).transfer(address(this).balance);
    }
    
}