--
-- PostgreSQL database dump
--

\restrict vR0nfdjvQVtgjgGp8SGYOOHDQgbTkF06380cA3PPlnooYmiwU6avckGp1OsNgwv

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-11-10 18:36:05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 228 (class 1259 OID 18733)
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    pickuppointid integer NOT NULL,
    postalcode character varying(10) NOT NULL,
    streetid integer NOT NULL,
    cityid integer NOT NULL,
    housenumber character varying(10) NOT NULL
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 18690)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    categoryid integer NOT NULL,
    categoryname character varying(100) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 18697)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    cityid integer NOT NULL,
    cityname character varying(100) NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 18683)
-- Name: manufacturers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manufacturers (
    manufacturerid integer NOT NULL,
    manufacturername character varying(100) NOT NULL
);


ALTER TABLE public.manufacturers OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 18820)
-- Name: orderitems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderitems (
    orderitemid integer NOT NULL,
    orderid integer NOT NULL,
    productid integer NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT orderitems_quantity_check CHECK ((quantity > 0))
);


ALTER TABLE public.orderitems OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 18793)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    orderid integer NOT NULL,
    orderdate date NOT NULL,
    deliverydate date NOT NULL,
    pickuppointid integer NOT NULL,
    userid integer NOT NULL,
    pickupcode character varying(20) NOT NULL,
    statusid integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 18753)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    productid integer NOT NULL,
    article character varying(20) NOT NULL,
    productname character varying(200) NOT NULL,
    unitid integer NOT NULL,
    price numeric(10,2) NOT NULL,
    supplierid integer NOT NULL,
    manufacturerid integer NOT NULL,
    categoryid integer NOT NULL,
    discount numeric(5,2) NOT NULL,
    quantity integer NOT NULL,
    description text,
    photo character varying(100),
    CONSTRAINT products_discount_check CHECK (((discount >= (0)::numeric) AND (discount <= (100)::numeric))),
    CONSTRAINT products_price_check CHECK ((price >= (0)::numeric)),
    CONSTRAINT products_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18662)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    roleid integer NOT NULL,
    rolename character varying(50) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 18711)
-- Name: statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statuses (
    statusid integer NOT NULL,
    statusname character varying(50) NOT NULL
);


ALTER TABLE public.statuses OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18704)
-- Name: streets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.streets (
    streetid integer NOT NULL,
    streetname character varying(100) NOT NULL
);


ALTER TABLE public.streets OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 18676)
-- Name: suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliers (
    supplierid integer NOT NULL,
    suppliername character varying(100) NOT NULL
);


ALTER TABLE public.suppliers OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18669)
-- Name: units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.units (
    unitid integer NOT NULL,
    unitname character varying(20) NOT NULL
);


ALTER TABLE public.units OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 18718)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    roleid integer NOT NULL,
    fullname character varying(100) NOT NULL,
    login character varying(100) NOT NULL,
    password character varying(50) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 5000 (class 0 OID 18733)
-- Dependencies: 228
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (1, '420151', 1, 1, '32');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (2, '125061', 2, 1, '8');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (3, '630370', 3, 1, '24');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (4, '400562', 4, 1, '32');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (5, '614510', 5, 1, '47');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (6, '410542', 6, 1, '46');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (7, '620839', 7, 1, '8');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (8, '443890', 8, 1, '1');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (9, '603379', 9, 1, '46');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (10, '603721', 10, 1, '41');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (11, '410172', 11, 1, '13');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (12, '614611', 12, 1, '50');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (13, '454311', 13, 1, '19');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (14, '660007', 14, 1, '19');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (15, '603036', 15, 1, '4');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (16, '394060', 16, 1, '43');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (17, '410661', 17, 1, '50');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (18, '625590', 8, 1, '20');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (19, '625683', 18, 1, '');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (20, '450983', 19, 1, '26');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (21, '394782', 20, 1, '3');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (22, '603002', 21, 1, '28');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (23, '450558', 22, 1, '30');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (24, '344288', 20, 1, '1');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (25, '614164', 23, 1, '30');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (26, '394242', 8, 1, '43');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (27, '660540', 24, 1, '25');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (28, '125837', 3, 1, '40');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (29, '125703', 25, 1, '49');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (30, '625283', 26, 1, '46');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (31, '614753', 27, 1, '35');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (32, '426030', 5, 1, '44');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (33, '450375', 28, 1, '44');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (34, '625560', 29, 1, '12');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (35, '630201', 19, 1, '17');
INSERT INTO public.addresses (pickuppointid, postalcode, streetid, cityid, housenumber) VALUES (36, '190949', 30, 1, '26');


