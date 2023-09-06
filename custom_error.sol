// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CustomError {
    // definuji si custom errory
    error MyError(address caller, uint i);
    error InvalidAddress();
    error NotAuthorized(address caller);

    address public owner = msg.sender;

    function testMyError(uint i) external {
        if (i < 10) {
            revert MyError(msg.sender, i);
        }
    }

    function setOwner(address _owner) external {
 //Check that _owner is not the zero address, revert with InvalidAddress
    if (_owner == address(0)) {
        revert InvalidAddress();
    }
    //Revert with NotAuthorize(msg.sender) if msg.sender is not the current owner.
    if (msg.sender != owner) {
        revert NotAuthorized(msg.sender);
    }
    //If the 2 checks above pass, set the new owner.
    owner = _owner;
}
    }

