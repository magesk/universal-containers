public class PositionSharingClassTest {
	private static testMethod void myShareTest(){
		// this is a test method for Position Inserts, not Updates
		// updates were left out so as not to interfere with student helloWorldTest exercise
		Position__c[] positions = new Position__c[100];
		
		for (Integer i=0;i<100;i++){
			positions[i] = new Position__c();
			
			positions[i].Name = String.valueOf(i) + ' test name';
			positions[i].Responsibilities__c = String.valueOf(i) + ' test responsibilities';
			positions[i].Job_Description__c = String.valueOf(i) + ' test description';
		}
		
		try{
			System.debug('attempting to update the position');
			insert positions;
			System.debug('update complete');
		} catch (System.DmlException e){
			System.debug('we caught a dml exception: ' + e.getDmlMessage(0));	
		}
	}
}