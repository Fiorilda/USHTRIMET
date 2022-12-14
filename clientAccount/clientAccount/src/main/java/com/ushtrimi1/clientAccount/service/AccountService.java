package com.ushtrimi1.clientAccount.service;


import com.ushtrimi1.clientAccount.model.Account;
import com.ushtrimi1.clientAccount.model.Client;

import java.util.List;

public interface AccountService {

    Account createAccount(Account account);
    List<Account> getAllAccounts();
    Account getAccountById(long accountId);
    void deleteAccount(long accountId);
    Account updateAccount(Account account,long clientId, long accountId);
    Account updateAccount(Account account);
}
