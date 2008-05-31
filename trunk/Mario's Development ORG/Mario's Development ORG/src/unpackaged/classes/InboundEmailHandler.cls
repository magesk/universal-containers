global class InboundEmailHandler implements Messaging.InboundEmailHandler {
	 global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        String myPlainText = '', fromName;
        
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
		System.debug('STEP1: Inbound Email Handler Class');
        System.debug('STEP2: Result: ' + result);
        
		try{
		      myPlainText = email.plainTextBody;
		      System.debug('STEP3: Subject: ' + email.subject);
		      System.debug('STEP4: Message Body: ' + myPlainText);
		      
			  fromName = email.fromName;
			  if(fromName == null || fromName.length() == 0)
			  	fromName = 'Unknown Email Sender Name';
			  else
			  	fromName = email.fromName;
			  	
		      Contact newCntct = new Contact(Lastname = fromName);
		      
		      newCntct.Description = 'Email Message Body: ' + email.plainTextBody;
		      newCntct.Email = email.fromAddress;
		      
		      insert newCntct;		      
		}

		catch (Exception e) {
  			System.debug('General Exception: ' + e);
 		}
        return result;
    }
    
    static testMethod void testClass() {

		// Create a new email and envelope object
	   	Messaging.InboundEmail email = new Messaging.InboundEmail();
	   	Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();
	
		// Create the plainTextBody and fromAddres for the test
		email.plainTextBody = 'Here is my plainText body of the email';
		email.fromAddress ='rmencke@salesforce.com';
	
		InboundEmailHandler taskObj = new InboundEmailHandler();
		taskObj.handleInboundEmail(email, env);
	} 
    
}