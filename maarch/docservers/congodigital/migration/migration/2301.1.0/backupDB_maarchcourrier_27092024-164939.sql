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
-- Data for Name: acknowledgement_receipts; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.acknowledgement_receipts (id, res_id, type, format, user_id, contact_id, creation_date, send_date, docserver_id, path, filename, fingerprint, cc, cci) FROM stdin;
\.


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
-- Data for Name: actions_categories; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.actions_categories (action_id, category_id) FROM stdin;
20	incoming
20	outgoing
20	internal
20	ged_doc
22	incoming
22	outgoing
22	internal
22	ged_doc
532	registeredMail
533	registeredMail
534	registeredMail
535	registeredMail
536	registeredMail
537	incoming
537	outgoing
537	internal
537	ged_doc
537	registeredMail
530	incoming
530	outgoing
530	internal
530	ged_doc
530	registeredMail
4	incoming
4	outgoing
4	internal
4	ged_doc
4	registeredMail
414	ged_doc
414	incoming
414	internal
414	outgoing
\.


--
-- Data for Name: actions_groupbaskets; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.actions_groupbaskets (id_action, where_clause, group_id, basket_id, used_in_basketlist, used_in_action_page, default_action_list) FROM stdin;
24		COURRIER	RetourCourrier	N	Y	Y
22		COURRIER	RetourCourrier	N	Y	N
531		COURRIER	RetourCourrier	N	Y	N
18		COURRIER	QualificationBasket	N	Y	Y
18		COURRIER	NumericBasket	N	Y	Y
19		AGENT	CopyMailBasket	N	Y	Y
114		AGENT	CopyMailBasket	Y	N	N
37		ELU	DdeAvisBasket	N	Y	Y
4		ELU	DdeAvisBasket	N	Y	N
19		AGENT	DepartmentBasket	N	Y	Y
20		AGENT	DepartmentBasket	Y	N	N
3		AGENT	DepartmentBasket	Y	N	N
1		AGENT	DepartmentBasket	Y	N	N
4		AGENT	RetAvisBasket	N	Y	Y
5		AGENT	RetAvisBasket	Y	Y	N
37		AGENT	DdeAvisBasket	N	Y	N
4		AGENT	DdeAvisBasket	N	Y	Y
4		AGENT	SupAvisBasket	N	Y	Y
5		AGENT	SupAvisBasket	Y	Y	N
19		AGENT	SuiviParafBasket	N	Y	Y
19		RESPONSABLE	MyBasket	N	Y	Y
1		RESPONSABLE	MyBasket	N	Y	N
414		RESPONSABLE	MyBasket	N	Y	N
36		RESPONSABLE	MyBasket	N	Y	N
3		RESPONSABLE	MyBasket	N	Y	N
20	closing_date IS NULL	RESPONSABLE	MyBasket	N	Y	N
506	closing_date IS NOT NULL	RESPONSABLE	MyBasket	N	Y	N
400		RESPONSABLE	MyBasket	N	Y	N
527		RESPONSABLE	MyBasket	Y	Y	N
19		RESPONSABLE	CopyMailBasket	N	Y	Y
114		RESPONSABLE	CopyMailBasket	Y	N	N
19		RESPONSABLE	ValidAnswerBasket	N	Y	Y
19		RESPONSABLE	DepartmentBasket	N	Y	Y
20		RESPONSABLE	DepartmentBasket	Y	N	N
3		RESPONSABLE	DepartmentBasket	Y	N	N
1		RESPONSABLE	DepartmentBasket	Y	N	N
37		RESPONSABLE	DdeAvisBasket	N	Y	N
4		RESPONSABLE	DdeAvisBasket	N	Y	Y
4		RESPONSABLE	SupAvisBasket	N	Y	Y
5		RESPONSABLE	SupAvisBasket	Y	Y	N
4		RESPONSABLE	RetAvisBasket	N	Y	Y
5		RESPONSABLE	RetAvisBasket	Y	Y	N
405		RESPONSABLE	ParafBasket	N	Y	Y
416		RESPONSABLE	ParafBasket	N	Y	N
407		RESPONSABLE	ParafBasket	N	Y	N
408		RESPONSABLE	ParafBasket	N	Y	N
410		RESPONSABLE	ParafBasket	N	Y	N
19		RESPONSABLE	SuiviParafBasket	N	Y	Y
19		AGENT	SendToSignatoryBook	N	Y	Y
5		AGENT	SendToSignatoryBook	Y	N	N
19		RESPONSABLE	SendToSignatoryBook	N	Y	Y
5		RESPONSABLE	SendToSignatoryBook	Y	N	N
19		ELU	MyBasket	N	Y	Y
19		ARCHIVISTE	ToArcBasket	N	Y	Y
500		ARCHIVISTE	ToArcBasket	Y	N	N
501		ARCHIVISTE	ToArcBasket	Y	N	N
502		ARCHIVISTE	SentArcBasket	Y	N	N
19		ARCHIVISTE	SentArcBasket	N	Y	Y
19		ARCHIVISTE	AckArcBasket	N	Y	Y
503		ARCHIVISTE	AckArcBasket	Y	N	N
504		ARCHIVISTE	AckArcBasket	Y	N	N
19		CABINET	SuiviBasket	N	Y	Y
524		CABINET	SuiviBasket	Y	N	N
525		CABINET	SuiviBasket	Y	N	N
19		SERVICE	ValidationBasket	N	Y	Y
19		AGENT	Maileva_Sended	N	Y	Y
22		RESP_COURRIER	ValidationBasket	Y	Y	Y
420		RESP_COURRIER	ValidationBasket	Y	Y	N
3		RESP_COURRIER	ValidationBasket	Y	Y	N
528		AGENT	AR_Create	Y	N	N
537		AGENT	AR_Create	N	Y	Y
507		AGENT	EenvBasket	Y	Y	N
20		AGENT	EenvBasket	Y	Y	N
19		AGENT	EenvBasket	N	Y	Y
530		AGENT	AR_AlreadySend	Y	N	N
537		AGENT	AR_AlreadySend	N	Y	Y
507		RESPONSABLE	EenvBasket	Y	Y	N
20		RESPONSABLE	EenvBasket	Y	Y	N
19		RESPONSABLE	EenvBasket	N	Y	Y
20		AGENT	MyBasket	N	Y	N
505		AGENT	MyBasket	N	Y	N
414		AGENT	MyBasket	N	Y	N
36		AGENT	MyBasket	N	Y	N
1		AGENT	MyBasket	N	Y	N
19		AGENT	MyBasket	N	Y	Y
18		AGENT	outlook_mails	N	Y	Y
18		DIRECTEUR	outlook_mails	N	Y	Y
18		RESPONSABLE	outlook_mails	N	Y	Y
18		COURRIER	outlook_mails	N	Y	Y
18		RESP_COURRIER	outlook_mails	N	Y	Y
\.


--
-- Data for Name: address_sectors; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.address_sectors (id, address_number, address_street, address_postcode, address_town, label, ban_id) FROM stdin;
\.


--
-- Data for Name: adr_attachments; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.adr_attachments (id, res_id, type, docserver_id, path, filename, fingerprint) FROM stdin;
\.


--
-- Data for Name: adr_letterbox; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.adr_letterbox (id, res_id, type, version, docserver_id, path, filename, fingerprint) FROM stdin;
\.


--
-- Data for Name: attachment_types; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.attachment_types (id, type_id, label, visible, email_link, signable, signed_by_default, icon, chrono, version_enabled, new_version_default) FROM stdin;
2	response_project	Projet de réponse	t	t	t	f	R	t	t	t
3	signed_response	Réponse signée	f	t	f	f		t	t	t
4	simple_attachment	Pièce jointe	t	f	f	f	PJ	f	t	t
5	incoming_mail_attachment	Pièce jointe capturée	t	f	f	f		f	t	t
6	outgoing_mail	Courrier départ spontané	t	f	t	f	DS	t	t	t
7	summary_sheet	Fiche de liaison	f	f	f	f		t	t	t
8	acknowledgement_record_management	Accusé de réception (Archivage)	f	f	f	f		t	t	t
9	reply_record_management	Réponse au transfert (Archivage)	f	f	f	f		t	t	t
10	shipping_deposit_proof	Preuve de dépôt Maileva	f	f	f	f	M	f	f	f
11	shipping_acknowledgement_of_receipt	Accusé de réception Maileva	f	f	f	f	M	f	f	f
\.


--
-- Data for Name: basket_persistent_mode; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.basket_persistent_mode (res_id, user_id, is_persistent) FROM stdin;
\.


--
-- Data for Name: baskets; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.baskets (id, coll_id, basket_id, basket_name, basket_desc, basket_clause, is_visible, enabled, basket_order, color, basket_res_order, flag_notif) FROM stdin;
5	letterbox_coll	CopyMailBasket	Courriers en copie	Courriers en copie non clos ou sans suite	(res_id in (select res_id from listinstance WHERE item_type = 'user_id' and item_id = @user_id and item_mode = 'cc') or res_id in (select res_id from listinstance WHERE item_type = 'entity_id' and item_mode = 'cc' and item_id in (@my_entities_id))) and status not in ( 'DEL', 'END', 'SSUITE') and res_id not in (select res_id from res_mark_as_read WHERE user_id = @user_id)	Y	Y	7	\N	res_id desc	N
9	letterbox_coll	DdeAvisBasket	Avis : Avis à émettre	Courriers nécessitant un avis	status = 'EAVIS' AND res_id IN (SELECT res_id FROM listinstance WHERE item_type = 'user_id' AND item_id = @user_id AND item_mode = 'avis' and process_date is NULL)	Y	Y	8	\N	res_id desc	N
8	letterbox_coll	RetourCourrier	Retours Courrier	Courriers retournés au service Courrier	STATUS='RET'	Y	Y	4	\N	res_id desc	N
6	letterbox_coll	AR_Create	AR - A Envoyer	AR non envoyés	dest_user = @user_id AND res_id NOT IN(select distinct res_id from acknowledgement_receipts) and status not in ('END') and category_id = 'incoming'	Y	Y	5	\N	res_id desc	N
11	letterbox_coll	RetAvisBasket	Avis : Retours partiels	Courriers avec avis reçus	status='EAVIS' and ((dest_user = @user_id) OR (DEST_USER IN (select user_id from users_entities WHERE entity_id IN( @my_entities)) or DESTINATION in (@subentities[@my_entities]))) and res_id IN (SELECT res_id FROM listinstance WHERE item_mode = 'avis' and difflist_type = 'entity_id' and process_date is not NULL and res_view_letterbox.res_id = res_id group by res_id)	Y	Y	10	\N	res_id desc	N
12	letterbox_coll	ValidationBasket	Attributions à vérifier	Courriers signalés en attente d'instruction pour les services	status='VAL'	Y	Y	11	\N	res_id desc	N
13	letterbox_coll	InValidationBasket	Courriers signalés en attente d'instruction	Courriers signalés en attente d'instruction par le responsable	destination in (@my_entities, @subentities[@my_entities]) and status='VAL'	Y	Y	12	\N	res_id desc	N
14	letterbox_coll	LateMailBasket	Courriers en retard	Courriers en retard	destination in (@my_entities, @subentities[@my_primary_entity]) and (status <> 'DEL' AND status <> 'REP') and (now() > process_limit_date)	Y	Y	13	\N	res_id desc	N
15	letterbox_coll	DepartmentBasket	Courriers de ma direction	Bannette de supervision	destination in (@my_entities, @subentities[@my_primary_entity]) and (status <> 'DEL' AND status <> 'REP' and status <> 'VAL')	Y	Y	14	\N	res_id desc	N
16	letterbox_coll	ParafBasket	Parapheur électronique	Courriers à viser ou signer dans mon parapheur	status in ('ESIG', 'EVIS') AND ((res_id, @user_id) IN (SELECT res_id, item_id FROM listinstance WHERE difflist_type = 'VISA_CIRCUIT' and process_date ISNULL and res_view_letterbox.res_id = res_id order by listinstance_id asc limit 1))	Y	Y	15	\N	res_id desc	N
17	letterbox_coll	SuiviParafBasket	Courriers en circuit de visa/signature	Courriers en circulation dans les parapheurs électroniques	status in ('ESIG', 'EVIS') AND dest_user = @user_id	Y	Y	16	\N	res_id desc	N
18	letterbox_coll	SendToSignatoryBook	Courriers envoyés au parapheur Maarch en attente ou rejetés	Courriers envoyés au parapheur Maarch en attente ou rejetés	(status = 'ATT_MP' or status = 'REJ_SIGN') AND dest_user = @user_id	Y	Y	17	\N	res_id desc	Y
19	letterbox_coll	Maileva_Sended	Courriers transmis via Maileva	Courriers transmis via Maileva	dest_user = @user_id AND res_id IN(SELECT distinct r.res_id_master from res_attachments r inner join shippings s on s.document_id = r.res_id) and status not in ('END')	Y	Y	18	\N	res_id desc	N
20	letterbox_coll	ToArcBasket	Courriers à archiver	Courriers arrivés en fin de DUC à envoyer en archive intermédiaire	status = 'EXP_SEDA' OR status = 'END' OR status = 'SEND_SEDA'	Y	Y	19	\N	res_id desc	N
21	letterbox_coll	SentArcBasket	Courriers en cours d'archivage	Courriers envoyés au SAE, en attente de réponse de transfert	status='ACK_SEDA'	Y	Y	20	\N	res_id desc	N
23	letterbox_coll	GedSampleBasket	Contrats arrivant à expiration (date fin contrat < 3mois)	Contrats arrivant à expiration (date fin contrat < 3mois)	custom_fields->>'1' is not null and custom_fields->>'1' <> '' and date(custom_fields->>'1') < now()+ interval '3 months'	Y	Y	22	\N	res_id desc	Y
7	letterbox_coll	AR_AlreadySend	AR transmis	AR en masse : transmis	dest_user = @user_id AND ((res_id IN(SELECT distinct res_id FROM acknowledgement_receipts WHERE creation_date is not null AND send_date is not null) and status not in ('END')) OR res_id IN (SELECT distinct res_id FROM acknowledgement_receipts WHERE creation_date is not null AND send_date is null ))	Y	Y	6	\N	res_id desc	N
24	letterbox_coll	IntervBasket	Demandes d''intervention voirie à traiter	Demandes d''intervention voirie à traiter	status in ('NEW', 'COU', 'STDBY', 'ENVDONE') and dest_user = @user_id and type_id = 1202	Y	Y	23	\N	res_id desc	Y
1	letterbox_coll	QualificationBasket	Courriers à qualifier	Bannette de qualification	status='INIT'	Y	Y	0	\N	res_id desc	N
2	letterbox_coll	NumericBasket	Plis numériques à qualifier	Plis numériques à qualifier	status = 'NUMQUAL'	Y	Y	1	\N	res_id desc	N
3	letterbox_coll	EenvBasket	Courriers à envoyer	Courriers visés/signés prêts à être envoyés	status='EENV' and dest_user = @user_id	Y	Y	2	\N	res_id desc	N
22	letterbox_coll	AckArcBasket	Courriers archivés	Courriers archivés et acceptés dans le SAE	status='REPLY_SEDA'	Y	Y	21	\N	res_id desc	N
4	letterbox_coll	MyBasket	Courriers à traiter	Bannette de traitement	status in ('NEW', 'COU', 'STDBY', 'ENVDONE') and dest_user = @user_id	Y	Y	3	\N	res_id desc	Y
10	letterbox_coll	SupAvisBasket	Avis : En attente de réponse	Courriers en attente d'avis	status='EAVIS' and ((dest_user = @user_id) OR (DEST_USER IN (select user_id from users_entities WHERE entity_id IN( @my_entities)) or DESTINATION in (@subentities[@my_entities]))) and res_id NOT IN (SELECT res_id FROM listinstance WHERE item_mode = 'avis' and difflist_type = 'entity_id' and process_date is not NULL and res_view_letterbox.res_id = res_id group by res_id) AND res_id IN (SELECT res_id FROM listinstance WHERE item_mode = 'avis' and difflist_type = 'entity_id' and process_date is NULL and res_view_letterbox.res_id = res_id group by res_id)	Y	Y	9	\N	res_id desc	N
25	letterbox_coll	outlook_mails	Courriels importés	Bannette des courriels importés de MS Outlook	status in ('OUT') and typist = @user_id	Y	Y	1	\N	res_id desc	N
\.


--
-- Data for Name: blacklist; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.blacklist (id, term) FROM stdin;
\.


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
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.contacts (id, civility, firstname, lastname, company, department, function, address_number, address_street, address_additional1, address_additional2, address_postcode, address_town, address_country, email, phone, communication_means, notes, creator, creation_date, modification_date, enabled, custom_fields, external_id, sector, lad_indexation) FROM stdin;
1	1	Jean-Louis	ERCOLANI	MAARCH		Directeur Général	11	Boulevard du Sud-Est			99000	MAARCH LES BAINS	France	dev.maarch@maarch.org		\N	Editeur du logiciel libre Maarch	21	2015-04-24 12:43:54.97424	2016-07-25 16:28:38.498185	t	{}	{}	\N	f
4	1	Nicolas	MARTIN	Préfecture de Maarch Les Bains	\N	\N	13	RUE LA PREFECTURE	\N	\N	99000	MAARCH LES BAINS	\N	\N	\N	{"url": "https://cchaplin:maarch@demo.maarchcourrier.com"}	\N	21	2018-04-18 12:43:54.97424	2020-03-24 15:06:58.16582	t	\N	{"m2m": "45239273100025/COU"}	\N	f
5	2	Brigitte	BERGER	ACME		Directrice Générale	25	PLACE DES MIMOSAS	\N		99000	MAARCH LES BAINS	FRANCE	dev.maarch@maarch.org		\N	Archivage et Conservation des Mémoires Electroniques	21	2015-04-24 12:43:54.97424	2016-07-25 16:28:38.498185	t	{}	{}	\N	f
6	1	Bernard	PASCONTENT				25	route de Pampelone	\N		99000	MAARCH-LES-BAINS		bernard.pascontent@gmail.com	06 08 09 07 55	\N		21	2019-03-20 13:59:09.23436	\N	t	{}	{}	\N	f
7	1	Jacques	DUPONT				1	rue du Peuplier	\N		92000	NANTERRE				\N		21	2019-03-20 13:59:09.23436	\N	t	{}	{}	\N	f
8	1	Pierre	BRUNEL				5	allée des Pommiers	\N		99000	MAARCH-LES-BAINS		dev.maarch@maarch.org	06 08 09 07 55	\N		21	2019-03-20 13:59:09.23436	\N	t	{}	{}	\N	f
9	1	Eric	MACKIN				13	rue du Square Carré	\N		99000	MAARCH-LES-BAINS			06 11 12 13 14	\N		21	2019-03-20 13:59:09.23436	\N	t	{}	{}	\N	f
10	2	Carole	COTIN	MAARCH		Directrice Administrative et Qualité	11	Boulevard du Sud-Est	\N		99000	MAARCH LES BAINS	FRANCE	dev.maarch@maarch.org		\N	Editeur du logiciel libre Maarch	21	2015-04-24 12:43:54.97424	2016-07-25 16:28:38.498185	t	{}	{}	\N	f
11	1	Martin Donald	PELLE				17	rue de la Demande	\N		99000	MAARCH-LES-BAINS		dev.maarch@maarch.org	01 23 24 21 22	\N		21	2019-03-20 13:59:09.23436	\N	t	{}	{}	\N	f
\.


--
-- Data for Name: contacts_civilities; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.contacts_civilities (id, label, abbreviation) FROM stdin;
1	Monsieur	M.
2	Madame	Mme
3	Mademoiselle	Mlle
4	Messieurs	MM.
5	Mesdames	Mmes
6	Mesdemoiselles	Mlles
\.


--
-- Data for Name: contacts_custom_fields_list; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.contacts_custom_fields_list (id, label, type, "values") FROM stdin;
\.


--
-- Data for Name: contacts_filling; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.contacts_filling (id, enable, first_threshold, second_threshold) FROM stdin;
1	t	33	66
\.


--
-- Data for Name: contacts_groups; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.contacts_groups (id, label, description, owner, entities) FROM stdin;
\.


--
-- Data for Name: contacts_groups_lists; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.contacts_groups_lists (id, contacts_groups_id, correspondent_id, correspondent_type) FROM stdin;
\.


--
-- Data for Name: contacts_parameters; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.contacts_parameters (id, identifier, mandatory, filling, searchable, displayable) FROM stdin;
1	civility	f	f	f	f
2	firstname	f	t	t	t
3	lastname	t	t	t	t
4	company	t	f	t	t
5	department	f	f	f	f
6	function	f	f	f	f
7	addressNumber	f	f	t	t
8	addressStreet	f	t	t	t
9	addressAdditional1	f	f	f	f
10	addressAdditional2	f	f	f	f
11	addressPostcode	f	t	t	t
12	addressTown	f	t	t	t
13	addressCountry	f	f	f	f
14	email	f	t	f	f
15	phone	f	t	f	f
16	notes	f	f	f	f
17	sector	f	f	f	f
\.


--
-- Data for Name: convert_stack; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.convert_stack (coll_id, res_id, convert_format, cnt_retry, status, work_batch, regex) FROM stdin;
\.


--
-- Data for Name: custom_fields; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.custom_fields (id, label, type, mode, "values") FROM stdin;
1	Date de fin de contrat	date	form	[]
2	Adresse d'intervention	banAutocomplete	form	[]
3	Nature	select	form	["Courrier simple", "Courriel", "Courrier suivi", "Courrier avec AR", "Fax", "Chronopost", "Fedex", "Courrier AR", "Coursier", "Pli numérique", "Autre"]
4	Référence courrier expéditeur	string	form	[]
5	Num recommandé	string	form	[]
\.


--
-- Data for Name: difflist_roles; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.difflist_roles (id, role_id, label, keep_in_list_instance) FROM stdin;
1	dest	Destinataire	f
2	copy	En copie	t
3	visa	Pour visa	f
4	sign	Pour signature	f
5	avis	Pour avis	f
6	avis_copy	En copie (avis)	f
7	avis_info	Pour information (avis)	f
\.


--
-- Data for Name: difflist_types; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.difflist_types (difflist_type_id, difflist_type_label, difflist_type_roles, allow_entities, is_system) FROM stdin;
entity_id	Diffusion aux services	dest copy avis	Y	Y
type_id	Diffusion selon le type de document	dest copy	Y	Y
VISA_CIRCUIT	Circuit de visa	visa sign 	N	Y
AVIS_CIRCUIT	Circuit d'avis	avis 	N	Y
\.


