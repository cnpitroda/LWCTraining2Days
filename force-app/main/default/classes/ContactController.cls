public class ContactController {
    
    public ApexPages.StandardSetController getContactDetails{
        get{
            if(getContactDetails==null){
                getContactDetails = new ApexPages.StandardSetController(Database.getQueryLocator
                             ([SELECT FirstName,LastName,Title,Account.Name,Account.Industry from Contact]));
            }
            return getContactDetails;
        }
        set;
    }
	
    public List<Contact> getContacts(){
        return (List<Contact>) getContactDetails.getRecords();
    }
}