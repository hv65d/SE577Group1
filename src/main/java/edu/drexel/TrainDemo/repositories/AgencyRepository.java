package edu.drexel.TrainDemo.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.drexel.TrainDemo.models.Agency;

@Repository
public interface AgencyRepository extends CrudRepository<Agency, Long> {
}
