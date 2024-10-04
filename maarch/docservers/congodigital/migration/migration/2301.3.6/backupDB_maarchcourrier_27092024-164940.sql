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
-- Data for Name: parameters; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.parameters (id, description, param_value_string, param_value_int, param_value_date) FROM stdin;
work_batch_autoimport_id	\N	\N	1	\N
user_quota	\N		0	\N
defaultDepartment	Département par défaut sélectionné dans les autocomplétions de la Base Adresse Nationale	75	\N	\N
thumbnailsSize	Résolution des imagettes	750x900	\N	\N
QrCodePrefix	Si activé (1), ajoute "Maarch_" dans le contenu des QrCode générés. (Utilisable avec MaarchCapture >= 1.4)	\N	0	\N
workingDays	Si activé (1), les délais de traitement sont calculés en jours ouvrés (Lundi à Vendredi). Sinon, en jours calendaire	\N	1	\N
last_deposit_id	\N	\N	0	\N
registeredMailNotDistributedStatus	\N	PND	\N	\N
registeredMailDistributedStatus	\N	DSTRIBUTED	\N	\N
registeredMailImportedStatus	\N	NEW	\N	\N
keepDiffusionRoleInOutgoingIndexation	Si activé (1), prend en compte les roles du modèle de diffusion de l'entité.	\N	1	\N
bindingDocumentFinalAction	\N	copy	\N	\N
nonBindingDocumentFinalAction	\N	delete	\N	\N
minimumVisaRole	\N	\N	0	\N
maximumSignRole	\N	\N	0	\N
workflowSignatoryRole	Rôle de signataire dans le circuit	mandatory	\N	\N
siret	Numéro SIRET de l'entreprise	45239273100025	\N	\N
traffic_record_summary_sheet			\N	\N
chrono_outgoing_2021		\N	3	\N
chrono_incoming_2021		\N	4	\N
suggest_links_n_days_ago	Le nombre de jours sur lequel sont cherchés les courriers à lier	\N	0	\N
noteVisibilityOffAction	Visibilité par défaut des annotations hors actions (0 = toutes les entités, 1 = restreint)	\N	0	\N
noteVisibilityOnAction	Visibilité par défaut des annotations sur les actions (0 = toutes les entités, 1 = restreint)	\N	0	\N
allowMultipleAvisAssignment	Un utilisateur peut fournir plusieurs avis tout en conservant le même rôle	\N	0	\N
loginpage_message			\N	\N
homepage_message		<p>D&eacute;couvrez <strong>Maarch Courrier 2301</strong> avec <a title="notre guide de visite" href="https://docs.maarch.org/gitbook/html/MaarchCourrier/2301" target="_blank" rel="noopener"><span style="color: #f99830;"><strong>notre guide de visite en ligne</strong></span></a>.</p>	\N	\N
database_version		2301.3.0	\N	\N
\.


--
-- PostgreSQL database dump complete
--

