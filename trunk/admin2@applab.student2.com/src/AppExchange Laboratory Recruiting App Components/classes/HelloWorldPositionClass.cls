public class HelloWorldPositionClass {
	
	public static void helloWorld(Position__c[] positions){
		
		for (Position__c p:positions){
			if (p.Hello__c != 'World') {
				p.Hello__c = 'World';
			}
		}
	}
}