--
-- TOC entry 4995 (class 0 OID 18690)
-- Dependencies: 223
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories (categoryid, categoryname) VALUES (1, 'Художественная литература');
INSERT INTO public.categories (categoryid, categoryname) VALUES (2, 'Учебник для вузов');
INSERT INTO public.categories (categoryid, categoryname) VALUES (3, 'Хрестоматия');
INSERT INTO public.categories (categoryid, categoryname) VALUES (4, 'Учебное пособие');


--
-- TOC entry 4996 (class 0 OID 18697)
-- Dependencies: 224
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cities (cityid, cityname) VALUES (1, 'г. Лесной');


--
-- TOC entry 4994 (class 0 OID 18683)
-- Dependencies: 222
-- Data for Name: manufacturers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.manufacturers (manufacturerid, manufacturername) VALUES (1, 'Яуза');
INSERT INTO public.manufacturers (manufacturerid, manufacturername) VALUES (2, 'Т8 Издательские технологии');
INSERT INTO public.manufacturers (manufacturerid, manufacturername) VALUES (3, 'Прогресс книга');
INSERT INTO public.manufacturers (manufacturerid, manufacturername) VALUES (4, 'Время');
INSERT INTO public.manufacturers (manufacturerid, manufacturername) VALUES (5, 'Лениздат');
INSERT INTO public.manufacturers (manufacturerid, manufacturername) VALUES (6, 'Неолит');
INSERT INTO public.manufacturers (manufacturerid, manufacturername) VALUES (7, 'Амрита-Русь');
INSERT INTO public.manufacturers (manufacturerid, manufacturername) VALUES (8, 'Златоуст');
INSERT INTO public.manufacturers (manufacturerid, manufacturername) VALUES (9, 'Аспект Пресс');
INSERT INTO public.manufacturers (manufacturerid, manufacturername) VALUES (10, 'ВКН');


--
-- TOC entry 5003 (class 0 OID 18820)
-- Dependencies: 231
-- Data for Name: orderitems; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity) VALUES (1, 1, 1, 2);
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity) VALUES (4, 1, 2, 2);
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity) VALUES (2, 2, 1, 1);
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity) VALUES (5, 2, 2, 1);
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity) VALUES (3, 6, 1, 2);
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity) VALUES (6, 6, 2, 2);
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity) VALUES (7, 3, 3, 10);
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity) VALUES (9, 3, 4, 10);
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity) VALUES (8, 4, 3, 4);
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity) VALUES (10, 4, 5, 5);
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity) VALUES (12, 5, 6, 20);
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity) VALUES (14, 5, 7, 20);
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity) VALUES (15, 7, 8, 3);
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity) VALUES (16, 7, 9, 3);
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity) VALUES (11, 8, 5, 1);
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity) VALUES (13, 8, 6, 1);
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity) VALUES (17, 9, 9, 1);
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity) VALUES (19, 9, 10, 5);
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity) VALUES (18, 10, 9, 5);
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity) VALUES (20, 10, 10, 5);