--
-- Data for Name: docserver_types; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.docserver_types (docserver_type_id, docserver_type_label, enabled, fingerprint_mode) FROM stdin;
DOC	Documents numériques	Y	SHA512
CONVERT	Conversions de formats	Y	SHA256
FULLTEXT	Plein texte	Y	SHA256
TNL	Miniatures	Y	NONE
TEMPLATES	Modèles de documents	Y	NONE
ARCHIVETRANSFER	Archives numériques	Y	SHA256
ACKNOWLEDGEMENT_RECEIPTS	Accusés de réception	Y	\N
MIGRATION	Sauvegarde des migrations	Y	\N
\.


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
13	MIGRATION	MIGRATION	Dêpot de sauvegarde des migrations	N	f	50000000000	0	/opt/maarch/docservers/congodigital/migration/	2023-09-05 22:22:22.201904	migration
\.


--
-- Data for Name: doctypes; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.doctypes (coll_id, type_id, description, enabled, doctypes_first_level_id, doctypes_second_level_id, retention_final_disposition, retention_rule, action_current_use, duration_current_use, process_delay, delay1, delay2, process_mode) FROM stdin;
	101	Abonnements – documentation – archives	Y	1	1	destruction	compta_3_03	\N	365	30	14	1	NORMAL
	102	Convocation	Y	1	1	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	103	Demande de documents	Y	1	1	destruction	compta_3_03	\N	365	30	14	1	NORMAL
	104	Demande de fournitures et matériels	Y	1	1	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	105	Demande de RDV	Y	1	1	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	106	Demande de renseignements	Y	1	1	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	107	Demande mise à jour de fichiers	Y	1	1	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	108	Demande Multi-Objet	Y	1	1	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	109	Installation provisoire dans un équipement ville	Y	1	1	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	110	Invitation	Y	1	1	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	111	Rapport – Compte-rendu – Bilan	Y	1	1	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	112	Réservation d'un local communal et scolaire	Y	1	1	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	201	Pétition	Y	1	2	destruction	compta_3_03	\N	365	15	14	1	NORMAL
	202	Communication	Y	1	2	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	203	Politique	Y	1	2	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	204	Relations et solidarité internationales 	Y	1	2	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	205	Remerciements et félicitations	Y	1	2	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	206	Sécurité	Y	1	2	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	207	Suggestion	Y	1	2	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	301	Culture	Y	1	3	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	302	Demande scolaire hors inscription et dérogation	Y	1	3	destruction	compta_3_03	\N	365	60	14	1	SVR
	303	Éducation nationale	Y	1	3	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	304	Jeunesse	Y	1	3	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	305	Lycées et collèges	Y	1	3	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	306	Parentalité	Y	1	3	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	307	Petite Enfance	Y	1	3	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	308	Sport	Y	1	3	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	401	Contestation financière	Y	1	4	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	402	Contrat de prêt	Y	1	4	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	403	Garantie d'emprunt	Y	1	4	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	404	Paiement	Y	1	4	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	405	Quotient familial	Y	1	4	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	406	Subvention	Y	1	4	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	407	Facture ou avoir	Y	1	4	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	408	Proposition financière	Y	1	4	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	501	Hospitalisation d'office	Y	1	5	destruction	compta_3_03	\N	365	2	14	1	NORMAL
	502	Mise en demeure	Y	1	5	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	503	Plainte	Y	1	5	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	504	Recours contentieux	Y	1	5	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	505	Recours gracieux et réclamations	Y	1	5	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	601	Débits de boisson	Y	1	6	destruction	compta_3_03	\N	365	60	14	1	SVR
	602	Demande d’État Civil	Y	1	6	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	603	Élections	Y	1	6	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	604	Étrangers	Y	1	6	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	605	Marché	Y	1	6	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	606	Médaille du travail	Y	1	6	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	607	Stationnement taxi	Y	1	6	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	608	Vente au déballage	Y	1	6	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	701	Arrêts de travail et maladie	Y	1	7	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	702	Assurance du personnel	Y	1	7	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	703	Candidature	Y	1	7	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	704	Carrière	Y	1	7	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	705	Conditions de travail santé	Y	1	7	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	706	Congés exceptionnels et concours	Y	1	7	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	707	Formation	Y	1	7	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	708	Instances RH	Y	1	7	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	709	Retraite	Y	1	7	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	710	Stage	Y	1	7	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	711	Syndicats	Y	1	7	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	801	Aide à domicile	Y	1	8	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	802	Aide Financière	Y	1	8	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	803	Animations retraités	Y	1	8	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	804	Domiciliation	Y	1	8	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	805	Dossier de logement	Y	1	8	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	806	Expulsion	Y	1	8	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	807	Foyer	Y	1	8	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	808	Obligation alimentaire	Y	1	8	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	809	RSA	Y	1	8	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	810	Scolarisation à domicile	Y	1	8	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	901	Aire d'accueil des gens du voyage	Y	1	9	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	902	Assainissement	Y	1	9	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	903	Assurance et sinistre	Y	1	9	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	904	Autorisation d'occupation du domaine public	Y	1	9	destruction	compta_3_03	\N	365	60	14	1	SVR
	905	Contrat et convention hors marchés publics	Y	1	9	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	906	Détention de chiens dangereux	Y	1	9	destruction	compta_3_03	\N	365	60	14	1	SVR
	907	Espaces verts – Environnement – Développement durable	Y	1	9	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	908	Hygiène et Salubrité	Y	1	9	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	909	Marchés Publics	Y	1	9	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	910	Mobiliers urbains	Y	1	9	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	911	NTIC	Y	1	9	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	912	Opération d'aménagement	Y	1	9	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	913	Patrimoine	Y	1	9	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	914	Problème de voisinage	Y	1	9	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	915	Propreté	Y	1	9	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	916	Stationnement et circulation	Y	1	9	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	917	Transports	Y	1	9	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	918	Travaux	Y	1	9	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	1001	Alignement	Y	1	10	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	1002	Avis d'urbanisme	Y	1	10	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	1003	Commerces	Y	1	10	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	1004	Numérotation	Y	1	10	destruction	compta_3_03	\N	365	60	14	1	NORMAL
	1101	Autorisation de buvette	Y	1	11	destruction	compta_3_03	\N	365	60	14	1	SVA
	1102	Cimetière	Y	1	11	destruction	compta_3_03	\N	365	60	14	1	SVA
	1103	Demande de dérogation scolaire	Y	1	11	destruction	compta_3_03	\N	365	60	14	1	SVA
	1104	Inscription à la cantine et activités périscolaires 	Y	1	11	destruction	compta_3_03	\N	365	60	14	1	SVA
	1105	Inscription toutes petites sections	Y	1	11	destruction	compta_3_03	\N	365	90	14	1	SVA
	1106	Travaux ERP	Y	1	11	destruction	compta_3_03	\N	365	60	14	1	SVA
	1201	Appel téléphonique	Y	1	12	destruction	compta_3_03	\N	365	21	14	1	NORMAL
	1202	Demande intervention voirie	Y	1	12	destruction	compta_3_03	\N	365	21	14	1	NORMAL
	1203	Courriel importé	Y	1	12	destruction	compta_3_03	\N	365	21	14	1	NORMAL
\.


--
-- Data for Name: doctypes_first_level; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.doctypes_first_level (doctypes_first_level_id, doctypes_first_level_label, css_style, enabled) FROM stdin;
1	COURRIERS	#000000	Y
\.


--
-- Data for Name: doctypes_indexes; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.doctypes_indexes (type_id, coll_id, field_name, mandatory) FROM stdin;
\.


--
-- Data for Name: doctypes_second_level; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.doctypes_second_level (doctypes_second_level_id, doctypes_second_level_label, doctypes_first_level_id, css_style, enabled) FROM stdin;
1	01. Correspondances	1	#000000	Y
2	02. Cabinet	1	#000000	Y
3	03. Éducation	1	#000000	Y
4	04. Finances	1	#000000	Y
5	05. Juridique	1	#000000	Y
6	06. Population 	1	#000000	Y
7	07. Ressources Humaines	1	#000000	Y
8	08. Social	1	#000000	Y
9	09. Technique	1	#000000	Y
10	10. Urbanisme	1	#000000	Y
11	11. Silence vaut acceptation	1	#000000	Y
12	12. Formulaires	1	#000000	Y
\.


--
-- Data for Name: emails; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.emails (id, user_id, sender, recipients, cc, cci, object, body, document, is_html, status, message_exchange_id, creation_date, send_date) FROM stdin;
\.


--
-- Data for Name: entities; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.entities (id, entity_id, entity_label, short_label, entity_full_name, enabled, address_number, address_street, address_additional1, address_additional2, address_postcode, address_town, address_country, email, business_id, parent_entity_id, entity_type, ldap_id, producer_service, folder_import, external_id) FROM stdin;
1	VILLE	Ville de Maarch-les-Bains	Ville de Maarch-les-Bains	\N	Y		Place de la liberté	Hôtel de Ville	\N	99000	Maarch-les-Bains	FRANCE	mairie@maarchlesbains.fr	45239273100025/VILLE		Direction	\N	\N	\N	{}
2	CAB	Cabinet du Maire	Cabinet du Maire	\N	Y		Place de la liberté	Hôtel de Ville	\N	99000	Maarch-les-Bains	FRANCE	mairie@maarchlesbains.fr	45239273100025/CAB	VILLE	Direction	\N	\N	\N	{}
4	DGA	Direction Générale Adjointe	Direction Générale Adjointe	\N	Y		Place de la liberté	Hôtel de Ville	\N	99000	Maarch-les-Bains	FRANCE	mairie@maarchlesbains.fr	45239273100025/DGA	DGS	Bureau	\N	\N	\N	{}
3	DGS	Direction Générale des Services	Direction Générale des Services	\N	Y		Place de la liberté	Hôtel de Ville	\N	99000	Maarch-les-Bains	FRANCE	mairie@maarchlesbains.fr	45239273100025/DGS	VILLE	Direction	\N	\N	\N	{}
5	PCU	Pôle Culturel	Pôle Culturel	\N	Y		Place de la liberté	Hôtel de Ville	\N	99000	Maarch-les-Bains	FRANCE	mairie@maarchlesbains.fr	45239273100025/PCU	DGA	Service	\N	\N	\N	{}
6	PJS	Pôle Jeunesse et Sport	Pôle Jeunesse et Sport	\N	Y		Place de la liberté	Hôtel de Ville	\N	99000	Maarch-les-Bains	FRANCE	mairie@maarchlesbains.fr	45239273100025/PJS	DGA	Service	\N	\N	\N	{}
7	PE	Petite enfance	Petite enfance	\N	Y		Place de la liberté	Hôtel de Ville	\N	99000	Maarch-les-Bains	FRANCE	mairie@maarchlesbains.fr	45239273100025/PE	PJS	Service	\N	\N	\N	{}
8	SP	Sport	Sport	\N	Y		Place de la liberté	Hôtel de Ville	\N	99000	Maarch-les-Bains	FRANCE	mairie@maarchlesbains.fr	45239273100025/SP	PJS	Service	\N	\N	\N	{}
9	PSO	Pôle Social	Pôle Social	\N	Y		Place de la liberté	Hôtel de Ville	\N	99000	Maarch-les-Bains	FRANCE	mairie@maarchlesbains.fr	45239273100025/PSO	DGA	Service	\N	\N	\N	{}
10	PTE	Pôle Technique	Pôle Technique	\N	Y		Place de la liberté	Hôtel de Ville	\N	99000	Maarch-les-Bains	FRANCE	mairie@maarchlesbains.fr	45239273100025/PTE	DGA	Service	\N	\N	\N	{}
11	DRH	Direction des Ressources Humaines	Direction des Ressources Humaines	\N	Y		Place de la liberté	Hôtel de Ville	\N	99000	Maarch-les-Bains	FRANCE	mairie@maarchlesbains.fr	45239273100025/DRH	DGS	Service	\N	\N	\N	{}
12	DSG	Secrétariat Général	Secrétariat Général	\N	Y		Place de la liberté	Hôtel de Ville	\N	99000	Maarch-les-Bains	FRANCE	mairie@maarchlesbains.fr	45239273100025/DSG	DGS	Direction	\N	\N	\N	{}
15	PSF	Pôle des Services Fonctionnels	Services Fonctionnels	\N	Y		Place de la liberté	Hôtel de Ville	\N	99000	Maarch-les-Bains	FRANCE	mairie@maarchlesbains.fr	45239273100025/PSF	DSG	Service	\N	\N	\N	{}
13	COU	Service Courrier	Service Courrier	\N	Y		Place de la liberté	Hôtel de Ville	\N	99000	Maarch-les-Bains	FRANCE	mairie@maarchlesbains.fr	45239273100025/COU	DSG	Service	\N	\N	\N	{}
14	COR	Correspondants Archive	Correspondants Archive	\N	Y		Place de la liberté	Hôtel de Ville	\N	99000	Maarch-les-Bains	FRANCE	mairie@maarchlesbains.fr	45239273100025/COR	COU	Service	\N	\N	\N	{}
17	FIN	Direction des Finances	Direction des Finances	\N	Y		Place de la liberté	Hôtel de Ville	\N	99000	Maarch-les-Bains	FRANCE	mairie@maarchlesbains.fr	45239273100025/FIN	DGS	Service	\N	\N	\N	{}
18	PJU	Pôle Juridique	Pôle Juridique	\N	Y		Place de la liberté	Hôtel de Ville	\N	99000	Maarch-les-Bains	FRANCE	mairie@maarchlesbains.fr	45239273100025/PJU	FIN	Service	\N	\N	\N	{}
16	DSI	Direction des Systèmes d'Information	Direction des Systèmes d'Information	\N	Y		Place de la liberté	Hôtel de Ville	\N	99000	Maarch-les-Bains	FRANCE	mairie@maarchlesbains.fr	45239273100025/DSI	DGS	Service	\N	\N	\N	{}
19	ELUS	Ensemble des élus	ELUS:Ensemble des élus	\N	Y		Place de la liberté	Hôtel de Ville	\N	99000	Maarch-les-Bains	FRANCE	mairie@maarchlesbains.fr	45239273100025/ELUS	VILLE	Direction	\N	\N	\N	{}
20	CCAS	Centre Communal d'Action Sociale	Centre Communal d'Action Sociale	\N	Y		Place de la liberté	Hôtel de Ville	\N	99000	Maarch-les-Bains	France	mairie@maarchlesbains.fr	45239273100025/CCAS		Direction	\N	\N	\N	{}
\.


