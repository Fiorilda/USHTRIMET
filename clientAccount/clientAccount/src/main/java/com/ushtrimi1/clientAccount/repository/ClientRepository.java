package com.ushtrimi1.clientAccount.repository;

import com.ushtrimi1.clientAccount.model.Client;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClientRepository extends JpaRepository<Client,Long> {

}
