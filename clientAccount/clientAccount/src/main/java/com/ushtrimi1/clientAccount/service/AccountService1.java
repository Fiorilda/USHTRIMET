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

//    @Override
//    public Account updateProduct(Account product) {
//        Optional<Account> productDb = this.productRepository.findById(product.getId());
//
//        if(productDb.isPresent()) {
//            Account productUpdate = productDb.get();
//            productUpdate.setId(product.getId());
//            productUpdate.setName(product.getName());
//            productUpdate.setDescription(product.getDescription());
//            productRepository.save(productUpdate);
//            return productUpdate;
//        }else {
//            throw new ResourceNotFoundException("Record not found with id : " + product.getId());
//        }
//    }


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
