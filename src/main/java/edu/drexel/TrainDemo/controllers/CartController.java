package edu.drexel.TrainDemo.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.drexel.TrainDemo.service.AddToCartService;

@Controller
public class CartController {

	@Autowired
	private AddToCartService addToCartService;

	@RequestMapping("cart")
	public ModelAndView cartHandler(HttpServletRequest request) {

		ModelAndView mvw = new ModelAndView();
		String ticketDetails = request.getParameter("ticketDetails");
		String classH = request.getParameter("classH");

		mvw.addObject("ticketDetails", ticketDetails);
		mvw.addObject("classH", classH);
		addToCartService.addToCart(ticketDetails, classH);
		mvw.setViewName("Confirmation.jsp");

		return mvw;
	}

}
