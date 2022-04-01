public with sharing class AccountBO {

    private static final AccountBO instance= new AccountBO();
    private static Utility util= Utility.getInstance();

    public static AccountBO getInstance() {
        return instance;
    }
    public class AccountBOException extends Exception {}

    public void accountValidation(List<Account> account) {
        for (Account item: account) {

            item.Phone= util.phoneNumberFormat((SObject)item, 'Phone');
            item.Fax= util.phoneNumberFormat((SObject)item, 'Fax');

            item.BillingPostalCode= util.CEPFormat((SObject)item, 'BillingPostalCode');
            item.ShippingPostalCode= util.CEPFormat((SObject)item, 'ShippingPostalCode');

            item.CPF__c= util.CPFMask((SObject)item, 'CPF__c');
            System.debug(item.CPF__c);
        }
    }
}
