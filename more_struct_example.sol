// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract test {
   enum FreshJuiceSize{ SMALL, MEDIUM, LARGE }
    //This is a variable named choice of the type FreshJuiceSize. 
    //It will hold one of the enumeration values.
   FreshJuiceSize choice; 

   //This is a constant named defaultChoice of the type FreshJuiceSize. 
   //It's set to the enumeration value MEDIUM and cannot be changed because it's a constant.
   FreshJuiceSize constant defaultChoice = FreshJuiceSize.MEDIUM;

   //public function that sets the choice variable to the enumeration value LARGE.
   function setLarge() public {
      choice = FreshJuiceSize.LARGE;
   }

   function getChoice() public view returns (FreshJuiceSize) {
      return choice;  //returns the current value of the choice variable.
   }

   function getDefaultChoice() public pure returns (uint) {
      return uint(defaultChoice); //returns the defaultChoice constant.
   }// SMALL is 0, MEDIUM is 1, and LARGE is 2. Therefore, this function will return 1 because MEDIUM is default
}