package com.ushtrimi1.clientAccount.service;
import com.ushtrimi1.clientAccount.exception.ResourceNotFoundException;
import com.ushtrimi1.clientAccount.model.Account;
import com.ushtrimi1.clientAccount.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class AccountService1 implements AccountService {

    @Autowired
    private AccountRepository accountRepository;

    @Override
    public Account createAccount(Account account) {
        return accountRepository.save(account);
    }

    @Override
    public List<Account> getAllAccounts() {
        return this.accountRepository.findAll();
    }

    @Override
    public Account updateAccount(Account accountRequest,long clientId,long accountId) {
        if(!accountRepository.existsById(clientId)) {
            throw new ResourceNotFoundException("clientId " + clientId + " not found");
        }
        return accountRepository.findById(accountId).map(account -> {
            account.setCurrency(accountRequest.getCurrency());
            account.setAmount(accountRequest.getAmount());
            account.setBranch_code(accountRequest.getBranch_code());
            return accountRepository.save(account);
        }).orElseThrow(() -> new ResourceNotFoundException("accountId " + accountId + "not found"));
    }

    @Override
    public Account getAccountById(long accountId) {
        Optional<Account> accountDb = this.accountRepository.findById(accountId);

        if(accountDb.isPresent()) {
            return accountDb.get();
        }else {
            throw new ResourceNotFoundException("Record not found with id : " + accountDb);
        }
    }

    @Override
    public void deleteAccount(long accountId) {
        Optional<Account> accountDb = this.accountRepository.findById(accountId);

        if(accountDb.isPresent()) {
            this.accountRepository.delete(accountDb.get());
        }else {
            throw new ResourceNotFoundException("Record not found with id : " + accountId);
        }
    }
}
