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
-- Data for Name: actions; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.actions (id, keyword, label_action, id_status, is_system, action_page, component, history, parameters) FROM stdin;
1	redirect	Rediriger	NEW	Y	redirect	redirectAction	Y	{}
3		Retourner au service Courrier	RET	N	confirm_status	confirmAction	Y	{}
5		Remettre en traitement	COU	N	confirm_status	confirmAction	Y	{}
6		Supprimer le courrier	DEL	N	confirm_status	confirmAction	Y	{}
18	redirect	Qualifier le courrier	NEW	N	redirect	redirectAction	Y	{}
19		Traiter courrier	COU	N	confirm_status	confirmAction	N	{}
20		Cloturer	END	N	close_mail	closeMailAction	Y	{"requiredFields": []}
21		Envoyer le courrier en validation	VAL	N	\N	confirmAction	Y	{}
22		Attribuer au service	NEW	N	confirm_status	confirmAction	Y	{}
24	indexing	Remettre en validation	VAL	N	confirm_status	confirmAction	Y	{}
36		Envoyer pour avis	EAVIS	N	send_docs_to_recommendation	sendToParallelOpinion	Y	{}
37		Donner un avis	_NOSTATUS_	N	avis_workflow_simple	giveOpinionParallelAction	Y	{}
114		Marquer comme lu		N	mark_as_read	resMarkAsReadAction	N	{}
400		Envoyer un AR	_NOSTATUS_	N	send_attachments_to_contact	createAcknowledgementReceiptsAction	Y	{"mode": "manual"}
405		Viser le courrier	_NOSTATUS_	N	confirm_status	confirmAction	Y	{}
407		Renvoyer pour traitement	COU	N	confirm_status	confirmAction	Y	{}
408		Refuser le visa et remonter le circuit	_NOSTATUS_	N	rejection_visa_previous	rejectVisaBackToPreviousAction	N	{}
410		Transmettre la réponse signée	EENV	N	interrupt_status	continueVisaCircuitAction	Y	{}
416		Valider et poursuivre le circuit	_NOSTATUS_	N	visa_workflow	continueVisaCircuitAction	Y	{"errorStatus": "END", "successStatus": "_NOSTATUS_"}
420		Classer sans suite	SSUITE	N	confirm_status	confirmAction	Y	{}
421		Retourner au Service Courrier	RET	N	confirm_status	confirmAction	Y	{}
431		Envoyer en GRC	GRC	N	confirm_status	confirmAction	Y	{}
500		Transférer au système d'archivage	SEND_SEDA	N	export_seda	sendToRecordManagementAction	Y	{"errorStatus": "END", "successStatus": "SEND_SEDA"}
501		Valider la réception du courrier par le système d'archivage	ACK_SEDA	N	check_acknowledgment	checkAcknowledgmentRecordManagementAction	Y	{}
502		Valider l'archivage du courrier	REPLY_SEDA	N	check_reply	checkReplyRecordManagementAction	Y	{}
503		Purger le courrier	DEL	N	purge_letter	confirmAction	Y	{}
504		Remise à zero du courrier	END	N	reset_letter	resetRecordManagementAction	Y	{}
505		Clôturer avec suivi	STDBY	N	close_mail	closeMailAction	Y	{"requiredFields": []}
506		Terminer le suivi	END	N	confirm_status	confirmAction	Y	{}
507		Acter l’envoi	ENVDONE	N	confirm_status	confirmAction	Y	{}
524		Activer la persistance	_NOSTATUS_	N	set_persistent_mode_on	enabledBasketPersistenceAction	N	{}
525		Désactiver la persistance	_NOSTATUS_	N	set_persistent_mode_off	disabledBasketPersistenceAction	N	{}
527		Envoyer sur la tablette (Maarch Parapheur)	ATT_MP	N	sendToExternalSignatureBook	sendExternalSignatoryBookAction	Y	{"errorStatus": "END", "successStatus": "ATT_MP"}
528		Générer les accusés de réception	_NOSTATUS_	N	create_acknowledgement_receipt	createAcknowledgementReceiptsAction	Y	{"mode": "both"}
529		Envoyer un pli postal Maileva	_NOSTATUS_	N	send_shipping	sendShippingAction	Y	{}
531		Envoyer pour annotation sur la tablette (Maarch Parapheur)	ATT_MP	N	sendToExternalSignatureBook	sendExternalSignatoryBookAction	Y	{}
532		Enregistrer et imprimer le recommandé	NEW	N	saveAndPrintRegisteredMail	saveAndPrintRegisteredMailAction	Y	{}
533		Enregistrer le recommandé et rester sur la page d'indexation	NEW	N	saveAndIndexRegisteredMail	saveAndIndexRegisteredMailAction	Y	{}
534		Imprimer le recommandé	_NOSTATUS_	N	printRegisteredMail	printRegisteredMailAction	Y	{}
535		Imprimer le descriptif de pli	_NOSTATUS_	N	printDepositList	printDepositListAction	Y	{}
536		Enregistrer le recommandé	NEW	N	saveRegisteredMail	saveRegisteredMailAction	Y	{}
537		Quitter le traitement	_NOSTATUS_	N	no_confirm_status	noConfirmAction	N	{}
530		Générer à nouveau les accusés de réception pour impression	_NOSTATUS_	N	create_acknowledgement_receipt	createAcknowledgementReceiptsAction	Y	{"mode": "both"}
4		Enregistrer les modifications	_NOSTATUS_	N	no_confirm_status	noConfirmAction	N	{}
414		Envoyer au parapheur interne	_NOSTATUS_	N	send_to_visa	sendSignatureBookAction	Y	{"errorStatus": "_NOSTATUS_", "successStatus": "EVIS"}
\.


