/**
 * RestResource Annotation Sample
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class RestAccountManagerDaoTest {
    
    private static RestAccountManagerDao dao = new RestAccountManagerDao();
    private static User testAdminUser = CommonTester.getTestUser();
 
    /**
     * Get Accounts
     */
    static testMethod void getAccountsTest1() {    
        System.runAs(testAdminUser) {
            
            Test.startTest();
            
            List<Account> results = dao.getAccounts();
            
            Test.stopTest();
            
            System.assertEquals(results.isEmpty(), true);
        }
    }
    
    /**
     * Get Accounts
     */
    static testMethod void getAccountsTest2() {    
        System.runAs(testAdminUser) {
            
            Account account = CommonTester.createAccount(true);
            
            Test.startTest();
            
            List<Account> results = dao.getAccounts();
            
            Test.stopTest();
            
            System.assertEquals(results.size(), 1);
        }
    }
}