// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract IterableMapping {
    mapping(address => uint) public balances; //It's used to store the balance of each address.
    mapping(address => bool) public inserted; //It's used to keep track of which addresses have been inserted into the keys array.
    address[] public keys; //It's used to store the addresses in the order they were inserted.

    //It's used to set the balance of the given address.
    function set(address _addr, uint _bal) external {
        balances[_addr] = _bal;

        if (!inserted[_addr]) { //This if statement checks if the given address has been inserted into the keys array.
            inserted[_addr] = true; //If the given address has not been inserted into the keys array, this line sets the value of the given address in the inserted mapping to true.
            keys.push(_addr); //This line adds the given address to the end of the keys array.
        }
    }

//It's used to get the balance of the address at the given index in the keys array.
    function get(uint _index) external view returns (uint) {
        address key = keys[_index]; //This line gets the address at the given index in the keys array.
        return balances[key]; //This line returns the balance of the gotten address.
    }
    
//Write function first() which will return the balance of the first address to be inserted.
// assume that the array keys is not empty.
    function first() external view returns (uint) {
        return balances[keys[0]];
    }

//Write function last() which will return the balance of the last address to be inserted.
    function last() external view returns (uint) {
       return balances[keys[keys.length - 1]]; 
    }
}