--
-- TOC entry 5002 (class 0 OID 18793)
-- Dependencies: 230
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (orderid, orderdate, deliverydate, pickuppointid, userid, pickupcode, statusid) VALUES (0, '2024-02-27', '2024-04-20', 1, 10, '901', 1);
INSERT INTO public.orders (orderid, orderdate, deliverydate, pickuppointid, userid, pickupcode, statusid) VALUES (1, '2023-09-28', '2024-04-21', 11, 7, '902', 1);
INSERT INTO public.orders (orderid, orderdate, deliverydate, pickuppointid, userid, pickupcode, statusid) VALUES (2, '2024-03-01', '2024-04-25', 15, 7, '906', 1);
INSERT INTO public.orders (orderid, orderdate, deliverydate, pickuppointid, userid, pickupcode, statusid) VALUES (3, '2024-02-27', '2024-04-20', 1, 10, '901', 1);
INSERT INTO public.orders (orderid, orderdate, deliverydate, pickuppointid, userid, pickupcode, statusid) VALUES (4, '2023-09-28', '2024-04-21', 11, 7, '902', 1);
INSERT INTO public.orders (orderid, orderdate, deliverydate, pickuppointid, userid, pickupcode, statusid) VALUES (5, '2024-03-01', '2024-04-25', 15, 7, '906', 1);
INSERT INTO public.orders (orderid, orderdate, deliverydate, pickuppointid, userid, pickupcode, statusid) VALUES (6, '2024-03-21', '2024-04-22', 2, 8, '903', 1);
INSERT INTO public.orders (orderid, orderdate, deliverydate, pickuppointid, userid, pickupcode, statusid) VALUES (7, '2024-02-20', '2024-04-23', 11, 9, '904', 1);
INSERT INTO public.orders (orderid, orderdate, deliverydate, pickuppointid, userid, pickupcode, statusid) VALUES (8, '2024-03-21', '2024-04-22', 2, 8, '903', 1);
INSERT INTO public.orders (orderid, orderdate, deliverydate, pickuppointid, userid, pickupcode, statusid) VALUES (9, '2024-02-20', '2024-04-23', 11, 9, '904', 1);
INSERT INTO public.orders (orderid, orderdate, deliverydate, pickuppointid, userid, pickupcode, statusid) VALUES (10, '2024-03-31', '2024-04-27', 19, 9, '908', 2);
INSERT INTO public.orders (orderid, orderdate, deliverydate, pickuppointid, userid, pickupcode, statusid) VALUES (11, '2024-03-17', '2024-04-24', 2, 10, '905', 1);
INSERT INTO public.orders (orderid, orderdate, deliverydate, pickuppointid, userid, pickupcode, statusid) VALUES (12, '2024-03-31', '2024-04-27', 19, 9, '908', 2);
INSERT INTO public.orders (orderid, orderdate, deliverydate, pickuppointid, userid, pickupcode, statusid) VALUES (13, '2024-03-17', '2024-04-24', 2, 10, '905', 1);
INSERT INTO public.orders (orderid, orderdate, deliverydate, pickuppointid, userid, pickupcode, statusid) VALUES (14, '2024-02-02', '2024-04-26', 3, 8, '907', 1);
INSERT INTO public.orders (orderid, orderdate, deliverydate, pickuppointid, userid, pickupcode, statusid) VALUES (15, '2024-02-02', '2024-04-26', 3, 8, '907', 1);
INSERT INTO public.orders (orderid, orderdate, deliverydate, pickuppointid, userid, pickupcode, statusid) VALUES (16, '2024-04-02', '2024-04-28', 5, 10, '909', 2);
INSERT INTO public.orders (orderid, orderdate, deliverydate, pickuppointid, userid, pickupcode, statusid) VALUES (17, '2024-04-03', '2024-04-29', 19, 10, '910', 2);
INSERT INTO public.orders (orderid, orderdate, deliverydate, pickuppointid, userid, pickupcode, statusid) VALUES (18, '2024-04-02', '2024-04-28', 5, 10, '909', 2);
INSERT INTO public.orders (orderid, orderdate, deliverydate, pickuppointid, userid, pickupcode, statusid) VALUES (19, '2024-04-03', '2024-04-29', 19, 10, '910', 1);


