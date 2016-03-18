/**
 * RestResource Annotation Sample
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class RestAccountManagerHelperTest {

    private static RestAccountManagerHelper helper = new RestAccountManagerHelper();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());
 
    /**
     * Check Parameters
     */
    static testMethod void isParametersErrorTest1() {    
        System.runAs(testAdminUser) {
            
            String accountName = '';
            
            Test.startTest();
            
            Boolean result = helper.isParametersError(accountName);
            
            Test.stopTest();
            
            System.assertEquals(result, true);
        }
    }
    
    /**
     * Check Parameters
     */
    static testMethod void isParametersErrorTest2() {    
        System.runAs(testAdminUser) {
            
            String accountName = 'Sample';
            
            Test.startTest();
            
            Boolean result = helper.isParametersError(accountName);
            
            Test.stopTest();
            
            System.assertEquals(result, false);
        }
    }
    
    /**
     * Get Account
     */
    static testMethod void getAccountTest1() {    
        System.runAs(testAdminUser) {
            
            String accountName = '';
            String accountNumber = '';
            
            Test.startTest();
            
            Account result = helper.getAccount(accountName, accountNumber);
            
            Test.stopTest();
            
            System.assertEquals(String.isEmpty(result.Name), true);
            System.assertEquals(String.isEmpty(result.AccountNumber), true);
        }
    }
    
    /**
     * Get Account
     */
    static testMethod void getAccountTest2() {    
        System.runAs(testAdminUser) {
            
            String accountName = 'Sample';
            String accountNumber = 'A-001';
            
            Test.startTest();
            
            Account result = helper.getAccount(accountName, accountNumber);
            
            Test.stopTest();
            
            System.assertEquals(String.isNotEmpty(result.Name), true);
            System.assertEquals(String.isNotEmpty(result.AccountNumber), true);
        }
    }
}
