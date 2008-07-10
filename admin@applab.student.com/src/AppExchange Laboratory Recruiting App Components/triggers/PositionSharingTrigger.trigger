trigger PositionSharingTrigger on Position__c (after insert, after update) {

	Position__c[] positions = Trigger.new;
	
	// first, we must create Position__Share records
	PositionSharingClass.addBulkPS(positions);
	
	// second, we need to create Job_Application__Share and Candidate__Share records
	//    that are associated to the Position records that were updated (not needed for Insert)
	if (Trigger.isUpdate){
		Map<Id, Position__c> newPosMap = Trigger.newMap; 
		PositionSharingClass.addBulkJACS(newPosMap);
	}
}