--
-- TOC entry 5001 (class 0 OID 18753)
-- Dependencies: 229
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products (productid, article, productname, unitid, price, supplierid, manufacturerid, categoryid, discount, quantity, description, photo) VALUES (1, 'А112Т4', 'Прокляты и убиты', 1, 585.00, 1, 1, 1, 25.00, 6, 'Роман-эпопею "Прокляты и убиты" Виктора Астафьева по праву считают одним из самых сильных и пронзительных произведений отечественной военной прозы.', '1.jpg');
INSERT INTO public.products (productid, article, productname, unitid, price, supplierid, manufacturerid, categoryid, discount, quantity, description, photo) VALUES (2, 'G843H5', 'Тайны и загадки отца Брауна', 1, 193.00, 2, 1, 1, 30.00, 9, 'Гилберт Кит Честертон — признанный классик английской литературы, один из самых ярких писателей первой половины XX века. Классикой стали его романы и многочисленные эссе, однако любовь массового читателя принесли ему рассказы об отце Брауне, тихом, застенчивом священнике, мастерски раскрывающем наиболее запутанные загадки и преступления.', '2.jpg');
INSERT INTO public.products (productid, article, productname, unitid, price, supplierid, manufacturerid, categoryid, discount, quantity, description, photo) VALUES (3, 'D325D4', 'Девайс', 1, 1599.00, 3, 2, 1, 5.00, 12, 'Молодой фрилансер Захар Скаро устраивается на очередную подработку. Задача, казалось бы, тривиальная: тестирование нового устройства. Вот только вопрос в том, тестированием какой реальности занимается этот новый Девайс?', '3.jpg');
INSERT INTO public.products (productid, article, productname, unitid, price, supplierid, manufacturerid, categoryid, discount, quantity, description, photo) VALUES (4, 'S432T5', 'Необыкновенное обыкновенное чудо. Школьные истории', 1, 549.00, 4, 2, 1, 15.00, 15, 'нет', '4.jpg');
INSERT INTO public.products (productid, article, productname, unitid, price, supplierid, manufacturerid, categoryid, discount, quantity, description, photo) VALUES (5, 'F325D4', 'Чук и Гек', 1, 209.00, 5, 2, 1, 18.00, 3, 'В книгу вошли повести и рассказы Аркадия Петровича Гайдара: "Чук и Гек", "Горячий камень" и "Сказка о военной тайне, о Мальчише-Кибальчише и его твердом слове"', '5.jpg');
INSERT INTO public.products (productid, article, productname, unitid, price, supplierid, manufacturerid, categoryid, discount, quantity, description, photo) VALUES (6, 'G432G6', 'Информационная безопасность. Нац. стандарты РФ', 1, 3899.00, 6, 3, 2, 22.00, 3, 'В учебном пособии рассмотрено более 300 действующих открытых документов национальной системы стандартизации Российской Федерации, включая международные и межгосударственные стандарты в области информационной безопасности по состоянию на начало 2023 года.', '6.jpg');
INSERT INTO public.products (productid, article, productname, unitid, price, supplierid, manufacturerid, categoryid, discount, quantity, description, photo) VALUES (7, 'H542F5', 'Linux. Командная строка. Лучшие практики', 1, 1799.00, 7, 3, 2, 4.00, 5, 'Перейдите на новый уровень работы в Linux! Если вы системный администратор, разработчик программного обеспечения, SRE-инженер или пользователь Linux, книга поможет вам работать быстрее, элегантнее и эффективнее.', '7.jpg');
INSERT INTO public.products (productid, article, productname, unitid, price, supplierid, manufacturerid, categoryid, discount, quantity, description, photo) VALUES (8, 'C346F5', 'Квантовые миры и возникновение пространства-времени', 1, 1349.00, 8, 3, 2, 5.00, 4, 'Шон Кэрролл — физик-теоретик и один из самых известных в мире популяризаторов науки — заставляет нас по-новому взглянуть на физику. Столкновение с главной загадкой квантовой механики полностью поменяет наши представления о пространстве и времени.', '8.jpg');
INSERT INTO public.products (productid, article, productname, unitid, price, supplierid, manufacturerid, categoryid, discount, quantity, description, photo) VALUES (9, 'F256G6', 'Вселенная. Происхождение жизни...', 1, 1799.00, 8, 3, 2, 6.00, 2, 'Знаменитый физик Шон Кэрролл в свойственной ему увлекательной манере объясняет принципы, которые лежат в основах научных революций от Дарвина до Эйнштейна, и показывает как невероятные научные открытия последнего столетия изменили наш мир.', 'picture.png');
INSERT INTO public.products (productid, article, productname, unitid, price, supplierid, manufacturerid, categoryid, discount, quantity, description, photo) VALUES (10, 'J532V5', 'Пушкин. Бродский. Империя и судьба (2 тома)', 1, 529.00, 9, 4, 3, 8.00, 6, 'Первая книга двухтомника «Пушкин. Бродский. Империя и судьба» пронизана пушкинской темой. Пушкин — «певец империи и свободы» — присутствует даже там, где он впрямую не упоминается, ибо его судьба, как и судьба других героев книги, органично связана с трагедией великой империи.', '10.jpg');
INSERT INTO public.products (productid, article, productname, unitid, price, supplierid, manufacturerid, categoryid, discount, quantity, description, photo) VALUES (11, 'G643F4', 'Иосиф Бродский. Избранные эссе (6 книг)', 1, 4925.00, 10, 5, 3, 2.00, 24, 'Шесть сборников избранных эссе Иосифа Бродского (1940-1996), великого поэта, драматурга, мыслителя, лауреата Нобелевской премии по литературе (1987): «Будущее или далекое прошлое», «Верь своей боли», «Как читать книгу», «О русской литературе», «О тирании», «Путеводитель по переименованному городу». Все тексты представлены на английском языке и в переводе на русский и открывают автора не только как поэта, но как историка, критика, и глубокого и ироничного мыслителя.', '11.jpg');
INSERT INTO public.products (productid, article, productname, unitid, price, supplierid, manufacturerid, categoryid, discount, quantity, description, photo) VALUES (12, 'J326V5', 'Тысячелетие императорской керамики', 1, 2599.00, 11, 5, 3, 5.00, 4, 'Фарфор стал величайшим символом китайской культуры. Это одно из выдающихся изобретений, внесших неоценимый вклад в мировую цивилизацию.', '12.jpg');
INSERT INTO public.products (productid, article, productname, unitid, price, supplierid, manufacturerid, categoryid, discount, quantity, description, photo) VALUES (13, 'J632F6', 'Вечные спутники: Портреты из всемирной литературы', 1, 1599.00, 12, 5, 3, 0.00, 6, 'Книга "Вечные спутники" - это цикл критических очерков о культуре и великих литераторах, сопровождавших жизнь и творчество русского писателя, поэта, литературного критика и общественного деятеля Дмитрия Мережковского (1865–1941).', '13.jpg');
INSERT INTO public.products (productid, article, productname, unitid, price, supplierid, manufacturerid, categoryid, discount, quantity, description, photo) VALUES (14, 'G632H6', 'Формирование лит. репутации Н.Г.Чернышевского', 1, 1349.00, 13, 6, 3, 2.00, 8, 'Монография Д. А. Щербакова - новаторская. Поэтапно рассмотрены не только многочисленные суждения известных отечественных и зарубежных критиков, литературоведов, философов и политиков, различным образом характеризовавших Н. Г. Чернышевского в связи и вне связи со знаменитым романом "Что делать?', '14.jpg');
INSERT INTO public.products (productid, article, productname, unitid, price, supplierid, manufacturerid, categoryid, discount, quantity, description, photo) VALUES (15, 'M642E5', 'Теория искусства. Краткий путеводитель', 1, 879.00, 14, 6, 3, 3.00, 2, 'Настоящее издание представляет собой сборник переводов лекций по истории дохристианских и нехристианских религий, прочитанных в Лондоне в период с 1888 по 1891 гг. авторитетными исследователями данного раздела религиоведения.', 'picture.png');
INSERT INTO public.products (productid, article, productname, unitid, price, supplierid, manufacturerid, categoryid, discount, quantity, description, photo) VALUES (16, 'G543F5', 'Религиозные верования с древнейших времен', 1, 879.00, 13, 7, 3, 4.00, 6, 'нет', '16.jpg');
INSERT INTO public.products (productid, article, productname, unitid, price, supplierid, manufacturerid, categoryid, discount, quantity, description, photo) VALUES (17, 'B653G6', 'Русский язык: Первые шаги. Часть 3', 1, 2699.00, 15, 8, 4, 8.00, 9, 'Пособие является завершающей частью учебного комплекса. Третья часть содержит 10 уроков (21-30, последний-повторительный). Усвоение лексико-грамматического материала рассчитано примерно на 200-240 часов аудиторных занятий.', '17.jpg');
INSERT INTO public.products (productid, article, productname, unitid, price, supplierid, manufacturerid, categoryid, discount, quantity, description, photo) VALUES (18, 'J735J7', 'Синтетический образ индивидуального психического мира', 1, 1099.00, 16, 8, 3, 9.00, 4, 'Психика подобна определенным объектам, это фиксируют сами люди в языке и искусстве. В данном исследовании рассматриваются в этом плане образы сосуда, воронки, дерева и крепости.', '18.jpg');
INSERT INTO public.products (productid, article, productname, unitid, price, supplierid, manufacturerid, categoryid, discount, quantity, description, photo) VALUES (19, 'H436H7', 'Английский язык в спорте', 1, 1999.00, 17, 9, 4, 2.00, 0, 'Учебное пособие подготовлено для слушателей, изу чающих английский язык как язык специальности', '19.jpg');
INSERT INTO public.products (productid, article, productname, unitid, price, supplierid, manufacturerid, categoryid, discount, quantity, description, photo) VALUES (0, 'ART-0021', 'Большая книга', 1, 1200.00, 5, 1, 3, 34.00, 7, 'нет', 'picture.png');
INSERT INTO public.products (productid, article, productname, unitid, price, supplierid, manufacturerid, categoryid, discount, quantity, description, photo) VALUES (20, 'H475R5', 'Лексика и грамматика современного китайского языка', 1, 600.00, 18, 10, 4, 25.00, 12, 'Пособие выступает дополнением ко второму тому учебника «Новый практический курс китайского языка» (под редакцией Лю Сюня).', '20.jpg');


