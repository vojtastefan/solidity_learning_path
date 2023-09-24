// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    /*Create a pure, external function sum which takes a fixed size array of five unsigned integers.
    Find the sum of the unsigned integers and return it as a uint */

    function sum(uint[5]  calldata numbers) pure external returns(uint s ) {
        for(uint i=0; i< 5 ; i++) {
            s += numbers[i];
        }
    }
}

/* to same zadani pro dynamic sized arrays*/
// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
   function sum(uint[] calldata cisla) pure external returns(uint soucet) {
       for (uint i = 0; i < cisla.length; i++) {
           soucet += cisla[i];
       }
   } 
}

/* Data Location 
There are three different locations for data in Solidity: calldata, memory and storage. Quite simply, calldata is for referring to external argument data, memory is for temporary data, and storage is for persistent data. Let's examine them more closely. 

calldata 
When we broadcast a transaction from an EOA to the EVM, we send data which includes an identifier for the function we're targeting and the arguments we're sending.

If we are referring to this message call data directly and we don't want to change it, we can use the calldata location. This makes the argument is read-only, we cannot modify it.

memory 
Memory is a temporary data location provided for us to keep our local variables in. These variables will only exist in that scope for the length of the transaction.

When we're working with arrays that should only exist for the length of the transaction, and we'd like to modify them, we label them with the memory keyword. We can read/write to this data location relatively cheaply when compared to storage. If we use this keyword in the parameter list it will make a copy of the calldata array which can be modified.

storage 
Storage is the data that actually gets stored on the blockchain. This is where state variables are stored!

For all the node operators in the network who store the state of the blockchain, this increases the amount of data they need to store. For this reason storage operations are expensive.

Value vs Reference
Assigning an array will copy it in some cases and store a reference in other cases.

Let's consider this example: */

import "forge-std/console.sol";
contract Contract {
    uint[3] numbers = [1,2,3];

    function modify() external {
        uint[3] memory memoryArray = numbers;
        // will modifying memoryArray modify numbers?
        memoryArray[0] = 4;
        // nope! 
        console.log(numbers[0]); // 1
    }
}
 /*This will not modify the numbers. The values from numbers are copied into memoryArray at this assignment and they are otherwise unrelated.

 In fact, the compiler will warn that this can be labeled as a view since this function is not modifying an state.*/

import "forge-std/console.sol";
contract Contract {
    uint[3] numbers = [1,2,3];

    function modify() external {
        uint[3] storage storageArray = numbers;
        // will modifying storageArray modify numbers?
        storageArray[0] = 4;
        // yup! 
        console.log(numbers[0]); // 4
    }
}
 /*This will modify the numbers. In this case, storageArray contains a reference to numbers due to its storage location.

Further Reading
If you want more resources on how smart contract storage works, check out this guide, What is Smart Contract Storage Layout? */