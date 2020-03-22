package edu.drexel.TrainDemo.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.drexel.TrainDemo.models.Orders;

@Repository
public interface OrdersRepository extends CrudRepository<Orders, Long> {

	List<Orders> findByOrderId(long order_id);
}