--
-- TOC entry 4991 (class 0 OID 18662)
-- Dependencies: 219
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles (roleid, rolename) VALUES (1, 'Администратор');
INSERT INTO public.roles (roleid, rolename) VALUES (2, 'Менеджер');
INSERT INTO public.roles (roleid, rolename) VALUES (3, 'Авторизированный клиент');


--
-- TOC entry 4998 (class 0 OID 18711)
-- Dependencies: 226
-- Data for Name: statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.statuses (statusid, statusname) VALUES (1, 'Завершен');
INSERT INTO public.statuses (statusid, statusname) VALUES (2, 'Новый');


--
-- TOC entry 4997 (class 0 OID 18704)
-- Dependencies: 225
-- Data for Name: streets; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.streets (streetid, streetname) VALUES (1, 'ул. Вишневая');
INSERT INTO public.streets (streetid, streetname) VALUES (2, 'ул. Подгорная');
INSERT INTO public.streets (streetid, streetname) VALUES (3, 'ул. Шоссейная');
INSERT INTO public.streets (streetid, streetname) VALUES (4, 'ул. Зеленая');
INSERT INTO public.streets (streetid, streetname) VALUES (5, 'ул. Маяковского');
INSERT INTO public.streets (streetid, streetname) VALUES (6, 'ул. Светлая');
INSERT INTO public.streets (streetid, streetname) VALUES (7, 'ул. Цветочная');
INSERT INTO public.streets (streetid, streetname) VALUES (8, 'ул. Коммунистическая');
INSERT INTO public.streets (streetid, streetname) VALUES (9, 'ул. Спортивная');
INSERT INTO public.streets (streetid, streetname) VALUES (10, 'ул. Гоголя');
INSERT INTO public.streets (streetid, streetname) VALUES (11, 'ул. Северная');
INSERT INTO public.streets (streetid, streetname) VALUES (12, 'ул. Молодежная');
INSERT INTO public.streets (streetid, streetname) VALUES (13, 'ул. Новая');
INSERT INTO public.streets (streetid, streetname) VALUES (14, 'ул. Октябрьская');
INSERT INTO public.streets (streetid, streetname) VALUES (15, 'ул. Садовая');
INSERT INTO public.streets (streetid, streetname) VALUES (16, 'ул. Фрунзе');
INSERT INTO public.streets (streetid, streetname) VALUES (17, 'ул. Школьная');
INSERT INTO public.streets (streetid, streetname) VALUES (18, 'ул. 8 Марта');
INSERT INTO public.streets (streetid, streetname) VALUES (19, 'ул. Комсомольская');
INSERT INTO public.streets (streetid, streetname) VALUES (20, 'ул. Чехова');
INSERT INTO public.streets (streetid, streetname) VALUES (21, 'ул. Дзержинского');
INSERT INTO public.streets (streetid, streetname) VALUES (22, 'ул. Набережная');
INSERT INTO public.streets (streetid, streetname) VALUES (23, 'ул. Степная');
INSERT INTO public.streets (streetid, streetname) VALUES (24, 'ул. Солнечная');
INSERT INTO public.streets (streetid, streetname) VALUES (25, 'ул. Партизанская');
INSERT INTO public.streets (streetid, streetname) VALUES (26, 'ул. Победы');
INSERT INTO public.streets (streetid, streetname) VALUES (27, 'ул. Полевая');
INSERT INTO public.streets (streetid, streetname) VALUES (28, 'ул. Клубная');
INSERT INTO public.streets (streetid, streetname) VALUES (29, 'ул. Некрасова');
INSERT INTO public.streets (streetid, streetname) VALUES (30, 'ул. Мичурина');


