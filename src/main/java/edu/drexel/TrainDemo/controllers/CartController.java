package edu.drexel.TrainDemo.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.drexel.TrainDemo.service.AddToCartService;
import edu.drexel.TrainDemo.service.ItineraryServicer;

@Controller
public class CartController {

	@Autowired
	private AddToCartService addToCartService;
	
	@Autowired
	private ItineraryServicer itineraryServicer;

	@RequestMapping("cart")
	public ModelAndView cartHandler(HttpServletRequest request) {

		ModelAndView mvw = new ModelAndView();
		String ticketDetails = request.getParameter("ticketDetails");
		String classH = request.getParameter("classH");
		mvw.addObject("itinerary", itineraryServicer.returnItinerary("user"));
		mvw.addObject("ticketDetails", ticketDetails);
		mvw.addObject("classH", classH);
		addToCartService.addToCart(ticketDetails, classH);
		mvw.setViewName("Itinerary.jsp");

		return mvw;
	}
	
	
	@RequestMapping("updateItinerary")
	public ModelAndView updateItinerary(HttpServletRequest request) {

		ModelAndView mvw = new ModelAndView();
		String removeOrderIdString = request.getParameter("removeOrderId");
		long removeOrderIdLong = Long.parseLong(removeOrderIdString);
		addToCartService.deleteOrder(removeOrderIdLong);
		mvw.addObject("itinerary", itineraryServicer.returnItinerary("user"));
		mvw.setViewName("Itinerary.jsp");

		return mvw;
	}

}
