trigger AccountTrigger on Account (before insert, before update, before delete, after insert) {
  new AccountTriggerHandler().run();
}