
public with sharing class ContactTriggerHandler extends TriggerHandler {

    // private static ContactBO bo= ContactBO.getInstance();
    private ContactBO bo= new ContactBO();

    // public ContactTriggerHandler() {}

    public override void beforeInsert() {
        bo.contactValidation(Trigger.new);
    }

    public override void beforeUpdate() {
        bo.contactValidation(Trigger.new);
    }

    public override void beforeDelete() {}
}
