/**
 * RestResource Annotation Sample
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class RestAccountManagerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());
 
    /**
     * Apex REST - Get Account
     */
    static testMethod void getAccountTest1() {    
        System.runAs(testAdminUser) {
            
            RestRequest req = new RestRequest();
            RestResponse res = new RestResponse();
            
            req.requestURI = '/services/apexrest/Account';
            req.httpMethod = 'GET';
            RestContext.request = req;
            RestContext.response= res;
            
            Test.startTest();
            
            List<Account> results = RestAccountManager.getAccounts();
            
            Test.stopTest();
            
            System.assertEquals(results.isEmpty(), true);
        }
    }
    
    /**
     * Apex REST - Get Account
     */
    static testMethod void getAccountTest2() {    
        System.runAs(testAdminUser) {

            Account account1 = new Account(Name = 'sforce1');
            insert account1;

            Account account2 = new Account(Name = 'sforce2');
            insert account2;
            
            RestRequest req = new RestRequest();
            RestResponse res = new RestResponse();
            
            req.requestURI = '/services/apexrest/Account';
            req.httpMethod = 'GET';
            RestContext.request = req;
            RestContext.response= res;
            
            Test.startTest();
            
            List<Account> results = RestAccountManager.getAccounts();
            
            Test.stopTest();
            
            System.assertEquals(results.size(), 2);
        }
    }
    
    /**
     * Apex REST - Crate Account
     */
    static testMethod void createAccountTest1() {    
        System.runAs(testAdminUser) {
            
            RestRequest req = new RestRequest();
            RestResponse res = new RestResponse();
            
            req.requestURI = '/services/apexrest/Account';
            req.httpMethod = 'POST';
            RestContext.request = req;
            RestContext.response= res;
            
            String accountName = '';
            String accountNumber = 'A-001';
            
            Test.startTest();
            
            Account result = RestAccountManager.createAccount(accountName, accountNumber);
            
            Test.stopTest();
            
            System.assertEquals(String.isEmpty(result.Id), true);
            System.assertEquals(String.isEmpty(result.Name), true);
            System.assertEquals(String.isEmpty(result.AccountNumber), true);
        }
    }
    
    /**
     * Apex REST - Crate Account
     */
    static testMethod void createAccountTest2() {    
        System.runAs(testAdminUser) {
            
            RestRequest req = new RestRequest();
            RestResponse res = new RestResponse();
            
            req.requestURI = '/services/apexrest/Account';
            req.httpMethod = 'POST';
            RestContext.request = req;
            RestContext.response= res;
            
            String accountName = 'Sample';
            String accountNumber = 'A-001';
            
            Test.startTest();
            
            Account result = RestAccountManager.createAccount(accountName, accountNumber);
            
            Test.stopTest();
            
            System.assertEquals(String.isNotEmpty(result.Id), true);
            System.assertEquals(result.Name, accountName);
            System.assertEquals(result.AccountNumber, accountNumber);
        }
    }
}
