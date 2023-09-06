// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MappingBasic {
    // Mapping from address to uint used to store balance of addresses
    mapping(address => uint) public balances;

    // Nested mapping from address to address to bool
    // used to store if first address is a friend of second address
    mapping(address => mapping(address => bool)) public isFriend;

    function examples() external {
        // Insert
        balances[msg.sender] = 123;
        // Read
        uint bal = balances[msg.sender];
        // Update
        balances[msg.sender] += 456;
        // Delete
        delete balances[msg.sender];

        // msg.sender is a friend of this contract
        isFriend[msg.sender][address(this)] = true;
    }
    
    //Write external function get(address _addr) which will return the balance of _addr stored in balances.
    function get(address _addr) external view returns(uint) {
        return balances[_addr];
    }
    
    //Complete function set(address _addr, uint _val) which will set the balance of _addr to _val. 
    //This function must be external.
    function set(address _addr, uint _val) external {
        balances[_addr] = _val; 
    }
    
    //Complete remove(address _addr). This function will delete the value stored in balances at _addr. 
    //This function must be external.
    function remove(address _addr) external {
        delete balances[_addr];
    }
 
}