--
-- TOC entry 4993 (class 0 OID 18676)
-- Dependencies: 221
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.suppliers (supplierid, suppliername) VALUES (1, 'Виктор Астафьев');
INSERT INTO public.suppliers (supplierid, suppliername) VALUES (2, 'Гилберт Кит Честертон');
INSERT INTO public.suppliers (supplierid, suppliername) VALUES (3, 'Кирилл Каланджи');
INSERT INTO public.suppliers (supplierid, suppliername) VALUES (4, 'Людмила Улицкая');
INSERT INTO public.suppliers (supplierid, suppliername) VALUES (5, 'Аркадий Гайдар');
INSERT INTO public.suppliers (supplierid, suppliername) VALUES (6, 'Юрий Родичев');
INSERT INTO public.suppliers (supplierid, suppliername) VALUES (7, 'Дэниел Джей Барретт');
INSERT INTO public.suppliers (supplierid, suppliername) VALUES (8, 'Шон Кэрролл');
INSERT INTO public.suppliers (supplierid, suppliername) VALUES (9, 'Яков Гордин');
INSERT INTO public.suppliers (supplierid, suppliername) VALUES (10, 'Иосиф Бродский');
INSERT INTO public.suppliers (supplierid, suppliername) VALUES (11, 'Янь Чуннянь');
INSERT INTO public.suppliers (supplierid, suppliername) VALUES (12, 'Дмитрий Мережковский');
INSERT INTO public.suppliers (supplierid, suppliername) VALUES (13, 'Дмитрий Щербаков');
INSERT INTO public.suppliers (supplierid, suppliername) VALUES (14, 'Роджер Осборн, Дэн Стерджис');
INSERT INTO public.suppliers (supplierid, suppliername) VALUES (15, 'Любовь Беликова, Инна Ерофеева, Татьяна Шутова');
INSERT INTO public.suppliers (supplierid, suppliername) VALUES (16, 'Сергей Моргачев');
INSERT INTO public.suppliers (supplierid, suppliername) VALUES (17, 'Екатерина Габарта, Ирина Игнатьева');
INSERT INTO public.suppliers (supplierid, suppliername) VALUES (18, 'Татьяна Лопаткина, Софья Маннапова');


