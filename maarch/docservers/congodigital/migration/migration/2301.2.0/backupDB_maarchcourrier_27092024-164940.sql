--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Ubuntu 16.4-0ubuntu0.24.04.2)
-- Dumped by pg_dump version 16.4 (Ubuntu 16.4-0ubuntu0.24.04.2)

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

--
-- Data for Name: configurations; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.configurations (id, privilege, value) FROM stdin;
1	admin_email_server	{"auth": true, "from": "test.maarch.courrier@maarch.org", "host": "smtp.globalsp.com", "port": 587, "type": "smtp", "user": "", "online": false, "secure": "tls", "charset": "utf-8", "password": ""}
2	admin_search	{"listEvent": {"defaultTab": "dashboard"}, "listDisplay": {"subInfos": [{"icon": "fa-traffic-light", "value": "getPriority", "cssClasses": ["align_leftData"]}, {"icon": "fa-calendar", "value": "getCreationAndProcessLimitDates", "cssClasses": ["align_leftData"]}, {"icon": "fa-sitemap", "value": "getAssignee", "cssClasses": ["align_leftData"]}, {"icon": "fa-suitcase", "value": "getDoctype", "cssClasses": ["align_leftData"]}, {"icon": "fa-user", "value": "getRecipients", "cssClasses": ["align_leftData"]}, {"icon": "fa-book", "value": "getSenders", "cssClasses": ["align_leftData"]}], "templateColumns": 6}}
3	admin_sso	{"url": "", "mapping": [{"ssoId": "", "maarchId": "login"}]}
4	admin_document_editors	{"java": [], "default": "", "onlyoffice": {"ssl": true, "uri": "onlyoffice7.maarchcourrier.com", "port": "443", "token": "", "authorizationHeader": "Authorization"}}
5	admin_parameters_watermark	{"font": "helvetica", "posX": 30, "posY": 35, "size": 10, "text": "Copie conforme de [alt_identifier] le [date_now] [hour_now]", "angle": 0, "color": [20, 192, 30], "enabled": true, "opacity": 0.5}
6	admin_shippings	{"uri": "", "authUri": "", "enabled": false}
7	admin_addin_outlook	{"typeId": 1203, "statusId": 42, "indexingModelId": 8, "attachmentTypeId": 5}
8	admin_organization_email_signatures	{"signatures": [{"label": "Signature Organisation", "content": "<div><span><span><strong>[user.firstname] </strong></span></span><span>[user.lastname]</span></div>\\n<div><span><span><span><span><strong>[userPrimaryEntity.entity_label]</strong></span></span></span></span></div>\\n<div><span>[user.phone]</span></div>\\n<div><span><span>[userPrimaryEntity.address_number] [userPrimaryEntity.address_street], [userPrimaryEntity.address_postcode] [userPrimaryEntity.address_town]</span></span></div>\\n<div>&nbsp;</div>"}]}
9	admin_export_seda	{}
10	admin_mercure	{"mws": {"url": "", "login": "", "password": "", "tokenMws": "", "loginMaarch": "", "passwordMaarch": ""}, "enabledLad": true, "mwsLadPriority": false}
\.


--
-- Name: configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.configurations_id_seq', 11, false);


--
-- PostgreSQL database dump complete
--

