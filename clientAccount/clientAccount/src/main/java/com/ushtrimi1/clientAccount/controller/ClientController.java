package com.ushtrimi1.clientAccount.controller;
import com.ushtrimi1.clientAccount.model.Client;
import com.ushtrimi1.clientAccount.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.util.List;

@RestController

public class ClientController {

    @Autowired
    private ClientService clientService;

    @GetMapping("/clients")
    public ResponseEntity<List<Client>> getAllClient(){
        return ResponseEntity.ok().body(clientService.getAllClient());
    }

    @GetMapping("/clients/{id}")
    public ResponseEntity<Client> getClientById(@PathVariable long id){
        return ResponseEntity.ok().body(clientService.getClientById(id));
    }

    @PostMapping("/clients")
    public ResponseEntity<Client> createProduct(@RequestBody Client client){
        return ResponseEntity.ok().body(this.clientService.createClient(client));
    }

    @DeleteMapping("/clients/{id}")
    public HttpStatus deleteClient(@PathVariable long id){
        this.clientService.deleteClient(id);
        return HttpStatus.OK;
    }

    @PutMapping("/clients/{id}")
    public ResponseEntity<Client> updateClient(@PathVariable long id, @RequestBody Client client){
        client.setId(id);
        return ResponseEntity.ok().body(this.clientService.updateClient(client));
    }


}
