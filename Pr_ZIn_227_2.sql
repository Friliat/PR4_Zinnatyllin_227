CREATE TABLE doctors (
	id_doctor serial4 NOT NULL,
	fio varchar NULL,
	specialnost varchar NULL,
	"Cost" int4 NULL,
	allocation int4 NULL,
	CONSTRAINT doctors_pk PRIMARY KEY (id_doctor)
);

-- Permissions

ALTER TABLE doctors OWNER TO postgres;
GRANT ALL ON TABLE doctors TO postgres;


-- public.patient определение

-- Drop table

-- DROP TABLE patient;

CREATE TABLE patient (
	id_patient serial4 NOT NULL,
	name_patient varchar NULL,
	firstname_patient varchar NULL,
	patronymic varchar NULL,
	dateofbirdthey date NULL,
	address varchar NULL,
	CONSTRAINT patient_pk PRIMARY KEY (id_patient)
);

-- Permissions

ALTER TABLE patient OWNER TO postgres;
GRANT ALL ON TABLE patient TO postgres;


-- public.reception определение

-- Drop table

-- DROP TABLE reception;

CREATE TABLE reception (
	id_reception serial4 NOT NULL,
	doctor_id int4 NOT NULL,
	pacient_id int4 NOT NULL,
	date_reception date NULL,
	CONSTRAINT reception_pk PRIMARY KEY (id_reception),
	CONSTRAINT reception_doctors_fk FOREIGN KEY (doctor_id) REFERENCES doctors(id_doctor) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT reception_patient_fk FOREIGN KEY (pacient_id) REFERENCES patient(id_patient) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Permissions

ALTER TABLE reception OWNER TO postgres;
GRANT ALL ON TABLE reception TO postgres;




-- Permissions

GRANT ALL ON SCHEMA public TO pg_database_owner;
GRANT USAGE ON SCHEMA public TO public;
INSERT INTO public.doctors (id_doctor,fio,specialnost,"Cost",allocation) VALUES
	 (1,'Анна Сергеевна Петрова ','Кардиолог',1500,15),
	 (2,'Дмитрий Александрович Смирнов','Ортопед',2000,15),
	 (3,'Елена Викторовна Кузнецова','Дерматолог',2200,15),
	 (4,'Сергей Николаевич Иванов','Гастроэнтеролог',1200,15),
	 (5,'Мария Андреевна Лебедева','Педиатр',3000,15),
	 (6,'Алексей Валерьевич Сидоров','Невролог',1200,15),
	 (7,'Ольга Дмитриевна Федорова','Эндокринолог',4500,15),
	 (8,'Игорь Павлович Михайлов','Травматолог',3200,15),
	 (9,'Наталья Борисовна Григорьева','Психиатр',4400,15),
	 (10,'Владимир Юрьевич Соловьев','Офтальмолог',4100,15);
INSERT INTO public.patient (id_patient,name_patient,firstname_patient,patronymic,dateofbirdthey,address) VALUES
	 (1,'Владимир ','Александрович ','Смирнов ','2024-11-05','Улица Солнечная 1'),
	 (2,'Елена ','Дмитриевна ','Лебедева ','2024-11-05','Проспект Мира 2'),
	 (3,'Алексей ','Иванов','Сидоров ','2024-11-05','Улица Небесная 3'),
	 (4,'Анна ','Дмитриевна ','Петрова ','2024-11-05',' Бульвар Улыбок 4'),
	 (5,'Сергей ','Валерьевич ','Михайлов ','2024-11-05','Улица Творческая 5'),
	 (6,'Наталья ','Андреевна ','Кузнецова ','2024-11-05','Улица Зелёная 22'),
	 (7,'Игорь ','Александрович ','Григорьев','2024-11-05','Улица Строителей 13'),
	 (8,'Анастасия','Юрьевна','Федорова ','2024-11-05','Улица Гоголя 23'),
	 (9,'Мария','Сергеевна','Петрова ','2024-11-05','Улица Модельная 14'),
	 (10,'Иван','Николаевич ','Соловьев ','2024-11-05','Улица Березовая 11');
INSERT INTO public.reception (id_reception,doctor_id,pacient_id,date_reception) VALUES
	 ('2',5,4,'2024-11-05'),
	 ('3',1,3,'2024-11-05'),
	 ('4',3,2,'2024-11-05'),
	 ('5',6,10,'2024-11-05'),
	 ('6',10,9,'2024-11-05'),
	 ('7',9,7,'2024-11-05'),
	 ('8',8,6,'2024-11-05'),
	 ('9',4,8,'2024-11-05'),
	 ('10',7,5,'2024-11-05'),
	 ('1',2,1,'2024-11-05');
