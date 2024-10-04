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
-- Data for Name: docservers; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.docservers (id, docserver_id, docserver_type_id, device_label, is_readonly, is_encrypted, size_limit_number, actual_size_number, path_template, creation_date, coll_id) FROM stdin;
1	FASTHD_AI	DOC	Dépôt documentaire issue d'imports de masse	Y	f	50000000000	1	/opt/maarch/docservers/congodigital/ai/	2011-01-07 13:43:48.696644	letterbox_coll
8	FULLTEXT_MLB	FULLTEXT	Dépôt de l'extraction plein texte des documents numérisés	N	f	50000000000	0	/opt/maarch/docservers/congodigital/fulltext_resources/	2015-03-16 14:47:49.197164	letterbox_coll
9	FULLTEXT_ATTACH	FULLTEXT	Dépôt de l'extraction plein texte des pièces jointes	N	f	50000000000	0	/opt/maarch/docservers/congodigital/fulltext_attachments/	2015-03-16 14:47:49.197164	attachments_coll
6	TNL_MLB	TNL	Dépôt des maniatures des documents numérisés	N	f	50000000000	0	/opt/maarch/docservers/congodigital/thumbnails_resources/	2015-03-16 14:47:49.197164	letterbox_coll
11	ARCHIVETRANSFER	ARCHIVETRANSFER	Dépôt des archives numériques	N	f	50000000000	1	/opt/maarch/docservers/congodigital/archive_transfer/	2017-01-13 14:47:49.197164	archive_transfer_coll
7	TNL_ATTACH	TNL	Dépôt des maniatures des pièces jointes	N	f	50000000000	0	/opt/maarch/docservers/congodigital/thumbnails_attachments/	2015-03-16 14:47:49.197164	attachments_coll
10	TEMPLATES	TEMPLATES	Dépôt des modèles de documents	N	f	50000000000	71511	/opt/maarch/docservers/congodigital/templates/	2012-04-01 14:49:05.095119	templates
3	FASTHD_ATTACH	DOC	Dépôt des pièces jointes	N	f	50000000000	1	/opt/maarch/docservers/congodigital/attachments/	2011-01-13 14:47:49.197164	attachments_coll
5	CONVERT_ATTACH	CONVERT	Dépôt des formats des pièces jointes	N	f	50000000000	0	/opt/maarch/docservers/congodigital/convert_attachments/	2015-03-16 14:47:49.197164	attachments_coll
2	FASTHD_MAN	DOC	Dépôt documentaire de numérisation manuelle	N	f	50000000000	1290730	/opt/maarch/docservers/congodigital/resources/	2011-01-13 14:47:49.197164	letterbox_coll
4	CONVERT_MLB	CONVERT	Dépôt des formats des documents numérisés	N	f	50000000000	0	/opt/maarch/docservers/congodigital/convert_resources/	2015-03-16 14:47:49.197164	letterbox_coll
12	ACKNOWLEDGEMENT_RECEIPTS	ACKNOWLEDGEMENT_RECEIPTS	Dépôt des AR	N	f	50000000000	0	/opt/maarch/docservers/congodigital/acknowledgement_receipts/	2019-04-19 22:22:22.201904	letterbox_coll
14	MIGRATION	MIGRATION	Dépôt de sauvegarde des migrations	N	f	50000000000	0	/opt/maarch/docservers/congodigital/migration/	2024-09-27 14:49:40.426909	migration
\.


--
-- Name: docservers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.docservers_id_seq', 14, true);


--
-- PostgreSQL database dump complete
--

