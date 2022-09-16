package com.ushtrimi1.clientAccount.repository;

import com.ushtrimi1.clientAccount.model.Account;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccountRepository extends JpaRepository<Account,Long> { }
