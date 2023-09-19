// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
//Variables declared immutable are like constants, 
//except their value can be set inside the constructor.
contract Immutable {
    // Modify state variable owner to be immutable
    address public immutable owner;
    //Set owner to msg.sender inside the constructor.
    constructor() {
        owner = msg.sender;
    }
}
