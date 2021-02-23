pragma solidity ^0.5.0;

import "./BaleToken.sol";
contract BitmindICO {
    address payable admin;
    BaleToken public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokenSold;

    event Sell(address _buyer, uint256 _amount);

    constructor(BaleToken _tokenContract, uint256 _tokenPrice) public {
        // Assign an admin
        admin = msg.sender;

        // Token Contract 
        tokenContract = _tokenContract;
        // Token Price
        tokenPrice = _tokenPrice;
    }

    function multiply(uint256 x, uint256 y) internal pure returns (uint256 z){
        require(y == 0 || (z = x*y) / y == x);
    }

    //Buy Token
    function buyTokens(uint256 _value) public payable {

        //Require that value is equal to tokens
        require(msg.value == multiply(_value, tokenPrice));

        //Require that the contract has enough tokens
        require(tokenContract.balanceOf(address(this)) >= _value);
        
        //Require that a transfer is successful
        require(tokenContract.transfer(msg.sender, _value));

        // Keep track of tokenSold
        tokenSold += _value;

        // trigger sell event
        emit Sell(msg.sender, _value);
    }

    //Ending ICO
    function endSale() public {
        
        // require admin
        require(msg.sender == admin);
        
        // transfer remaining bale token to admin
        require(tokenContract.transfer(admin, tokenContract.balanceOf(address(this))));
        
        // destroy contract
        selfdestruct(admin);
    }
}