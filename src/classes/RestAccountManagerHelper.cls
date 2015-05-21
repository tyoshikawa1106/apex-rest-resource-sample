/**
 * RestResource Annotation Sample
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class RestAccountManagerHelper {
    
    /**
     * Constructor
     */
    public RestAccountManagerHelper() {
        
    }
    
    /**
     * Check Parameters
     */
    public Boolean isParametersError(String accountName) {
        if (String.isEmpty(accountName)) {
            return true;
        }
        
        return false;
    }
    
    /**
     * Get Account
     */
    public Account getAccount(String accountName, String accountNumber) {
        Account account = new Account(
             Name = accountName
            ,AccountNumber = accountNumber
        );
        
        return account;
    }
}