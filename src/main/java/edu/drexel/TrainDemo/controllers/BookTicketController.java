package edu.drexel.TrainDemo.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BookTicketController {

	@RequestMapping("next")
	public ModelAndView bookTicket(HttpServletRequest request) {

		String ticketType = request.getParameter("ticketType");

		request.getParameter("ticketType");

		ModelAndView mvw = new ModelAndView();
		mvw.addObject("ticketType", ticketType);
		mvw.setViewName("PickClass.jsp");
		System.out.println("in next part");
		return mvw;
	}

}
