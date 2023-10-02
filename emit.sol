// SPDX-License-Identifier: MIT
// emit example
pragma solidity >=0.8.0 ;

contract SimpleToken {
    mapping(address => uint256) public balances;
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    function transfer(address _to, uint256 _value) public {
        require(balances[msg.sender] >= _value, "Insufficient balance.");
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
    }
}

// another example:

contract SimpleToken2 {

    //public state variable balances which is a mapping from addresses to unsigned integers. 
    //This is used to keep track of the balance of tokens for each address.
    mapping(address => uint256) public balances; 

    //declares an event named Transfer which will be emitted on successful token transfers. 
    //It includes the sender's address, the receiver's address, and the amount transferred.
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    ////public function named transfer which takes two arguments: the recipient's address and the amount to be transferred.
    function transfer(address _to, uint256 _value) public { 

        //This line checks if the sender has enough balance to make the transfer. If not, it throws an error with the message "Insufficient balance."
        require(balances[msg.sender] >= _value, "Insufficient balance.");

        //If the sender has enough balance, this line deducts the specified amount from the sender's balance.
        balances[msg.sender] -= _value;

        //This line adds the specified amount to the recipient's balance.
        balances[_to] += _value;

        // This line emits the Transfer event, indicating a successful transfer.
        emit Transfer(msg.sender, _to, _value);
    }
}