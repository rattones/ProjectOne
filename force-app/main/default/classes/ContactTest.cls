@isTest
public  class ContactTest {
    public ContactTest() {}

    @isTest 
    static void testValidPhone() {
        Contact contact= new Contact(Phone= '+554 37 99900-8877');

        Database.SaveResult rs= Database.insert(contact, false);

        System.assert(rs.isSuccess());
        // System.assertEquals('37999888877', contact.Phone);
    }

    @isTest
    static void testInvalidPhone() {
        Contact contact= new Contact(Phone= '37 99900-e300');

        Database.SaveResult rs= Database.insert(contact, false);

        System.assertEquals('Invalid Phone number: '+contact.Phone
                                , rs.getErrors()[0].getMessage());
    }
}
