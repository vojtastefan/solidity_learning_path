// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

//Declare a public state variable named todos which will store an array of Todo structs.
    Todo[] public todos; //This line declares a public array of Todo structs named todos.

//Write a function which will create a new Todo with text set from input and then stores the new Todo into the array todos.
    function create(string calldata _text) external {
//This line creates a new Todo struct with the provided _text and completed set to false, and adds it to the todos array.
        todos.push(Todo({text: _text, completed: false})); 
    }


//Write a function named updateText(uint _index, string calldata _text) which will update the text of Todo stored at _index to the new value _text.
    function updateText(uint _index, string calldata _text) external {
        Todo storage todo = todos[_index]; //This line retrieves the Todo struct at the specified _index from the todos array and stores it in a todo variable.
        todo.text = _text;
        //todos[_index].text = _text     jedna se o ekvivalentni reseni dane funkce, ale za jistych okolnosti toto reseni zere vice gasu. 
    }
/*Write a function to toggle completed of a Todo stored in todos at a given index.
The function toggleCompleted(uint _index) will toggle completed of Todo stored in todos at _index.
For example, if completed is true, this function should flip it to false.
Likewise if false, set it to true.*/
    function toggleCompleted(uint _index) external {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed; //This line toggles the completed status of the todo.
    }

/* Write function get(uint _index) which will return the Todo stored at _index.
This function should return two outputs, text and completed.*/
    function get(uint _index) external view returns (string memory, bool) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
        //return(todos[_index].text, todos[_index].completed); dela to same, co 2 radky vyse
    }
}
