
public with sharing class AccountTriggerHandler extends TriggerHandler {

    private static AccountBO bo= AccountBO.getInstance();

    // public AccountTriggerHandler() {}

    public override void beforeInsert() {
        bo.accountValidation(Trigger.new);
    }

    public override void beforeUpdate() {
        bo.accountValidation(Trigger.new);
    }

    public override void beforeDelete() {}
}
