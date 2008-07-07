trigger helloWorldPositionTrigger on Position__c (before insert, before update) {

	Position__c[] positions = Trigger.new;
	
	HelloWorldPositionClass.helloWorld(positions);
	
}