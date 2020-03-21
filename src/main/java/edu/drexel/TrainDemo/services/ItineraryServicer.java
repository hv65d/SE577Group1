package edu.drexel.TrainDemo.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.drexel.TrainDemo.models.Orders;
import edu.drexel.TrainDemo.repositories.OrdersRepository;

@Service
public class ItineraryServicer {

	@Autowired
	private OrdersRepository orderRepository;

	public List<Orders> returnItinerary(String userName) {

		List<Orders> itinerary = new ArrayList<Orders>();
		List<Orders> orders = (List<Orders>) orderRepository.findAll();
		orders.forEach(order -> {
			if (order.getCustomer_name().equals(userName)) {
				itinerary.add(order);
			}
		});
		return itinerary;
	}

}
