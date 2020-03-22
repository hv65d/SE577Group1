  
# SE577 Group 1
### Search 

 - Added to homepage. 
 - Login required. 
 - Includes autocomplete of station names.
 
  Since Routes are hard to find just by choosing 2 random stops
  here is an exmaple of two routes to input
  
  Testing:
  - Using the following will yield a result
  - From: New York Penn Station
  - To: Philadelphia 30th Street Station Amtrak
  
  

### Display 

 - Added after clicking search from homepage.
 - Includes Book button to book a ticket.

### Cart

 - DB Management required for this work. Run the following query to the same PostGreSQL used for Amtrak Data.

    ```
    -- Table: public.orders

	-- DROP TABLE public.orders;

	CREATE TABLE public.orders
	(
	    order_id integer NOT NULL,
	    customer_name text COLLATE pg_catalog."default" NOT NULL,
	    fromstation text COLLATE pg_catalog."default" NOT NULL,
	    tostation text COLLATE pg_catalog."default" NOT NULL,
	    tripid text COLLATE pg_catalog."default" NOT NULL,
	    departtime text COLLATE pg_catalog."default" NOT NULL,
	    arrivaltime text COLLATE pg_catalog."default" NOT NULL,
	    numoftickets integer NOT NULL,
	    CONSTRAINT orders_pkey PRIMARY KEY (order_id)
	)

	TABLESPACE pg_default;

	ALTER TABLE public.orders
	    OWNER to postgres;
    ```

### Checkout 
Files necessary to access PayPal to checkout has been added. A prototype for the webpage of the checkout can be accessed through the Checkout tab in the navigation bar (which can only be accessed when logged in). 


## Getting Started

1. Fork this repository.

2. Clone your forked repo.

3. Download the latest version of [Postgres](https://www.postgresql.org/download/) for your OS. Install with the default options and remember the admin password you set.

4. Open pgAdmin 4 (this comes with Postgres) and create a new database called "TrainDemo".

5. Unzip `amtrak_sql.zip` and run `init_tables.sql` then `init_data.sql` on your new database. This populates our database with some initial tables and data. The easiest way to run queries is with Query Tool (`Tools > Query Tool`) in pgAdmin 4.

6. Update `src/main/resources/application.properties` with your Postgres password. Make sure not to commit changes to this file to source control.

7. Add your GitHub `client-id` and `client-secret` to your `application.properites`.

8. Run the project in IntelliJ, Eclipse, or on the command line with
    ```
    mvnw clean package
    java -jar target/TrainDemo-0.0.1-SNAPSHOT.jar
    ```