--
-- Data for Name: entities_folders; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.entities_folders (id, folder_id, entity_id, edition, keyword) FROM stdin;
1	1	1	f	\N
2	1	2	f	\N
3	1	4	f	\N
4	1	3	f	\N
5	1	5	f	\N
6	1	6	f	\N
7	1	7	f	\N
8	1	8	f	\N
9	1	9	f	\N
10	1	10	f	\N
11	1	11	f	\N
12	1	12	f	\N
13	1	15	f	\N
14	1	13	f	\N
15	1	14	f	\N
16	1	17	f	\N
17	1	18	f	\N
18	1	16	f	\N
19	1	19	f	\N
20	1	20	f	\N
21	2	1	f	\N
22	2	2	f	\N
23	2	4	f	\N
24	2	3	f	\N
25	2	5	f	\N
26	2	6	f	\N
27	2	7	f	\N
28	2	8	f	\N
29	2	9	f	\N
30	2	10	f	\N
31	2	11	f	\N
32	2	12	f	\N
33	2	15	f	\N
34	2	13	f	\N
35	2	14	f	\N
36	2	17	f	\N
37	2	18	f	\N
38	2	16	f	\N
39	2	19	f	\N
40	2	20	f	\N
41	3	1	f	\N
42	3	2	f	\N
43	3	4	f	\N
44	3	3	f	\N
45	3	5	f	\N
46	3	6	f	\N
47	3	7	f	\N
48	3	8	f	\N
49	3	9	f	\N
50	3	10	f	\N
51	3	11	f	\N
52	3	12	f	\N
53	3	15	f	\N
54	3	13	f	\N
55	3	14	f	\N
56	3	17	f	\N
57	3	18	f	\N
58	3	16	f	\N
59	3	19	f	\N
60	3	20	f	\N
61	4	1	f	\N
62	4	2	f	\N
63	4	4	f	\N
64	4	3	f	\N
65	4	5	f	\N
66	4	6	f	\N
67	4	7	f	\N
68	4	8	f	\N
69	4	9	f	\N
70	4	10	f	\N
71	4	11	f	\N
72	4	12	f	\N
73	4	15	f	\N
74	4	13	f	\N
75	4	14	f	\N
76	4	17	f	\N
77	4	18	f	\N
78	4	16	f	\N
79	4	19	f	\N
80	4	20	f	\N
81	5	1	f	\N
82	5	2	f	\N
83	5	4	f	\N
84	5	3	f	\N
85	5	5	f	\N
86	5	6	f	\N
87	5	7	f	\N
88	5	8	f	\N
89	5	9	f	\N
90	5	10	f	\N
91	5	11	f	\N
92	5	12	f	\N
93	5	15	f	\N
94	5	13	f	\N
95	5	14	f	\N
96	5	17	f	\N
97	5	18	f	\N
98	5	16	f	\N
99	5	19	f	\N
100	5	20	f	\N
101	6	1	f	\N
102	6	2	f	\N
103	6	4	f	\N
104	6	3	f	\N
105	6	5	f	\N
106	6	6	f	\N
107	6	7	f	\N
108	6	8	f	\N
109	6	9	f	\N
110	6	10	f	\N
111	6	11	f	\N
112	6	12	f	\N
113	6	15	f	\N
114	6	13	f	\N
115	6	14	f	\N
116	6	17	f	\N
117	6	18	f	\N
118	6	16	f	\N
119	6	19	f	\N
120	6	20	f	\N
121	7	1	f	\N
122	7	2	f	\N
123	7	4	f	\N
124	7	3	f	\N
125	7	5	f	\N
126	7	6	f	\N
127	7	7	f	\N
128	7	8	f	\N
129	7	9	f	\N
130	7	10	f	\N
131	7	11	f	\N
132	7	12	f	\N
133	7	15	f	\N
134	7	13	f	\N
135	7	14	f	\N
136	7	17	f	\N
137	7	18	f	\N
138	7	16	f	\N
139	7	19	f	\N
140	7	20	f	\N
141	8	1	f	\N
142	8	2	f	\N
143	8	4	f	\N
144	8	3	f	\N
145	8	5	f	\N
146	8	6	f	\N
147	8	7	f	\N
148	8	8	f	\N
149	8	9	f	\N
150	8	10	f	\N
151	8	11	f	\N
152	8	12	f	\N
153	8	15	f	\N
154	8	13	f	\N
155	8	14	f	\N
156	8	17	f	\N
157	8	18	f	\N
158	8	16	f	\N
159	8	19	f	\N
160	8	20	f	\N
161	9	1	f	\N
162	9	2	f	\N
163	9	4	f	\N
164	9	3	f	\N
165	9	5	f	\N
166	9	6	f	\N
167	9	7	f	\N
168	9	8	f	\N
169	9	9	f	\N
170	9	10	f	\N
171	9	11	f	\N
172	9	12	f	\N
173	9	15	f	\N
174	9	13	f	\N
175	9	14	f	\N
176	9	17	f	\N
177	9	18	f	\N
178	9	16	f	\N
179	9	19	f	\N
180	9	20	f	\N
181	10	1	f	\N
182	10	2	f	\N
183	10	4	f	\N
184	10	3	f	\N
185	10	5	f	\N
186	10	6	f	\N
187	10	7	f	\N
188	10	8	f	\N
189	10	9	f	\N
190	10	10	f	\N
191	10	11	f	\N
192	10	12	f	\N
193	10	15	f	\N
194	10	13	f	\N
195	10	14	f	\N
196	10	17	f	\N
197	10	18	f	\N
198	10	16	f	\N
199	10	19	f	\N
200	10	20	f	\N
201	11	1	f	\N
202	11	2	f	\N
203	11	4	f	\N
204	11	3	f	\N
205	11	5	f	\N
206	11	6	f	\N
207	11	7	f	\N
208	11	8	f	\N
209	11	9	f	\N
210	11	10	f	\N
211	11	11	f	\N
212	11	12	f	\N
213	11	15	f	\N
214	11	13	f	\N
215	11	14	f	\N
216	11	17	f	\N
217	11	18	f	\N
218	11	16	f	\N
219	11	19	f	\N
220	11	20	f	\N
221	12	1	f	\N
222	12	2	f	\N
223	12	4	f	\N
224	12	3	f	\N
225	12	5	f	\N
226	12	6	f	\N
227	12	7	f	\N
228	12	8	f	\N
229	12	9	f	\N
230	12	10	f	\N
231	12	11	f	\N
232	12	12	f	\N
233	12	15	f	\N
234	12	13	f	\N
235	12	14	f	\N
236	12	17	f	\N
237	12	18	f	\N
238	12	16	f	\N
239	12	19	f	\N
240	12	20	f	\N
241	13	1	f	\N
242	13	2	f	\N
243	13	4	f	\N
244	13	3	f	\N
245	13	5	f	\N
246	13	6	f	\N
247	13	7	f	\N
248	13	8	f	\N
249	13	9	f	\N
250	13	10	f	\N
251	13	11	f	\N
252	13	12	f	\N
253	13	15	f	\N
254	13	13	f	\N
255	13	14	f	\N
256	13	17	f	\N
257	13	18	f	\N
258	13	16	f	\N
259	13	19	f	\N
260	13	20	f	\N
261	14	1	f	\N
262	14	2	f	\N
263	14	4	f	\N
264	14	3	f	\N
265	14	5	f	\N
266	14	6	f	\N
267	14	7	f	\N
268	14	8	f	\N
269	14	9	f	\N
270	14	10	f	\N
271	14	11	f	\N
272	14	12	f	\N
273	14	15	f	\N
274	14	13	f	\N
275	14	14	f	\N
276	14	17	f	\N
277	14	18	f	\N
278	14	16	f	\N
279	14	19	f	\N
280	14	20	f	\N
281	15	1	f	\N
282	15	2	f	\N
283	15	4	f	\N
284	15	3	f	\N
285	15	5	f	\N
286	15	6	f	\N
287	15	7	f	\N
288	15	8	f	\N
289	15	9	f	\N
290	15	10	f	\N
291	15	11	f	\N
292	15	12	f	\N
293	15	15	f	\N
294	15	13	f	\N
295	15	14	f	\N
296	15	17	f	\N
297	15	18	f	\N
298	15	16	f	\N
299	15	19	f	\N
300	15	20	f	\N
301	16	1	f	\N
302	16	2	f	\N
303	16	4	f	\N
304	16	3	f	\N
305	16	5	f	\N
306	16	6	f	\N
307	16	7	f	\N
308	16	8	f	\N
309	16	9	f	\N
310	16	10	f	\N
311	16	11	f	\N
312	16	12	f	\N
313	16	15	f	\N
314	16	13	f	\N
315	16	14	f	\N
316	16	17	f	\N
317	16	18	f	\N
318	16	16	f	\N
319	16	19	f	\N
320	16	20	f	\N
321	17	1	f	\N
322	17	2	f	\N
323	17	4	f	\N
324	17	3	f	\N
325	17	5	f	\N
326	17	6	f	\N
327	17	7	f	\N
328	17	8	f	\N
329	17	9	f	\N
330	17	10	f	\N
331	17	11	f	\N
332	17	12	f	\N
333	17	15	f	\N
334	17	13	f	\N
335	17	14	f	\N
336	17	17	f	\N
337	17	18	f	\N
338	17	16	f	\N
339	17	19	f	\N
340	17	20	f	\N
341	18	1	f	\N
342	18	2	f	\N
343	18	4	f	\N
344	18	3	f	\N
345	18	5	f	\N
346	18	6	f	\N
347	18	7	f	\N
348	18	8	f	\N
349	18	9	f	\N
350	18	10	f	\N
351	18	11	f	\N
352	18	12	f	\N
353	18	15	f	\N
354	18	13	f	\N
355	18	14	f	\N
356	18	17	f	\N
357	18	18	f	\N
358	18	16	f	\N
359	18	19	f	\N
360	18	20	f	\N
361	19	1	f	\N
362	19	2	f	\N
363	19	4	f	\N
364	19	3	f	\N
365	19	5	f	\N
366	19	6	f	\N
367	19	7	f	\N
368	19	8	f	\N
369	19	9	f	\N
370	19	10	f	\N
371	19	11	f	\N
372	19	12	f	\N
373	19	15	f	\N
374	19	13	f	\N
375	19	14	f	\N
376	19	17	f	\N
377	19	18	f	\N
378	19	16	f	\N
379	19	19	f	\N
380	19	20	f	\N
381	20	1	f	\N
382	20	2	f	\N
383	20	4	f	\N
384	20	3	f	\N
385	20	5	f	\N
386	20	6	f	\N
387	20	7	f	\N
388	20	8	f	\N
389	20	9	f	\N
390	20	10	f	\N
391	20	11	f	\N
392	20	12	f	\N
393	20	15	f	\N
394	20	13	f	\N
395	20	14	f	\N
396	20	17	f	\N
397	20	18	f	\N
398	20	16	f	\N
399	20	19	f	\N
400	20	20	f	\N
401	21	1	f	\N
402	21	2	f	\N
403	21	4	f	\N
404	21	3	f	\N
405	21	5	f	\N
406	21	6	f	\N
407	21	7	f	\N
408	21	8	f	\N
409	21	9	f	\N
410	21	10	f	\N
411	21	11	f	\N
412	21	12	f	\N
413	21	15	f	\N
414	21	13	f	\N
415	21	14	f	\N
416	21	17	f	\N
417	21	18	f	\N
418	21	16	f	\N
419	21	19	f	\N
420	21	20	f	\N
421	22	1	f	\N
422	22	2	f	\N
423	22	4	f	\N
424	22	3	f	\N
425	22	5	f	\N
426	22	6	f	\N
427	22	7	f	\N
428	22	8	f	\N
429	22	9	f	\N
430	22	10	f	\N
431	22	11	f	\N
432	22	12	f	\N
433	22	15	f	\N
434	22	13	f	\N
435	22	14	f	\N
436	22	17	f	\N
437	22	18	f	\N
438	22	16	f	\N
439	22	19	f	\N
440	22	20	f	\N
441	23	1	f	\N
442	23	2	f	\N
443	23	4	f	\N
444	23	3	f	\N
445	23	5	f	\N
446	23	6	f	\N
447	23	7	f	\N
448	23	8	f	\N
449	23	9	f	\N
450	23	10	f	\N
451	23	11	f	\N
452	23	12	f	\N
453	23	15	f	\N
454	23	13	f	\N
455	23	14	f	\N
456	23	17	f	\N
457	23	18	f	\N
458	23	16	f	\N
459	23	19	f	\N
460	23	20	f	\N
461	24	1	f	\N
462	24	2	f	\N
463	24	4	f	\N
464	24	3	f	\N
465	24	5	f	\N
466	24	6	f	\N
467	24	7	f	\N
468	24	8	f	\N
469	24	9	f	\N
470	24	10	f	\N
471	24	11	f	\N
472	24	12	f	\N
473	24	15	f	\N
474	24	13	f	\N
475	24	14	f	\N
476	24	17	f	\N
477	24	18	f	\N
478	24	16	f	\N
479	24	19	f	\N
480	24	20	f	\N
481	25	1	f	\N
482	25	2	f	\N
483	25	4	f	\N
484	25	3	f	\N
485	25	5	f	\N
486	25	6	f	\N
487	25	7	f	\N
488	25	8	f	\N
489	25	9	f	\N
490	25	10	f	\N
491	25	11	f	\N
492	25	12	f	\N
493	25	15	f	\N
494	25	13	f	\N
495	25	14	f	\N
496	25	17	f	\N
497	25	18	f	\N
498	25	16	f	\N
499	25	19	f	\N
500	25	20	f	\N
501	26	1	f	\N
502	26	2	f	\N
503	26	4	f	\N
504	26	3	f	\N
505	26	5	f	\N
506	26	6	f	\N
507	26	7	f	\N
508	26	8	f	\N
509	26	9	f	\N
510	26	10	f	\N
511	26	11	f	\N
512	26	12	f	\N
513	26	15	f	\N
514	26	13	f	\N
515	26	14	f	\N
516	26	17	f	\N
517	26	18	f	\N
518	26	16	f	\N
519	26	19	f	\N
520	26	20	f	\N
521	27	1	f	\N
522	27	2	f	\N
523	27	4	f	\N
524	27	3	f	\N
525	27	5	f	\N
526	27	6	f	\N
527	27	7	f	\N
528	27	8	f	\N
529	27	9	f	\N
530	27	10	f	\N
531	27	11	f	\N
532	27	12	f	\N
533	27	15	f	\N
534	27	13	f	\N
535	27	14	f	\N
536	27	17	f	\N
537	27	18	f	\N
538	27	16	f	\N
539	27	19	f	\N
540	27	20	f	\N
541	28	1	f	\N
542	28	2	f	\N
543	28	4	f	\N
544	28	3	f	\N
545	28	5	f	\N
546	28	6	f	\N
547	28	7	f	\N
548	28	8	f	\N
549	28	9	f	\N
550	28	10	f	\N
551	28	11	f	\N
552	28	12	f	\N
553	28	15	f	\N
554	28	13	f	\N
555	28	14	f	\N
556	28	17	f	\N
557	28	18	f	\N
558	28	16	f	\N
559	28	19	f	\N
560	28	20	f	\N
561	29	1	f	\N
562	29	2	f	\N
563	29	4	f	\N
564	29	3	f	\N
565	29	5	f	\N
566	29	6	f	\N
567	29	7	f	\N
568	29	8	f	\N
569	29	9	f	\N
570	29	10	f	\N
571	29	11	f	\N
572	29	12	f	\N
573	29	15	f	\N
574	29	13	f	\N
575	29	14	f	\N
576	29	17	f	\N
577	29	18	f	\N
578	29	16	f	\N
579	29	19	f	\N
580	29	20	f	\N
581	30	1	f	\N
582	30	2	f	\N
583	30	4	f	\N
584	30	3	f	\N
585	30	5	f	\N
586	30	6	f	\N
587	30	7	f	\N
588	30	8	f	\N
589	30	9	f	\N
590	30	10	f	\N
591	30	11	f	\N
592	30	12	f	\N
593	30	15	f	\N
594	30	13	f	\N
595	30	14	f	\N
596	30	17	f	\N
597	30	18	f	\N
598	30	16	f	\N
599	30	19	f	\N
600	30	20	f	\N
601	31	1	f	\N
602	31	2	f	\N
603	31	4	f	\N
604	31	3	f	\N
605	31	5	f	\N
606	31	6	f	\N
607	31	7	f	\N
608	31	8	f	\N
609	31	9	f	\N
610	31	10	f	\N
611	31	11	f	\N
612	31	12	f	\N
613	31	15	f	\N
614	31	13	f	\N
615	31	14	f	\N
616	31	17	f	\N
617	31	18	f	\N
618	31	16	f	\N
619	31	19	f	\N
620	31	20	f	\N
621	32	1	f	\N
622	32	2	f	\N
623	32	4	f	\N
624	32	3	f	\N
625	32	5	f	\N
626	32	6	f	\N
627	32	7	f	\N
628	32	8	f	\N
629	32	9	f	\N
630	32	10	f	\N
631	32	11	f	\N
632	32	12	f	\N
633	32	15	f	\N
634	32	13	f	\N
635	32	14	f	\N
636	32	17	f	\N
637	32	18	f	\N
638	32	16	f	\N
639	32	19	f	\N
640	32	20	f	\N
641	33	1	f	\N
642	33	2	f	\N
643	33	4	f	\N
644	33	3	f	\N
645	33	5	f	\N
646	33	6	f	\N
647	33	7	f	\N
648	33	8	f	\N
649	33	9	f	\N
650	33	10	f	\N
651	33	11	f	\N
652	33	12	f	\N
653	33	15	f	\N
654	33	13	f	\N
655	33	14	f	\N
656	33	17	f	\N
657	33	18	f	\N
658	33	16	f	\N
659	33	19	f	\N
660	33	20	f	\N
661	34	1	f	\N
662	34	2	f	\N
663	34	4	f	\N
664	34	3	f	\N
665	34	5	f	\N
666	34	6	f	\N
667	34	7	f	\N
668	34	8	f	\N
669	34	9	f	\N
670	34	10	f	\N
671	34	11	f	\N
672	34	12	f	\N
673	34	15	f	\N
674	34	13	f	\N
675	34	14	f	\N
676	34	17	f	\N
677	34	18	f	\N
678	34	16	f	\N
679	34	19	f	\N
680	34	20	f	\N
681	35	1	f	\N
682	35	2	f	\N
683	35	4	f	\N
684	35	3	f	\N
685	35	5	f	\N
686	35	6	f	\N
687	35	7	f	\N
688	35	8	f	\N
689	35	9	f	\N
690	35	10	f	\N
691	35	11	f	\N
692	35	12	f	\N
693	35	15	f	\N
694	35	13	f	\N
695	35	14	f	\N
696	35	17	f	\N
697	35	18	f	\N
698	35	16	f	\N
699	35	19	f	\N
700	35	20	f	\N
701	36	1	f	\N
702	36	2	f	\N
703	36	4	f	\N
704	36	3	f	\N
705	36	5	f	\N
706	36	6	f	\N
707	36	7	f	\N
708	36	8	f	\N
709	36	9	f	\N
710	36	10	f	\N
711	36	11	f	\N
712	36	12	f	\N
713	36	15	f	\N
714	36	13	f	\N
715	36	14	f	\N
716	36	17	f	\N
717	36	18	f	\N
718	36	16	f	\N
719	36	19	f	\N
720	36	20	f	\N
721	37	1	f	\N
722	37	2	f	\N
723	37	4	f	\N
724	37	3	f	\N
725	37	5	f	\N
726	37	6	f	\N
727	37	7	f	\N
728	37	8	f	\N
729	37	9	f	\N
730	37	10	f	\N
731	37	11	f	\N
732	37	12	f	\N
733	37	15	f	\N
734	37	13	f	\N
735	37	14	f	\N
736	37	17	f	\N
737	37	18	f	\N
738	37	16	f	\N
739	37	19	f	\N
740	37	20	f	\N
741	38	1	f	\N
742	38	2	f	\N
743	38	4	f	\N
744	38	3	f	\N
745	38	5	f	\N
746	38	6	f	\N
747	38	7	f	\N
748	38	8	f	\N
749	38	9	f	\N
750	38	10	f	\N
751	38	11	f	\N
752	38	12	f	\N
753	38	15	f	\N
754	38	13	f	\N
755	38	14	f	\N
756	38	17	f	\N
757	38	18	f	\N
758	38	16	f	\N
759	38	19	f	\N
760	38	20	f	\N
\.


--
-- Data for Name: exports_templates; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.exports_templates (id, user_id, delimiter, format, data) FROM stdin;
2	4	;	csv	[{"value":"doc_date","label":"Date du courrier","isFunction":false},{"value":"getAssignee","label":"Attributaire","isFunction":true},{"value":"getDestinationEntity","label":"Libellé de l'entité traitante","isFunction":true},{"value":"subject","label":"Objet","isFunction":false},{"value":"process_limit_date","label":"Date limite de traitement","isFunction":false}]
1	4	;	pdf	[{"value":"doc_date","label":"Date du courrier","isFunction":false},{"value":"type_label","label":"Type de courrier","isFunction":false},{"value":"getAssignee","label":"Attributaire","isFunction":true},{"value":"subject","label":"Objet","isFunction":false},{"value":"process_limit_date","label":"Date limite de traitement","isFunction":false}]
\.


--
-- Data for Name: folders; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.folders (id, label, public, user_id, parent_id, level) FROM stdin;
1	Compétences fonctionnelles	t	21	\N	0
2	Vie politique	t	21	1	1
3	Vie citoyenne	t	21	1	1
4	Administration municipale	t	21	1	1
5	Ressources humaines	t	21	1	1
6	Candidatures sur postes ouverts	t	21	5	2
7	Candidatures spontanées	t	21	5	2
8	Affaires juridiques	t	21	1	1
9	Finances	t	21	1	1
10	Marchés publics	t	21	1	1
11	Informatique	t	21	1	1
12	Communication	t	21	1	1
13	Événements	t	21	1	1
14	Moyens généraux (matériels et logistiques)	t	21	1	1
15	Archives	t	21	1	1
16	Compétences techniques	t	21	\N	0
17	Population	t	21	16	1
18	Police - ordre public	t	21	16	1
19	Stationnement	t	21	18	2
20	Politique de la ville	t	21	16	1
21	Urbanisme opérationnel	t	21	16	1
22	Urbanisme réglementaire	t	21	16	1
23	Affaires foncières 	t	21	16	1
24	Développement du territoire 	t	21	16	1
25	Habitat	t	21	16	1
26	Biens communaux (domaine privé)	t	21	16	1
27	Espaces publics urbains (domaine public - voiries -réseaux)	t	21	16	1
28	Éclairage public	t	21	27	2
29	Ouvrages d'art	t	21	27	2
30	Hygiène	t	21	16	1
31	Santé publique	t	21	16	1
32	Enseignement	t	21	16	1
33	Sports	t	21	16	1
34	Centre de loisirs nautiques	t	21	33	2
35	Jeunesse	t	21	16	1
36	Culture	t	21	16	1
37	Actions sociales	t	21	16	1
38	Cohésion sociale	t	21	16	1
\.


