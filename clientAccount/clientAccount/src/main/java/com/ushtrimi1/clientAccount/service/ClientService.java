package com.ushtrimi1.clientAccount.service;
import com.ushtrimi1.clientAccount.model.Client;
import org.springframework.stereotype.Service;
import javax.transaction.Transactional;
import java.util.List;


public interface ClientService  {

    Client createClient(Client client);
    List<Client> getAllClient();
    Client getClientById(long clientId);
    void deleteClient(long id);
    Client updateClient(Client client);

}
