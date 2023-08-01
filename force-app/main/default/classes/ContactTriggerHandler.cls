public class ContactTriggerHandler {
	
    public static void processRecords(List<Contact> conList){
        for(Contact c:conList){
            if(c.Create_User__c==True && c.Email!=null){
                CreateUser(c.Id);
            }
        }
    }
	@future    
    public static void CreateUser(String contactId){
        Contact c = [Select Id,FirstName,LastName,Email,AccountId from Contact where Id=:contactId];
        Id systemAdminProfileId = [SELECT Id FROM Profile WHERE Name = 'Standard Platform User' LIMIT 1].Id;
		User userExample = new User();
		userExample.Username = c.Email;
		userExample.FirstName = c.firstName;
		userExample.LastName = c.LastName;
		userExample.Alias = 'Alias';
		userExample.Email = c.Email;
		userExample.TimeZoneSidKey = 'America/New_York';
		userExample.LocaleSidKey = 'en_US';
		userExample.EmailEncodingKey = 'ISO-8859-1';
		userExample.ProfileId = systemAdminProfileId;
		userExample.LanguageLocaleKey = 'en_US';
		insert userExample;
    }
}