public with sharing class ContactBO {

    private static final ContactBO instance= new ContactBO();
    private static Utility util= Utility.getInstance();

    public static ContactBO getInstance() {
        return instance;
    }

    public void contactValidation(List<Contact> contact) {
        for (Contact item: contact) {
            item.Phone= util.phoneNumberFormat((SObject)item, 'Phone');
            // item.HomePhone= util.phoneNumberFormat((SObject)item, 'HomePhone');
            // item.MobilePhone= util.phoneNumberFormat((SObject)item, 'MobilePhone');
            // item.OtherPhone= util.phoneNumberFormat((SObject)item, 'OtherPhone');
            // item.AssistantPhone= util.phoneNumberFormat((SObject)item, 'AssistantPhone');
            // item.Fax= util.phoneNumberFormat((SObject)item, 'Fax');
            // item.OtherPostalCode= util.CEPFormat((SObject)item, 'OtherPostalCode');
            // item.MailingPostalCode= util.CEPFormat((SObject)item, 'MailingPostalCode');
        }
    }
}
