pragma solidity ^0.5.0;

import "./BaleToken.sol";
contract BitmindICO {
    address admin;
    BaleToken public tokenContract;
    uint256 public tokenPrice;

    constructor(BaleToken _tokenContract, uint256 _tokenPrice) public {
        // Assign an admin
        admin = msg.sender;

        // Token Contract 
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
        
        // Token Price
    }
}