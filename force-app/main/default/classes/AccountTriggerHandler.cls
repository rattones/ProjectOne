
public class AccountTriggerHandler extends TriggerHandler {

    // private static AccountBO bo= AccountBO.getInstance();
    private AccountBO bo= new  AccountBO();

    // public AccountTriggerHandler() {}

    public override void beforeInsert() {
        bo.accountValidation(Trigger.new);
    }

    public override void beforeUpdate() {
        bo.accountValidation(Trigger.new);
    }

    public override void beforeDelete() {}

    public override void afterInsert() {
        bo.accountInspectData(Trigger.new);
    }
}
