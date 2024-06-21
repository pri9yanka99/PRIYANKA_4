// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "ERC20.sol";

contract Mtoken is ERC20 {
    address owner = msg.sender;
    string items = "1. BUNDLE , 2. GUN SKIN , 3. SHIRT , 4. PANT , 5. GOOGLES";
    string BUNDLE = "YOU REDEEMED BUNDLE.";
    string SHIRT = "YOU REDEEMED SHIRT.";
    string PANT = "YOU REDEEMED PANT.";
    string GOOGLES = "YOU REDEEMED GOOGLES.";
    string GUN_SKIN = "YOU REDEEMED GUN SKIN";
    string NONE = "PLEASE CHOOSE VALUE FROM ITEMS.";
    mapping(address => string) public redeemed_items;
    mapping(address => uint256) public count;

    modifier onlyOwner { 
        require (owner == msg.sender, "only owner can access");
        _;
    }
    
    constructor(string memory name, string memory symbol) ERC20(name, symbol){} 

    function token_mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function token_transfer(address account,uint256 value) external  {
        _transfer(msg.sender, account, value);
    }

    function check_items() external view returns (string memory){
        return items;
    }

    function redeem_items(uint256 choice) external returns(string memory){
        count[msg.sender]++;
        require(choice == 1 || choice == 2 || choice == 3 || choice == 4 || choice == 5, "PLEASE CHOOSE VALUE FROM ITEMS.");
        if(count[msg.sender] == 1){
            if(choice == 1){
                redeemed_items[msg.sender] = string.concat(redeemed_items[msg.sender], "BUNDLE");
                _burn(msg.sender,200);
                return BUNDLE;
            }
            else if(choice == 2){
                redeemed_items[msg.sender] = string.concat(redeemed_items[msg.sender], "GUN_SKIN");
                _burn(msg.sender, 150);
                return GUN_SKIN;
            }
            else if(choice == 3){
                redeemed_items[msg.sender] = string.concat(redeemed_items[msg.sender], "SHIRT");
                _burn(msg.sender, 100);
                return SHIRT;
            }
            else if(choice == 4){
                redeemed_items[msg.sender] = string.concat(redeemed_items[msg.sender], "PANT");
                _burn(msg.sender, 75);
                return PANT;
            }
            else if(choice == 5){
                redeemed_items[msg.sender] = string.concat(redeemed_items[msg.sender], "GOOGLES");
                _burn(msg.sender, 50);
                return GOOGLES;
            }
            else{
                return NONE;
            }
        }
        else {
            if(choice == 1){
                redeemed_items[msg.sender] = string.concat(redeemed_items[msg.sender], " , BUNDLE");
                _burn(msg.sender,200);
                return BUNDLE;
            }
            else if(choice == 2){
                redeemed_items[msg.sender] = string.concat(redeemed_items[msg.sender], " , GUN_SKIN");
                _burn(msg.sender, 150);
                return GUN_SKIN;
            }
            else if(choice == 3){
                redeemed_items[msg.sender] = string.concat(redeemed_items[msg.sender], " , SHIRT");
                _burn(msg.sender, 100);
                return SHIRT;
            }
            else if(choice == 4){
                redeemed_items[msg.sender] = string.concat(redeemed_items[msg.sender], " , PANT");
                _burn(msg.sender, 75);
                return PANT;
            }
            else if(choice == 5){
                redeemed_items[msg.sender] = string.concat(redeemed_items[msg.sender], " , GOOGLES");
                _burn(msg.sender, 50);
                return GOOGLES;
            }
            else{
                return NONE;
            }
        }
    }

    function token_balance() external view  returns (uint256){
        return  balanceOf(msg.sender);
    }

    function token_burn(address account, uint256 value) external {
        _burn(account, value);
    }
}
