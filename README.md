
# MODULE 4 PROJECT

This Solidity program is a Module 4 Project program that demonstrates the basic syntax and functionality of the Solidity programming language and Javascript.
## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain .The purpose of this project is to create a ERC20 token and deploy it on the Avalanche network for Degen Gaming. The smart contract should have the following functionality:
1. Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
2. Transferring tokens: Players should be able to transfer their tokens to others.
3. Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
4. Checking token balance: Players should be able to check their token balance at any time.
5. Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed. 
This program serves as a simple and straightforward introduction to Solidity programming, and can be used as a stepping stone for more complex projects in the future.

## Getting Started

### Executing solidity program

To run only solidity program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a.sol extension (e.g., project.sol). Copy and paste the following code into the file:

```solidity
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
        require(choice == 1 || choice == 2 || choice == 3 || choice == 4 || choice == 5, "PLEASE CHOOSE VALUE FROM ITEMS.");
        if(choice == 1){
            _burn(msg.sender,200);
            return BUNDLE;
        }
        else if(choice == 2){
            _burn(msg.sender, 150);
            return GUN_SKIN;
        }
        else if(choice == 3){
            _burn(msg.sender, 100);
            return SHIRT;
        }
        else if(choice == 4){
            _burn(msg.sender, 75);
            return PANT;
        }
        else if(choice == 5){
            _burn(msg.sender, 50);
            return GOOGLES;
        }
        else{
            return NONE;
        }
    }

    function token_balance() external view  returns (uint256){
        return  balanceOf(msg.sender);
    }

    function token_burn(address account, uint256 value) external {
        _burn(account, value);
    }
}
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.26" (or another compatible version), and then click on the "Compile project.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "project" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling all the functions. 

# To run the entire project you can use this steps:

You will want to do the following steps to run the project :-

1. First of all , install the metamask wallet on Browser.
2. Then follow the steps from this site https://docs.avax.network/build/dapp/smart-contracts/get-funds-faucet and click on button "Add subnet to wallet" to add network to metamask and then click on button "Request 2 AVAX" to add Testnet AVAX native tokens to account .
3. Add all files on the remix.
4. Open "project.sol" file and in Solidity compiler section , drop-down Advanced Configurations and select EVM VERSION as "shanghai" and also tick the checkbox Enable optimization then click on the "Compile project.sol" button.
5. In DEPLOY & RUN TRANSACTIONS section , Select ENVIRONMENT as "Injected Provider - Metamask" and select the account in which you have Testnet AVAX native tokens . Select the "Mtoken - project.sol" contract from the dropdown menu, and then click on the "Deploy" button after passing the name and symbol of token. Then confirm the transaction from metamask and now your contract is deployed .
6. Once the contract is deployed, you can interact with it by calling all the functions and confirming all the transactions .
7. You can check all the transactions , Degen tokens and left Testnet AVAX native tokens to confirm transactions(Used as gas fee) on the following AVALANCHE Testnet site https://subnets-test.avax.network/  by putting the metamask account address in the searchbar of site. You can also use Snowtrace site https://testnet.snowtrace.io/ if it is working by putting the metamask account address in the searchbar of site.
8. Everything is Done , Our Project is completed.


## Author

GAURAV GARG
STUDENT
CHANDIGARH UNIVERSITY
