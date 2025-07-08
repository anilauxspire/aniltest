public class handlerClassAutopopulation {
    public static void beforeInsertHandler(List<Account> newAccounts){
    for (Account acc : newAccounts) {
        
                       acc.Phone = '9999999999';
        }

    }
}