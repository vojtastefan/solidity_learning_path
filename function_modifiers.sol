//We can write modifiers on functions to run logic before and/or after the function body.
//Let's see an example:

import "forge-std/console.sol";
contract Example {
    function logMessage() public view logModifier {
        console.log("during");
    }

    modifier logModifier {
        console.log("before");
        _;
        console.log("after");
    }
}
 /*Let's say we called logMessage, what would you expect the order of the logged messages to be? 
It would be:

before
during 
after
Why? 

Notice that the logMessage function signature is decorated with the logModifier modifier.
This modifier can add behavior to the function before and after the function body runs. 
The _ in the modifier body is where the function body of the modified function will run.*/