--
-- Data for Name: groupbasket; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.groupbasket (id, group_id, basket_id, list_display, list_event, list_event_data) FROM stdin;
1	COURRIER	QualificationBasket	{"templateColumns":7,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"}]}	processDocument	{"defaultTab": "info", "canUpdateData": true}
2	AGENT	CopyMailBasket	{"templateColumns":7,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"}]}	documentDetails	[]
3	RESPONSABLE	CopyMailBasket	{"templateColumns":7,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"}]}	documentDetails	[]
4	COURRIER	RetourCourrier	{"templateColumns":7,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"}]}	processDocument	{"defaultTab": "info", "canUpdateData": true}
5	AGENT	DdeAvisBasket	{"templateColumns":5,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getParallelOpinionsNumber","cssClasses":["align_rightData"],"icon":"fa-comment-alt"},{"value":"getOpinionLimitDate","cssClasses":["align_rightData"],"icon":"fa-stopwatch"}]}	processDocument	{"defaultTab": "dashboard"}
6	RESPONSABLE	DdeAvisBasket	{"templateColumns":5,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getParallelOpinionsNumber","cssClasses":["align_rightData"],"icon":"fa-comment-alt"},{"value":"getOpinionLimitDate","cssClasses":["align_rightData"],"icon":"fa-stopwatch"}]}	processDocument	{"defaultTab": "dashboard"}
9	RESPONSABLE	SupAvisBasket	{"templateColumns":5,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getParallelOpinionsNumber","cssClasses":["align_rightData"],"icon":"fa-comment-alt"},{"value":"getOpinionLimitDate","cssClasses":["align_rightData"],"icon":"fa-stopwatch"}]}	processDocument	{"defaultTab": "opinionCircuit"}
10	AGENT	RetAvisBasket	{"templateColumns":5,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getParallelOpinionsNumber","cssClasses":["align_rightData"],"icon":"fa-comment-alt"},{"value":"getOpinionLimitDate","cssClasses":["align_rightData"],"icon":"fa-stopwatch"}]}	processDocument	{"defaultTab": "notes"}
11	RESPONSABLE	RetAvisBasket	{"templateColumns":5,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getParallelOpinionsNumber","cssClasses":["align_rightData"],"icon":"fa-comment-alt"},{"value":"getOpinionLimitDate","cssClasses":["align_rightData"],"icon":"fa-stopwatch"}]}	processDocument	{"defaultTab": "notes"}
12	RESP_COURRIER	ValidationBasket	{"templateColumns":7,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"}]}	processDocument	{"defaultTab": "diffusionList", "canUpdateData": true}
8	AGENT	SupAvisBasket	{"templateColumns":5,"subInfos":[{"value":"getPriority","label":"Priorité","sample":"Urgent","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","label":"Catégorie","sample":"Courrier arrivée","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","label":"Type de courrier","sample":"Réclamation","cssClasses":[],"icon":"fa-suitcase"},{"value":"getParallelOpinionsNumber","label":"Nombre d'avis donnés","sample":"<b>3</b> avis donné(s)","cssClasses":["align_rightData"],"icon":"fa-comment-alt"},{"value":"getOpinionLimitDate","label":"Date limite d'envoi des avis","sample":"01-01-2019","cssClasses":["align_rightData"],"icon":"fa-stopwatch"}]}	processDocument	{"defaultTab": "dashboard", "canUpdateData": true, "canUpdateModel": false}
15	ELU	MyBasket	{"templateColumns":7,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"}]}	processDocument	{"defaultTab": "dashboard"}
16	AGENT	LateMailBasket	{"templateColumns":7,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"}]}	processDocument	{"defaultTab": "dashboard"}
17	RESPONSABLE	DepartmentBasket	{"templateColumns":7,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"}]}	documentDetails	[]
19	AGENT	SuiviParafBasket	{"templateColumns":7,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"}]}	documentDetails	[]
20	RESPONSABLE	SuiviParafBasket	{"templateColumns":7,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"}]}	documentDetails	[]
21	AGENT	EenvBasket	{"templateColumns":7,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"}]}	processDocument	{"defaultTab": "dashboard"}
22	RESPONSABLE	EenvBasket	{"templateColumns":7,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"}]}	processDocument	{"defaultTab": "dashboard"}
23	ARCHIVISTE	ToArcBasket	{"templateColumns":7,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"}]}	processDocument	{"defaultTab": "dashboard"}
24	ARCHIVISTE	SentArcBasket	{"templateColumns":7,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"}]}	processDocument	{"defaultTab": "dashboard"}
25	ARCHIVISTE	AckArcBasket	{"templateColumns":7,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"}]}	processDocument	{"defaultTab": "dashboard"}
26	COURRIER	NumericBasket	{"templateColumns":7,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"}]}	processDocument	{"defaultTab": "info", "canUpdateData": true}
27	AGENT	SendToSignatoryBook	{"templateColumns":7,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"}]}	documentDetails	[]
28	RESPONSABLE	SendToSignatoryBook	{"templateColumns":7,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"}]}	documentDetails	[]
31	AGENT	Maileva_Sended	{"templateColumns":7,"subInfos":[{"value":"getPriority","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"}]}	processDocument	{"defaultTab": "dashboard"}
13	AGENT	MyBasket	{"templateColumns":7,"subInfos":[{"value":"getPriority","label":"Priorité","sample":"Urgent","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","label":"Catégorie","sample":"Courrier arrivée","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","label":"Type de courrier","sample":"Réclamation","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","label":"Attributaire (entité traitante)","sample":"Barbara BAIN (Pôle Jeunesse et Sport)","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","label":"Destinataire","sample":"Patricia PETIT","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","label":"Expéditeur","sample":"Alain DUBOIS (MAARCH)","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"},{"value":"getFolders","label":"Dossiers (emplacement fixe)","sample":"Litiges","cssClasses":["align_leftData"],"icon":"fa-folder"}]}	processDocument	{"defaultTab": "dashboard", "canUpdateData": true, "canUpdateModel": false}
29	AGENT	AR_Create	{"templateColumns":7,"subInfos":[{"value":"getPriority","label":"Priorité","sample":"Urgent","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","label":"Catégorie","sample":"Courrier arrivée","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","label":"Type de courrier","sample":"Réclamation","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","label":"Attributaire (entité traitante)","sample":"Barbara BAIN (Pôle Jeunesse et Sport)","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","label":"Destinataire","sample":"Patricia PETIT","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","label":"Expéditeur","sample":"Alain DUBOIS (MAARCH)","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"}]}	processDocument	{"defaultTab": "emails", "canUpdateData": true, "canUpdateModel": false}
30	AGENT	AR_AlreadySend	{"templateColumns":7,"subInfos":[{"value":"getPriority","label":"Priorité","sample":"Urgent","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","label":"Catégorie","sample":"Courrier arrivée","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","label":"Type de courrier","sample":"Réclamation","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","label":"Attributaire (entité traitante)","sample":"Barbara BAIN (Pôle Jeunesse et Sport)","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","label":"Destinataire","sample":"Patricia PETIT","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","label":"Expéditeur","sample":"Alain DUBOIS (MAARCH)","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"}]}	documentDetails	\N
7	ELU	DdeAvisBasket	{"templateColumns":5,"subInfos":[{"value":"getPriority","label":"Priorité","sample":"Urgent","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","label":"Catégorie","sample":"Courrier arrivée","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","label":"Type de courrier","sample":"Réclamation","cssClasses":[],"icon":"fa-suitcase"},{"value":"getParallelOpinionsNumber","label":"Nombre d'avis donnés","sample":"<b>3</b> avis donné(s)","cssClasses":["align_rightData"],"icon":"fa-comment-alt"},{"value":"getOpinionLimitDate","label":"Date limite d'envoi des avis","sample":"01-01-2019","cssClasses":["align_rightData"],"icon":"fa-stopwatch"}]}	processDocument	{"defaultTab": "notes", "canUpdateData": false, "canUpdateModel": false}
14	RESPONSABLE	MyBasket	{"templateColumns":7,"subInfos":[{"value":"getPriority","label":"Priorité","sample":"Urgent","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","label":"Catégorie","sample":"Courrier arrivée","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","label":"Type de courrier","sample":"Réclamation","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","label":"Attributaire (entité traitante)","sample":"Barbara BAIN (Pôle Jeunesse et Sport)","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","label":"Destinataire","sample":"Patricia PETIT","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","label":"Expéditeur","sample":"Alain DUBOIS (MAARCH)","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"},{"value":"getFolders","label":"Dossiers (emplacement fixe)","sample":"Litiges","cssClasses":["align_leftData"],"icon":"fa-folder"}]}	processDocument	{"defaultTab": "dashboard", "canUpdateData": false, "canUpdateModel": false}
18	RESPONSABLE	ParafBasket	{"templateColumns":7,"subInfos":[{"value":"getPriority","label":"Priorité","sample":"Urgent","cssClasses":[],"icon":"fa-traffic-light"},{"value":"getCategory","label":"Catégorie","sample":"Courrier arrivée","cssClasses":[],"icon":"fa-exchange-alt"},{"value":"getDoctype","label":"Type de courrier","sample":"Réclamation","cssClasses":[],"icon":"fa-suitcase"},{"value":"getAssignee","label":"Attributaire (entité traitante)","sample":"Barbara BAIN (Pôle Jeunesse et Sport)","cssClasses":[],"icon":"fa-sitemap"},{"value":"getRecipients","label":"Destinataire","sample":"Patricia PETIT","cssClasses":[],"icon":"fa-user"},{"value":"getSenders","label":"Expéditeur","sample":"Alain DUBOIS (MAARCH)","cssClasses":[],"icon":"fa-book"},{"value":"getCreationAndProcessLimitDates","cssClasses":["align_rightData"],"icon":"fa-calendar"},{"value":"getFolders","label":"Dossiers (emplacement fixe)","sample":"Litiges","cssClasses":["align_leftData"],"icon":"fa-folder"}]}	signatureBookAction	{"canUpdateDocuments": true}
33	AGENT	outlook_mails	{"templateColumns":0,"subInfos":[]}	processDocument	{"defaultTab": "info", "canUpdateData": true, "canUpdateModel": true}
34	DIRECTEUR	outlook_mails	{"templateColumns":0,"subInfos":[]}	processDocument	{"defaultTab": "info", "canUpdateData": true, "canUpdateModel": true}
35	RESPONSABLE	outlook_mails	{"templateColumns":0,"subInfos":[]}	processDocument	{"defaultTab": "info", "canUpdateData": true, "canUpdateModel": true}
36	COURRIER	outlook_mails	{"templateColumns":0,"subInfos":[]}	processDocument	{"defaultTab": "info", "canUpdateData": true, "canUpdateModel": true}
37	RESP_COURRIER	outlook_mails	{"templateColumns":0,"subInfos":[]}	processDocument	{"defaultTab": "info", "canUpdateData": true, "canUpdateModel": true}
\.


--
-- Data for Name: groupbasket_redirect; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.groupbasket_redirect (system_id, group_id, basket_id, action_id, entity_id, keyword, redirect_mode) FROM stdin;
600	COURRIER	QualificationBasket	18		ALL_ENTITIES	ENTITY
601	COURRIER	NumericBasket	18		ALL_ENTITIES	ENTITY
607	RESPONSABLE	MyBasket	1		MY_ENTITIES	ENTITY
608	RESPONSABLE	MyBasket	1		ENTITIES_BELOW	ENTITY
609	RESPONSABLE	MyBasket	1		ENTITIES_JUST_UP	ENTITY
610	RESPONSABLE	MyBasket	1		SAME_LEVEL_ENTITIES	ENTITY
611	RESPONSABLE	MyBasket	1		MY_ENTITIES	USERS
612	RESPONSABLE	DepartmentBasket	1		MY_ENTITIES	ENTITY
613	RESPONSABLE	DepartmentBasket	1		ENTITIES_BELOW	ENTITY
614	RESPONSABLE	DepartmentBasket	1		ENTITIES_JUST_UP	ENTITY
615	RESPONSABLE	DepartmentBasket	1		SAME_LEVEL_ENTITIES	ENTITY
616	RESPONSABLE	DepartmentBasket	1		MY_ENTITIES	USERS
617	ELU	MyBasket	1		ALL_ENTITIES	ENTITY
619	AGENT	DepartmentBasket	1		ALL_ENTITIES	ENTITY
620	RESPONSABLE	MyBasket	1		ALL_ENTITIES	ENTITY
621	RESPONSABLE	DepartmentBasket	1		ALL_ENTITIES	ENTITY
678	AGENT	MyBasket	1		MY_ENTITIES	ENTITY
679	AGENT	MyBasket	1		SAME_LEVEL_ENTITIES	ENTITY
680	AGENT	MyBasket	1		MY_PRIMARY_ENTITY	ENTITY
681	AGENT	MyBasket	1		ENTITIES_JUST_UP	ENTITY
726	DIRECTEUR	outlook_mails	18		ALL_ENTITIES	ENTITY
727	DIRECTEUR	outlook_mails	18		ALL_ENTITIES	USERS
728	RESPONSABLE	outlook_mails	18		ALL_ENTITIES	ENTITY
729	RESPONSABLE	outlook_mails	18		ALL_ENTITIES	USERS
730	COURRIER	outlook_mails	18		ALL_ENTITIES	ENTITY
731	COURRIER	outlook_mails	18		ALL_ENTITIES	USERS
732	RESP_COURRIER	outlook_mails	18		ALL_ENTITIES	ENTITY
733	RESP_COURRIER	outlook_mails	18		ALL_ENTITIES	USERS
724	AGENT	outlook_mails	18		ALL_ENTITIES	ENTITY
725	AGENT	outlook_mails	18		ALL_ENTITIES	USERS
\.


--
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.history (id, table_name, record_id, event_type, user_id, event_date, info, id_module, remote_ip, event_id) FROM stdin;
\.


--
-- Data for Name: history_batch; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.history_batch (id, module_name, batch_id, event_date, total_processed, total_errors, info) FROM stdin;
\.


--
-- Data for Name: indexing_models; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.indexing_models (id, label, category, "default", owner, private, master, enabled, mandatory_file, lad_processing) FROM stdin;
2	Courrier Départ	outgoing	f	23	f	\N	t	f	f
3	Note Interne	internal	f	23	f	\N	t	f	f
4	Document GED	ged_doc	f	23	f	\N	t	f	f
1	Courrier Arrivée	incoming	t	23	f	\N	t	t	t
5	Exemple de données pré-enregistrées	incoming	f	21	t	1	t	t	f
7	Demande de documents	outgoing	f	16	t	2	t	f	f
8	Courriels importés	incoming	f	23	f	\N	t	f	f
\.


--
-- Data for Name: indexing_models_entities; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.indexing_models_entities (id, model_id, entity_id, keyword) FROM stdin;
1	2	\N	ALL_ENTITIES
2	3	\N	ALL_ENTITIES
3	4	\N	ALL_ENTITIES
4	1	\N	ALL_ENTITIES
5	8	\N	ALL_ENTITIES
\.


--
-- Data for Name: indexing_models_fields; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.indexing_models_fields (id, model_id, identifier, mandatory, enabled, default_value, unit, allowed_values) FROM stdin;
9	2	doctype	t	t	\N	mail	\N
10	2	priority	t	t	\N	mail	\N
11	2	confidentiality	t	t	\N	mail	\N
12	2	documentDate	t	t	\N	mail	\N
13	2	departureDate	t	t	\N	mail	\N
14	2	subject	t	t	\N	mail	\N
15	2	senders	f	t	\N	contact	\N
16	2	recipients	t	t	\N	contact	\N
17	2	initiator	t	t	\N	process	\N
18	2	destination	t	t	\N	process	\N
19	2	processLimitDate	t	t	\N	process	\N
20	2	folders	f	t	\N	classifying	\N
21	2	tags	f	t	\N	classifying	\N
22	3	doctype	t	t	\N	mail	\N
23	3	priority	t	t	\N	mail	\N
24	3	confidentiality	t	t	\N	mail	\N
25	3	documentDate	t	t	"_TODAY"	mail	\N
26	3	subject	t	t	\N	mail	\N
27	3	senders	f	t	[]	contact	\N
28	3	initiator	t	t	\N	process	\N
29	3	destination	t	t	\N	process	\N
30	3	processLimitDate	t	t	\N	process	\N
31	3	folders	f	t	\N	classifying	\N
32	3	tags	f	t	\N	classifying	\N
33	4	doctype	t	t	\N	mail	\N
34	4	documentDate	t	t	\N	mail	\N
35	4	subject	t	t	\N	mail	\N
36	4	senders	f	t	\N	contact	\N
37	4	destination	t	t	\N	process	\N
38	4	indexingCustomField_1	f	t	\N	process	\N
39	4	folders	f	t	\N	classifying	\N
40	4	tags	f	t	\N	classifying	\N
41	1	doctype	t	t	\N	mail	\N
42	1	priority	t	t	\N	mail	\N
43	1	documentDate	t	t	\N	mail	\N
44	1	arrivalDate	t	t	"_TODAY"	mail	\N
45	1	subject	t	t	\N	mail	\N
46	1	senders	t	t	\N	contact	\N
47	1	destination	t	t	\N	process	\N
48	1	processLimitDate	t	t	\N	process	\N
49	5	doctype	t	t	1202	mail	\N
50	5	priority	t	t	"poiuytre1391nbvc"	mail	\N
51	5	documentDate	t	t	"2021-03-24"	mail	\N
52	5	arrivalDate	t	t	"2021-03-24"	mail	\N
53	5	subject	t	t	"Demande d'interventions"	mail	\N
54	5	senders	t	t	[{"type":"contact","id":6,"label":"Bernard PASCONTENT"}]	contact	\N
55	5	destination	t	t	10	process	\N
56	5	diffusionList	f	t	[{"id":16,"mode":"dest","type":"user"},{"id":12,"mode":"cc","type":"entity"},{"id":20,"mode":"cc","type":"entity"}]	process	\N
57	5	processLimitDate	t	t	"2021-03-30"	process	\N
72	7	doctype	t	t	106	mail	\N
73	7	priority	t	t	"poiuytre1357nbvc"	mail	\N
74	7	confidentiality	t	t	false	mail	\N
75	7	documentDate	t	t	"2021-03-25"	mail	\N
76	7	departureDate	t	t	"2021-03-30"	mail	\N
77	7	subject	t	t	"Demande de Kbis"	mail	\N
78	7	senders	f	t	[{"type":"entity","id":10,"label":"Pôle Technique"}]	contact	\N
79	7	recipients	t	t	[{"type":"contact","id":10,"label":"Carole COTIN (MAARCH)"}]	contact	\N
80	7	initiator	t	t	10	process	\N
81	7	destination	t	t	10	process	\N
82	7	diffusionList	f	t	[{"id":16,"mode":"dest","type":"user"},{"id":12,"mode":"cc","type":"entity"},{"id":20,"mode":"cc","type":"entity"}]	process	\N
83	7	processLimitDate	t	t	"2021-06-18"	process	\N
84	7	folders	f	t	[16]	classifying	\N
85	7	tags	f	t	[4]	classifying	\N
86	8	doctype	t	t	\N	mail	\N
87	8	documentDate	f	t	\N	mail	\N
88	8	priority	f	t	"poiuytre1357nbvc"	mail	\N
89	8	subject	t	t	\N	mail	\N
90	8	senders	f	t	\N	contact	\N
91	8	destination	f	t	"#myPrimaryEntity"	process	\N
92	8	processLimitDate	f	t	"2021-05-13"	process	\N
\.


--
-- Data for Name: lc_cycle_steps; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.lc_cycle_steps (policy_id, cycle_id, cycle_step_id, cycle_step_desc, docserver_type_id, is_allow_failure, step_operation, sequence_number, is_must_complete, preprocess_script, postprocess_script) FROM stdin;
\.


--
-- Data for Name: lc_cycles; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.lc_cycles (policy_id, cycle_id, cycle_desc, sequence_number, where_clause, break_key, validation_mode) FROM stdin;
\.


--
-- Data for Name: lc_policies; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.lc_policies (policy_id, policy_name, policy_desc) FROM stdin;
\.


--
-- Data for Name: lc_stack; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.lc_stack (policy_id, cycle_id, cycle_step_id, coll_id, res_id, cnt_retry, status, work_batch, regex) FROM stdin;
\.


--
-- Data for Name: list_templates; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.list_templates (id, title, description, type, entity_id, owner) FROM stdin;
1	Ville de Maarch-les-bains	Ville de Maarch-les-bains	diffusionList	1	\N
2	Cabinet du Maire	Cabinet du Maire	diffusionList	2	\N
3	Direction Générale des Services	Direction Générale des Services	diffusionList	3	\N
4	Direction Générale Adjointe	Direction Générale Adjointe	diffusionList	4	\N
5	Pôle Culturel	Pôle Culturel	diffusionList	5	\N
6	Pôle Jeunesse et Sport	Pôle Jeunesse et Sport	diffusionList	6	\N
7	Petite enfance	Petite enfance	diffusionList	7	\N
8	Sport	Sport	diffusionList	8	\N
9	Pôle Social	Pôle Social	diffusionList	9	\N
1009	visa Pôle Social	visa Pôle Social	visaCircuit	9	\N
10	Pôle Technique	Pôle Technique	diffusionList	10	\N
1010	visa Pôle Technique	visa Pôle Technique	visaCircuit	10	\N
11	Direction des Ressources Humaines	Direction des Ressources Humaines	diffusionList	11	\N
12	Secrétariat Général	Secrétariat Général	diffusionList	12	\N
13	Service Courrier	Service Courrier	diffusionList	13	\N
14	Correspondants Archive	Correspondants Archive	diffusionList	14	\N
15	Services Fonctionnels	Pôle des Services Fonctionnels	diffusionList	15	\N
16	Direction des Systèmes d'Information	Direction des Systèmes d'Information	diffusionList	16	\N
17	Direction des Finances	Direction des Finances	diffusionList	17	\N
18	Pôle Juridique	Pôle Juridique	diffusionList	18	\N
\.


--
-- Data for Name: list_templates_items; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.list_templates_items (id, list_template_id, item_id, item_type, item_mode, sequence) FROM stdin;
1	1	15	user	dest	0
2	2	7	user	dest	0
3	2	12	entity	cc	1
4	2	10	user	cc	2
5	2	3	user	cc	3
6	3	1	user	dest	0
7	3	10	user	cc	1
8	4	17	user	dest	0
9	4	12	entity	cc	1
10	4	8	user	cc	2
11	5	9	user	dest	0
12	5	12	entity	cc	1
13	6	19	user	dest	0
14	6	1	entity	cc	1
15	7	15	user	dest	0
16	7	12	entity	cc	1
17	8	13	user	dest	0
18	8	12	entity	cc	1
19	9	4	user	dest	0
20	9	12	entity	cc	1
21	1009	17	user	visa	0
22	1009	10	user	sign	1
23	10	16	user	dest	0
24	10	12	entity	cc	1
25	10	20	entity	cc	2
26	1010	17	user	visa	0
27	1010	10	user	sign	1
28	11	12	user	dest	0
29	11	12	entity	cc	1
30	12	18	user	dest	0
31	13	21	user	dest	0
32	13	12	entity	cc	1
33	14	22	user	dest	0
34	14	14	user	cc	1
35	15	11	user	dest	0
36	15	12	entity	cc	1
37	16	3	user	dest	0
38	16	12	entity	cc	1
39	16	2	user	cc	2
40	17	14	user	dest	0
41	17	12	entity	cc	1
42	17	6	user	cc	2
43	18	20	user	dest	0
44	18	12	entity	cc	1
\.


--
-- Data for Name: listinstance; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.listinstance (listinstance_id, res_id, sequence, item_id, item_type, item_mode, added_by_user, viewed, difflist_type, process_date, process_comment, signatory, requested_signature, delegate) FROM stdin;
\.


--
-- Data for Name: listinstance_history; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.listinstance_history (listinstance_history_id, coll_id, res_id, user_id, updated_date) FROM stdin;
\.


--
-- Data for Name: listinstance_history_details; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.listinstance_history_details (listinstance_history_details_id, listinstance_history_id, coll_id, res_id, listinstance_type, sequence, item_id, item_type, item_mode, added_by_user, visible, viewed, difflist_type, process_date, process_comment, requested_signature, signatory) FROM stdin;
\.


--
-- Data for Name: message_exchange; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.message_exchange (message_id, schema, type, status, date, reference, account_id, sender_org_identifier, sender_org_name, recipient_org_identifier, recipient_org_name, archival_agreement_reference, reply_code, operation_date, reception_date, related_reference, request_reference, reply_reference, derogation, data_object_count, size, data, active, archived, res_id_master, docserver_id, path, filename, fingerprint, filesize, file_path) FROM stdin;
\.


--
-- Data for Name: note_entities; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.note_entities (id, note_id, item_id) FROM stdin;
\.


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.notes (id, identifier, user_id, creation_date, note_text) FROM stdin;
\.


--
-- Data for Name: notif_email_stack; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.notif_email_stack (email_stack_sid, reply_to, recipient, cc, bcc, subject, html_body, attachments, exec_date, exec_result) FROM stdin;
\.


--
-- Data for Name: notif_event_stack; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.notif_event_stack (event_stack_sid, notification_sid, table_name, record_id, user_id, event_info, event_date, exec_date, exec_result) FROM stdin;
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.notifications (notification_sid, notification_id, description, is_enabled, event_id, notification_mode, template_id, diffusion_type, diffusion_properties, attachfor_type, attachfor_properties, send_as_recap) FROM stdin;
1	USERS	[administration] Actions sur les utilisateurs de l'application	Y	users%	EMAIL	2	user	superadmin			f
2	RET2	Courriers en retard de traitement	Y	alert2	EMAIL	5	dest_user				f
3	RET1	Courriers arrivant à échéance	Y	alert1	EMAIL	6	dest_user				f
4	BASKETS	Notification de bannettes	Y	baskets	EMAIL	7	dest_user				f
5	ANC	Nouvelle annotation sur courrier en copie	Y	noteadd	EMAIL	8	copy_list				f
6	AND	Nouvelle annotation sur courrier destinataire	Y	noteadd	EMAIL	8	dest_user				f
7	RED	Redirection de courrier	Y	1	EMAIL	7	dest_user				f
100	QUOTA	Alerte lorsque le quota est dépassé	Y	user_quota	EMAIL	110	user	superadmin	\N	\N	f
\.


--
-- Data for Name: parameters; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.parameters (id, description, param_value_string, param_value_int, param_value_date) FROM stdin;
work_batch_autoimport_id	\N	\N	1	\N
database_version	\N	2301.0.0	\N	\N
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
useSectorsForAddresses	Utilisation de la table address_sectors pour autocomplétion des adresses ; la BAN est ignorée (valeur = 1)	\N	0	\N
noteVisibilityOffAction	Visibilité par défaut des annotations hors actions (0 = toutes les entités, 1 = restreint)	\N	0	\N
noteVisibilityOnAction	Visibilité par défaut des annotations sur les actions (0 = toutes les entités, 1 = restreint)	\N	0	\N
allowMultipleAvisAssignment	Un utilisateur peut fournir plusieurs avis tout en conservant le même rôle	\N	0	\N
loginpage_message			\N	\N
homepage_message		<p>D&eacute;couvrez <strong>Maarch Courrier 2301</strong> avec <a title="notre guide de visite" href="https://docs.maarch.org/gitbook/html/MaarchCourrier/2301" target="_blank" rel="noopener"><span style="color: #f99830;"><strong>notre guide de visite en ligne</strong></span></a>.</p>	\N	\N
\.


--
-- Data for Name: password_history; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.password_history (id, user_serial_id, password) FROM stdin;
\.


--
-- Data for Name: password_rules; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.password_rules (id, label, value, enabled) FROM stdin;
1	minLength	6	t
2	complexityUpper	0	f
3	complexityNumber	0	f
4	complexitySpecial	0	f
5	lockAttempts	3	f
6	lockTime	5	f
7	historyLastUse	2	f
8	renewal	90	f
\.


--
-- Data for Name: priorities; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.priorities (id, label, color, delays, "order") FROM stdin;
poiuytre1357nbvc	Normal	#009dc5	30	1
poiuytre1379nbvc	Urgent	#ffa500	8	2
poiuytre1391nbvc	Très urgent	#ff0000	4	3
\.


--
-- Data for Name: redirected_baskets; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.redirected_baskets (id, actual_user_id, owner_user_id, basket_id, group_id) FROM stdin;
\.


--
-- Data for Name: registered_mail_issuing_sites; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.registered_mail_issuing_sites (id, label, post_office_label, account_number, address_number, address_street, address_additional1, address_additional2, address_postcode, address_town, address_country) FROM stdin;
1	MAARCH - Nanterre	La poste Nanterre	1234567	10	AVENUE DE LA GRANDE ARMEE			75017	PARIS	FRANCE
\.


--
-- Data for Name: registered_mail_issuing_sites_entities; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.registered_mail_issuing_sites_entities (id, site_id, entity_id) FROM stdin;
1	1	6
2	1	13
\.


--
-- Data for Name: registered_mail_number_range; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.registered_mail_number_range (id, type, tracking_account_number, range_start, range_end, creator, creation_date, status, current_number) FROM stdin;
1	2C	SuiviNumber	1	10	23	2020-09-14 14:38:09.008644	OK	1
2	RW	SuiviNumberInternational	1	10	23	2020-09-14 14:39:32.972626	OK	1
3	2D	suiviNumber	1	10	23	2020-09-14 14:39:16.779322	OK	1
\.


--
-- Data for Name: registered_mail_resources; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.registered_mail_resources (id, res_id, type, issuing_site, warranty, letter, recipient, number, reference, generated, deposit_id, received_date, return_reason) FROM stdin;
\.


--
-- Data for Name: res_attachments; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.res_attachments (res_id, title, format, typist, creation_date, modification_date, modified_by, identifier, relation, docserver_id, path, filename, fingerprint, filesize, status, validation_date, effective_date, work_batch, origin, res_id_master, origin_id, attachment_type, recipient_id, recipient_type, in_signature_book, in_send_attach, signatory_user_serial_id, fulltext_result, external_id, external_state) FROM stdin;
\.


--
-- Data for Name: res_letterbox; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.res_letterbox (res_id, subject, type_id, format, typist, creation_date, modification_date, doc_date, docserver_id, path, filename, fingerprint, filesize, status, destination, work_batch, origin, priority, policy_id, cycle_id, initiator, dest_user, locker_user_id, locker_time, confidentiality, fulltext_result, external_id, external_state, departure_date, opinion_limit_date, barcode, category_id, alt_identifier, admission_date, process_limit_date, closing_date, alarm1_date, alarm2_date, flag_alarm1, flag_alarm2, model_id, version, integrations, custom_fields, linked_resources, retention_frozen, binding) FROM stdin;
\.


--
-- Data for Name: res_mark_as_read; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.res_mark_as_read (res_id, user_id, basket_id) FROM stdin;
\.


--
-- Data for Name: resource_contacts; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.resource_contacts (id, res_id, item_id, type, mode) FROM stdin;
\.


--
-- Data for Name: resources_folders; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.resources_folders (id, folder_id, res_id) FROM stdin;
\.


--
-- Data for Name: resources_tags; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.resources_tags (id, res_id, tag_id) FROM stdin;
\.


--
-- Data for Name: search_templates; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.search_templates (id, user_id, label, creation_date, query) FROM stdin;
1	23	Tous les courriers	2021-03-25 11:54:30.273871	[{"identifier":"category","values":""},{"identifier":"meta"}]
2	18	Courriers arrivés	2021-03-25 11:59:29.500487	[{"identifier":"category","values":[{"id":"incoming","label":"Courrier Arrivée"}]},{"identifier":"meta"}]
\.


--
-- Data for Name: security; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.security (security_id, group_id, coll_id, where_clause, maarch_comment) FROM stdin;
600	COURRIER	letterbox_coll	1=1	Tous les courriers
601	AGENT	letterbox_coll	destination in (@my_entities, @subentities[@my_primary_entity])	Les courriers de mes services et sous-services
602	RESP_COURRIER	letterbox_coll	1=1	Tous les courriers
603	RESPONSABLE	letterbox_coll	destination in (@my_entities, @subentities[@my_primary_entity])	Les courriers de mes services et sous-services
604	ADMINISTRATEUR_N1	letterbox_coll	1=1	Tous les courriers
605	ADMINISTRATEUR_N2	letterbox_coll	1=0	Aucun courrier
606	DIRECTEUR	letterbox_coll	1=0	Aucun courrier
607	ELU	letterbox_coll	1=0	Aucun courrier
608	CABINET	letterbox_coll	1=0	Aucun courrier
609	ARCHIVISTE	letterbox_coll	1=1	Tous les courriers
610	MAARCHTOGEC	letterbox_coll	1=0	Aucun courrier
611	SERVICE	letterbox_coll	1=0	Aucun courrier
612	WEBSERVICE	letterbox_coll	1=0	Tous les courriers
\.


--
-- Data for Name: shipping_templates; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.shipping_templates (id, label, description, options, fee, entities, account, subscriptions, token_min_iat) FROM stdin;
1	Modèle d'exemple d'envoi postal	Modèle d'exemple d'envoi postal	{"shapingOptions":[],"sendMode":"fast"}	{"firstPagePrice":0.4,"nextPagePrice":0.5,"postagePrice":0.9}	["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "17", "18", "16", "19", "20"]	{"id": "sandbox.562", "password": "VPh5AY6i::82f88fe97cead428e0885084f93a684c"}	[]	2024-09-27 14:49:31.347353
\.


--
-- Data for Name: shippings; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.shippings (id, user_id, document_id, document_type, options, fee, recipient_entity_id, recipients, account_id, creation_date, history, attachments, sending_id, action_id) FROM stdin;
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.status (identifier, id, label_status, is_system, img_filename, maarch_module, can_be_searched, can_be_modified) FROM stdin;
1	ATT	En attente	Y	fm-letter-status-attr	apps	Y	Y
2	COU	En cours	Y	fm-letter-status-inprogress	apps	Y	Y
3	DEL	Supprimé	Y	fm-letter-del	apps	N	Y
4	END	Clos / fin du workflow	Y	fm-letter-status-end	apps	Y	Y
5	NEW	Nouveau courrier pour le service	Y	fm-letter-status-new	apps	Y	Y
6	RET	Retour courrier ou document en qualification	N	fm-letter-status-rejected	apps	Y	Y
7	VAL	Courrier signalé	Y	fm-letter-status-aval	apps	Y	Y
8	INIT	Nouveau courrier ou document non qualifié	Y	fm-letter-status-attr	apps	Y	Y
9	VALSG	Nouveau courrier ou document en validation SG	Y	fm-letter-status-attr	apps	Y	Y
10	ATT_MP	En attente tablette (MP)	Y	fm-letter-status-wait	apps	Y	Y
11	EAVIS	Avis demandé	N	fa-lightbulb	apps	Y	Y
12	EENV	A e-envoyer	N	fm-letter-status-aenv	apps	Y	Y
13	ESIG	A e-signer	N	fm-file-fingerprint	apps	Y	Y
14	EVIS	A e-viser	N	fm-letter-status-aval	apps	Y	Y
15	ESIGAR	AR à e-signer	N	fm-file-fingerprint	apps	Y	Y
16	EENVAR	AR à e-envoyer	N	fm-letter-status-aenv	apps	Y	Y
17	SVX	En attente  de traitement SVE	N	fm-letter-status-wait	apps	Y	Y
18	SSUITE	Sans suite	Y	fm-letter-del	apps	Y	Y
19	A_TRA	PJ à traiter	Y	fa-question	apps	Y	Y
20	FRZ	PJ gelée	Y	fa-pause	apps	Y	Y
21	TRA	PJ traitée	Y	fa-check	apps	Y	Y
22	OBS	PJ obsolète	Y	fa-pause	apps	Y	Y
23	TMP	PJ brouillon	Y	fm-letter-status-inprogress	apps	N	N
24	EXP_SEDA	A archiver	Y	fm-letter-status-acla	apps	Y	Y
25	SEND_SEDA	Courrier envoyé au système d'archivage	Y	fm-letter-status-inprogress	apps	Y	Y
26	ACK_SEDA	Accusé de réception reçu	Y	fm-letter-status-acla	apps	Y	Y
27	REPLY_SEDA	Courrier archivé	Y	fm-letter-status-acla	apps	Y	Y
28	GRC	Envoyé en GRC	N	fm-letter-status-inprogress	apps	Y	Y
29	GRC_TRT	En traitement GRC	N	fm-letter-status-inprogress	apps	Y	Y
30	GRC_ALERT	Retourné par la GRC	N	fm-letter-status-inprogress	apps	Y	Y
31	RETRN	Retourné	Y	fm-letter-outgoing	apps	N	N
32	NO_RETRN	Pas de retour	Y	fm-letter-status-rejected	apps	N	N
33	PJQUAL	PJ à réconcilier	Y	fm-letter-status-attr	apps	Y	Y
34	NUMQUAL	Plis à qualifier	Y	fm-letter-status-attr	apps	Y	Y
35	SEND_MASS	Pour publipostage	Y	fa-mail-bulk	apps	Y	Y
36	SIGN	PJ signée	Y	fa-check	apps	Y	Y
37	STDBY	Clôturé avec suivi	Y	fm-letter-status-wait	apps	Y	Y
38	ENVDONE	Courrier envoyé	Y	fm-letter-status-aenv	apps	Y	Y
39	REJ_SIGN	Signature refusée sur la tablette (MP)	Y	fm-letter-status-rejected	apps	Y	Y
40	PND	AR Non distribué	Y	fm-letter-status-rejected	apps	Y	Y
41	DSTRIBUTED	AR distribué	Y	fa-check	apps	Y	Y
42	OUT	Courriels importés à qualifier	N	fm-letter-incoming	apps	Y	Y
\.


--
-- Data for Name: status_images; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.status_images (id, image_name) FROM stdin;
1	fm-letter-status-new
2	fm-letter-status-inprogress
3	fm-letter-status-info
4	fm-letter-status-wait
5	fm-letter-status-validated
6	fm-letter-status-rejected
7	fm-letter-status-end
8	fm-letter-status-newmail
9	fm-letter-status-attr
10	fm-letter-status-arev
11	fm-letter-status-aval
12	fm-letter-status-aimp
13	fm-letter-status-imp
14	fm-letter-status-aenv
15	fm-letter-status-acla
16	fm-letter-status-aarch
17	fm-letter
18	fm-letter-add
19	fm-letter-search
20	fm-letter-del
21	fm-letter-incoming
22	fm-letter-outgoing
23	fm-letter-internal
24	fm-file-fingerprint
25	fm-classification-plan-l1
26	fa-question
27	fa-check
28	fa-pause
29	fa-mail-bulk
30	fa-lightbulb
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.tags (id, label, description, parent_id, creation_date, links, usage) FROM stdin;
1	SEMINAIRE	\N	\N	2021-03-24 10:17:02.66594	[]	\N
2	INNOVATION	\N	\N	2021-03-24 10:17:02.66594	[]	\N
3	MAARCH	\N	\N	2021-03-24 10:17:02.66594	[]	\N
4	ENVIRONNEMENT	\N	\N	2021-03-24 10:17:02.66594	[]	\N
5	PARTENARIAT	\N	\N	2021-03-24 10:17:02.66594	[]	\N
6	JUMELAGE	\N	\N	2021-03-24 10:17:02.66594	[]	\N
7	ECONOMIE	\N	\N	2021-03-24 10:17:02.66594	[]	\N
8	ASSOCIATIONS	\N	\N	2021-03-24 10:17:02.66594	[]	\N
9	RH	\N	\N	2021-03-24 10:17:02.66594	[]	\N
10	BUDGET	\N	\N	2021-03-24 10:17:02.66594	[]	\N
11	QUARTIERS	\N	\N	2021-03-24 10:17:02.66594	[]	\N
12	LITTORAL	\N	\N	2021-03-24 10:17:02.66594	[]	\N
13	SPORT	\N	\N	2021-03-24 10:17:02.66594	[]	\N
\.


--
-- Data for Name: templates; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.templates (template_id, template_label, template_comment, template_content, template_type, template_path, template_file_name, template_style, template_datasource, template_target, template_attachment_type, subject, options) FROM stdin;
2	[notification] Notifications événement	Notifications des événements système	<p><font face="verdana,geneva" size="1">Bonjour [recipient.firstname] [recipient.lastname],</font></p>\n<p><font face="verdana,geneva" size="1"> </font></p>\n<p><font face="verdana,geneva" size="1">Voici la liste des &eacute;v&eacute;nements de l'application qui vous sont notifi&eacute;s ([notification.description]) :</font></p>\n<table style="width: 800px; height: 36px;" border="0" cellspacing="1" cellpadding="1">\n<tbody>\n<tr>\n<td style="width: 150px; background-color: #0099ff;"><font face="verdana,geneva" size="1"><strong><font color="#FFFFFF">Date</font></strong></font></td>\n<td style="width: 150px; background-color: #0099ff;"><font face="verdana,geneva" size="1"><strong><font color="#FFFFFF">Utilisateur </font></strong></font><font face="verdana,geneva" size="1"><strong></strong></font></td>\n<td style="width: 500px; background-color: #0099ff;"><font face="verdana,geneva" size="1"><strong><font color="#FFFFFF">Description</font></strong></font></td>\n</tr>\n<tr>\n<td><font face="verdana,geneva" size="1">[events.event_date;block=tr;frm=dd/mm/yyyy hh:nn:ss]</font></td>\n<td><font face="verdana,geneva" size="1">[events.user_id]</font></td>\n<td><font face="verdana,geneva" size="1">[events.event_info]</font></td>\n</tr>\n</tbody>\n</table>	HTML	\N	\N		notif_events	notifications	\N	\N	{}
5	[notification courrier] Alerte 2	[notification] Alerte 2	<p><font face="arial,helvetica,sans-serif" size="2">Bonjour [recipient.firstname] [recipient.lastname],</font></p>\n<p> </p>\n<p><font face="arial,helvetica,sans-serif" size="2">Voici la liste des courriers dont la date limite de traitement est dépassée :n</font></p>\n<table style="border: 1pt solid #000000; width: 1582px; height: 77px;" border="1" cellspacing="1" cellpadding="5" frame="box">\n<tbody>\n<tr>\n<td><font face="arial,helvetica,sans-serif"><strong><font size="2">Référence</font></strong></font></td>\n<td><font face="arial,helvetica,sans-serif"><strong><font size="2">Origine</font></strong></font></td>\n<td><font face="arial,helvetica,sans-serif"><strong><font size="2">Emetteur</font></strong></font></td>\n<td><font face="arial,helvetica,sans-serif" size="2" color="#000000"><strong>Date</strong></font></td>\n<td><font face="arial,helvetica,sans-serif" size="2" color="#000000"><strong>Objet</strong></font></td>\n<td><font face="arial,helvetica,sans-serif" size="2" color="#000000"><strong>Type</strong></font></td>\n<td><font face="arial,helvetica,sans-serif" size="2" color="#FFFFFF"><strong>Liens</strong></font></td>\n</tr>\n<tr>\n<td><font face="arial,helvetica,sans-serif" size="2">[res_letterbox.res_id]</font></td>\n<td><font face="arial,helvetica,sans-serif" size="2">[res_letterbox.typist_label]</font></td>\n<td>\n<p><font face="arial,helvetica,sans-serif" size="2">[sender.company;block=tr] [sender.firstname] [sender.lastname] [sender.function] [sender.address_number] [sender.address_street] [sender.address_postcode] [sender.address_town]</font></p>\n</td>\n<td><font face="arial,helvetica,sans-serif" size="2">[res_letterbox.doc_date;block=tr;frm=dd/mm/yyyy]</font></td>\n<td><font face="arial,helvetica,sans-serif" color="#FF0000"><strong><font size="2">[res_letterbox.subject]</font></strong></font></td>\n<td><font face="arial,helvetica,sans-serif" size="2">[res_letterbox.type_label]</font></td>\n<td><font face="arial,helvetica,sans-serif"><a href="[res_letterbox.linktoprocess]" name="traiter">traiter</a> <a href="[res_letterbox.linktodoc]" name="doc">Afficher</a></font></td>\n</tr>\n</tbody>\n</table>	HTML	\N	\N	ODP: open_office_presentation	letterbox_events	notifications	\N	\N	{}
6	[notification courrier] Alerte 1	[notification] Alerte 1	<p><font face="arial,helvetica,sans-serif" size="2">Bonjour [recipient.firstname] [recipient.lastname],</font></p>\n<p> </p>\n<p><font face="arial,helvetica,sans-serif" size="2"> </font></p>\n<p> </p>\n<p><font face="arial,helvetica,sans-serif" size="2">Voici la liste des courriers toujours en attente de traitement :</font></p>\n<p> </p>\n<table style="border: 1pt solid #000000; width: 1582px; height: 77px;" border="1" cellspacing="1" cellpadding="5" frame="box">\n<tbody>\n<tr>\n<td><font face="arial,helvetica,sans-serif"><strong><font size="2">Référence</font></strong></font></td>\n<td><font face="arial,helvetica,sans-serif"><strong><font size="2">Origine</font></strong></font></td>\n<td><font face="arial,helvetica,sans-serif"><strong><font size="2">Emetteur</font></strong></font></td>\n<td><font face="arial,helvetica,sans-serif" size="2" color="#000000"><strong>Date</strong></font></td>\n<td><font face="arial,helvetica,sans-serif" size="2" color="#000000"><strong>Objet</strong></font></td>\n<td><font face="arial,helvetica,sans-serif" size="2" color="#000000"><strong>Type</strong></font></td>\n<td><font face="arial,helvetica,sans-serif" size="2" color="#FFFFFF"><strong>Liens</strong></font></td>\n</tr>\n<tr>\n<td><font face="arial,helvetica,sans-serif" size="2">[res_letterbox.res_id]</font></td>\n<td><font face="arial,helvetica,sans-serif" size="2">[res_letterbox.typist_label]</font></td>\n<td>\n<p><font face="arial,helvetica,sans-serif" size="2">[sender.company;block=tr] [sender.firstname] [sender.lastname] [sender.function] [sender.address_number] [sender.address_street] [sender.address_postcode] [sender.address_town]</font></p>\n</td>\n<td><font face="arial,helvetica,sans-serif" size="2">[res_letterbox.doc_date;block=tr;frm=dd/mm/yyyy]</font></td>\n<td><font face="arial,helvetica,sans-serif" color="#FF0000"><strong><font size="2">[res_letterbox.subject]</font></strong></font></td>\n<td><font face="arial,helvetica,sans-serif" size="2">[res_letterbox.type_label]</font></td>\n<td><font face="arial,helvetica,sans-serif"><a href="[res_letterbox.linktoprocess]" name="traiter">traiter</a> <a href="[res_letterbox.linktodoc]" name="doc">Afficher</a></font></td>\n</tr>\n</tbody>\n</table>	HTML	\N	\N	ODP: open_office_presentation	letterbox_events	notifications	\N	\N	{}
7	[notification courrier] Diffusion de courrier	Alerte de courriers présents dans les bannettes	<p style="font-family: Trebuchet MS, Arial, Helvetica, sans-serif;">Bonjour <strong>[recipient.firstname] [recipient.lastname]</strong>,</p>\n<p>&nbsp;</p>\n<p style="font-family: Trebuchet MS, Arial, Helvetica, sans-serif;">Voici la liste des nouveaux courriers pr&eacute;sents dans cette bannette :</p>\n<table style="font-family: Trebuchet MS, Arial, Helvetica, sans-serif; border-collapse: collapse; width: 100%;">\n<tbody>\n<tr>\n<th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #135f7f; color: white;">R&eacute;f&eacute;rence</th>\n<th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #135f7f; color: white;">Origine</th>\n<th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #135f7f; color: white;">Emetteur</th>\n<th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #135f7f; color: white;">Date</th>\n<th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #135f7f; color: white;">Objet</th>\n<th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #135f7f; color: white;">Type</th>\n<th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #135f7f; color: white;">&nbsp;</th>\n</tr>\n<tr>\n<td style="border: 1px solid #ddd; padding: 8px;">[res_letterbox.res_id]</td>\n<td style="border: 1px solid #ddd; padding: 8px;">[res_letterbox.typist_label]</td>\n<td style="border: 1px solid #ddd; padding: 8px;">[sender.company;block=tr] [sender.firstname] [sender.lastname][sender.function][sender.address_number][sender.address_street][sender.address_postcode][sender.address_town]</td>\n<td style="border: 1px solid #ddd; padding: 8px;">[res_letterbox.doc_date;block=tr;frm=dd/mm/yyyy]</td>\n<td style="border: 1px solid #ddd; padding: 8px;">[res_letterbox.subject]</td>\n<td style="border: 1px solid #ddd; padding: 8px;">[res_letterbox.type_label]</td>\n<td style="border: 1px solid #ddd; padding: 8px; text-align: right;"><a style="text-decoration: none; background: #135f7f; padding: 5px; color: white; -webkit-box-shadow: 6px 4px 5px 0px rgba(0,0,0,0.75); -moz-box-shadow: 6px 4px 5px 0px rgba(0,0,0,0.75); box-shadow: 6px 4px 5px 0px rgba(0,0,0,0.75);" href="[res_letterbox.linktodetail]" name="detail">D&eacute;tail</a> <a style="text-decoration: none; background: #135f7f; padding: 5px; color: white; -webkit-box-shadow: 6px 4px 5px 0px rgba(0,0,0,0.75); -moz-box-shadow: 6px 4px 5px 0px rgba(0,0,0,0.75); box-shadow: 6px 4px 5px 0px rgba(0,0,0,0.75);" href="[res_letterbox.linktodoc]" name="doc">Afficher</a></td>\n</tr>\n</tbody>\n</table>\n<p>&nbsp;</p>\n<p style="font-family: Trebuchet MS, Arial, Helvetica, sans-serif; width: 100%; text-align: center; font-size: 9px; font-style: italic; opacity: 0.5;">Message g&eacute;n&eacute;r&eacute; via l'application MaarchCourrier</p>	HTML	\N	\N	ODP: open_office_presentation	letterbox_events	notifications	\N	\N	{}
8	[notification courrier] Nouvelle annotation	[notification] Nouvelle annotation	<p style="font-family: Trebuchet MS, Arial, Helvetica, sans-serif;">Bonjour <strong>[recipient.firstname] [recipient.lastname]</strong>,</p>\n<p>&nbsp;</p>\n<p style="font-family: Trebuchet MS, Arial, Helvetica, sans-serif;">Voici les nouvelles annotations sur les courriers suivants :</p>\n<table style="font-family: Trebuchet MS, Arial, Helvetica, sans-serif; border-collapse: collapse; width: 100%;">\n<tbody>\n<tr>\n<th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #135f7f; color: white;">R&eacute;f&eacute;rence</th>\n<th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #135f7f; color: white;">Num</th>\n<th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #135f7f; color: white;">Date</th>\n<th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #135f7f; color: white;">Objet</th>\n<th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #135f7f; color: white;">Note</th>\n<th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #135f7f; color: white;">Contact</th>\n<th style="border: 1px solid #ddd; padding: 8px; padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #135f7f; color: white;">&nbsp;</th>\n</tr>\n<tr>\n<td style="border: 1px solid #ddd; padding: 8px;">[res_letterbox.res_id]</td>\n<td style="border: 1px solid #ddd; padding: 8px;">[res_letterbox.# ;frm=0000]</td>\n<td style="border: 1px solid #ddd; padding: 8px;">[res_letterbox.doc_date;block=tr;frm=dd/mm/yyyy]</td>\n<td style="border: 1px solid #ddd; padding: 8px;">[res_letterbox.subject]</td>\n<td style="border: 1px solid #ddd; padding: 8px;">[notes.content;block=tr]</td>\n<td style="border: 1px solid #ddd; padding: 8px;">[sender.company;block=tr] [sender.firstname] [sender.lastname]</td>\n<td style="border: 1px solid #ddd; padding: 8px; text-align: right;"><a style="text-decoration: none; background: #135f7f; padding: 5px; color: white; -webkit-box-shadow: 6px 4px 5px 0px rgba(0,0,0,0.75); -moz-box-shadow: 6px 4px 5px 0px rgba(0,0,0,0.75); box-shadow: 6px 4px 5px 0px rgba(0,0,0,0.75);" href="[res_letterbox.linktodetail]" name="detail">D&eacute;tail</a> <a style="text-decoration: none; background: #135f7f; padding: 5px; color: white; -webkit-box-shadow: 6px 4px 5px 0px rgba(0,0,0,0.75); -moz-box-shadow: 6px 4px 5px 0px rgba(0,0,0,0.75); box-shadow: 6px 4px 5px 0px rgba(0,0,0,0.75);" href="[res_letterbox.linktodoc]" name="doc">Afficher</a></td>\n</tr>\n</tbody>\n</table>\n<p>&nbsp;</p>\n<p style="font-family: Trebuchet MS, Arial, Helvetica, sans-serif; width: 100%; text-align: center; font-size: 9px; font-style: italic; opacity: 0.5;">Message g&eacute;n&eacute;r&eacute; via l'application MaarchCourrier</p>	HTML	\N	\N	ODP: open_office_presentation	notes	notifications	\N	\N	{}
900	[TRT] Passer me voir	Passer me voir	Passer me voir à mon bureau, merci.	TXT	\N	\N	XLSX: demo_spreadsheet_msoffice		notes	all	\N	{}
901	[TRT] Compléter	Compléter	Le projet de réponse doit être complété/révisé sur les points suivants :\n\n- 	TXT	\N	\N	XLSX: demo_spreadsheet_msoffice		notes	all	\N	{}
902	[AVIS] Demande avis	Demande avis	Merci de me fournir les éléments de langage pour répondre à ce courrier.	TXT	\N	\N	XLSX: demo_spreadsheet_msoffice		notes	all	\N	{}
904	[AVIS] Avis favorable	Avis favorable	Merci de répondre favorablement à la demande inscrite dans ce courrier	TXT	\N	\N	XLSX: demo_spreadsheet_msoffice		notes	all	\N	{}
905	[CLOTURE] Clôture pour REJET	Clôture pour REJET	Clôture pour REJET	TXT	\N	\N	XLSX: demo_spreadsheet_msoffice		notes	all	\N	{}
906	[CLOTURE] Clôture pour ABANDON	Clôture pour ABANDON	Clôture pour ABANDON	TXT	\N	\N	XLSX: demo_spreadsheet_msoffice		notes	all	\N	{}
907	[CLOTURE] Clôture RAS	Clôture RAS	Clôture NORMALE	TXT	\N	\N	XLSX: demo_spreadsheet_msoffice		notes	all	\N	{}
908	[CLOTURE] Clôture AUTRE	Clôture AUTRE	Clôture pour ce motif : 	TXT	\N	\N	XLSX: demo_spreadsheet_msoffice		notes	all	\N	{}
909	[REJET] Erreur affectation	Erreur affectation	Ce courrier ne semble pas concerner mon service	TXT	\N	\N	XLSX: demo_spreadsheet_msoffice		notes	all	\N	{}
910	[REJET] Anomalie de numérisation	Anomalie de numérisation	Le courrier présente des anomalies de numérisation	TXT	\N	\N	XLSX: demo_spreadsheet_msoffice		notes	all	\N	{}
1033	AR EN MASSE TYPE SIMPLE	Cas d’une demande n’impliquant pas de décision implicite de l’administration	<div id="write" class="is-node"><br /><hr /><span style="color: #236fa1;">H&ocirc;tel de ville</span><br /><span style="color: #236fa1;">Place de la Libert&eacute;</span><br /><span style="color: #236fa1;">99000 Maarch-les-bains</span>\n<p>&nbsp;</p>\n<p><span style="color: #236fa1;"><strong>Accus&eacute; de r&eacute;ception</strong></span></p>\n<p>Service instructeur : <strong>[userPrimaryEntity.entity_label]</strong> <br />Courriel : [userPrimaryEntity.email]</p>\n<p>[userPrimaryEntity.address_town], le [datetime.date;frm=dddd dd mmmm yyyy (locale)]</p>\n<hr />\n<p>Bonjour,</p>\n<p>Votre demande concernant :</p>\n<p><strong>[res_letterbox.subject]</strong></p>\n<p>&agrave; bien &eacute;t&eacute; r&eacute;ceptionn&eacute;e par nos services le [res_letterbox.admission_date].</p>\n<p><br />La r&eacute;f&eacute;rence de votre dossier est : <strong>[res_letterbox.alt_identifier]</strong></p>\n<p>Le pr&eacute;sent accus&eacute; de r&eacute;ception atteste de la r&eacute;ception de votre demande. Il ne pr&eacute;juge pas de la conformit&eacute; de son contenu qui d&eacute;pend entre autres de l'&eacute;tude des pi&egrave;ces fournies.</p>\n<p>Si l'instruction de votre demande n&eacute;cessite des informations ou des pi&egrave;ces compl&eacute;mentaires, nos services vous en ferons la demande</p>\n<p>&nbsp;</p>\n<p>Nous vous conseillons de conserver ce message jusqu'&agrave; la fin du traitement de votre dossier.</p>\n<p>&nbsp;</p>\n<p>[userPrimaryEntity.entity_label]</p>\n<p>Ville de Maarch-les-Bains</p>\n<p>&nbsp;</p>\n</div>	OFFICE_HTML	2021/03/0001/	0011_1443263267.docx		letterbox_attachment	acknowledgementReceipt	simple	\N	{"acknowledgementReceiptFrom": "destination"}
1034	AR EN MASSE TYPE SVA	Cas d’une demande impliquant une décision implicite d'acceptation de l’administration	<div id="write" class="is-node"><br /><hr /><span style="color: #236fa1;">H&ocirc;tel de ville</span><br /><span style="color: #236fa1;">Place de la Libert&eacute;</span><br /><span style="color: #236fa1;">99000 Maarch-les-bains</span>\n<p>&nbsp;</p>\n<p><span style="color: #236fa1;"><strong>Accus&eacute; de r&eacute;ception de votre demande intervenant<br />dans le cadre d'une d&eacute;cision implicite d'acceptation<br /></strong></span></p>\n<p>Num&eacute;ro d'enregistrement :<strong> [res_letterbox.alt_identifier]</strong></p>\n<p>Service instructeur : <strong>[userPrimaryEntity.entity_label]</strong> <br />Courriel : [userPrimaryEntity.email]</p>\n<p>[userPrimaryEntity.address_town], le [datetime.date;frm=dddd dd mmmm yyyy (locale)]</p>\n<hr />\n<p>Bonjour,</p>\n<p>Votre demande concernant :</p>\n<p><strong>[res_letterbox.subject]</strong></p>\n<p>&agrave; bien &eacute;t&eacute; r&eacute;ceptionn&eacute;e par nos services le [res_letterbox.admission_date].</p>\n<p><br />La r&eacute;f&eacute;rence de votre dossier est : <strong>[res_letterbox.alt_identifier]</strong></p>\nLe pr&eacute;sent accus&eacute; de r&eacute;ception atteste de la r&eacute;ception de votre demande. il ne pr&eacute;juge pas de la conformit&eacute; de son contenu qui d&eacute;pend entre autres de l''&eacute;tude des pi&egrave;ces fournies.<br /><br />Votre demande est susceptible de faire l'objet d''une d&eacute;cision implicite d''acceptation en l'absence de r&eacute;ponse dans les jours suivant sa r&eacute;ception, soit le <strong>[res_letterbox.process_limit_date]</strong>.<br /><br />Si l'instruction de votre demande n&eacute;cessite des informations ou pi&egrave;ces compl&eacute;mentaires, la Ville vous contactera afin de les fournir, dans un d&eacute;lai de production qui sera fix&eacute;.<br /><br />Le cas &eacute;ch&eacute;ant, le d&eacute;lai de d&eacute;cision implicite d'acceptation ne d&eacute;butera qu''apr&egrave;s la production des pi&egrave;ces demand&eacute;es.<br /><br />En cas de d&eacute;cision implicite d''acceptation vous avez la possibilit&eacute; de demander au service charg&eacute; du dossier une attestation conform&eacute;ment aux dispositions de l'article 22 de la loi n&deg; 2000-321 du 12 avril 2000 relative aux droits des citoyens dans leurs relations avec les administrations modifi&eacute;e.\n<p>Nous vous conseillons de conserver ce message jusqu'&agrave; la fin du traitement de votre dossier.</p>\n<p>&nbsp;</p>\n<p><span style="color: #236fa1;">Ville de Maarch-les-Bains</span><br />[userPrimaryEntity.entity_label]</p>\n<p>Courriel : [userPrimaryEntity.email]<br />T&eacute;l&eacute;phone : [user.phone]</p>\n</div>	OFFICE_HTML	\N	\N	DOCX: AR_Masse_SVA	letterbox_attachment	acknowledgementReceipt	sva	\N	{"acknowledgementReceiptFrom": "destination"}
1045	AR TYPE SVR - Courriel Manuel	A utiliser avec l'action "Générer les AR"	<div id="write" class="is-node"><br /><hr /><span style="color: #236fa1;">H&ocirc;tel de ville</span><br /><span style="color: #236fa1;">Place de la Libert&eacute;</span><br /><span style="color: #236fa1;">99000 Maarch-les-bains</span>\n<p>&nbsp;</p>\n<p><span style="color: #236fa1;"><strong>Accus&eacute; de r&eacute;ception de votre demande intervenant<br />dans le cadre d'une d&eacute;cision implicite de rejet<br /></strong></span></p>\n<p>Num&eacute;ro d'enregistrement :<strong> [res_letterbox.alt_identifier]</strong></p>\n<p>Service instructeur : <strong>[userPrimaryEntity.entity_label]</strong> <br />Courriel : [userPrimaryEntity.email]</p>\n<p>[userPrimaryEntity.address_town], le [datetime.date;frm=dddd dd mmmm yyyy (locale)]</p>\n<hr />\n<p>Bonjour,</p>\n<p>Votre demande concernant :</p>\n<p><strong>[res_letterbox.subject]</strong></p>\n<p>&agrave; bien &eacute;t&eacute; r&eacute;ceptionn&eacute;e par nos services le [res_letterbox.admission_date].</p>\n<p><br />La r&eacute;f&eacute;rence de votre dossier est : <strong>[res_letterbox.alt_identifier]</strong></p>\nLe pr&eacute;sent accus&eacute; de r&eacute;ception atteste de la r&eacute;ception de votre demande. il ne pr&eacute;juge pas de la conformit&eacute; de son contenu qui d&eacute;pend entre autres de l''&eacute;tude des pi&egrave;ces fournies.<br /><br />Votre demande est susceptible de faire l'objet d'une d&eacute;cision implicite de rejet en l'absence de r&eacute;ponse dans les jours suivant sa r&eacute;ception, soit le <strong>[res_letterbox.process_limit_date]</strong>.<br /><br />Si l'instruction de votre demande n&eacute;cessite des informations ou pi&egrave;ces compl&eacute;mentaires, la Ville vous contactera afin de les fournir, dans un d&eacute;lai de production qui sera fix&eacute;.<br /><br />Dans ce cas, le d&eacute;lai de d&eacute;cision implicite de rejet serait alors suspendu le temps de produire les pi&egrave;ces demand&eacute;es.<br /><br />Si vous estimez que la d&eacute;cision qui sera prise par l'administration est contestable, vous pourrez formuler :<br /><br />- Soit un recours gracieux devant l'auteur de la d&eacute;cision<br />- Soit un recours hi&eacute;rarchique devant le Maire<br />- Soit un recours contentieux devant le Tribunal Administratif territorialement comp&eacute;tent.<br /><br />Le recours gracieux ou le recours hi&eacute;rarchique peuvent &ecirc;tre faits sans condition de d&eacute;lais.<br /><br />Le recours contentieux doit intervenir dans un d&eacute;lai de deux mois &agrave; compter de la notification de la d&eacute;cision.<br /><br />Toutefois, si vous souhaitez en cas de rejet du recours gracieux ou du recours hi&eacute;rarchique former un recours contentieux, ce recours gracieux ou hi&eacute;rarchique devra avoir &eacute;t&eacute; introduit dans le d&eacute;lai sus-indiqu&eacute; du recours contentieux.<br /><br />Vous conserverez ainsi la possibilit&eacute; de former un recours contentieux, dans un d&eacute;lai de deux mois &agrave; compter de la d&eacute;cision intervenue sur ledit recours gracieux ou hi&eacute;rarchique.<br />\n<p>Nous vous conseillons de conserver ce message jusqu'&agrave; la fin du traitement de votre dossier.</p>\n<p>&nbsp;</p>\n<p><span style="color: #236fa1;">Ville de Maarch-les-Bains</span><br />[userPrimaryEntity.entity_label]</p>\n<p>Courriel : [userPrimaryEntity.email]<br />T&eacute;l&eacute;phone : [user.phone]</p>\n</div>	HTML	\N	\N	\N	letterbox_attachment	sendmail	all	\N	{}
1035	AR EN MASSE TYPE SVR	Cas d’une demande impliquant une décision implicite de rejet de l’administration	<div id="write" class="is-node"><br /><hr /><span style="color: #236fa1;">H&ocirc;tel de ville</span><br /><span style="color: #236fa1;">Place de la Libert&eacute;</span><br /><span style="color: #236fa1;">99000 Maarch-les-bains</span>\n<p>&nbsp;</p>\n<p><span style="color: #236fa1;"><strong>Accus&eacute; de r&eacute;ception de votre demande intervenant<br />dans le cadre d'une d&eacute;cision implicite de rejet<br /></strong></span></p>\n<p>Num&eacute;ro d'enregistrement :<strong> [res_letterbox.alt_identifier]</strong></p>\n<p>Service instructeur : <strong>[userPrimaryEntity.entity_label]</strong> <br />Courriel : [userPrimaryEntity.email]</p>\n<p>[userPrimaryEntity.address_town], le [datetime.date;frm=dddd dd mmmm yyyy (locale)]</p>\n<hr />\n<p>Bonjour,</p>\n<p>Votre demande concernant :</p>\n<p><strong>[res_letterbox.subject]</strong></p>\n<p>&agrave; bien &eacute;t&eacute; r&eacute;ceptionn&eacute;e par nos services le [res_letterbox.admission_date].</p>\n<p><br />La r&eacute;f&eacute;rence de votre dossier est : <strong>[res_letterbox.alt_identifier]</strong></p>\nLe pr&eacute;sent accus&eacute; de r&eacute;ception atteste de la r&eacute;ception de votre demande. il ne pr&eacute;juge pas de la conformit&eacute; de son contenu qui d&eacute;pend entre autres de l''&eacute;tude des pi&egrave;ces fournies.<br /><br />Votre demande est susceptible de faire l'objet d'une d&eacute;cision implicite de rejet en l'absence de r&eacute;ponse dans les jours suivant sa r&eacute;ception, soit le <strong>[res_letterbox.process_limit_date]</strong>.<br /><br />Si l'instruction de votre demande n&eacute;cessite des informations ou pi&egrave;ces compl&eacute;mentaires, la Ville vous contactera afin de les fournir, dans un d&eacute;lai de production qui sera fix&eacute;.<br /><br />Dans ce cas, le d&eacute;lai de d&eacute;cision implicite de rejet serait alors suspendu le temps de produire les pi&egrave;ces demand&eacute;es.<br /><br />Si vous estimez que la d&eacute;cision qui sera prise par l'administration est contestable, vous pourrez formuler :<br /><br />- Soit un recours gracieux devant l'auteur de la d&eacute;cision<br />- Soit un recours hi&eacute;rarchique devant le Maire<br />- Soit un recours contentieux devant le Tribunal Administratif territorialement comp&eacute;tent.<br /><br />Le recours gracieux ou le recours hi&eacute;rarchique peuvent &ecirc;tre faits sans condition de d&eacute;lais.<br /><br />Le recours contentieux doit intervenir dans un d&eacute;lai de deux mois &agrave; compter de la notification de la d&eacute;cision.<br /><br />Toutefois, si vous souhaitez en cas de rejet du recours gracieux ou du recours hi&eacute;rarchique former un recours contentieux, ce recours gracieux ou hi&eacute;rarchique devra avoir &eacute;t&eacute; introduit dans le d&eacute;lai sus-indiqu&eacute; du recours contentieux.<br /><br />Vous conserverez ainsi la possibilit&eacute; de former un recours contentieux, dans un d&eacute;lai de deux mois &agrave; compter de la d&eacute;cision intervenue sur ledit recours gracieux ou hi&eacute;rarchique.<br />\n<p>Nous vous conseillons de conserver ce message jusqu'&agrave; la fin du traitement de votre dossier.</p>\n<p>&nbsp;</p>\n<p><span style="color: #236fa1;">Ville de Maarch-les-Bains</span><br />[userPrimaryEntity.entity_label]</p>\n<p>Courriel : [userPrimaryEntity.email]<br />T&eacute;l&eacute;phone : [user.phone]</p>\n</div>	OFFICE_HTML	\N	\N	DOCX: AR_Masse_SVR	letterbox_attachment	acknowledgementReceipt	svr	\N	{"acknowledgementReceiptFrom": "destination"}
1036	SVE - Courriel de réorientation	Modèle de courriel de réorientation d'une saisine SVE	<div id="write" class="is-node"><br /><hr /><span style="color: #236fa1;">H&ocirc;tel de ville</span><br /><span style="color: #236fa1;">Place de la Libert&eacute;</span><br /><span style="color: #236fa1;">99000 Maarch-les-bains</span>\n<p>[destination.entity_label]<br /><br />T&eacute;l&eacute;phone : &nbsp;&nbsp; &nbsp;[user.phone]<br />Courriel : &nbsp;&nbsp;&nbsp; [destination.email]</p>\n<p>[destination.address_town], le [datetime.date;frm=dddd dd mmmm yyyy (locale)]</p>\n<hr />\n<p>Bonjour,</p>\nLe [res_letterbox.doc_date], vous avez transmis par voie &eacute;lectronique &agrave; la Ville une demande qui ne rel&egrave;ve pas de sa comp&eacute;tence.<br /><br />Votre demande cit&eacute;e en objet de ce courriel a &eacute;t&eacute; transmise &agrave;</div>\n<div class="is-node">&nbsp;</div>\n<div class="is-node">(veuillez renseigner le nom de l'AUTORITE COMPETENTE).<br />\n<p><br /><br /></p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n</div>	HTML	\N	\N	DOCX: AR_Masse_SVA	letterbox_attachment	sendmail	all	\N	{}
1043	AR TYPE SIMPLE- Courriel Manuel	A utiliser avec l'action "Générer les AR"	<div id="write" class="is-node"><br /><hr /><span style="color: #236fa1;">H&ocirc;tel de ville</span><br /><span style="color: #236fa1;">Place de la Libert&eacute;</span><br /><span style="color: #236fa1;">99000 Maarch-les-bains</span>\n<p>&nbsp;</p>\n<p><span style="color: #236fa1;"><strong>Accus&eacute; de r&eacute;ception</strong></span></p>\n<p>Service instructeur : <strong>[userPrimaryEntity.entity_label]</strong> <br />Courriel : [userPrimaryEntity.email]</p>\n<p>[userPrimaryEntity.address_town], le [datetime.date;frm=dddd dd mmmm yyyy (locale)]</p>\n<hr />\n<p>Bonjour,</p>\n<p>Votre demande concernant :</p>\n<p><strong>[res_letterbox.subject]</strong></p>\n<p>&agrave; bien &eacute;t&eacute; r&eacute;ceptionn&eacute;e par nos services le [res_letterbox.admission_date].</p>\n<p><br />La r&eacute;f&eacute;rence de votre dossier est : <strong>[res_letterbox.alt_identifier]</strong></p>\n<p>Le pr&eacute;sent accus&eacute; de r&eacute;ception atteste de la r&eacute;ception de votre demande. Il ne pr&eacute;juge pas de la conformit&eacute; de son contenu qui d&eacute;pend entre autres de l'&eacute;tude des pi&egrave;ces fournies.</p>\n<p>Si l'instruction de votre demande n&eacute;cessite des informations ou des pi&egrave;ces compl&eacute;mentaires, nos services vous en ferons la demande</p>\n<p>&nbsp;</p>\n<p>Nous vous conseillons de conserver ce message jusqu'&agrave; la fin du traitement de votre dossier.</p>\n<p>&nbsp;</p>\n<p>[userPrimaryEntity.entity_label]</p>\n<p>Ville de Maarch-les-Bains</p>\n<p>&nbsp;</p>\n</div>	HTML	\N	\N	\N	letterbox_attachment	sendmail	all	\N	{}
1044	AR TYPE SVA - Courriel Manuel	A utiliser avec l'action "Générer les AR"	<div id="write" class="is-node"><br /><hr /><span style="color: #236fa1;">H&ocirc;tel de ville</span><br /><span style="color: #236fa1;">Place de la Libert&eacute;</span><br /><span style="color: #236fa1;">99000 Maarch-les-bains</span>\n<p>&nbsp;</p>\n<p><span style="color: #236fa1;"><strong>Accus&eacute; de r&eacute;ception de votre demande intervenant<br />dans le cadre d'une d&eacute;cision implicite d'acceptation<br /></strong></span></p>\n<p>Num&eacute;ro d'enregistrement :<strong> [res_letterbox.alt_identifier]</strong></p>\n<p>Service instructeur : <strong>[userPrimaryEntity.entity_label]</strong> <br />Courriel : [userPrimaryEntity.email]</p>\n<p>[userPrimaryEntity.address_town], le [datetime.date;frm=dddd dd mmmm yyyy (locale)]</p>\n<hr />\n<p>Bonjour,</p>\n<p>Votre demande concernant :</p>\n<p><strong>[res_letterbox.subject]</strong></p>\n<p>&agrave; bien &eacute;t&eacute; r&eacute;ceptionn&eacute;e par nos services le [res_letterbox.admission_date].</p>\n<p><br />La r&eacute;f&eacute;rence de votre dossier est : <strong>[res_letterbox.alt_identifier]</strong></p>\nLe pr&eacute;sent accus&eacute; de r&eacute;ception atteste de la r&eacute;ception de votre demande. il ne pr&eacute;juge pas de la conformit&eacute; de son contenu qui d&eacute;pend entre autres de l''&eacute;tude des pi&egrave;ces fournies.<br /><br />Votre demande est susceptible de faire l'objet d''une d&eacute;cision implicite d''acceptation en l'absence de r&eacute;ponse dans les jours suivant sa r&eacute;ception, soit le <strong>[res_letterbox.process_limit_date]</strong>.<br /><br />Si l'instruction de votre demande n&eacute;cessite des informations ou pi&egrave;ces compl&eacute;mentaires, la Ville vous contactera afin de les fournir, dans un d&eacute;lai de production qui sera fix&eacute;.<br /><br />Le cas &eacute;ch&eacute;ant, le d&eacute;lai de d&eacute;cision implicite d'acceptation ne d&eacute;butera qu''apr&egrave;s la production des pi&egrave;ces demand&eacute;es.<br /><br />En cas de d&eacute;cision implicite d''acceptation vous avez la possibilit&eacute; de demander au service charg&eacute; du dossier une attestation conform&eacute;ment aux dispositions de l'article 22 de la loi n&deg; 2000-321 du 12 avril 2000 relative aux droits des citoyens dans leurs relations avec les administrations modifi&eacute;e.\n<p>Nous vous conseillons de conserver ce message jusqu'&agrave; la fin du traitement de votre dossier.</p>\n<p>&nbsp;</p>\n<p><span style="color: #236fa1;">Ville de Maarch-les-Bains</span><br />[userPrimaryEntity.entity_label]</p>\n<p>Courriel : [userPrimaryEntity.email]<br />T&eacute;l&eacute;phone : [user.phone]</p>\n</div>	HTML	\N	\N	\N	letterbox_attachment	sendmail	all	\N	{}
1041	PR - Invitation (Visa interne)	Projet de réponse invitation pour visa interne	\N	OFFICE	2021/03/0001/	0001_742130848.docx	DOCX: PR02_INVITATION	letterbox_attachment	attachments	response_project	\N	{}
1047	EC - Générique (Visa externe)	Enregistrement de courrier générique	\N	OFFICE	2021/03/0001/	0005_1707546937.docx	DOCX: EC01_GENERIC	letterbox_attachment	indexingFile	all	\N	{}
20	Courriel d'accompagnement	Modèle de courriel d'accompagnement	<div id="write" class="is-node"><br /><hr /><span style="color: #236fa1;">H&ocirc;tel de ville</span><br /><span style="color: #236fa1;">Place de la Libert&eacute;</span><br /><span style="color: #236fa1;">99000 Maarch-les-bains</span>\n<p>[user.firstname] [user.lastname]<br />[userPrimaryEntity.role]<br />[userPrimaryEntity.entity_label]<br /><br />T&eacute;l&eacute;phone : &nbsp;&nbsp; &nbsp;[user.phone]<br />Courriel : &nbsp;&nbsp; &nbsp;[user.mail]</p>\n<p>[userPrimaryEntity.address_town], le [datetime.date;frm=dddd dd mmmm yyyy (locale)]</p>\n<hr />\n<p>Bonjour,</p>\n<p>Veuillez trouver en pi&egrave;ce jointe &agrave; ce courriel notre r&eacute;ponse &agrave; votre demande du [res_letterbox.admission_date].</p>\n<p>Bien cordialement.</p>\n<p>[user.firstname] [user.lastname]<br />[userPrimaryEntity.role]<br />[userPrimaryEntity.entity_label]<br /><br /></p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n</div>	HTML	\N	\N	DOCX: standard_nosign	letterbox_attachment	sendmail	all	\N	{}
1048	PR - Générique (Visa externe)	Projet de réponse générique	\N	OFFICE	2021/03/0001/	0008_1397704541.docx	DOCX: PR01_GENERIC	letterbox_attachment	attachments	response_project	\N	{}
1038	EC - Générique (Visa interne)	Enregistrement de courrier générique	\N	OFFICE	2021/03/0001/	0003_320653448.docx	DOCX: EC01_GENERIC	letterbox_attachment	indexingFile	all	\N	{}
1040	PR - Générique (Visa interne)	Projet de réponse générique	\N	OFFICE	2021/03/0001/	0006_1786637551.docx	DOCX: PR01_GENERIC	letterbox_attachment	attachments	response_project	\N	{}
1046	PR - Invitation (Visa externe)	Modèle invitation pour visa externe	\N	OFFICE	2021/03/0001/	0002_705367294.docx	\N	letterbox_attachment	attachments	response_project	\N	{}
\.


--
-- Data for Name: templates_association; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.templates_association (id, template_id, value_field) FROM stdin;
1	900	VILLE
2	901	VILLE
3	902	VILLE
4	904	VILLE
5	905	VILLE
6	906	VILLE
7	907	VILLE
8	908	VILLE
9	909	VILLE
10	910	VILLE
11	1033	VILLE
12	1034	VILLE
572	1046	CAB
573	1046	COR
15	1035	VILLE
574	1046	FIN
575	1046	DRH
576	1046	DSI
577	1046	DGA
20	900	CAB
21	901	CAB
22	902	CAB
23	904	CAB
24	905	CAB
25	906	CAB
26	907	CAB
27	908	CAB
28	909	CAB
29	910	CAB
30	1033	CAB
31	1034	CAB
578	1046	DGS
579	1046	PE
34	1035	CAB
580	1046	PCU
581	1046	PSF
582	1046	PJS
583	1046	PJU
39	900	DGS
40	901	DGS
41	902	DGS
42	904	DGS
43	905	DGS
44	906	DGS
45	907	DGS
46	908	DGS
47	909	DGS
48	910	DGS
49	1033	DGS
50	1034	DGS
584	1046	PSO
585	1046	PTE
53	1035	DGS
586	1046	DSG
587	1046	COU
588	1046	SP
589	1046	VILLE
58	900	DGA
59	901	DGA
60	902	DGA
61	904	DGA
62	905	DGA
63	906	DGA
64	907	DGA
65	908	DGA
66	909	DGA
67	910	DGA
68	1033	DGA
69	1034	DGA
72	1035	DGA
77	900	PCU
78	901	PCU
79	902	PCU
80	904	PCU
81	905	PCU
82	906	PCU
83	907	PCU
84	908	PCU
85	909	PCU
86	910	PCU
87	1033	PCU
88	1034	PCU
91	1035	PCU
96	900	PJS
97	901	PJS
98	902	PJS
99	904	PJS
100	905	PJS
101	906	PJS
102	907	PJS
103	908	PJS
104	909	PJS
105	910	PJS
106	1033	PJS
107	1034	PJS
110	1035	PJS
115	900	PE
116	901	PE
117	902	PE
118	904	PE
119	905	PE
120	906	PE
121	907	PE
122	908	PE
123	909	PE
124	910	PE
125	1033	PE
126	1034	PE
129	1035	PE
134	900	SP
135	901	SP
136	902	SP
137	904	SP
138	905	SP
139	906	SP
140	907	SP
141	908	SP
142	909	SP
143	910	SP
144	1033	SP
145	1034	SP
148	1035	SP
153	900	PSO
154	901	PSO
155	902	PSO
156	904	PSO
157	905	PSO
158	906	PSO
159	907	PSO
160	908	PSO
161	909	PSO
162	910	PSO
163	1033	PSO
164	1034	PSO
590	1041	CAB
591	1041	COR
167	1035	PSO
592	1041	FIN
593	1041	DRH
594	1041	DSI
595	1041	DGA
172	900	PTE
173	901	PTE
174	902	PTE
175	904	PTE
176	905	PTE
177	906	PTE
178	907	PTE
179	908	PTE
180	909	PTE
181	910	PTE
182	1033	PTE
183	1034	PTE
596	1041	DGS
597	1041	PE
186	1035	PTE
598	1041	PCU
599	1041	PSF
600	1041	PJS
601	1041	PJU
191	900	DRH
192	901	DRH
193	902	DRH
194	904	DRH
195	905	DRH
196	906	DRH
197	907	DRH
198	908	DRH
199	909	DRH
200	910	DRH
201	1033	DRH
202	1034	DRH
602	1041	PSO
603	1041	PTE
205	1035	DRH
604	1041	DSG
605	1041	COU
606	1041	SP
607	1041	VILLE
210	900	DSG
211	901	DSG
212	902	DSG
213	904	DSG
214	905	DSG
215	906	DSG
216	907	DSG
217	908	DSG
218	909	DSG
219	910	DSG
220	1033	DSG
221	1034	DSG
224	1035	DSG
229	900	COU
230	901	COU
231	902	COU
232	904	COU
233	905	COU
234	906	COU
235	907	COU
236	908	COU
237	909	COU
238	910	COU
239	1033	COU
240	1034	COU
243	1035	COU
248	900	COR
249	901	COR
250	902	COR
251	904	COR
252	905	COR
253	906	COR
254	907	COR
255	908	COR
256	909	COR
257	910	COR
258	1033	COR
259	1034	COR
262	1035	COR
267	900	PSF
268	901	PSF
269	902	PSF
270	904	PSF
271	905	PSF
272	906	PSF
273	907	PSF
274	908	PSF
275	909	PSF
276	910	PSF
277	1033	PSF
278	1034	PSF
281	1035	PSF
286	900	DSI
287	901	DSI
288	902	DSI
289	904	DSI
290	905	DSI
291	906	DSI
292	907	DSI
293	908	DSI
294	909	DSI
295	910	DSI
296	1033	DSI
297	1034	DSI
300	1035	DSI
305	900	FIN
306	901	FIN
307	902	FIN
308	904	FIN
309	905	FIN
310	906	FIN
311	907	FIN
312	908	FIN
313	909	FIN
314	910	FIN
315	1033	FIN
316	1034	FIN
608	20	CAB
609	20	COR
319	1035	FIN
610	20	FIN
611	20	DRH
612	20	DSI
613	20	DGA
324	900	PJU
325	901	PJU
326	902	PJU
327	904	PJU
328	905	PJU
329	906	PJU
330	907	PJU
331	908	PJU
332	909	PJU
333	910	PJU
334	1033	PJU
335	1034	PJU
614	20	DGS
615	20	ELUS
338	1035	PJU
616	20	PE
617	20	PCU
618	20	PSF
619	20	PJS
343	900	ELUS
344	901	ELUS
345	902	ELUS
346	904	ELUS
347	905	ELUS
348	906	ELUS
349	907	ELUS
350	908	ELUS
351	909	ELUS
352	910	ELUS
353	1033	ELUS
354	1034	ELUS
620	20	PJU
621	20	PSO
357	1035	ELUS
622	20	PTE
623	20	DSG
624	20	COU
625	20	SP
362	900	CCAS
363	901	CCAS
364	902	CCAS
365	904	CCAS
366	905	CCAS
367	906	CCAS
368	907	CCAS
369	908	CCAS
370	909	CCAS
371	910	CCAS
372	1033	CCAS
373	1034	CCAS
626	20	VILLE
376	1035	CCAS
499	1048	CAB
500	1048	COR
501	1048	FIN
502	1048	DRH
503	1048	DSI
504	1048	DGA
505	1048	DGS
506	1048	ELUS
507	1048	PE
508	1048	PCU
509	1048	PSF
510	1048	PJS
511	1048	PJU
512	1048	PSO
513	1048	PTE
514	1048	DSG
515	1048	COU
516	1048	SP
517	1048	VILLE
518	1038	CAB
519	1038	COR
520	1038	FIN
521	1038	DRH
522	1038	DSI
523	1038	DGA
524	1038	DGS
525	1038	PE
526	1038	PCU
527	1038	PSF
528	1038	PJS
529	1038	PJU
530	1038	PSO
531	1038	PTE
532	1038	DSG
533	1038	COU
534	1038	SP
535	1038	VILLE
536	1047	CAB
537	1047	COR
538	1047	FIN
539	1047	DRH
540	1047	DSI
541	1047	DGA
542	1047	DGS
543	1047	PE
544	1047	PCU
545	1047	PSF
546	1047	PJS
547	1047	PJU
548	1047	PSO
549	1047	PTE
550	1047	DSG
551	1047	COU
552	1047	SP
553	1047	VILLE
554	1040	CAB
555	1040	COR
556	1040	FIN
557	1040	DRH
558	1040	DSI
559	1040	DGA
560	1040	DGS
561	1040	PE
562	1040	PCU
563	1040	PSF
564	1040	PJS
565	1040	PJU
566	1040	PSO
567	1040	PTE
568	1040	DSG
569	1040	COU
570	1040	SP
571	1040	VILLE
\.


--
-- Data for Name: tiles; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.tiles (id, user_id, type, view, "position", color, parameters) FROM stdin;
2	21	myLastResources	list	0	#80cbc4	{}
3	21	shortcut	summary	1	#9fa8da	{"privilegeId": "admin_tag"}
1	21	basket	summary	3	#90caf9	{"groupId": 1, "basketId": 1}
5	16	myLastResources	list	0	#90caf9	{"groupId": 2, "basketId": 3}
8	23	searchTemplate	chart	1	#bcaaa4	{"chartMode": "creationDate", "chartType": "line", "searchTemplateId": 1}
7	23	searchTemplate	chart	0	#b0bec5	{"chartMode": "status", "chartType": "vertical-bar", "searchTemplateId": 1}
9	18	searchTemplate	chart	1	#ce93d8	{"chartMode": "destination", "chartType": "pie", "searchTemplateId": 2}
11	18	basket	list	0	#ef9a9a	{"groupId": 3, "basketId": 12}
12	5	basket	list	0	#90caf9	{"groupId": 8, "basketId": 9}
13	4	myLastResources	list	0	#90caf9	{"groupId": 2, "basketId": 3}
14	4	basket	summary	1	#ffcc80	{"groupId": 2, "basketId": 17}
16	17	basket	chart	1	#90caf9	{"groupId": 4, "basketId": 15, "chartMode": "doctype", "chartType": "pie"}
15	17	basket	summary	0	#ef9a9a	{"groupId": 4, "basketId": 16}
17	10	basket	summary	0	#ef9a9a	{"groupId": 4, "basketId": 16}
18	10	basket	chart	1	#b39ddb	{"groupId": 4, "basketId": 15, "chartMode": "destination", "chartType": "pie"}
19	10	basket	chart	2	#bcaaa4	{"groupId": 4, "basketId": 15, "chartMode": "doctype", "chartType": "vertical-bar"}
\.


--
-- Data for Name: unit_identifier; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.unit_identifier (message_id, tablename, res_id, disposition) FROM stdin;
\.


--
-- Data for Name: user_signatures; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.user_signatures (id, user_serial_id, signature_label, signature_path, signature_file_name, fingerprint) FROM stdin;
\.


--
-- Data for Name: usergroup_content; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.usergroup_content (user_id, group_id, role) FROM stdin;
1	4	
1	7	
2	2	
3	4	
4	2	
5	8	
6	4	
7	4	
7	7	
8	2	
9	2	
10	4	
11	2	
12	2	
13	2	
14	4	
15	2	
16	2	
17	4	
18	1	
18	3	
19	2	
20	2	
21	1	
21	5	
22	10	
24	11	
24	13	
\.


--
-- Data for Name: usergroups; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.usergroups (id, group_id, group_desc, can_index, indexation_parameters) FROM stdin;
4	RESPONSABLE	Manager	t	{"actions": ["22", "20"], "entities": [], "keywords": ["ALL_ENTITIES"]}
5	ADMINISTRATEUR_N1	Admin. Fonctionnel N1	f	{"actions": [], "entities": [], "keywords": []}
6	ADMINISTRATEUR_N2	Admin. Fonctionnel N2	f	{"actions": [], "entities": [], "keywords": []}
7	DIRECTEUR	Directeur	f	{"actions": [], "entities": [], "keywords": []}
8	ELU	Elu	f	{"actions": [], "entities": [], "keywords": []}
9	CABINET	Cabinet	f	{"actions": [], "entities": [], "keywords": []}
10	ARCHIVISTE	Archiviste	f	{"actions": [], "entities": [], "keywords": []}
11	MAARCHTOGEC	Envoi dématérialisé	f	{"actions": [], "entities": [], "keywords": []}
12	SERVICE	Service	f	{"actions": [], "entities": [], "keywords": []}
13	WEBSERVICE	Utilisateurs de WebService	t	{"actions": ["22", "20"], "entities": [], "keywords": ["ALL_ENTITIES"]}
1	COURRIER	Opérateur de numérisation	t	{"actions": ["21", "22"], "entities": [], "keywords": ["ALL_ENTITIES"]}
3	RESP_COURRIER	Superviseur Courrier	t	{"actions": ["21", "22"], "entities": [], "keywords": ["ALL_ENTITIES"]}
2	AGENT	Utilisateur	t	{"actions": ["22", "414", "20"], "entities": [], "keywords": ["ALL_ENTITIES"]}
\.


--
-- Data for Name: usergroups_services; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.usergroups_services (group_id, service_id, parameters) FROM stdin;
COURRIER	admin	\N
COURRIER	adv_search_mlb	\N
COURRIER	create_contacts	\N
COURRIER	update_contacts	\N
COURRIER	update_status_mail	\N
COURRIER	view_technical_infos	\N
COURRIER	view_doc_history	\N
COURRIER	view_full_history	\N
COURRIER	add_links	\N
COURRIER	update_resources	\N
COURRIER	update_diffusion_indexing	\N
COURRIER	update_diffusion_details	\N
COURRIER	entities_print_sep_mlb	\N
COURRIER	sendmail	\N
COURRIER	use_mail_services	\N
COURRIER	admin_registered_mail	\N
COURRIER	include_folders_and_followed_resources_perimeter	\N
COURRIER	update_delete_attachments	\N
COURRIER	view_documents_with_notes	\N
COURRIER	add_new_version	\N
COURRIER	view_version_letterbox	\N
COURRIER	print_folder_doc	\N
COURRIER	manage_tags_application	\N
COURRIER	private_tag	\N
COURRIER	_print_sep	\N
COURRIER	physical_archive_print_sep_mlb	\N
COURRIER	manage_numeric_package	\N
AGENT	adv_search_mlb	\N
AGENT	create_contacts	\N
AGENT	update_contacts	\N
AGENT	view_doc_history	\N
AGENT	add_links	\N
AGENT	update_diffusion_indexing	\N
AGENT	update_diffusion_details	\N
AGENT	sendmail	\N
AGENT	use_mail_services	\N
AGENT	include_folders_and_followed_resources_perimeter	\N
AGENT	update_delete_attachments	\N
AGENT	view_documents_with_notes	\N
AGENT	add_new_version	\N
AGENT	view_version_letterbox	\N
AGENT	config_visa_workflow	\N
AGENT	config_visa_workflow_in_detail	\N
AGENT	print_folder_doc	\N
AGENT	config_avis_workflow	\N
AGENT	config_avis_workflow_in_detail	\N
AGENT	private_tag	\N
AGENT	manage_numeric_package	\N
AGENT	add_correspondent_in_shared_groups_on_profile	\N
RESP_COURRIER	adv_search_mlb	\N
RESP_COURRIER	create_contacts	\N
RESP_COURRIER	update_contacts	\N
RESP_COURRIER	view_doc_history	\N
RESP_COURRIER	view_full_history	\N
RESP_COURRIER	add_links	\N
RESP_COURRIER	update_resources	\N
RESP_COURRIER	update_diffusion_indexing	\N
RESP_COURRIER	update_diffusion_details	\N
RESP_COURRIER	update_diffusion_process	\N
RESP_COURRIER	sendmail	\N
RESP_COURRIER	use_mail_services	\N
RESP_COURRIER	admin_registered_mail	\N
RESP_COURRIER	include_folders_and_followed_resources_perimeter	\N
RESP_COURRIER	view_documents_with_notes	\N
RESP_COURRIER	add_new_version	\N
RESP_COURRIER	view_version_letterbox	\N
RESP_COURRIER	sign_document	\N
RESP_COURRIER	visa_documents	\N
RESP_COURRIER	print_folder_doc	\N
RESP_COURRIER	private_tag	\N
RESP_COURRIER	manage_numeric_package	\N
RESPONSABLE	adv_search_mlb	\N
RESPONSABLE	create_contacts	\N
RESPONSABLE	update_contacts	\N
RESPONSABLE	view_doc_history	\N
RESPONSABLE	add_links	\N
RESPONSABLE	update_diffusion_indexing	\N
RESPONSABLE	update_diffusion_details	\N
RESPONSABLE	sendmail	\N
RESPONSABLE	use_mail_services	\N
RESPONSABLE	include_folders_and_followed_resources_perimeter	\N
RESPONSABLE	update_delete_attachments	\N
RESPONSABLE	view_documents_with_notes	\N
RESPONSABLE	add_new_version	\N
RESPONSABLE	view_version_letterbox	\N
RESPONSABLE	config_visa_workflow	\N
RESPONSABLE	config_visa_workflow_in_detail	\N
RESPONSABLE	sign_document	\N
RESPONSABLE	visa_documents	\N
RESPONSABLE	modify_visa_in_signatureBook	\N
RESPONSABLE	print_folder_doc	\N
RESPONSABLE	config_avis_workflow	\N
RESPONSABLE	config_avis_workflow_in_detail	\N
RESPONSABLE	avis_documents	\N
RESPONSABLE	private_tag	\N
RESPONSABLE	manage_numeric_package	\N
RESPONSABLE	add_correspondent_in_shared_groups_on_profile	\N
ADMINISTRATEUR_N1	admin	\N
ADMINISTRATEUR_N1	adv_search_mlb	\N
ADMINISTRATEUR_N1	admin_groups	\N
ADMINISTRATEUR_N1	admin_architecture	\N
ADMINISTRATEUR_N1	view_history	\N
ADMINISTRATEUR_N1	view_history_batch	\N
ADMINISTRATEUR_N1	admin_status	\N
ADMINISTRATEUR_N1	admin_actions	\N
ADMINISTRATEUR_N1	admin_contacts	\N
ADMINISTRATEUR_N1	admin_indexing_models	\N
ADMINISTRATEUR_N1	admin_custom_fields	\N
ADMINISTRATEUR_N1	create_contacts	\N
ADMINISTRATEUR_N1	update_contacts	\N
ADMINISTRATEUR_N1	update_status_mail	\N
ADMINISTRATEUR_N1	view_technical_infos	\N
ADMINISTRATEUR_N1	view_doc_history	\N
ADMINISTRATEUR_N1	view_full_history	\N
ADMINISTRATEUR_N1	add_links	\N
ADMINISTRATEUR_N1	admin_parameters	\N
ADMINISTRATEUR_N1	admin_priorities	\N
ADMINISTRATEUR_N1	update_resources	\N
ADMINISTRATEUR_N1	admin_email_server	\N
ADMINISTRATEUR_N1	admin_shippings	\N
ADMINISTRATEUR_N1	admin_baskets	\N
ADMINISTRATEUR_N1	manage_entities	\N
ADMINISTRATEUR_N1	admin_difflist_types	\N
ADMINISTRATEUR_N1	admin_listmodels	\N
ADMINISTRATEUR_N1	update_diffusion_indexing	\N
ADMINISTRATEUR_N1	update_diffusion_details	\N
ADMINISTRATEUR_N1	update_diffusion_process	\N
ADMINISTRATEUR_N1	entities_print_sep_mlb	\N
ADMINISTRATEUR_N1	sendmail	\N
ADMINISTRATEUR_N1	use_mail_services	\N
ADMINISTRATEUR_N1	admin_registered_mail	\N
ADMINISTRATEUR_N1	include_folders_and_followed_resources_perimeter	\N
ADMINISTRATEUR_N1	admin_alfresco	\N
ADMINISTRATEUR_N1	admin_search	\N
ADMINISTRATEUR_N1	update_delete_attachments	\N
ADMINISTRATEUR_N1	view_documents_with_notes	\N
ADMINISTRATEUR_N1	add_new_version	\N
ADMINISTRATEUR_N1	view_version_letterbox	\N
ADMINISTRATEUR_N1	config_visa_workflow	\N
ADMINISTRATEUR_N1	config_visa_workflow_in_detail	\N
ADMINISTRATEUR_N1	print_folder_doc	\N
ADMINISTRATEUR_N1	config_avis_workflow	\N
ADMINISTRATEUR_N1	admin_templates	\N
ADMINISTRATEUR_N1	admin_tag	\N
ADMINISTRATEUR_N1	manage_tags_application	\N
ADMINISTRATEUR_N1	private_tag	\N
ADMINISTRATEUR_N1	admin_notif	\N
ADMINISTRATEUR_N1	_print_sep	\N
ADMINISTRATEUR_N1	physical_archive_print_sep_mlb	\N
ADMINISTRATEUR_N1	physical_archive_batch_manage	\N
ADMINISTRATEUR_N1	admin_life_cycle	\N
ADMINISTRATEUR_N1	add_correspondent_in_shared_groups_on_profile	\N
ADMINISTRATEUR_N2	admin	\N
ADMINISTRATEUR_N2	view_doc_history	\N
ADMINISTRATEUR_N2	view_full_history	\N
ADMINISTRATEUR_N2	update_resources	\N
ADMINISTRATEUR_N2	include_folders_and_followed_resources_perimeter	\N
ADMINISTRATEUR_N2	admin_templates	\N
ADMINISTRATEUR_N2	admin_tag	\N
ELU	include_folders_and_followed_resources_perimeter	\N
ELU	sign_document	\N
ELU	visa_documents	\N
ELU	avis_documents	\N
ARCHIVISTE	adv_search_mlb	\N
ARCHIVISTE	create_contacts	\N
ARCHIVISTE	update_contacts	\N
ARCHIVISTE	view_technical_infos	\N
ARCHIVISTE	view_doc_history	\N
ARCHIVISTE	view_full_history	\N
ARCHIVISTE	sendmail	\N
ARCHIVISTE	include_folders_and_followed_resources_perimeter	\N
ARCHIVISTE	avis_documents	\N
ARCHIVISTE	export_seda_view	\N
MAARCHTOGEC	include_folders_and_followed_resources_perimeter	\N
MAARCHTOGEC	manage_numeric_package	\N
WEBSERVICE	include_folders_and_followed_resources_perimeter	\N
ADMINISTRATEUR_N1	admin_users	{"groups": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]}
ADMINISTRATEUR_N1	manage_personal_data	\N
AGENT	update_resources	\N
RESPONSABLE	update_diffusion_process	\N
ADMINISTRATEUR_N1	admin_mercure	\N
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
-- Data for Name: users_baskets_preferences; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.users_baskets_preferences (id, user_serial_id, group_serial_id, basket_id, display, color) FROM stdin;
1	1	4	SendToSignatoryBook	t	\N
2	1	4	EenvBasket	t	\N
3	1	4	SuiviParafBasket	t	\N
4	1	4	ParafBasket	t	\N
5	1	4	DepartmentBasket	t	\N
6	1	4	MyBasket	t	\N
7	1	4	RetAvisBasket	t	\N
8	1	4	SupAvisBasket	t	\N
9	1	4	DdeAvisBasket	t	\N
10	1	4	CopyMailBasket	t	\N
13	2	2	Maileva_Sended	t	\N
14	2	2	AR_AlreadySend	t	\N
15	2	2	AR_Create	t	\N
16	2	2	SendToSignatoryBook	t	\N
17	2	2	EenvBasket	t	\N
18	2	2	SuiviParafBasket	t	\N
19	2	2	LateMailBasket	t	\N
20	2	2	MyBasket	t	\N
21	2	2	RetAvisBasket	t	\N
22	2	2	SupAvisBasket	t	\N
23	2	2	DdeAvisBasket	t	\N
24	2	2	CopyMailBasket	t	\N
25	3	4	SendToSignatoryBook	t	\N
26	3	4	EenvBasket	t	\N
27	3	4	SuiviParafBasket	t	\N
28	3	4	ParafBasket	t	\N
29	3	4	DepartmentBasket	t	\N
30	3	4	MyBasket	t	\N
31	3	4	RetAvisBasket	t	\N
32	3	4	SupAvisBasket	t	\N
33	3	4	DdeAvisBasket	t	\N
34	3	4	CopyMailBasket	t	\N
38	4	2	AR_AlreadySend	t	\N
39	4	2	AR_Create	t	\N
41	4	2	EenvBasket	t	\N
42	4	2	SuiviParafBasket	t	\N
43	4	2	LateMailBasket	t	\N
44	4	2	MyBasket	t	\N
45	4	2	RetAvisBasket	t	\N
46	4	2	SupAvisBasket	t	\N
47	4	2	DdeAvisBasket	t	\N
48	4	2	CopyMailBasket	t	\N
49	5	8	MyBasket	t	\N
50	5	8	DdeAvisBasket	t	\N
51	6	4	SendToSignatoryBook	t	\N
52	6	4	EenvBasket	t	\N
53	6	4	SuiviParafBasket	t	\N
54	6	4	ParafBasket	t	\N
55	6	4	DepartmentBasket	t	\N
56	6	4	MyBasket	t	\N
57	6	4	RetAvisBasket	t	\N
58	6	4	SupAvisBasket	t	\N
59	6	4	DdeAvisBasket	t	\N
60	6	4	CopyMailBasket	t	\N
61	7	4	SendToSignatoryBook	t	\N
62	7	4	EenvBasket	t	\N
63	7	4	SuiviParafBasket	t	\N
64	7	4	ParafBasket	t	\N
65	7	4	DepartmentBasket	t	\N
66	7	4	MyBasket	t	\N
67	7	4	RetAvisBasket	t	\N
68	7	4	SupAvisBasket	t	\N
69	7	4	DdeAvisBasket	t	\N
70	7	4	CopyMailBasket	t	\N
73	8	2	Maileva_Sended	t	\N
74	8	2	AR_AlreadySend	t	\N
75	8	2	AR_Create	t	\N
76	8	2	SendToSignatoryBook	t	\N
77	8	2	EenvBasket	t	\N
78	8	2	SuiviParafBasket	t	\N
79	8	2	LateMailBasket	t	\N
80	8	2	MyBasket	t	\N
81	8	2	RetAvisBasket	t	\N
82	8	2	SupAvisBasket	t	\N
83	8	2	DdeAvisBasket	t	\N
84	8	2	CopyMailBasket	t	\N
87	9	2	Maileva_Sended	t	\N
88	9	2	AR_AlreadySend	t	\N
89	9	2	AR_Create	t	\N
90	9	2	SendToSignatoryBook	t	\N
91	9	2	EenvBasket	t	\N
92	9	2	SuiviParafBasket	t	\N
93	9	2	LateMailBasket	t	\N
94	9	2	MyBasket	t	\N
95	9	2	RetAvisBasket	t	\N
96	9	2	SupAvisBasket	t	\N
97	9	2	DdeAvisBasket	t	\N
98	9	2	CopyMailBasket	t	\N
101	10	4	SuiviParafBasket	t	\N
102	10	4	ParafBasket	t	\N
103	10	4	DepartmentBasket	t	\N
105	10	4	RetAvisBasket	t	\N
106	10	4	SupAvisBasket	t	\N
107	10	4	DdeAvisBasket	t	\N
108	10	4	CopyMailBasket	t	\N
111	11	2	Maileva_Sended	t	\N
112	11	2	AR_AlreadySend	t	\N
113	11	2	AR_Create	t	\N
114	11	2	SendToSignatoryBook	t	\N
115	11	2	EenvBasket	t	\N
116	11	2	SuiviParafBasket	t	\N
117	11	2	LateMailBasket	t	\N
118	11	2	MyBasket	t	\N
119	11	2	RetAvisBasket	t	\N
120	11	2	SupAvisBasket	t	\N
121	11	2	DdeAvisBasket	t	\N
122	11	2	CopyMailBasket	t	\N
125	12	2	Maileva_Sended	t	\N
126	12	2	AR_AlreadySend	t	\N
127	12	2	AR_Create	t	\N
128	12	2	SendToSignatoryBook	t	\N
129	12	2	EenvBasket	t	\N
130	12	2	SuiviParafBasket	t	\N
131	12	2	LateMailBasket	t	\N
132	12	2	MyBasket	t	\N
133	12	2	RetAvisBasket	t	\N
134	12	2	SupAvisBasket	t	\N
135	12	2	DdeAvisBasket	t	\N
136	12	2	CopyMailBasket	t	\N
139	13	2	Maileva_Sended	t	\N
140	13	2	AR_AlreadySend	t	\N
141	13	2	AR_Create	t	\N
142	13	2	SendToSignatoryBook	t	\N
143	13	2	EenvBasket	t	\N
144	13	2	SuiviParafBasket	t	\N
145	13	2	LateMailBasket	t	\N
146	13	2	MyBasket	t	\N
147	13	2	RetAvisBasket	t	\N
148	13	2	SupAvisBasket	t	\N
149	13	2	DdeAvisBasket	t	\N
150	13	2	CopyMailBasket	t	\N
151	14	4	SendToSignatoryBook	t	\N
152	14	4	EenvBasket	t	\N
153	14	4	SuiviParafBasket	t	\N
154	14	4	ParafBasket	t	\N
155	14	4	DepartmentBasket	t	\N
156	14	4	MyBasket	t	\N
157	14	4	RetAvisBasket	t	\N
158	14	4	SupAvisBasket	t	\N
159	14	4	DdeAvisBasket	t	\N
160	14	4	CopyMailBasket	t	\N
163	15	2	Maileva_Sended	t	\N
164	15	2	AR_AlreadySend	t	\N
165	15	2	AR_Create	t	\N
166	15	2	SendToSignatoryBook	t	\N
167	15	2	EenvBasket	t	\N
168	15	2	SuiviParafBasket	t	\N
169	15	2	LateMailBasket	t	\N
170	15	2	MyBasket	t	\N
171	15	2	RetAvisBasket	t	\N
172	15	2	SupAvisBasket	t	\N
173	15	2	DdeAvisBasket	t	\N
174	15	2	CopyMailBasket	t	\N
177	16	2	Maileva_Sended	t	\N
178	16	2	AR_AlreadySend	t	\N
179	16	2	AR_Create	t	\N
180	16	2	SendToSignatoryBook	t	\N
181	16	2	EenvBasket	t	\N
182	16	2	SuiviParafBasket	t	\N
183	16	2	LateMailBasket	t	\N
184	16	2	MyBasket	t	\N
185	16	2	RetAvisBasket	t	\N
186	16	2	SupAvisBasket	t	\N
187	16	2	DdeAvisBasket	t	\N
188	16	2	CopyMailBasket	t	\N
189	17	4	SendToSignatoryBook	t	\N
190	17	4	EenvBasket	t	\N
191	17	4	SuiviParafBasket	t	\N
192	17	4	ParafBasket	t	\N
193	17	4	DepartmentBasket	t	\N
194	17	4	MyBasket	t	\N
195	17	4	RetAvisBasket	t	\N
196	17	4	SupAvisBasket	t	\N
197	17	4	DdeAvisBasket	t	\N
198	17	4	CopyMailBasket	t	\N
199	18	1	NumericBasket	t	\N
200	18	1	RetourCourrier	t	\N
201	18	1	QualificationBasket	t	\N
202	18	3	ValidationBasket	t	\N
205	19	2	Maileva_Sended	t	\N
206	19	2	AR_AlreadySend	t	\N
207	19	2	AR_Create	t	\N
208	19	2	SendToSignatoryBook	t	\N
209	19	2	EenvBasket	t	\N
210	19	2	SuiviParafBasket	t	\N
211	19	2	LateMailBasket	t	\N
212	19	2	MyBasket	t	\N
213	19	2	RetAvisBasket	t	\N
214	19	2	SupAvisBasket	t	\N
215	19	2	DdeAvisBasket	t	\N
216	19	2	CopyMailBasket	t	\N
219	20	2	Maileva_Sended	t	\N
220	20	2	AR_AlreadySend	t	\N
221	20	2	AR_Create	t	\N
222	20	2	SendToSignatoryBook	t	\N
223	20	2	EenvBasket	t	\N
224	20	2	SuiviParafBasket	t	\N
225	20	2	LateMailBasket	t	\N
226	20	2	MyBasket	t	\N
227	20	2	RetAvisBasket	t	\N
228	20	2	SupAvisBasket	t	\N
229	20	2	DdeAvisBasket	t	\N
230	20	2	CopyMailBasket	t	\N
231	21	1	NumericBasket	t	\N
232	21	1	RetourCourrier	t	\N
233	21	1	QualificationBasket	t	\N
234	22	10	AckArcBasket	t	\N
235	22	10	SentArcBasket	t	\N
236	22	10	ToArcBasket	t	\N
237	10	4	EenvBasket	t	\N
238	10	4	MyBasket	t	\N
251	2	2	outlook_mails	t	\N
252	4	2	outlook_mails	t	\N
253	8	2	outlook_mails	t	\N
254	9	2	outlook_mails	t	\N
255	11	2	outlook_mails	t	\N
256	12	2	outlook_mails	t	\N
257	13	2	outlook_mails	t	\N
258	15	2	outlook_mails	t	\N
259	16	2	outlook_mails	t	\N
260	19	2	outlook_mails	t	\N
261	20	2	outlook_mails	t	\N
262	1	7	outlook_mails	t	\N
263	7	7	outlook_mails	t	\N
264	1	4	outlook_mails	t	\N
265	3	4	outlook_mails	t	\N
266	6	4	outlook_mails	t	\N
267	7	4	outlook_mails	t	\N
268	10	4	outlook_mails	t	\N
269	14	4	outlook_mails	t	\N
270	17	4	outlook_mails	t	\N
271	18	1	outlook_mails	t	\N
272	21	1	outlook_mails	t	\N
273	18	3	outlook_mails	t	\N
\.


--
-- Data for Name: users_email_signatures; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.users_email_signatures (id, user_id, html_body, title) FROM stdin;
\.


--
-- Data for Name: users_entities; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.users_entities (user_id, entity_id, user_role, primary_entity) FROM stdin;
1	DGS		Y
2	DSI		Y
3	DSI		Y
5	ELUS		Y
6	CCAS		Y
7	CAB		Y
8	DGA		Y
9	PCU		Y
10	VILLE		Y
11	PSF		Y
12	DRH		Y
13	SP		Y
14	FIN		Y
15	PE		Y
17	DGA		Y
19	PJS		Y
20	PJU		Y
22	COR		Y
24	VILLE		Y
23	VILLE		Y
23	CCAS		N
21	COU	Agent service courrier	Y
16	PTE	Responsable de pôle	Y
18	DSG	Superviseur courrier	Y
4	PSO	Responsable Pole Social	Y
\.


--
-- Data for Name: users_followed_resources; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.users_followed_resources (id, res_id, user_id) FROM stdin;
\.


--
-- Data for Name: users_pinned_folders; Type: TABLE DATA; Schema: public; Owner: congodigital
--

COPY public.users_pinned_folders (id, folder_id, user_id) FROM stdin;
\.


--
-- Name: acknowledgement_receipts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.acknowledgement_receipts_id_seq', 1, false);


--
-- Name: actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.actions_id_seq', 538, false);


--
-- Name: address_sectors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.address_sectors_id_seq', 1, false);


--
-- Name: adr_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.adr_attachments_id_seq', 1, false);


--
-- Name: adr_letterbox_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.adr_letterbox_id_seq', 1, false);


--
-- Name: attachment_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.attachment_types_id_seq', 12, false);


--
-- Name: baskets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.baskets_id_seq', 26, false);


--
-- Name: blacklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.blacklist_id_seq', 1, false);


--
-- Name: configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.configurations_id_seq', 11, false);


--
-- Name: contacts_civilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.contacts_civilities_id_seq', 7, false);


--
-- Name: contacts_custom_fields_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.contacts_custom_fields_list_id_seq', 1, false);


--
-- Name: contacts_filling_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.contacts_filling_id_seq', 2, false);


--
-- Name: contacts_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.contacts_groups_id_seq', 1, false);


--
-- Name: contacts_groups_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.contacts_groups_lists_id_seq', 1, false);


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.contacts_id_seq', 12, false);


--
-- Name: contacts_parameters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.contacts_parameters_id_seq', 18, false);


--
-- Name: custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.custom_fields_id_seq', 6, false);


--
-- Name: difflist_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.difflist_roles_id_seq', 1, false);


--
-- Name: docservers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.docservers_id_seq', 14, false);


--
-- Name: doctypes_first_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.doctypes_first_level_id_seq', 2, false);


--
-- Name: doctypes_second_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.doctypes_second_level_id_seq', 13, false);


--
-- Name: doctypes_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.doctypes_type_id_seq', 1204, false);


--
-- Name: emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.emails_id_seq', 1, false);


--
-- Name: entities_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.entities_folders_id_seq', 761, false);


--
-- Name: entities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.entities_id_seq', 21, false);


--
-- Name: exports_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.exports_templates_id_seq', 3, false);


--
-- Name: folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.folders_id_seq', 39, false);


--
-- Name: groupbasket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.groupbasket_id_seq', 38, false);


--
-- Name: groupbasket_redirect_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.groupbasket_redirect_system_id_seq', 734, false);


--
-- Name: history_batch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.history_batch_id_seq', 1, false);


--
-- Name: history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.history_id_seq', 1, false);


--
-- Name: indexing_models_entities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.indexing_models_entities_id_seq', 6, false);


--
-- Name: indexing_models_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.indexing_models_fields_id_seq', 93, false);


--
-- Name: indexing_models_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.indexing_models_id_seq', 9, false);


--
-- Name: list_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.list_templates_id_seq', 1011, false);


--
-- Name: list_templates_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.list_templates_items_id_seq', 45, false);


--
-- Name: listinstance_history_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.listinstance_history_details_id_seq', 1, false);


--
-- Name: listinstance_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.listinstance_history_id_seq', 1, false);


--
-- Name: listinstance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.listinstance_id_seq', 1, false);


--
-- Name: notes_entities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.notes_entities_id_seq', 20, false);


--
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.notes_id_seq', 1, false);


--
-- Name: notif_email_stack_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.notif_email_stack_seq', 1, false);


--
-- Name: notif_event_stack_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.notif_event_stack_seq', 1, false);


--
-- Name: notifications_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.notifications_seq', 101, false);


--
-- Name: password_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.password_history_id_seq', 1, false);


--
-- Name: password_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.password_rules_id_seq', 9, false);


--
-- Name: redirected_baskets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.redirected_baskets_id_seq', 1, false);


--
-- Name: registered_mail_issuing_sites_entities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.registered_mail_issuing_sites_entities_id_seq', 3, false);


--
-- Name: registered_mail_issuing_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.registered_mail_issuing_sites_id_seq', 2, false);


--
-- Name: registered_mail_number_range_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.registered_mail_number_range_id_seq', 4, false);


--
-- Name: registered_mail_resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.registered_mail_resources_id_seq', 1, false);


--
-- Name: res_attachment_res_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.res_attachment_res_id_seq', 1, false);


--
-- Name: res_id_mlb_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.res_id_mlb_seq', 100, false);


--
-- Name: resource_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.resource_contacts_id_seq', 1, false);


--
-- Name: resources_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.resources_folders_id_seq', 1, false);


--
-- Name: resources_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.resources_tags_id_seq', 1, false);


--
-- Name: search_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.search_templates_id_seq', 3, false);


--
-- Name: security_security_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.security_security_id_seq', 613, false);


--
-- Name: shipping_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.shipping_templates_id_seq', 2, false);


--
-- Name: shippings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.shippings_id_seq', 1, false);


--
-- Name: status_identifier_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.status_identifier_seq', 43, false);


--
-- Name: status_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.status_images_id_seq', 31, false);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.tags_id_seq', 14, false);


--
-- Name: templates_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.templates_association_id_seq', 627, false);


--
-- Name: templates_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.templates_seq', 1049, false);


--
-- Name: tiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.tiles_id_seq', 20, false);


--
-- Name: user_signatures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.user_signatures_id_seq', 1, false);


--
-- Name: usergroups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.usergroups_id_seq', 14, false);


--
-- Name: users_baskets_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.users_baskets_preferences_id_seq', 274, false);


--
-- Name: users_email_signatures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.users_email_signatures_id_seq', 1, false);


--
-- Name: users_followed_resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.users_followed_resources_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.users_id_seq', 25, false);


--
-- Name: users_pinned_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: congodigital
--

SELECT pg_catalog.setval('public.users_pinned_folders_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

