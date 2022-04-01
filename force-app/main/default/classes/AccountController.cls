public class AccountController {
    public AccountController() {}
    public class CEPControllerException extends Exception {}

    /**
     * Save Billing address from given cep by ViaCEP api
     */
    @AuraEnabled
    public static void saveBillingAddress(CEPDTO.CEPResponse address, Id accountId) {
        // System.debug(address);
        // System.debug(accountId);
        try {
            // Account account= [SELECT Id, BillingStreet, BillingCity, BillingCountry, BillingPostalCode, BillingState
            //                 FROM Account
            //                 WHERE Id = :accountId]; // criar uma DAO para usar consultas

            Account account= new Account(Id= accountId);

            account.BillingStreet= address.logradouro+' '+address.complemento+' '+address.bairro;
            account.BillingCity= address.localidade;
            account.BillingCountry= 'Brasil';
            account.BillingPostalCode= address.cep;
            account.BillingState= address.uf;

            // System.debug(account);

            update account;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    /**
     * Save Shipping address from given cep by ViaCEP api
     */
    @AuraEnabled
    public static void saveShippingAddress(CEPDTO.CEPResponse address, Id accountId) {
        // System.debug(address);
        // System.debug(accountId);
        try {
            // Account account= [SELECT Id, ShippingStreet, ShippingCity, ShippingCountry, ShippingPostalCode, ShippingState
            //                 FROM Account
            //                 WHERE Id = :accountId]; // criar uma DAO para usar consultas

            Account account= new Account(Id= accountId);

            account.ShippingStreet= address.logradouro+' '+address.complemento+' '+address.bairro;
            account.ShippingCity= address.localidade;
            account.ShippingCountry= 'Brasil';
            account.ShippingPostalCode= address.cep;
            account.ShippingState= address.uf;

            // System.debug(account);

            update account;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
