package com.example.barbershop.repos;

import com.example.barbershop.domain.Service;
import org.springframework.data.repository.CrudRepository;

public interface ServiceRepo extends CrudRepository<Service, Integer> {
}
