create table regions(
	region_id serial primary key,
	region_name varchar(25)
);

create table countries(
	country_id varchar(2) primary key,
	country_name varchar(40),
	region_id integer not null,
	foreign key(region_id) references regions(region_id) 
)

drop table countries


create table locations(
    location_id character(2) primary key,
    street_address varchar(50),
    postal_code varchar(12),
    city varchar(30) not null,
    state_province varchar(25),
    country_id varchar(2),
    foreign key(country_id) references countries(country_id) 
)

create table locations(
    location_id character(2) primary key,
    street_address varchar(50),
    postal_code varchar(12),
    city varchar(30) not null,
    state_province varchar(25),
    country_id varchar(2),
    foreign key(country_id) references countries(country_id) 
)


create table departments(

    departments_id serial primary key,
    departments_name varchar (30) not null,
    location_id character(2),
    foreign key(location_id) references locations(location_id)
    
)

create table jobs(

    job_id serial primary key,
    job_title varchar(35) not null,
    min_salary numeric(82),
    max_salary numeric(82)
    
)

create table employees(

    employee_id serial primary key,
    first_name varchar(20),
    last_name varchar(25) not null,
    email varchar(100) not null,
    phone_number varchar(20),
    hire_date date not null,
    job_id integer not null,
    salary numeric (82) not null,
    manager_id integer,
    departments_id serial,
    foreign key(departments_id) references departments(departments_id)
)


create table dependents(

    dependents_id serial primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    relationship varchar(25) not null,
    employee_id serial,
    foreign key(employee_id) references employees(employee_id)

)


create table project_assignment(

    pras_proj_id integer,
    pras_employee_id integer,
    pras_startdate date,
    pras_enddate date,
    pras_status varchar(15)
    
)


select * from project_assignment;

ALTER TABLE ONLY project_assignment ADD CONSTRAINT "ID_PKEY" PRIMARY KEY (pras_proj_id,pras_employee_id);


create table projects(


    proj_id serial primary key,
    proj_name varchar(100),
    proj_createdon date,
    proj_duedate date,
    proj_cust_name varchar(100)
    
   
)

//no1
create table project_employess(
    
    employee_id integer,
    project_id integer,
    name_employess varchar(20),
    project_employes varchar(20),
    CONSTRAINT project_employess PRIMARY KEY (employee_id, project_id),
    CONSTRAINT fk_project_employess foreign key (employee_id) references projects (employee_id),
    CONSTRAINT fk_project_employess foreign key (project_id) references projects (project_id)
   
)

//no2
alter table regions add column proj_description varchar(255) 
alter table regions add column proj_status varchar(15) 
alter table regions add column proj_amount numeric  

//no3
alter table regions add column proj_account_mgr integer
CONSTRAINT fk_project_employess foreign key (employee_id) references projects (employee_id),
CONSTRAINT fk_project_employess foreign key (project_id) references projects (project_id)

//no4
INSERT INTO projects(proj_id,proj_name,proj_createdon,proj_duedate,proj_cust_name) VALUES ('1','E-COMMERCE',now(),now()+interval '3 day','TELKOMSEL') 
INSERT INTO projects(proj_id,proj_name,proj_createdon,proj_duedate,proj_cust_name) VALUES ('2','TRAVELOKA',now(),now()+interval '4 day','XL')
INSERT INTO projects(proj_id,proj_name,proj_createdon,proj_duedate,proj_cust_name) VALUES ('3','TIKET.COM',now(),now()+interval '5 day','INDOSAT')

//no5
INSERT INTO projects_assignment(pras_proj_id,pras_employee_id,pras_startdate,pras,enddate,pras_status) VALUES ('1','1',now(),'','ASSIGNED') 
INSERT INTO projects_assignment(pras_proj_id,pras_employee_id,pras_startdate,pras,enddate,pras_status) VALUES ('2','1',now(),now()+interval '3 day','COMPLETED') 
INSERT INTO projects_assignment(pras_proj_id,pras_employee_id,pras_startdate,pras,enddate,pras_status) VALUES ('3','1',now(),'','INPROGRESS') 
INSERT INTO projects_assignment(pras_proj_id,pras_employee_id,pras_startdate,pras,enddate,pras_status) VALUES ('4','2',now(),'','ASSIGNED') 
INSERT INTO projects_assignment(pras_proj_id,pras_employee_id,pras_startdate,pras,enddate,pras_status) VALUES ('5','2',now(),now()+interval '3 day','COMPLETED') 
INSERT INTO projects_assignment(pras_proj_id,pras_employee_id,pras_startdate,pras,enddate,pras_status) VALUES ('6','2',now(),now()+interval '3 day','INPROGRESS') 



