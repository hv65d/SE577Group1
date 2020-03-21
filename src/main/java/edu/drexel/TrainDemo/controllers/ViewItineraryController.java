package edu.drexel.TrainDemo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.drexel.TrainDemo.service.ItineraryServicer;

@Controller
public class ViewItineraryController {

	@Autowired
	private ItineraryServicer itineraryServicer;

	@RequestMapping("/Itinerary")
	public ModelAndView viewItinerary() {

		System.out.print("HI");
		ModelAndView mvw = new ModelAndView();
		mvw.setViewName("Itinerary.jsp");
		mvw.addObject("itinerary", itineraryServicer.returnItinerary("aditya"));
		return mvw;
	}
}
