--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2021-03-09 00:11:15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- TOC entry 202 (class 1259 OID 51324)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 51376)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 51329)
-- Name: interest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interest (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.interest OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 51334)
-- Name: option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.option (
    question_id integer NOT NULL,
    description character varying(255),
    number integer NOT NULL
);


ALTER TABLE public.option OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 51339)
-- Name: question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question (
    id integer NOT NULL,
    answer_number integer,
    text character varying(5000),
    quiz_id integer
);


ALTER TABLE public.question OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 51347)
-- Name: quiz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    tag character varying(255),
    text character varying(2048) NOT NULL,
    user_id integer
);


ALTER TABLE public.quiz OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 51458)
-- Name: result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.result (
    id integer NOT NULL,
    answer integer,
    question_id integer,
    user_id integer
);


ALTER TABLE public.result OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 51360)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 51433)
-- Name: score; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.score (
    id integer NOT NULL,
    score integer NOT NULL,
    quiz_id integer,
    user_id integer
);


ALTER TABLE public.score OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 51365)
-- Name: user_interests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_interests (
    user_id integer NOT NULL,
    interest_id integer NOT NULL
);


ALTER TABLE public.user_interests OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 51368)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    password character varying(255),
    username character varying(255),
    group_id integer,
    role_id integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 2881 (class 0 OID 51324)
-- Dependencies: 202
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, name) FROM stdin;
1	SE-1908
2	SE-1907
3	CS-01
4	CS-02
5	SE-1906
82	MT-03
\.


--
-- TOC entry 2882 (class 0 OID 51329)
-- Dependencies: 203
-- Data for Name: interest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interest (id, name) FROM stdin;
1	Music
2	Sport
3	Coding
4	Books
\.


--
-- TOC entry 2883 (class 0 OID 51334)
-- Dependencies: 204
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.option (question_id, description, number) FROM stdin;
102	15	0
102	50	1
102	100	2
102	14	3
103	5	0
103	14	1
103	45	2
103	78	3
104	0	0
104	1	1
104	2	2
118	 /res/values	0
118	/res/layout	1
118	/target	2
118	/src	3
118	/res/values	4
119	app	0
119	service	1
119	manifest	2
119	activity	3
120	AbsoluteLayout	0
120	ViewGroup	1
120	View	2
120	Object	3
130	1	0
130	2	1
130	3	2
130	4	3
149	Talgat	0
149	Askar	1
\.


--
-- TOC entry 2884 (class 0 OID 51339)
-- Dependencies: 205
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question (id, answer_number, text, quiz_id) FROM stdin;
102	2	10*10=?	101
103	0	20-15=?	101
104	1	(1+1)/2=?	101
118	1	Specify the directory name where the XML Layouts are stored	117
119	2	The root element of AndroidManifest.xml	117
120	1	All layout classes are a direct subclass of	117
130	0	1+1?	129
149	0	Choose the Teacher	148
\.


--
-- TOC entry 2885 (class 0 OID 51347)
-- Dependencies: 206
-- Data for Name: quiz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quiz (id, name, tag, text, user_id) FROM stdin;
101	Math	math	Midterm exam for Mathematical Statistics(Part 1).	5
117	Java	java	Midterm exam for java	5
129	test	test	test	5
148	Java Teacher	teacher	Choose Teacher	5
\.


--
-- TOC entry 2891 (class 0 OID 51458)
-- Dependencies: 212
-- Data for Name: result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.result (id, answer, question_id, user_id) FROM stdin;
105	0	103	32
106	2	102	32
107	0	104	32
109	0	103	3
110	2	102	3
111	1	104	3
113	0	103	4
114	1	102	4
115	1	104	4
121	1	118	3
122	2	120	3
123	2	119	3
125	0	103	72
126	2	102	72
127	1	104	72
131	0	130	72
133	1	130	3
135	2	130	32
137	0	130	4
140	0	103	139
141	2	102	139
142	1	104	139
150	1	149	139
152	0	149	32
\.


--
-- TOC entry 2886 (class 0 OID 51360)
-- Dependencies: 207
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, name) FROM stdin;
1	ADMIN
2	USER
\.


--
-- TOC entry 2890 (class 0 OID 51433)
-- Dependencies: 211
-- Data for Name: score; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.score (id, score, quiz_id, user_id) FROM stdin;
108	2	101	32
112	3	101	3
116	2	101	4
124	2	117	3
128	3	101	72
132	1	129	72
134	0	129	3
136	0	129	32
138	1	129	4
143	3	101	139
151	0	148	139
153	1	148	32
\.


--
-- TOC entry 2887 (class 0 OID 51365)
-- Dependencies: 208
-- Data for Name: user_interests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_interests (user_id, interest_id) FROM stdin;
3	1
3	2
3	3
4	2
4	4
27	1
32	1
32	2
72	1
72	2
72	3
72	4
5	1
5	2
5	3
139	1
139	2
139	3
139	4
\.


