CREATE TABLE zinnatyllin_227_shop (
	id_shop serial4 NOT NULL,
	stote_name varchar NOT NULL,
	address varchar NULL,
	phone varchar NULL,
	contact_person varchar NULL,
	CONSTRAINT zinnatyllin_227_shop_pk PRIMARY KEY (id_shop)
);

-- Permissions

ALTER TABLE zinnatyllin_227_shop OWNER TO postgres;
GRANT ALL ON TABLE zinnatyllin_227_shop TO postgres;


-- public.zinnatyllin_227_products определение

-- Drop table

-- DROP TABLE zinnatyllin_227_products;

CREATE TABLE zinnatyllin_227_products (
	id_product serial4 NOT NULL,
	product_name varchar NOT NULL,
	count_product varchar NOT NULL,
	price money NULL,
	CONSTRAINT zinnatyllin_227_products_pk PRIMARY KEY (id_product)
);

-- Permissions

ALTER TABLE zinnatyllin_227_products OWNER TO postgres;
GRANT ALL ON TABLE zinnatyllin_227_products TO postgres;


-- public.zinnatyllin_227_orders определение

-- Drop table

-- DROP TABLE zinnatyllin_227_orders;

CREATE TABLE zinnatyllin_227_orders (
	id_order serial4 NOT NULL,
	id_shop int4 NOT NULL,
	id_product int4 NOT NULL,
	count int4 NOT NULL,
	date_order date NULL,
	CONSTRAINT zinnatyllin_227_orders_pk PRIMARY KEY (id_order),
	CONSTRAINT zinnatyllin_227_orders_zinnatyllin_227_products_fk FOREIGN KEY (id_product) REFERENCES zinnatyllin_227_products(id_product) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT zinnatyllin_227_orders_zinnatyllin_227_shop_fk FOREIGN KEY (id_shop) REFERENCES zinnatyllin_227_shop(id_shop) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Permissions

ALTER TABLE zinnatyllin_227_orders OWNER TO postgres;
GRANT ALL ON TABLE zinnatyllin_227_orders TO postgres;




-- Permissions

GRANT ALL ON SCHEMA public TO pg_database_owner;
GRANT USAGE ON SCHEMA public TO public;
INSERT INTO public.zinnatyllin_227_products (id_product,product_name,count_product,price) VALUES
	 (1,'Компютерная мышь',8,450,00 ?),
	 (2,'Клавиатура',12,900,00 ?),
	 (3,'Коврик',100,299,00 ?);
INSERT INTO public.zinnatyllin_227_shop (id_shop,stote_name,address,phone,contact_person) VALUES
	 (1,'Мир компьютеров','Энгельса','89872241239','Иванов Павел'),
	 (2,'Электроник','Ленина','89123012143','Васильев Алексей');
	INSERT INTO public.zinnatyllin_227_orders (id_order,id_shop,id_product,count,date_order) VALUES
	 (1,1,2,1,'2024-10-27'),
	 (2,2,1,1,'2024-10-27');
