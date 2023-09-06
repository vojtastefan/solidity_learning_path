// Solidity program to demonstrate
// how to use 'structures'
// SPDX-License-Identifier: MIT


/* struct syntax:

struct <structure_name> {  
   <data type> variable_1;  
   <data type> variable_2; 
}
*/

// Solidity program to demonstrate
// how to use 'structures'
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Creating a contract
contract test {

// Declaring a structure
struct Book {
	string name;
	string writter;
	uint id;
	bool available;
}

// Declaring a structure object
Book book1;

// Assigning values to the fields
// for the structure object book2
Book book2
	= Book("nejaka kniha","kdokoliv ", 576213, false);

// Defining a function to set values
// for the fields for structure book1
function set_book1_detail() public {
	book1 = Book("prvni kniha","nejaky autor",2, true);
}


// Defining function to print
// book2 details
function book2_info(
)public view returns (
	string memory, string memory, uint, bool) {
		
		return(book2.name, book2.writter,
			book2.id, book2.available);
	}
	
// Defining function to print
// book1 details
function get_book1_details () public view returns (string memory, string memory,uint,bool) {
	return (book1.name, book1.writter, book1.id, book1.available);
}
}
