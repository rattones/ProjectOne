
public with sharing class ContactTriggerHandler extends TriggerHandler {

    private static ContactBO bo= ContactBO.getInstance();

    // public ContactTriggerHandler() {}

    public override void beforeInsert() {
        bo.contactValidation(Trigger.new);
    }

    public override void beforeUpdate() {
        bo.contactValidation(Trigger.new);
    }

    public override void beforeDelete() {}
}
