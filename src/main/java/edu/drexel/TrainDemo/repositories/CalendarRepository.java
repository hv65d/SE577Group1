package edu.drexel.TrainDemo.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.drexel.TrainDemo.models.Calendar;

@Repository
public interface CalendarRepository extends CrudRepository<Calendar, Long> {
}