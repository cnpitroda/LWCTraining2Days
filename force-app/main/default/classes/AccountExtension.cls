public class AccountExtension {
	
    private final Account acct;
    public AccountExtension(ApexPages.StandardController std){
        this.acct = (Account)std.getRecord();
    }
}