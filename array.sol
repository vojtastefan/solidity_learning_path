// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ArrayBasic {
    // Several ways to initialize an array
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];
    // Fixed sized array, all elements initialize to 0
    uint[3] public arrFixedSize;

    // Insert, read, update and delete
    function examples() external {
        // Insert - add new element to end of array
        arr.push(1);
        // Read
        uint first = arr[0];
        // Update
        arr[0] = 123;
        // Delete does not change the array length.
        // It resets the value at index to it's default value,
        // in this case 0
        delete arr[0];

        // pop removes last element
        arr.push(1);
        arr.push(2);
        // 2 is removed
        arr.pop();

        // Get length of array
        uint len = arr.length;

        // Fixed size array can be created in memory
        uint[] memory a = new uint[](3);
        // push and pop are not available
        // a.push(1);
        // a.pop(1);
        a[0] = 1;
    }
    //Write function get(uint i) that will return the array element of arr at index i.
    function get(uint i) external view returns(uint) {
        return arr[i];
    }
    
    //Write external function push, it takes in a single input x of type uint and appends x to the end of the array arr.
    function push(uint x) external  {
        return arr.push(x);
    }
    
    //Write external function remove(uint i) which will delete element at i from the array arr.
    function remove(uint i) external {
        return delete arr[i];
    }
    
    //Write function getLength which will return the current length of the array arr.
    function getLength() external view returns(uint) {
        return arr.length;
    }


    
    
    
    
    
    
    
    
}
