package io.swagger.service;

import com.chtrembl.petstore.pet.model.Pet;

import org.springframework.stereotype.Service;

import java.util.List;

import io.swagger.repository.PetRepository;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PetService {
    private final PetRepository petRepository;

    public List<Pet> getPets() {
        return petRepository.findAll();
    }
}

