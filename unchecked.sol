// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract UncheckedMath {
    function add(uint x, uint y) external pure returns (uint) {
        // 22291 gas
        // return x + y;

        // 22103 gas
        // unchecked zkontroluje, zda výpočet není např záporný 
        // a tím šetří gas v případě chyby
        //  btw unchecked šetří gas v každém případě
        unchecked {
            return x + y;
        }
    }

    function sub(uint x, uint y) external pure returns (uint) {
        // 22329 gas
        // return x - y;
        unchecked {
            return x - y;
        }
    }

    function sumOfSquares(uint x, uint y) external pure returns (uint) {
        // Wrap complex math logic inside unchecked
        unchecked {
            uint x2 = x * x;
            uint y2 = y * y;

            return x2 + y2;
        }
    }

    function sumOfCubes(uint x, uint y) external pure returns (uint) {
        unchecked{
            return x*x*x+y*y*y;
        }
    }
}
