package edu.drexel.TrainDemo.services;

import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.drexel.TrainDemo.models.Orders;
import edu.drexel.TrainDemo.repositories.OrdersRepository;

@Service
public class AddToCartService {

	@Autowired
	private OrdersRepository ordersRepository;

	@Autowired
	private UserNameResolverService userNameService;

	public String retrieveOrderDetails() {

		return null;
	}

	public void addToCart(String ticketDetails, String classH) {

		StringTokenizer str = new StringTokenizer(ticketDetails, ";");
		Orders orders = new Orders();
		// NYP;NOL;191296507;14:15:00;44:32:00;32;
		orders.setFromstation((String) str.nextElement());
		orders.setTostation((String) (str.nextElement()));
		orders.setTripid((String) str.nextElement());
		orders.setDeparttime((String) str.nextElement());
		orders.setArrivaltime((String) str.nextElement());
		orders.setNumoftickets(1);
		orders.setOrder_id(generateOrderId());
		orders.setCustomer_name("aditya");
		ordersRepository.save(orders);
		System.out.println("Testing this add to cart service");
	}

	public long generateOrderId() {
		return 0;
	}
}
