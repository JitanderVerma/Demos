pragma solidity >=0.7.0 <0.9.0;

// ERC-20 Token Standard: https://eips.ethereum.org/EIPS/eip-20
contract KointradeToken {
    // Public variables of the token
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    // This creates an array with all balances
    mapping(address => uint256) public balanceOf;

    // This generates a public event on the blockchain that will notify clients
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Constructor function
    constructor() public {
        name = "Kointrade";                                   // Set the name for display purposes
        symbol = "KNT";                                       // Set the symbol for display purposes
        decimals = 18;                                        // Amount of decimals for display purposes
        totalSupply = 100000000 * (10 ** uint256(decimals));  // Set the total supply to 100 million
        balanceOf[msg.sender] = totalSupply;                  // Give the creator all initial tokens
    }

    // Send `_value` tokens to `_to` from the caller's account
    function transfer(address _to, uint256 _value) public {
        require(_to != address(0), "Invalid recipient address");  // Ensure the recipient address is valid
        require(_value <= balanceOf[msg.sender], "Insufficient balance");  // Ensure the caller has enough balance

        // Subtract from the sender
        balanceOf[msg.sender] -= _value;
        // Add the same amount to the recipient
        balanceOf[_to] += _value;

        // Notify clients about the transfer
        emit Transfer(msg.sender, _to, _value);
    }
}