--
-- Data for Name: parameters; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.parameters (id, description, param_value_string, param_value_int, param_value_date) FROM stdin;
work_batch_autoimport_id	\N	\N	1	\N
user_quota	\N		0	\N
defaultDepartment	Département par défaut sélectionné dans les autocomplétions de la Base Adresse Nationale	75	\N	\N
thumbnailsSize	Résolution des imagettes	750x900	\N	\N
keepDestForRedirection	Si activé (1), met le destinataire en copie de la liste de diffusion lors d'une action de redirection	\N	0	\N
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
database_version		2301.1.3	\N	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.users (id, user_id, password, firstname, lastname, phone, mail, initials, preferences, status, password_modification_date, mode, refresh_token, reset_token, failed_authentication, locked_until, authorized_api, external_id, feature_tour, absence) FROM stdin;
5	ddur	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Dominique	DUR	\N	yourEmail@domain.com	\N	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	["eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTcyOTMxNjMsInVzZXIiOnsiaWQiOjV9fQ.-xHs1HNXaF04o5inFZeCOSOuodW8vrsPcVqsaiPnNww", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTcyOTMzMzgsInVzZXIiOnsiaWQiOjV9fQ.jY7jDCHyojZScH2FEDst825Rk3-M1ZspQXg0P5ZwQfQ"]	\N	0	\N	[]	{}	[]	\N
1	rrenaud	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Robert	RENAUD	\N	yourEmail@domain.com	\N	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	[]	\N	0	\N	[]	{}	[]	\N
2	ccordy	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Chloé	CORDY	\N	yourEmail@domain.com	\N	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	[]	\N	0	\N	[]	{}	[]	\N
3	ssissoko	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Sylvain	SISSOKO	\N	yourEmail@domain.com	\N	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	[]	\N	0	\N	[]	{}	[]	\N
7	eerina	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Edith	ERINA	\N	yourEmail@domain.com	\N	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	[]	\N	0	\N	[]	{}	[]	\N
8	kkaar	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Katy	KAAR	\N	yourEmail@domain.com	\N	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	[]	\N	0	\N	[]	{}	[]	\N
9	bboule	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Bruno	BOULE	\N	yourEmail@domain.com	\N	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	[]	\N	0	\N	[]	{}	[]	\N
11	aackermann	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Amanda	ACKERMANN	\N	yourEmail@domain.com	\N	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	[]	\N	0	\N	[]	{}	[]	\N
12	ppruvost	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Pierre	PRUVOST	\N	yourEmail@domain.com	\N	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	[]	\N	0	\N	[]	{}	[]	\N
13	ttong	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Tony	TONG	\N	yourEmail@domain.com	\N	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	[]	\N	0	\N	[]	{}	[]	\N
14	sstar	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Suzanne	STAR	\N	yourEmail@domain.com	\N	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	[]	\N	0	\N	[]	{}	[]	\N
15	ssaporta	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Sabrina	SAPORTA	\N	yourEmail@domain.com	\N	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	[]	\N	0	\N	[]	{}	[]	\N
10	ppetit	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Patricia	PETIT	\N	yourEmail@domain.com	\N	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	["eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczNzI2MTksInVzZXIiOnsiaWQiOjEwfX0.Ae49KoDeVxlFwVo4ET3nhuVt5syqsZT_f00-M1pEfFI", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODM0NDMsInVzZXIiOnsiaWQiOjEwfX0.G8Mw5nN-TkOZcRbWkmbhPqKCAPb3IHEJUkvLgcUMelE"]	\N	0	\N	[]	{"maarchParapheur": 10}	[]	\N
20	jjonasz	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Jean	JONASZ	\N	yourEmail@domain.com	\N	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	[]	\N	0	\N	[]	{}	[]	\N
22	ggrand	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Georges	GRAND	\N	yourEmail@domain.com	\N	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	[]	\N	0	\N	[]	{}	[]	\N
6	jjane	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Jenny	JANE	\N	yourEmail@domain.com	\N	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	[]	\N	0	\N	[]	{"maarchParapheur": 13}	[]	\N
17	mmanfred	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Martin	MANFRED	\N	yourEmail@domain.com	\N	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	["eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczNzE1NTMsInVzZXIiOnsiaWQiOjE3fX0.eEecd_WTB_6vi8VbaVa2K7fpezUcfZ3ERRrGPw-_u8E", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczNzIwMzgsInVzZXIiOnsiaWQiOjE3fX0.C0onpkSOTdb0wBooyiGv3k3rHMgGPK6XDZ9DhiZAtfk", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODI1MDgsInVzZXIiOnsiaWQiOjE3fX0.pnx3TTituAWYRfDrOBRe1w1HHnVFRi_qpM5WB4px13U"]	\N	0	\N	[]	{"maarchParapheur": 12}	[]	\N
24	cchaplin	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Charlie	CHAPLIN	\N	yourEmail@domain.com	\N	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	rest	[]	\N	0	\N	[]	{}	[]	\N
4	nnataly	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Nancy	NATALY	01 47 24 51 59	yourEmail@domain.com	NNA	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	["eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczNzgwMjgsInVzZXIiOnsiaWQiOjR9fQ.I35ctVjGU98nEVZF58YfjF6O0rJ-9kBKuxfaQB33500", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczNzg2OTYsInVzZXIiOnsiaWQiOjR9fQ.MFPGLYw0movM2-9u7OU5Ps1v3ydT78il2p5wOspD4_E", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczNzg3NzcsInVzZXIiOnsiaWQiOjR9fQ.2GXoECa6AGRzFIrjx724Ie2ClpOmcVN5hcM8q6Wmhxk", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczNzkzNTcsInVzZXIiOnsiaWQiOjR9fQ.pyi9SB-2XVjN6NwF2Ogf-C3s76bXsZxpfALfTlAkHZY", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODEwOTcsInVzZXIiOnsiaWQiOjR9fQ.UKS-X2axMLc383ox6V8iSkeTdU-iLFRqxUMjkr6yGzE", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODExOTUsInVzZXIiOnsiaWQiOjR9fQ.pPum2U9YxvyNpHbX8gql_5WVqBsjjuFsJyUSY2G_jqk", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODE0NzksInVzZXIiOnsiaWQiOjR9fQ.aFWso_KzJI_KM4gQ-o0TcR9gyYkyGLPRvpVSgIMvBq0", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODE3ODksInVzZXIiOnsiaWQiOjR9fQ.JV1dS4l_XQ_lysG6fiifDbz9_F5Z8FCoEfkwQk33G44", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODIxMTQsInVzZXIiOnsiaWQiOjR9fQ.wLG4aGupayZ2zaNwXd_jhJ-mANae_fc0Bx5tUguiOlI", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODIyNTYsInVzZXIiOnsiaWQiOjR9fQ.FYE8o4kg4EBiIx08_X514TQ0gGBRs8YPWWh0QPIJ3bg", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODM0MjMsInVzZXIiOnsiaWQiOjR9fQ.G0Uj3cJd8DOcqi1vtV63S9nBYTsT0sgjXiv49DmIm8Q"]	\N	0	\N	[]	{}	[]	\N
19	bbain	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Barbara	BAIN	\N	yourEmail@domain.com	\N	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	["eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTcxOTc1MTMsInVzZXIiOnsiaWQiOjE5fX0.3JD_K31gj_Cpzg2fDPv3ikwY8bEXHXHAgiPxBNP7Lks", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTcxOTgxOTMsInVzZXIiOnsiaWQiOjE5fX0.4IazyqfSoU_-kgOijesVIgwlfW6Zr1yofv2aOE9gZNM", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTcyMDE2NjUsInVzZXIiOnsiaWQiOjE5fX0.2noUw3WeSigdUK_y0a8O8edoOI97lPLh0VLs2zZ4zqA", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTcyNzAxOTksInVzZXIiOnsiaWQiOjE5fX0.reqaQ_wBiJ9GEMMqqeSHyPRXoHGemU8pWh2QOygo4ic", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTcyNzE3NzUsInVzZXIiOnsiaWQiOjE5fX0.bIG_XRegpDHdvT1Bqgkmw6yBB_KoNAk6an-Bmo4Sey0"]	\N	0	\N	[]	{}	[]	\N
18	ddaull	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Denis	DAULL	\N	yourEmail@domain.com	DDE	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	["eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTcyNzQyNzgsInVzZXIiOnsiaWQiOjE4fX0.jjGCRbta3QIJekhRITCShxGSM_iXTSG9N3kijeZhpcE", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTcyNzQ3MjksInVzZXIiOnsiaWQiOjE4fX0.NM69b97AA4Q3fNhKdliSl2ZDw8N8JJXqmsh7I3wfhrE", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTcyNzUzODUsInVzZXIiOnsiaWQiOjE4fX0.lF9yhGCoC9W-Hafdp0Ll6wrC1fQEJ7qw6h1y92U0gik", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTcyODIyOTksInVzZXIiOnsiaWQiOjE4fX0.y7dTpSBDHYKaX0y_mWd4zY5xNuoj0cMYLcH2Nr8g6ds"]	\N	0	\N	[]	{}	[]	\N
21	bblier	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Bernard	BLIER	\N	yourEmail@domain.com	\N	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	["eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTcxOTc1MjgsInVzZXIiOnsiaWQiOjIxfX0.plGMlETEhHn_OySZhYOsDhbiXbn6CG9yv8teMXURDz0", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTcxOTc2MzgsInVzZXIiOnsiaWQiOjIxfX0.8fxQFdyselx4IFRDaBBDFr3k3PlG66IMAaX5HrnQYfA", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTcxOTgyMDksInVzZXIiOnsiaWQiOjIxfX0.Q06K2dqzzSRUHapFcPGMud-FwZpwKC0B8zLsMZ0VFEM", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTcxOTgyODgsInVzZXIiOnsiaWQiOjIxfX0.zIdDXtyl0rYZEuSbNwFbo6yw5NtqNnWiNKGX5dGhZY0", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTcxOTgzODQsInVzZXIiOnsiaWQiOjIxfX0.e0bKwQY8KJtfpKWZA92gdqrGAeRpdIRjUu0YoONpu4k", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTcyMDE2ODEsInVzZXIiOnsiaWQiOjIxfX0.GCPm6k81zdjHwSk_SdivRduSyQEBzEM3R_zGlrZNtdg", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODI3NzksInVzZXIiOnsiaWQiOjIxfX0.zc1Ua1yDsIn_mAFTBFKNA0fqp2B2yPBqg-jkkdy54cw", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODI4NzksInVzZXIiOnsiaWQiOjIxfX0.3p1rQntbBkj0QQol_7c1s6Yt6UOs3iXD8XMgZ9wU7AE", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODMyOTMsInVzZXIiOnsiaWQiOjIxfX0.3AQOob8RWZN26xvb7cKZoBK5UUECcgqFhAw_kedDBoM", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODQ2OTgsInVzZXIiOnsiaWQiOjIxfX0.NrjZGTE3CnItgkeKA9VpZv-egRMhfHEKHkTVRe_kR8E", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODQ5NTksInVzZXIiOnsiaWQiOjIxfX0.3W8l3CxftN-nZft758ovsTEXfK3CCZTY_4UxpqzD-IE"]	\N	0	\N	[]	{}	[]	\N
16	ccharles	$2y$10$C.QSslBKD3yNMfRPuZfcaubFwPKiCkqqOUyAdOr5FSGKPaePwuEjG	Charlotte	CHARLES	01 47 24 51 59	yourEmail@domain.com	CCH	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	standard	["eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTcyOTMwNTMsInVzZXIiOnsiaWQiOjE2fX0._rHmsXcO-0vRCsW3G3XL71w4VDjIMebe4aSphm0vOcA", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTcyOTM5MjksInVzZXIiOnsiaWQiOjE2fX0.eiW-ayIAUkqa-UIbc6nTNGJgxqRUqC3df8P5QXNpPoY", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczNTMxNDYsInVzZXIiOnsiaWQiOjE2fX0.srfJhsaLYx3dKhdqxXKtpCtPbN39L4HvdmNZ7oFMhZk", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczNTMxNjYsInVzZXIiOnsiaWQiOjE2fX0.IHXvQhJ55loCeOVbnAQYEAdijsL27ldalGje2XQLOD8", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczNTYyNDYsInVzZXIiOnsiaWQiOjE2fX0.5sNOhAqGGve7Yw9z2h3rH8Gfrnr1TQhgXmBYmaVbRSw", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczNTcyMTUsInVzZXIiOnsiaWQiOjE2fX0.oxVhj7NNXf0DJq53cKKpXuSqxwop9jYJRkWH9UD5HlM", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczNTc0MTAsInVzZXIiOnsiaWQiOjE2fX0.XWeCumwk3I4sQOIhsrGiIxU6LaZ7EIUWMwYg95Y5qjU", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczNTc2MDIsInVzZXIiOnsiaWQiOjE2fX0.uPLIIIQqZoVc7UlNhj-DWKsbHzO_bJmsNPSPLlf3CQA", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczNTc2OTksInVzZXIiOnsiaWQiOjE2fX0.rFsF0YNxAZDR7ATQ0F-irDVwWi10TL-mO520jKl5siM", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczNzg3NDMsInVzZXIiOnsiaWQiOjE2fX0.U9Jv6X7ol87FyshBaGszRCpYVKSLWAID9YXX5CV15NU", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODM0MDUsInVzZXIiOnsiaWQiOjE2fX0.-kGf7-jXxJ47Q-CKq9ihFxZjZdhhMBmCChSdQh7-3YI"]	\N	0	\N	[]	{}	[]	\N
23	superadmin	$2y$10$eMVQWhYwoEv7OtCpc8nmBu47LxrRtl/vi9Mo9DJU/qbTORThu7dtO	Admin	SUPER	0147245159	contact@congo-digital.com	\N	{"documentEdition": "onlyoffice"}	OK	2021-03-24 10:17:02.66594	root_invisible	["eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODEwMzAsInVzZXIiOnsiaWQiOjIzfX0.UGeJdAGK2JitQExrK8jLDxJHnsRW6XyAqEM2Z_J9h4s", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODExNjIsInVzZXIiOnsiaWQiOjIzfX0.JP6VaQfSz4UE2O-jt6LtUV8rYUJoDtAR2QErDVk9WNU", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODE0MjcsInVzZXIiOnsiaWQiOjIzfX0.3tGHE94biLKFaCw2RTv8BbevYIEAcyMkwX3DC-6dD2o", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODE3MTUsInVzZXIiOnsiaWQiOjIzfX0.gTSVd0W7Awo7r7BcrJx2Nv6QMua0mhRY6eiDV0Akc3A", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODIwMDgsInVzZXIiOnsiaWQiOjIzfX0._obgnYje053-ulJ1YgLC9bRYjGJRebmMzUzHB7yAsCc", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODIxNjQsInVzZXIiOnsiaWQiOjIzfX0.IvZdVDqsndzee3P4bUSanPQh7PIMs97JhNHQ6ciK7Gw", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODIyODgsInVzZXIiOnsiaWQiOjIzfX0.zGZVL_oyxX9Q8IXLom3RebJK58taPaMLXfIaZyJonW4", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODI2MjcsInVzZXIiOnsiaWQiOjIzfX0.8ar9hfUbzbt04hOq_Ms_45L-SbyhzNEJ9YlMve7rxbY", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODI2NzksInVzZXIiOnsiaWQiOjIzfX0.XydXfRUonUrrurE7UVUD_e7slUVPPCIGbHwRkVAe4jE", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODI4NTIsInVzZXIiOnsiaWQiOjIzfX0.K9cEBVjVf80yQRnD3TSGtArig68WThM_cAILxhDUo1U", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTczODMyNjIsInVzZXIiOnsiaWQiOjIzfX0.71s6sivewtg1PLvm606YGjA3sUUKRH0wqlH65PFX0BA"]	\N	0	\N	[]	{}	["welcome", "email", "notification"]	\N
\.


--
-- Name: actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.actions_id_seq', 538, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.users_id_seq', 25, false);


--
-- PostgreSQL database dump complete
--

