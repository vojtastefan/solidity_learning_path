// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Ownable {
    address public owner;
    
    //initiallize owner to msg.sender.
    constructor() {
        owner = msg.sender;
    }
    
    // a function modifier onlyOwner that will restrict function calls to the current owner.
    // It should checks that the caller is the current owner before executing the rest of the code,
    // otherwise throw an error with the message "not owner".
    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }
    
    
    //This function can only be called by the current owner.
    // Check that _newOwner is not address(0) and throw an error "new owner = zero address" if it is.
    function setOwner(address _newOwner) external onlyOwner {
        require( _newOwner != address(0), "new owner = zero address");
        owner = _newOwner;
    }
    
    
}
