--
-- PostgreSQL database dump
--

\restrict 2OAg2GTwenDZ6Dl4Hxea7Ke6SQljooR3Chc0y02pZa3YAbs9BNExdWwFCHgxcbs

-- Dumped from database version 18.6 (Debian 18.6-1.pgdg13+2)
-- Dumped by pg_dump version 18.6 (Debian 18.6-1.pgdg13+2)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: food_order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.food_order (
    id integer NOT NULL,
    ordered_on date NOT NULL
);


--
-- Name: menu_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.menu_item (
    id integer NOT NULL,
    name text NOT NULL,
    price numeric(7,2) NOT NULL,
    CONSTRAINT menu_item_price_check CHECK ((price >= (0)::numeric))
);


--
-- Name: order_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_item (
    order_id integer NOT NULL,
    student_id integer NOT NULL,
    menu_item_id integer NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT order_item_quantity_check CHECK ((quantity > 0))
);


--
-- Name: student; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.student (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Data for Name: food_order; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.food_order (id, ordered_on) FROM stdin;
1	2026-10-20
2	2026-10-27
\.


--
-- Data for Name: menu_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.menu_item (id, name, price) FROM stdin;
1	Margherita pizza	12.50
2	Pepperoni pizza	15.75
3	Chicken sandwich	8.20
4	Cheese toast	4.60
5	Caesar salad	9.90
6	Lemonade	2.35
\.


--
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.order_item (order_id, student_id, menu_item_id, quantity) FROM stdin;
1	1	1	2
1	1	6	1
1	2	2	1
1	3	3	2
1	4	4	1
1	5	5	1
2	2	1	1
2	3	6	2
2	4	2	1
2	5	3	1
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.student (id, name) FROM stdin;
1	Alex
2	Boris
3	Dara
4	Elena
5	Mira
\.


--
-- Name: food_order food_order_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.food_order
    ADD CONSTRAINT food_order_pkey PRIMARY KEY (id);


--
-- Name: menu_item menu_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu_item
    ADD CONSTRAINT menu_item_pkey PRIMARY KEY (id);


--
-- Name: order_item order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (order_id, student_id, menu_item_id);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- Name: order_item order_item_menu_item_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_menu_item_fkey FOREIGN KEY (menu_item_id) REFERENCES public.menu_item(id);


--
-- Name: order_item order_item_order_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_order_fkey FOREIGN KEY (order_id) REFERENCES public.food_order(id);


--
-- Name: order_item order_item_student_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_student_fkey FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- PostgreSQL database dump complete
--

\unrestrict 2OAg2GTwenDZ6Dl4Hxea7Ke6SQljooR3Chc0y02pZa3YAbs9BNExdWwFCHgxcbs

