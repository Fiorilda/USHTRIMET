package com.ushtrimi1.clientAccount.controller;

import com.ushtrimi1.clientAccount.model.Account;
import com.ushtrimi1.clientAccount.model.Client;
import com.ushtrimi1.clientAccount.service.AccountService;
import com.ushtrimi1.clientAccount.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class AccountController {

      @Autowired
      private AccountService accountService;

      @GetMapping("/accounts")
      public ResponseEntity<List<Account>> getAllAccounts(){
          return ResponseEntity.ok().body(accountService.getAllAccounts());
      }


      @PostMapping("/accounts")
      public ResponseEntity<Account> createAccount(@RequestBody Account account){
          return ResponseEntity.ok().body(this.accountService.createAccount(account));
      }


    @GetMapping("/accounts/{id}")
    public ResponseEntity<Account> getAccountById(@PathVariable long id){
        return ResponseEntity.ok().body(accountService.getAccountById(id));
    }


//    @PutMapping("/accounts/{id}")
//    public ResponseEntity<Account> updateProduct(@PathVariable long AccountId, @RequestBody Account account){
//        account.setAccountId(AccountId);
//        return ResponseEntity.ok().body(this.accountService.updateAccount(account));
//    }

    @DeleteMapping("/accounts/{id}")
    public HttpStatus deleteAccount(@PathVariable long id){
        this.accountService.deleteAccount(id);
        return HttpStatus.OK;
    }

//    @DeleteMapping("/accounts/{id}")
//    public HttpStatus deleteProduct(@PathVariable long accountId){
//        this.accountService.deleteAccount(accountId);
//        return HttpStatus.OK;
//    }

}