--
-- TOC entry 2888 (class 0 OID 51368)
-- Dependencies: 209
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, password, username, group_id, role_id) FROM stdin;
3	$2a$10$0tmLJfjARqj3YW3Tiaa5uOj3RmIBZ97LQ.PXdcb1tWwMo/fprUSoW	Zhako	1	2
32	$2a$10$p2Z2sJm0IMnH0fZWk0srReTTzwYweXXs7Svuf7ZNYEcY5pxad3Lxi	CyberSecurity1	3	2
72	$2a$10$A2Ph7/YIedbq284bxxEIbOeFRbasuaavNDhMbyySBevJtgP4QZkR.	Beka	2	2
5	$2a$10$ratv1lJSXBFiJWZWHWWTveb6G5aMDiWnLLsScACCHJNXyxOLyVqFy	Aga	1	1
4	$2a$10$cw9/Pe96oXWFYhGoZ8qcJOWTNqI7Gripjl7do7zVURuKGhpCRTY7e	Test	2	2
139	$2a$10$yxkSfa7WdIe8XhInE/LcSeuyfLJfQhP9TUacYg7U4iy8.IO/sDury	Akylbek	82	2
27	$2a$10$CAot2dSHRGSLkOwZTqAvJeXmSJUeeUR1A7oqwbc7ch6NJK0ZK.rWy	Test123	3	2
\.


--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 210
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 153, true);


--
-- TOC entry 2727 (class 2606 OID 51328)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 51333)
-- Name: interest interest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interest
    ADD CONSTRAINT interest_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 51338)
-- Name: option option_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.option
    ADD CONSTRAINT option_pkey PRIMARY KEY (question_id, number);


--
-- TOC entry 2733 (class 2606 OID 51346)
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 51354)
-- Name: quiz quiz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz
    ADD CONSTRAINT quiz_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 51462)
-- Name: result result_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.result
    ADD CONSTRAINT result_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 51364)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 51437)
-- Name: score score_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.score
    ADD CONSTRAINT score_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 51375)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 51423)
-- Name: users fk4qu1gr772nnf6ve5af002rwya; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk4qu1gr772nnf6ve5af002rwya FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- TOC entry 2745 (class 2606 OID 51383)
-- Name: question fkb0yh0c1qaxfwlcnwo9dms2txf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT fkb0yh0c1qaxfwlcnwo9dms2txf FOREIGN KEY (quiz_id) REFERENCES public.quiz(id);


--
-- TOC entry 2748 (class 2606 OID 51413)
-- Name: user_interests fkdv9fflrh61wyuujfwx2yn1tb4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_interests
    ADD CONSTRAINT fkdv9fflrh61wyuujfwx2yn1tb4 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2747 (class 2606 OID 51408)
-- Name: user_interests fke1d4spo0uxw64vctuf0u62kw1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_interests
    ADD CONSTRAINT fke1d4spo0uxw64vctuf0u62kw1 FOREIGN KEY (interest_id) REFERENCES public.interest(id);


--
-- TOC entry 2749 (class 2606 OID 51418)
-- Name: users fkemfuglprp85bh5xwhfm898ysc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fkemfuglprp85bh5xwhfm898ysc FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- TOC entry 2744 (class 2606 OID 51378)
-- Name: option fkgtlhwmagte7l2ssfsgw47x9ka; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.option
    ADD CONSTRAINT fkgtlhwmagte7l2ssfsgw47x9ka FOREIGN KEY (question_id) REFERENCES public.question(id);


--
-- TOC entry 2751 (class 2606 OID 51448)
-- Name: score fkjmvhce8vfl803xnw4cdxjw1u1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.score
    ADD CONSTRAINT fkjmvhce8vfl803xnw4cdxjw1u1 FOREIGN KEY (quiz_id) REFERENCES public.quiz(id);


--
-- TOC entry 2754 (class 2606 OID 51468)
-- Name: result fkkfepddltqde0pif3dlrqaupss; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.result
    ADD CONSTRAINT fkkfepddltqde0pif3dlrqaupss FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2753 (class 2606 OID 51463)
-- Name: result fkmwfqh7y2w99evkim6c1s08sek; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.result
    ADD CONSTRAINT fkmwfqh7y2w99evkim6c1s08sek FOREIGN KEY (question_id) REFERENCES public.question(id);


--
-- TOC entry 2746 (class 2606 OID 51388)
-- Name: quiz fkoj71coq74ryc5c9c9o482p8mm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz
    ADD CONSTRAINT fkoj71coq74ryc5c9c9o482p8mm FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2752 (class 2606 OID 51453)
-- Name: score fkpqss47h2fevnmkh76r14055o0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.score
    ADD CONSTRAINT fkpqss47h2fevnmkh76r14055o0 FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2021-03-09 00:11:16

--
-- PostgreSQL database dump complete
--

