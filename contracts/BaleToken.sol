pragma solidity ^0.5.0;

contract BaleToken {
    //Name
    string public name = 'Bale Token';
    //Symbol
    string public symbol = 'BLT';
    //Standard
    string public standard = 'Bale Token v1.0';
    uint256 public totalSupply;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );
    event Approval(
        address indexed _owner, 
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address=>uint256)) public allowance;
    constructor(uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
        // allocate the initial supply
    }
    //Transfer
 
    function transfer(address _to, uint256 _value) public returns (bool success){
        //Exception if account doesn't have 
        require(balanceOf[msg.sender] >= _value);

        //Transfer the balance
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] +=_value;

        //Transfer event    
        emit Transfer(msg.sender, _to, _value);
        //return a boolean
        return true;
    }
    //Approve function
    function approve(address _spender, uint256 _value) public returns (bool success){
        //handle allowance
        allowance[msg.sender][_spender] = _value;
        // require(allowance(msg.sender, _spender));

        //Approve event
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // Delegate Transfer 
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        //require _from has enough tokens
        require(_value <= balanceOf[_from]);

        //require allowance is bih enough
        require(_value <= allowance[_from][msg.sender]);
        
        //Change the balance 
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        
        //update the allowance
        allowance[_from][msg.sender] -= _value;

        //Transver event
        emit Transfer(_from, _to, _value);
        
        //Return boolean
        return true;
    }

}