package com.ushtrimi1.clientAccount.service;
import com.ushtrimi1.clientAccount.exception.ResourceNotFoundException;
import com.ushtrimi1.clientAccount.model.Client;
import com.ushtrimi1.clientAccount.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class ClientService1  implements ClientService{

    @Autowired
    private ClientRepository clientRepository;

    @Override
    public Client createClient(Client client) {
        return clientRepository.save(client);
    }

    @Override
    public List<Client> getAllClient() {
        return this.clientRepository.findAll();
    }

    @Override
    public Client getClientById(long clientId) {
        Optional<Client> productDb = this.clientRepository.findById(clientId);

        if(productDb.isPresent()) {
            return productDb.get();
        }else {
            throw new ResourceNotFoundException("Record not found with id : " + clientId);
        }
    }

    @Override
    public void deleteClient(long clientId) {
        Optional<Client> productDb = this.clientRepository.findById(clientId);

        if (productDb.isPresent()) {
            this.clientRepository.delete(productDb.get());
        } else {
            throw new ResourceNotFoundException("Record not found with id : " + clientId);
        }
    }

    @Override
    public Client updateClient(Client client) {
        Optional<Client> clientDb = this.clientRepository.findById(client.getId());

        if(clientDb.isPresent()) {
            Client clientUpdate = clientDb.get();
            clientUpdate.setName(client.getName());
            clientUpdate.setSurname(client.getSurname());
            clientUpdate.setEmail(client.getEmail());
            clientRepository.save(clientUpdate);
            return clientUpdate;
        }else {
            throw new ResourceNotFoundException("Record not found with id : " + client.getId());
        }
    }

}
