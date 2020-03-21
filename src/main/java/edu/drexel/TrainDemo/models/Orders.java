package edu.drexel.TrainDemo.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Orders {

	@Id
	@Column(name = "order_id")
	Long orderId;

	public Long getOrder_id() {
		return orderId;
	}

	public void setOrder_id(Long order_id) {
		this.orderId = order_id;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getFromstation() {
		return fromstation;
	}

	public void setFromstation(String fromstation) {
		this.fromstation = fromstation;
	}

	public String getTostation() {
		return tostation;
	}

	public void setTostation(String tostation) {
		this.tostation = tostation;
	}

	public String getTripid() {
		return tripid;
	}

	public void setTripid(String tripid) {
		this.tripid = tripid;
	}

	public String getDeparttime() {
		return departtime;
	}

	public void setDeparttime(String departtime) {
		this.departtime = departtime;
	}

	public String getArrivaltime() {
		return arrivaltime;
	}

	public void setArrivaltime(String arrivaltime) {
		this.arrivaltime = arrivaltime;
	}

	public int getNumoftickets() {
		return numoftickets;
	}

	public void setNumoftickets(int i) {
		this.numoftickets = i;
	}

	String customer_name;
	String fromstation;
	String tostation;
	String tripid;
	String departtime;
	String arrivaltime;
	int numoftickets;

}
