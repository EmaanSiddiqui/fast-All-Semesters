-- @*Dropping tables queries*@ --
drop table Bookings;
drop table Tickets;
drop table Seats;
drop table Customer;
drop table Auditorium;
drop table Movies;

-- @*Creating tables queries*@ --
----------------------------------------
Create table Customer
(
    cust_id int NOT NULL PRIMARY KEY,
    cust_email varchar(20),
    cust_password varchar(20),
    cust_namee varchar(20) NOT NULL,
    cust_contact varchar(11) NOT NULL,
    cust_age int NOT NULL
);

Create table Auditorium
(
    audi_code char(1) NOT NULL PRIMARY KEY,
    capacity int not null check (capacity <= 100),
    total_rows int not null
);

Create table Seats
(
    seat_id int NOT NULL PRIMARY KEY,
    audi_code char(1),
    row_num int not null,
    booking_status number(1) not null,
    CONSTRAINT FK_audi_code FOREIGN KEY (audi_code) REFERENCES Auditorium(audi_code) ON DELETE CASCADE
);

Create table Movies
(
    movie_id int NOT NULL PRIMARY KEY,
    movie_name varchar(40) not null,
    genre varchar(10) not null,
    durationn int not null,
    director_name varchar(20),
    release_Date date,
    industry varchar(20) not null
);

Create table Tickets
(
    ticket_id int NOT NULL PRIMARY KEY,
    cust_id int,
    movie_id int,
    seat_id int,
    ticket_price int NOT NULL,
    CONSTRAINT FK_cust_id FOREIGN KEY (cust_id) REFERENCES Customer(cust_id) ON DELETE CASCADE,
    CONSTRAINT FK_movie_id FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ON DELETE CASCADE,
    CONSTRAINT FK_seat_id FOREIGN KEY (seat_id) REFERENCES Seats(seat_id) ON DELETE CASCADE
);

Create table Bookings
(
    booking_id int NOT NULL PRIMARY KEY,
    ticket_id int,
    paid_status number(1),
    active_status number(1),
    booking_time varchar(10),
    CONSTRAINT FK_ticket_id FOREIGN KEY (ticket_id) REFERENCES Tickets(ticket_id)ON DELETE CASCADE
);

----------------------------------------

-- @*Inserting in tables queries*@ --

Insert into movies values(1, 'Five feet apart', 'Romance',90, '', 20-Jan-2023, 'Hollywood' );



----------------------------------------

-- @*Triggers in tables queries*@ --


