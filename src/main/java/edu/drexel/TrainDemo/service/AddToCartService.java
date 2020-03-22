package edu.drexel.TrainDemo.service;

import java.util.StringTokenizer;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

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
	
	private long latestId = 0;
	private long latestIdHolder;

	public String retrieveOrderDetails() {

		return null;
	}

	public void addToCart(String ticketDetails, String classH) {

		StringTokenizer str = new StringTokenizer(ticketDetails, ";");
		Orders orders = new Orders();
		if (classH.equals("B")) {

		} else if (classH.equals("P")) {

		}
		orders.setFromstation((String) str.nextElement());
		orders.setTostation((String) (str.nextElement()));
		orders.setTripid((String) str.nextElement());
		orders.setDeparttime((String) str.nextElement());
		orders.setArrivaltime((String) str.nextElement());
		orders.setNumoftickets(1);
		orders.setOrder_id(generateOrderId());
		orders.setCustomer_name("user");
		ordersRepository.save(orders);
		System.out.println("Testing this add to cart service");
		
		latestIdHolder = generateOrderId();
	}

	public long generateOrderId() {
		latestId = latestIdHolder + 1;
		return latestId;
	}
	
	public void deleteOrder(long orderId) {
		ordersRepository.deleteById(orderId);
	}
}
