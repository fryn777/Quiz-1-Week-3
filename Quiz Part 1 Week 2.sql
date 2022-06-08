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


create table locations(
    location_id serial primary key,
    street_address varchar(40),
    postal_code varchar(12),
    city varchar(30) not null,
    state_province varchar(25),
    country_id varchar(2) not null,
    foreign key(country_id) references countries(country_id) 
)


create table departments(

    departments_id serial primary key,
    departments_name varchar (30) not null,
    location_id serial,
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

alter table employees add CONSTRAINT fk_job_employee foreign key (job_id) references jobs (job_id)


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

ALTER TABLE ONLY project_assignment ADD CONSTRAINT "ID_PKEY" PRIMARY KEY (pras_proj_id,pras_employee_id);

create table projects(


    proj_id serial primary key,
    proj_name varchar(100),
    proj_createdon date,
    proj_duedate date,
    proj_cust_name varchar(100)
    
)

///No1
create table emplo_proj(
    
    employee_id integer,
    project_id integer,
    name_employess varchar(20),
    project_employes varchar(20),
    CONSTRAINT employees_project PRIMARY KEY (employee_id, project_id)

)


alter table emplo_proj add CONSTRAINT fk_project_employee foreign key (employee_id) references employees (employee_id)
alter table emplo_proj add CONSTRAINT fk_employee_project foreign key (project_id) references projects (proj_id)

///No2
alter table projects add column proj_description varchar(255) 
alter table projects add column proj_status varchar(15) 
alter table projects add column proj_amount numeric  

///No3
alter table projects add column proj_account_mgr integer
alter table project_assignment ADD CONSTRAINT fk_pras_proj_id FOREIGN KEY (pras_proj_id) REFERENCES projects (proj_id) ON UPDATE CASCADE ON DELETE CASCADE
alter table project_assignment ADD CONSTRAINT fk_pras_employee_id FOREIGN KEY (pras_employee_id) REFERENCES employees (employee_id) ON UPDATE CASCADE ON DELETE CASCADE


///No4
INSERT INTO projects(proj_id,proj_name,proj_createdon,proj_duedate,proj_cust_name,proj_status) VALUES ('1','E-COMMERCE',now(),now()+interval '3 day','TELKOMSEL','INPROGRESS')
INSERT INTO projects(proj_id,proj_name,proj_createdon,proj_duedate,proj_cust_name,proj_status) VALUES ('2','TRAVELOKA',now(),now()+interval '3 day','XL','INPROGRESS')
INSERT INTO projects(proj_id,proj_name,proj_createdon,proj_duedate,proj_cust_name,proj_status) VALUES ('3','TIKET.COM',now(),now()+interval '3 day','INDOSAT','INPROGRESS')


///No5
INSERT INTO project_assignment(pras_proj_id,pras_employee_id,pras_startdate,pras_enddate,pras_status)
SELECT projects.proj_id,employees.employee_id,projects.proj_createdon,projects.proj_duedate,projects.proj_status
FROM projects,employees
WHERE employees.department_id = 6 

//IniBuatmanualinsertnya
INSERT INTO project_assignment(pras_proj_id,pras_employee_id,pras_startdate,pras_status) VALUES ('1','104',now(),'ASSIGNED')
INSERT INTO project_assignment(pras_proj_id,pras_employee_id,pras_startdate,pras_enddate,pras_status) VALUES ('1','105',now(),now()+interval '3 day','COMPLETED');
INSERT INTO project_assignment(pras_proj_id,pras_employee_id,pras_startdate,pras_status) VALUES ('1','106',now(),'INPROGRESS');
INSERT INTO project_assignment(pras_proj_id,pras_employee_id,pras_startdate,pras_status) VALUES ('2','104',now(),'ASSIGNED');
INSERT INTO project_assignment(pras_proj_id,pras_employee_id,pras_startdate,pras_enddate,pras_status) VALUES ('2','105',now(),now()+interval '3 day','COMPLETED');
INSERT INTO project_assignment(pras_proj_id,pras_employee_id,pras_startdate,pras_enddate,pras_status) VALUES ('2','106',now(),now()+interval '3 day','INPROGRESS');



//No6
SELECT * FROM project_assignment WHERE pras_status = 'COMPLETED'