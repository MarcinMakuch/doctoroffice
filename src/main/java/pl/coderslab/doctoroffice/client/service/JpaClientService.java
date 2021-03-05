package pl.coderslab.doctoroffice.client.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import pl.coderslab.doctoroffice.client.entity.Client;
import pl.coderslab.doctoroffice.client.repository.ClientRepository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
@RequiredArgsConstructor
public class JpaClientService implements ClientService{

    private final ClientRepository clientRepository;


    public List<Client> getClients () {
        return clientRepository.findAll();
    }

    public Client findClient(Long id) {
        return clientRepository.getOne(id);
    }

    public void addClient(Client client) {
        Optional<Client> userOptional = clientRepository.findClientByPesel(client.getPesel());
        if (userOptional.isPresent()) {
            throw new IllegalStateException("osoba o tym peselu istnieje");
        }
        clientRepository.save(client);
    }

    public void updateClient(Client client) {
        clientRepository.save(client);
    }
    public void deleteClient(Long id) {
        clientRepository.deleteById(id);
    }
}
