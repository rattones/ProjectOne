@isTest
private class AccountTest {

    @isTest 
    static void testInsertValidPhone() {
        Account account= new Account(Name='Account test', Phone='+55 37 99988-0011');

        Database.SaveResult rs= Database.insert(account, true);
        
        System.assert(rs.isSuccess());
        // System.assertEquals('37999880011', account.Phone);
    }

    @isTest
    static void testInsertInvalidPhone() {
        Account account= new Account(Name='Accoun test', Phone= '37 99900-e300');

        Database.SaveResult rs= Database.insert(account, false);

        System.assertEquals('Invalid Phone number: '+account.Phone
                                , rs.getErrors()[0].getMessage());
    }

    @isTest 
    static void testInsertValidFax() {
        Account account= new Account(Name='Account test', Fax='37 3988-0011');

        Database.SaveResult rs= Database.insert(account, false);
        
        System.assert(rs.isSuccess());
        // System.assertEquals('3739880011', account.Fax);
    }

    @isTest
    static void testInsertInvalidFax() {
        Account account= new Account(Name='Accoun test', Fax= '37 3900-e0011');

        Database.SaveResult rs= Database.insert(account, false);

        System.assertEquals('Invalid Phone number: '+account.Fax
                                , rs.getErrors()[0].getMessage());
    }

    @isTest 
    static void testUpdateValidPhone() {
        Account account= new Account(Name='Account test', Phone='37 99988-0011');
        insert account;

        account.Phone= '37 98877-0011';

        Database.SaveResult rs= Database.update(account, false);
        
        System.assert(rs.isSuccess());
        // System.assertEquals('37988770011', account.Phone);
    }

    @isTest
    static void testUpdateInvalidPhone() {
        Account account= new Account(Name='Accoun test', Phone= '37 99900-0011');
        insert account;

        account.Phone= '37 98877-e0011';

        Database.SaveResult rs= Database.update(account, false);

        System.assertEquals('Invalid Phone number: '+account.Phone
                                , rs.getErrors()[0].getMessage());
    }

    @isTest 
    static void testUpdateValidFax() {
        Account account= new Account(Name='Account test', Fax='37 3988-0011');
        insert account;

        account.Fax= '37 3877-0011';

        Database.SaveResult rs= Database.update(account, false);
        
        System.assert(rs.isSuccess());
        // System.assertEquals('3738770011', account.Fax);
    }

    @isTest
    static void testUpdateInvalidFax() {
        Account account= new Account(Name='Accoun test', Fax= '37 3900-0011');
        insert account;

        account.Fax= '37 3877-e0011';

        Database.SaveResult rs= Database.update(account, false);

        System.assertEquals('Invalid Phone number: '+account.Fax
                                , rs.getErrors()[0].getMessage());
    }

    @isTest 
    static void testCPFMask() {
        Account  account= new Account(Name='Account test', CPF__c= '01234567890');

        Test.startTest();
        Database.SaveResult rs= Database.insert(account, false);
        Test.stopTest();

        // System.assert(rs.isSuccess());
        System.assertEquals('012.345.678-90', account.CPF__c);
    }
}
