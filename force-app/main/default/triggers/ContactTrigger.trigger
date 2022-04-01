trigger ContactTrigger on Contact (before insert, before update, before delete) {
  new ContactTriggerHandler().run();
}