--
-- TOC entry 4992 (class 0 OID 18669)
-- Dependencies: 220
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.units (unitid, unitname) VALUES (1, 'шт.');


--
-- TOC entry 4999 (class 0 OID 18718)
-- Dependencies: 227
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (userid, roleid, fullname, login, password) VALUES (1, 1, 'Никифорова Анна Семеновна', '94d5ous@gmail.com', 'uzWC67');
INSERT INTO public.users (userid, roleid, fullname, login, password) VALUES (2, 1, 'Стелина Евгения Петровна', 'uth4iz@mail.com', '2L6KZG');
INSERT INTO public.users (userid, roleid, fullname, login, password) VALUES (3, 1, 'Михайлюк Анна Вячеславовна', '5d4zbu@tutanota.com', 'rwVDh9');
INSERT INTO public.users (userid, roleid, fullname, login, password) VALUES (4, 2, 'Ситдикова Елена Анатольевна', 'ptec8ym@yahoo.com', 'LdNyos');
INSERT INTO public.users (userid, roleid, fullname, login, password) VALUES (5, 2, 'Ворсин Петр Евгеньевич', '1qz4kw@mail.com', 'gynQMT');
INSERT INTO public.users (userid, roleid, fullname, login, password) VALUES (6, 2, 'Старикова Елена Павловна', '4np6se@mail.com', 'AtnDjr');
INSERT INTO public.users (userid, roleid, fullname, login, password) VALUES (7, 3, 'Никифорова Весения Николаевна', 'yzls62@outlook.com', 'JlFRCZ');
INSERT INTO public.users (userid, roleid, fullname, login, password) VALUES (8, 3, 'Сазонов Руслан Германович', '1diph5e@tutanota.com', '8ntwUp');
INSERT INTO public.users (userid, roleid, fullname, login, password) VALUES (9, 3, 'Одинцов Серафим Артёмович', 'tjde7c@yahoo.com', 'YOyhfR');
INSERT INTO public.users (userid, roleid, fullname, login, password) VALUES (10, 3, 'Степанов Михаил Артёмович', 'wpmrc3do@tutanota.com', 'RSbvHv');


