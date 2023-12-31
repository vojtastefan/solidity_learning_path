// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
/*Contracts can inherit other contract by using the `is` keyword.
Function that can be overridden by a child contract must declare `virtual`.
Function that is overriding a parent function must declare `override`. */

contract X {
    function foo() public pure virtual returns (string memory) {
        return "X";
    }

    function bar() public pure virtual returns (string memory) {
        return "X";
    }
}

contract Y is X {
    // Overrides X.foo
    // Also declared as virtual, this function can be overridden by child contract
    function foo() public pure virtual override returns (string memory) {
        return "Y";
    }
    
    function bar() public pure virtual override returns (string memory) {
        return "Y";
    }
}

// Order of inheritance - most base-lke to derived
contract Z is X, Y {
    // Overrides both X.foo and Y.foo
    function foo() public pure override(X, Y) returns (string memory) {
        return "Z";
    }
    function bar()public pure override(X,Y) returns (string memory) {
        return "Z";
    }
}
