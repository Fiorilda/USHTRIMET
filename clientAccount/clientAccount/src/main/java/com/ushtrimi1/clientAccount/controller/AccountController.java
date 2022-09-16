package com.ushtrimi1.clientAccount.controller;
import com.ushtrimi1.clientAccount.model.Account;
import com.ushtrimi1.clientAccount.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
public class AccountController {

    @Autowired
    private AccountService accountService;

    @PutMapping("/clients/{clientId}/accounts/{accountId}")
    public ResponseEntity<Account> updateAccount(@PathVariable  long clientId,
                                                 @PathVariable long accountId,
                                                 @RequestBody Account accountRequest){
        return ResponseEntity.ok().body(this.accountService.updateAccount(accountRequest,clientId,accountId));
    }

    @GetMapping("/accounts")
    public ResponseEntity<List<Account>> getAllAccounts(){
        return ResponseEntity.ok().body(accountService.getAllAccounts());
    }

    @GetMapping("/accounts/{id}")
    public ResponseEntity<Account> getAccountById(@PathVariable long id){
        return ResponseEntity.ok().body(accountService.getAccountById(id));
    }

    @PostMapping("/accounts")
    public ResponseEntity<Account> createAccount(@RequestBody Account account){
        return ResponseEntity.ok().body(this.accountService.createAccount(account));
    }

    @DeleteMapping("/accounts/{id}")
    public HttpStatus deleteAccount(@PathVariable long id){
        this.accountService.deleteAccount(id);
        return HttpStatus.OK;
    }

}