--
-- TOC entry 4825 (class 2606 OID 18742)
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (pickuppointid);


--
-- TOC entry 4815 (class 2606 OID 18696)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (categoryid);


--
-- TOC entry 4817 (class 2606 OID 18703)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (cityid);


--
-- TOC entry 4813 (class 2606 OID 18689)
-- Name: manufacturers manufacturers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT manufacturers_pkey PRIMARY KEY (manufacturerid);


--
-- TOC entry 4831 (class 2606 OID 18829)
-- Name: orderitems orderitems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_pkey PRIMARY KEY (orderitemid);


--
-- TOC entry 4829 (class 2606 OID 18804)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);


--
-- TOC entry 4827 (class 2606 OID 18772)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);


--
-- TOC entry 4807 (class 2606 OID 18668)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (roleid);


--
-- TOC entry 4821 (class 2606 OID 18717)
-- Name: statuses statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (statusid);


--
-- TOC entry 4819 (class 2606 OID 18710)
-- Name: streets streets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.streets
    ADD CONSTRAINT streets_pkey PRIMARY KEY (streetid);


--
-- TOC entry 4811 (class 2606 OID 18682)
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplierid);


--
-- TOC entry 4809 (class 2606 OID 18675)
-- Name: units units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (unitid);


--
-- TOC entry 4823 (class 2606 OID 18727)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- TOC entry 4833 (class 2606 OID 18748)
-- Name: addresses fk_addresses_cities; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT fk_addresses_cities FOREIGN KEY (cityid) REFERENCES public.cities(cityid);


--
-- TOC entry 4834 (class 2606 OID 18743)
-- Name: addresses fk_addresses_streets; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT fk_addresses_streets FOREIGN KEY (streetid) REFERENCES public.streets(streetid);


--
-- TOC entry 4842 (class 2606 OID 18830)
-- Name: orderitems fk_orderitems_orders; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT fk_orderitems_orders FOREIGN KEY (orderid) REFERENCES public.orders(orderid) ON DELETE CASCADE;


--
-- TOC entry 4843 (class 2606 OID 18835)
-- Name: orderitems fk_orderitems_products; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT fk_orderitems_products FOREIGN KEY (productid) REFERENCES public.products(productid);


--
-- TOC entry 4839 (class 2606 OID 18805)
-- Name: orders fk_orders_addresses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_addresses FOREIGN KEY (pickuppointid) REFERENCES public.addresses(pickuppointid);


--
-- TOC entry 4840 (class 2606 OID 18815)
-- Name: orders fk_orders_statuses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_statuses FOREIGN KEY (statusid) REFERENCES public.statuses(statusid);


--
-- TOC entry 4841 (class 2606 OID 18810)
-- Name: orders fk_orders_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_users FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- TOC entry 4835 (class 2606 OID 18788)
-- Name: products fk_products_categories; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_products_categories FOREIGN KEY (categoryid) REFERENCES public.categories(categoryid);


--
-- TOC entry 4836 (class 2606 OID 18783)
-- Name: products fk_products_manufacturers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_products_manufacturers FOREIGN KEY (manufacturerid) REFERENCES public.manufacturers(manufacturerid);


--
-- TOC entry 4837 (class 2606 OID 18778)
-- Name: products fk_products_suppliers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_products_suppliers FOREIGN KEY (supplierid) REFERENCES public.suppliers(supplierid);


--
-- TOC entry 4838 (class 2606 OID 18773)
-- Name: products fk_products_units; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_products_units FOREIGN KEY (unitid) REFERENCES public.units(unitid);


--
-- TOC entry 4832 (class 2606 OID 18728)
-- Name: users fk_users_roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_roles FOREIGN KEY (roleid) REFERENCES public.roles(roleid);


-- Completed on 2026-11-10 18:36:05

--
-- PostgreSQL database dump complete
--

\unrestrict vR0nfdjvQVtgjgGp8SGYOOHDQgbTkF06380cA3PPlnooYmiwU6avckGp1OsNgwv

