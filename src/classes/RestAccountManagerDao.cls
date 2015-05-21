/**
 * RestResource Annotation Sample
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class RestAccountManagerDao {
    
    /**
     * Constructor
     */
    public RestAccountManagerDao() {
        
    }
    
    /**
     *  Get Accounts
     */
    public List<Account> getAccounts() {
        return [
            SELECT
                 Id
                ,Name
            FROM
                Account
            ORDER BY Name ASC
            LIMIT 200
       ];
    }
}