pragma solidity ^0.4.0;

contract VulnerableFundraiser{

    mapping(address=>uint) balances;

    // VULNERABLE
    function withdrawAllMyCoins() {
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
    
    function MaliciousWallet(address fundraiserAddress) {
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
    
    }
    
    function() payable {
    
        
    }
    
}
