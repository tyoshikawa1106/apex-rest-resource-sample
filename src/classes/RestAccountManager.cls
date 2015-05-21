/**
 * RestResource Annotation Sample
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@RestResource(urlMapping='/Account/*')
global with sharing class RestAccountManager {

    private static RestAccountManagerHelper helper = new RestAccountManagerHelper();
    private static RestAccountManagerDao dao = new RestAccountManagerDao();
  
    /**
     * Apex REST - Get Accounts
     */
    @HttpGet
    global static List<Account> getAccounts() {
        RestRequest req = RestContext.request;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        System.debug(accountId);
        // Get Accounts
        List<Account> results = dao.getAccounts();
        return results;
    }
  
    /**
     * Apex REST - Create Account
     */
    @HttpPost
    global static Account createAccount(String accountName, String accountNumber) {
        
        // Check Parameters
        if (helper.isParametersError(accountName)) {
            return new Account();
        }
        // Get Account
        Account account = helper.getAccount(accountName, accountNumber);
        // Craate Account
        insert account;
        
        return account;
    }
}