// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
//Functions and addresses declared as payable can receive Ether.

contract Payable {
    // Payable address can receive Ether
    address payable public owner;

    // Payable constructor can receive Ether
    constructor() payable {
        owner = payable(msg.sender);
    }

    function deposit() external payable {}
    
    function getBalance() external view returns (uint) {
        return address(this).balance;  // ziska balance adresy
    }
}
