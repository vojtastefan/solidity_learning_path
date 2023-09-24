/*Stack Club
This StackClub contract will have many members like a club or an organization would. 
We'll track these members by keeping a list of addresses.
Members will be added by pushing their address to the top of the list. 
Members will be removed by popping the most recent one off of the list. A Last-In-First-Out structure, just like a stack!

Your Goal: Add Members 
Create a dynamic sized array of addresses called members
Create an external function addMember which has a single parameter: an address for a new member.
Create a public view function isMember that takes an address and returns a bool indicating whether the address is a member or not.
Create a constructor which will add the deployer address as the first member of the stack club.
Create a removeLastMember function which will remove the last member added to the club.
       Function Security:
Ensure that the removeLastMember function can only be called by an existing member
Ensure that addMember can only be called by an existing member*/

// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract StackClub {
	address[] members;

	constructor() {
		members.push(msg.sender);
	}

	function isMember(address member) public view returns(bool) {
		for(uint i = 0; i < members.length; i++) {
			if(members[i] == member) {
				return true;
			}
		}
		return false;
	}

	function removeLastMember() external {
		require(isMember(msg.sender));
		members.pop();
	}

	function addMember(address member) external {
		require(isMember(msg.sender));
		members.push(member);
	}
}