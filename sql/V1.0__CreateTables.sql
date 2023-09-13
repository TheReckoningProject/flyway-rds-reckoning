-- Create EventSource table
CREATE TABLE EventSource (
    source_id INT PRIMARY KEY,
    source_name VARCHAR(255),
    source_type VARCHAR(50),
    source_location VARCHAR(255),
    source_description TEXT
);

-- Create Event table
CREATE TABLE Event (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(255),
    event_type VARCHAR(50),
    event_date DATE,
    description TEXT,
    location VARCHAR(255),
    associated_case_id INT,
    source_id INT,
    FOREIGN KEY (associated_case_id) REFERENCES Case(case_id),
    FOREIGN KEY (source_id) REFERENCES EventSource(source_id)
);

-- Create Actor table
CREATE TABLE Actor (
    actor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    address VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(100),
    role VARCHAR(50),
    location VARCHAR(255),
    data_source VARCHAR(255),
    data_source_type VARCHAR(50)
);

-- Create EventActorAssociation table
CREATE TABLE EventActorAssociation (
    association_id INT PRIMARY KEY,
    event_id INT,
    actor_id INT,
    role_in_event VARCHAR(50),
    involvement_date DATE,
    location VARCHAR(255),
    association_date DATE,
    source_id INT,
    FOREIGN KEY (event_id) REFERENCES Event(event_id),
    FOREIGN KEY (actor_id) REFERENCES Actor(actor_id),
    FOREIGN KEY (source_id) REFERENCES EventSource(source_id)
);
