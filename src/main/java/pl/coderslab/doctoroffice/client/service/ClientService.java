package pl.coderslab.doctoroffice.client.service;

import pl.coderslab.doctoroffice.client.entity.Client;

import java.util.List;

public interface ClientService {

    List<Client> getClients();
    Client findClient(Long id);
    void addClient(Client client);
    void updateClient(Client client);
    void deleteClient(Long id);
}
