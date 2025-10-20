--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6 (Debian 15.6-1.pgdg110+2)
-- Dumped by pg_dump version 15.6 (Debian 15.6-1.pgdg110+2)

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
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: kommonitor
--

ALTER SCHEMA tiger OWNER TO kommonitor;

--
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: kommonitor
--

ALTER SCHEMA tiger_data OWNER TO kommonitor;

--
-- Name: topology; Type: SCHEMA; Schema: -; Owner: kommonitor
--

ALTER SCHEMA topology OWNER TO kommonitor;

--
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: kommonitor
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: GEORESOURCE_0; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public."GEORESOURCE_0" (
    fid integer NOT NULL,
    "ID" character varying,
    "NAME" character varying,
    fid_1 character varying,
    gml_id character varying,
    "E_Auto" character varying,
    persons character varying,
    gebaeude_2 character varying,
    gebaeude_1 character varying,
    "WPumpe" character varying,
    gebaeudefu character varying,
    grundflaec character varying,
    "Lon" character varying,
    "Lat" character varying,
    _uid_ character varying,
    geometry public.geometry,
    "validStartDate" date,
    "validEndDate" date,
    "arisenFrom" character varying
);


ALTER TABLE public."GEORESOURCE_0" OWNER TO kommonitor;

--
-- Name: GEORESOURCE_0_fid_seq; Type: SEQUENCE; Schema: public; Owner: kommonitor
--

CREATE SEQUENCE public."GEORESOURCE_0_fid_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GEORESOURCE_0_fid_seq" OWNER TO kommonitor;

--
-- Name: GEORESOURCE_0_fid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kommonitor
--

ALTER SEQUENCE public."GEORESOURCE_0_fid_seq" OWNED BY public."GEORESOURCE_0".fid;


--
-- Name: SPATIAL_UNIT_0; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public."SPATIAL_UNIT_0" (
    fid integer NOT NULL,
    "ID" character varying,
    "NAME" character varying,
    fid_1 character varying,
    "Name" character varying,
    geometry public.geometry,
    "validStartDate" date,
    "validEndDate" date,
    "arisenFrom" character varying
);


ALTER TABLE public."SPATIAL_UNIT_0" OWNER TO kommonitor;

--
-- Name: SPATIAL_UNIT_0_fid_seq; Type: SEQUENCE; Schema: public; Owner: kommonitor
--

CREATE SEQUENCE public."SPATIAL_UNIT_0_fid_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SPATIAL_UNIT_0_fid_seq" OWNER TO kommonitor;

--
-- Name: SPATIAL_UNIT_0_fid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kommonitor
--

ALTER SEQUENCE public."SPATIAL_UNIT_0_fid_seq" OWNED BY public."SPATIAL_UNIT_0".fid;


--
-- Name: SPATIAL_UNIT_1; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public."SPATIAL_UNIT_1" (
    fid integer NOT NULL,
    "ID" character varying,
    "NAME" character varying,
    "Block_ID" character varying,
    "Block_Name" character varying,
    geometry public.geometry,
    "validStartDate" date,
    "validEndDate" date,
    "arisenFrom" character varying
);


ALTER TABLE public."SPATIAL_UNIT_1" OWNER TO kommonitor;

--
-- Name: SPATIAL_UNIT_1_fid_seq; Type: SEQUENCE; Schema: public; Owner: kommonitor
--

CREATE SEQUENCE public."SPATIAL_UNIT_1_fid_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SPATIAL_UNIT_1_fid_seq" OWNER TO kommonitor;

--
-- Name: SPATIAL_UNIT_1_fid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kommonitor
--

ALTER SEQUENCE public."SPATIAL_UNIT_1_fid_seq" OWNED BY public."SPATIAL_UNIT_1".fid;


--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO kommonitor;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO kommonitor;

--
-- Name: defaultclassificationmappingitemtype; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.defaultclassificationmappingitemtype (
    mappingid character varying(255) NOT NULL,
    spatialunitid character varying(255),
    breaks real[]
);


ALTER TABLE public.defaultclassificationmappingitemtype OWNER TO kommonitor;

--
-- Name: georesourcereference; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.georesourcereference (
    entryid character varying(255) NOT NULL,
    mainindicatorid character varying(255),
    referencedescription text,
    referencedgeoresourceid character varying(255)
);


ALTER TABLE public.georesourcereference OWNER TO kommonitor;

--
-- Name: georesources_favourites; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.georesources_favourites (
    user_id character varying(255) NOT NULL,
    dataset_id character varying(255) NOT NULL
);


ALTER TABLE public.georesources_favourites OWNER TO kommonitor;

--
-- Name: gt_pk_metadata; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.gt_pk_metadata (
    table_schema character varying(32) NOT NULL,
    table_name character varying(32) NOT NULL,
    pk_column character varying(32) NOT NULL,
    pk_column_idx integer,
    pk_policy character varying(32),
    pk_sequence character varying(64),
    CONSTRAINT check_positive CHECK (((pk_policy)::text = ANY (ARRAY[('sequence'::character varying)::text, ('assigned'::character varying)::text, ('autogenerated'::character varying)::text])))
);


ALTER TABLE public.gt_pk_metadata OWNER TO kommonitor;

--
-- Name: indicator_tags; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.indicator_tags (
    dataset_id character varying(255) NOT NULL,
    tag character varying(255)
);


ALTER TABLE public.indicator_tags OWNER TO kommonitor;

--
-- Name: indicator_timestamps; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.indicator_timestamps (
    dataset_id character varying(255) NOT NULL,
    "timestamp" character varying(255)
);


ALTER TABLE public.indicator_timestamps OWNER TO kommonitor;

--
-- Name: indicatorreference; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.indicatorreference (
    entryid character varying(255) NOT NULL,
    indicatorid character varying(255),
    referencedescription text,
    referencedindicatorid character varying(255)
);


ALTER TABLE public.indicatorreference OWNER TO kommonitor;

--
-- Name: indicators_favourites; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.indicators_favourites (
    user_id character varying(255) NOT NULL,
    dataset_id character varying(255) NOT NULL
);


ALTER TABLE public.indicators_favourites OWNER TO kommonitor;

--
-- Name: indicatorspatialunits; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.indicatorspatialunits (
    ispublic boolean,
    defaultstylename character varying(255),
    entryid character varying(255) NOT NULL,
    indicatormetadataid character varying(255),
    indicatorname character varying(255),
    indicatorvaluetablename character varying(255),
    owner_organizationalunitid character varying(255),
    spatialunitid character varying(255),
    spatialunitname character varying(255),
    wfsurl character varying(255),
    wmsurl character varying(255)
);


ALTER TABLE public.indicatorspatialunits OWNER TO kommonitor;

--
-- Name: indicatorspatialunits_permissions; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.indicatorspatialunits_permissions (
    indicatorspatialunit_id character varying(255) NOT NULL,
    permission_id character varying(255) NOT NULL
);


ALTER TABLE public.indicatorspatialunits_permissions OWNER TO kommonitor;

--
-- Name: lastmodification; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.lastmodification (
    accesscontrol timestamp with time zone,
    georesources timestamp with time zone,
    indicators timestamp with time zone,
    processscripts timestamp with time zone,
    spatialunits timestamp with time zone,
    topics timestamp with time zone,
    id character varying(255) NOT NULL
);


ALTER TABLE public.lastmodification OWNER TO kommonitor;

--
-- Name: metadatageoresources; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.metadatageoresources (
    isaoi boolean NOT NULL,
    isloi boolean NOT NULL,
    ispoi boolean NOT NULL,
    ispublic boolean,
    loiwidth integer,
    poimarkercolor smallint,
    poimarkerstyle integer DEFAULT 1,
    poisymbolcolor smallint,
    sridepsg integer NOT NULL,
    lastupdate timestamp with time zone,
    aoicolor character varying(255),
    contact text,
    databasis text,
    datasource text,
    datasetid character varying(255) NOT NULL,
    datasetname character varying(255),
    dbtablename character varying(255),
    description text,
    jsonschema text,
    literature text,
    loicolor character varying(255),
    loidasharraystring character varying(255),
    note text,
    owner_organizationalunitid character varying(255),
    poimarkertext character varying(255),
    poisymbolbootstrap3name character varying(255),
    topicreference character varying(255),
    updateintervall character varying(255),
    wfsurl character varying(255),
    wmsurl character varying(255)
);


ALTER TABLE public.metadatageoresources OWNER TO kommonitor;

--
-- Name: metadatageoresources_permissions; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.metadatageoresources_permissions (
    metadatageoresources_id character varying(255) NOT NULL,
    permission_id character varying(255) NOT NULL
);


ALTER TABLE public.metadatageoresources_permissions OWNER TO kommonitor;

--
-- Name: metadataindicators; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.metadataindicators (
    classificationmethod integer DEFAULT 2,
    creationtype smallint,
    displayorder integer NOT NULL,
    indicatortype smallint,
    isheadlineindicator boolean NOT NULL,
    ispublic boolean,
    numclasses integer DEFAULT 5,
    lastupdate timestamp with time zone,
    abbreviation character varying(255),
    characteristicvalue character varying(255),
    colorbrewerschemename character varying(255),
    contact text,
    databasis text,
    datasource text,
    datasetid character varying(255) NOT NULL,
    datasetname character varying(255),
    dbtablename character varying(255),
    description text,
    interpretation character varying(255),
    jsonschema text,
    literature text,
    lowestspatialunitforcomputation character varying(255),
    note text,
    owner_organizationalunitid character varying(255),
    processdescription text,
    referencedatenote character varying(255),
    topicreference character varying(255),
    unit character varying(255),
    updateintervall character varying(255),
    wfsurl character varying(255),
    wmsurl character varying(255),
    "precision" integer
);


ALTER TABLE public.metadataindicators OWNER TO kommonitor;

--
-- Name: metadataindicators_defaultclassification; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.metadataindicators_defaultclassification (
    dataset_id character varying(255) NOT NULL,
    mapping_id character varying(255) NOT NULL
);


ALTER TABLE public.metadataindicators_defaultclassification OWNER TO kommonitor;

--
-- Name: metadataindicators_permissions; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.metadataindicators_permissions (
    metadataindicators_id character varying(255) NOT NULL,
    permission_id character varying(255) NOT NULL
);


ALTER TABLE public.metadataindicators_permissions OWNER TO kommonitor;

--
-- Name: metadataindicators_regionalreferencevalues; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.metadataindicators_regionalreferencevalues (
    dataset_id character varying(255) NOT NULL,
    mapping_id character varying(255) NOT NULL
);


ALTER TABLE public.metadataindicators_regionalreferencevalues OWNER TO kommonitor;

--
-- Name: metadataspatialunits; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.metadataspatialunits (
    isoutlinelayer boolean NOT NULL,
    ispublic boolean,
    outlinewidth integer,
    sridepsg integer NOT NULL,
    lastupdate timestamp with time zone,
    contact text,
    databasis text,
    datasource text,
    datasetid character varying(255) NOT NULL,
    datasetname character varying(255),
    dbtablename character varying(255),
    description text,
    jsonschema text,
    literature text,
    nextlowerhierarchylevel character varying(255),
    nextupperhierarchylevel character varying(255),
    note text,
    outlinecolor character varying(255),
    outlinedasharraystring character varying(255),
    owner_organizationalunitid character varying(255),
    updateintervall character varying(255),
    wfsurl character varying(255),
    wmsurl character varying(255)
);


ALTER TABLE public.metadataspatialunits OWNER TO kommonitor;

--
-- Name: metadataspatialunits_permissions; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.metadataspatialunits_permissions (
    metadataspatialunits_id character varying(255) NOT NULL,
    permission_id character varying(255) NOT NULL
);


ALTER TABLE public.metadataspatialunits_permissions OWNER TO kommonitor;

--
-- Name: organizationalunits; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.organizationalunits (
    ismandant boolean NOT NULL,
    keycloakid uuid NOT NULL,
    contact character varying(255) NOT NULL,
    description character varying(255),
    mandant character varying(255),
    name character varying(255) NOT NULL,
    organizationalunitid character varying(255) NOT NULL,
    parent character varying(255)
);


ALTER TABLE public.organizationalunits OWNER TO kommonitor;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.permissions (
    permissionlevel smallint,
    name character varying(255),
    organizationalunit character varying(255) NOT NULL,
    permissionid character varying(255) NOT NULL,
    permissiontype character varying(255)
);


ALTER TABLE public.permissions OWNER TO kommonitor;

--
-- Name: regionalreferencevaluetype; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.regionalreferencevaluetype (
    regionalaverage real,
    regionalsum real,
    spatiallyunassignable real,
    mappingid character varying(255) NOT NULL,
    referencedate character varying(255)
);


ALTER TABLE public.regionalreferencevaluetype OWNER TO kommonitor;

--
-- Name: scriptinputparameters; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.scriptinputparameters (
    datatype smallint,
    maxparametervaluefornumericinputs double precision NOT NULL,
    minparametervaluefornumericinputs double precision NOT NULL,
    defaultvalue text,
    description text,
    inputparameterid character varying(255) NOT NULL,
    name character varying(255)
);


ALTER TABLE public.scriptinputparameters OWNER TO kommonitor;

--
-- Name: scriptmetadata; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.scriptmetadata (
    lastupdate timestamp with time zone,
    description text,
    indicatorid character varying(255),
    name character varying(255),
    scriptid character varying(255) NOT NULL,
    scripttype character varying(255),
    scriptcode bytea
);


ALTER TABLE public.scriptmetadata OWNER TO kommonitor;

--
-- Name: scripts_inputparameters; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.scripts_inputparameters (
    inputparameter_id character varying(255) NOT NULL,
    script_id character varying(255) NOT NULL
);


ALTER TABLE public.scripts_inputparameters OWNER TO kommonitor;

--
-- Name: scripts_requiredgeoresources; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.scripts_requiredgeoresources (
    dataset_id character varying(255) NOT NULL,
    script_id character varying(255) NOT NULL
);


ALTER TABLE public.scripts_requiredgeoresources OWNER TO kommonitor;

--
-- Name: scripts_requiredindicators; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.scripts_requiredindicators (
    dataset_id character varying(255) NOT NULL,
    script_id character varying(255) NOT NULL
);


ALTER TABLE public.scripts_requiredindicators OWNER TO kommonitor;

--
-- Name: topics; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.topics (
    topicresource smallint,
    topictype smallint,
    topicdescription text,
    topicid character varying(255) NOT NULL,
    topicname character varying(255)
);


ALTER TABLE public.topics OWNER TO kommonitor;

--
-- Name: topics_favourites; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.topics_favourites (
    user_id character varying(255) NOT NULL,
    topic_id character varying(255) NOT NULL
);


ALTER TABLE public.topics_favourites OWNER TO kommonitor;

--
-- Name: topics_subtopics; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.topics_subtopics (
    main_topic_id character varying(255) NOT NULL,
    subtopics_topicid character varying(255) NOT NULL
);


ALTER TABLE public.topics_subtopics OWNER TO kommonitor;

--
-- Name: userinfo; Type: TABLE; Schema: public; Owner: kommonitor
--

CREATE TABLE public.userinfo (
    userinfoid character varying(255) NOT NULL,
    keycloakid character varying(255) NOT NULL
);


ALTER TABLE public.userinfo OWNER TO kommonitor;

--
-- Name: GEORESOURCE_0 fid; Type: DEFAULT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public."GEORESOURCE_0" ALTER COLUMN fid SET DEFAULT nextval('public."GEORESOURCE_0_fid_seq"'::regclass);


--
-- Name: SPATIAL_UNIT_0 fid; Type: DEFAULT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public."SPATIAL_UNIT_0" ALTER COLUMN fid SET DEFAULT nextval('public."SPATIAL_UNIT_0_fid_seq"'::regclass);


--
-- Name: SPATIAL_UNIT_1 fid; Type: DEFAULT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public."SPATIAL_UNIT_1" ALTER COLUMN fid SET DEFAULT nextval('public."SPATIAL_UNIT_1_fid_seq"'::regclass);


--
-- Data for Name: GEORESOURCE_0; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public."GEORESOURCE_0" (fid, "ID", "NAME", fid_1, gml_id, "E_Auto", persons, gebaeude_2, gebaeude_1, "WPumpe", gebaeudefu, grundflaec, "Lon", "Lat", _uid_, geometry, "validStartDate", "validEndDate", "arisenFrom") FROM stdin;
1	13868.0	DENW05AL10002Hax	6.0	DENW05AL10002Hax	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	113.8672855347395	377595.6278081739	5713697.334210398	13868.0	01060000000100000001030000000100000005000000D8E6846BADEF1C40C782A438D2C74940BB906CDFCEEF1C40F43FA1D7D2C749406DFA43A3DBEF1C4059029756CFC749406FFED793BAEF1C405DDD599FCEC74940D8E6846BADEF1C40C782A438D2C74940	2000-01-01	\N	\N
2	13873.0	DENW05AL10002Hdq	7.0	DENW05AL10002Hdq	0	20	Gemischt genutztes Gebäude mit Wohnen ist ein Gebäude, in dem sowohl gewohnt wird, als auch Teile des Gebäudes zum Anbieten von Dienstleistungen, zur Durchführung von öffentlichen oder privaten Verwaltungsarbeiten, zur gewerblichen oder industrielle	Gemischt genutztes Gebäude mit Wohnen	0	1100	365.0502570196986	378169.21792756685	5713550.333808939	13873.0	01060000000100000001030000000100000006000000823E979709F81C4097864D63A8C74940CDF8DD9A74F81C4092E5B371ADC74940DEE90F708AF81C40D95EAAACAAC7494088051B551FF81C40A0CCCE9FA5C749403306DE8414F81C40762CDEFCA6C74940823E979709F81C4097864D63A8C74940	2000-01-01	\N	\N
3	13876.0	DENW05AL10002HeR	8.0	DENW05AL10002HeR	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	176.1702334600559	377820.6713305017	5713530.081503829	13876.0	0106000000010000000103000000010000000D000000CCBC505838F31C401C60D4B59FC7494043968DD412F31C408A6E2DE69FC749403BDF736512F31C4029F7F4619FC749401F1B85E404F31C406BAD60739FC7494081A7F5C707F31C403FD453DDA2C749406BE358F819F31C40075BEBC2A2C749400E79A6DC19F31C40F6E185A5A2C74940626F2CB835F31C40D7F90D7DA2C749407540EDD235F31C40D8AE5F9AA2C749408015D9D147F31C40ACC33F80A2C749402923B9EF44F31C402D1630189FC7494046344EE037F31C406880D7289FC74940CCBC505838F31C401C60D4B59FC74940	2000-01-01	\N	\N
4	13877.0	DENW05AL10002Hff	9.0	DENW05AL10002Hff	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	151.7358409045264	377646.3583674864	5713392.834874419	13877.0	010600000001000000010300000001000000090000002CDA4A5C83F01C408E4EAE4878C74940EA3A566892F01C402483487878C749403D6D88B090F01C40411CC95079C74940C956DD71A7F01C40DF97C49879C749409706A22AA9F01C40247344C078C749409DF06523B8F01C409C499BEF78C7494037F53DA3BDF01C40505CB52C76C74940BBF3E6D688F01C40F889218775C749402CDA4A5C83F01C408E4EAE4878C74940	2000-01-01	\N	\N
5	13889.0	DENW05AL10002Hic	10.0	DENW05AL10002Hic	0	18	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	282.7210301536252	377785.600753421	5713633.303327385	13889.0	0106000000010000000103000000010000000E000000D74564777BF21C40512880FEBBC74940E1F8868F7FF21C407BDDC298C1C749403C05249786F21C403587E419C2C749403153A8E3BAF21C407F58D915C2C74940C3AC98AEBAF21C40C8ACD1EABEC7494020A28ADDAAF21C40F9ECE3E7BEC74940E7C2F9B9AAF21C4070E55A44BEC74940DFF95E24A4F21C40E3174844BEC749401D84C475A0F21C404F2B5A04BEC74940532EF812A1F21C405425B1F6BDC7494016E7745BA0F21C40669E022DBDC74940A1CF89FDA7F21C40DFC3E425BDC749401012BBCFA6F21C40779675C3BBC74940D74564777BF21C40512880FEBBC74940	2000-01-01	\N	\N
6	13895.0	DENW05AL10002HKh	11.0	DENW05AL10002HKh	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	68.37565643597918	377404.71758636873	5713598.632806175	13895.0	0106000000010000000103000000010000000D0000005DC1C56205ED1C40BAC3FCB3B0C74940C46C368BF0EC1C40B14434C3B0C749409FF0BF72F0EC1C402BC46A7FB0C74940F624358BEFEC1C4088CEE27FB0C74940A39392DCF0EC1C406B627A13B4C7494051125D9DF1EC1C40CB451613B4C7494073211D94F1EC1C40791BBEF8B3C74940A506DA6906ED1C40C93D50ECB3C7494063DDD57306ED1C400CE06907B4C74940D4E7463808ED1C401CA67406B4C74940852BFCEB06ED1C402255F36EB0C74940F7C2804405ED1C4053763070B0C749405DC1C56205ED1C40BAC3FCB3B0C74940	2000-01-01	\N	\N
7	13904.0	DENW05AL10002HlA	12.0	DENW05AL10002HlA	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	88.27317807777398	377831.8546680726	5713659.99955585	13904.0	0106000000010000000103000000010000000A000000733C5D4D42F31C404502D9F4C5C74940696AAD0634F31C40D1CB1CF7C5C749405E11A4F133F31C40489EDCBFC8C74940B479862347F31C407A53E3BBC8C7494072676A1747F31C40C9C23147C9C749407966306649F31C4061E6A446C9C74940A381503154F31C404D71E943C9C749402AC87BFA53F31C40AC3F58D6C5C749407010954B42F31C40A9CC2DD8C5C74940733C5D4D42F31C404502D9F4C5C74940	2000-01-01	\N	\N
8	13926.0	DENW05AL10002Hop	13.0	DENW05AL10002Hop	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	233.4077756605111	377623.08293685643	5713464.067139035	13926.0	010600000001000000010300000001000000070000005135978727F01C4042F7B6B089C7494001B16E082BF01C40D37D24058FC7494012C1293556F01C40AE18BDD58EC74940851B1BAB5BF01C40E4B2C4CF8EC74940E7ED32D85AF01C400FF526878DC74940D3A5344558F01C40A486DC7E89C749405135978727F01C4042F7B6B089C74940	2000-01-01	\N	\N
9	13937.0	DENW05AL10002Hre	14.0	DENW05AL10002Hre	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	150.12896936712787	377417.9335050167	5713460.427345388	13937.0	0106000000010000000103000000010000000700000063F76E2050ED1C40ACD9FE7B87C749408F7776B22EED1C403E203C1387C74940DC15DB7B28ED1C402976AE348AC74940EE43136525ED1C40D9154DC38BC749402DEB270025ED1C40FD56F4F58BC74940109DBD5946ED1C40EA8EFA5E8CC7494063F76E2050ED1C40ACD9FE7B87C74940	2000-01-01	\N	\N
10	13938.0	DENW05AL10002HRG	15.0	DENW05AL10002HRG	1	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	88.88065860862844	377872.5199655837	5713575.916833102	13938.0	01060000000100000001030000000100000009000000C4D5B5C2FCF31C407FF3B5A6ADC749402F162FDFD0F31C40262B43DEADC74940A604570DD2F31C401FADCA3FAFC7494022EEAEA3D3F31C4045CE9C3DAFC74940BAA9649FD4F31C401A33FB63B0C74940B9BC67A0F7F31C40E0D9CF39B0C749409D8F1268F6F31C40EEC08ABAAEC74940A3AFFA9CFDF31C4040419DB2AEC74940C4D5B5C2FCF31C407FF3B5A6ADC74940	2000-01-01	\N	\N
11	13946.0	DENW05AL10002HSJ	16.0	DENW05AL10002HSJ	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	191.5378979893867	378586.2921534475	5713800.446218811	13946.0	01060000000100000001030000000100000008000000564DC74733FE1C40865456EAF5C749403329B89170FE1C405EEF0EE2F8C74940D94E556384FE1C40460D255CF6C7494099FB3B8173FE1C40E666068CF5C749406C425D7548FE1C40CA7A4A79F3C74940C83F0F6F49FE1C404B4A265AF3C7494005E368EF47FE1C409C0D0248F3C74940564DC74733FE1C40865456EAF5C74940	2000-01-01	\N	\N
12	13948.0	DENW05AL10002HSS	17.0	DENW05AL10002HSS	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	150.3363981731236	377516.17140608566	5713345.271528397	13948.0	01060000000100000001030000000100000005000000DBB3969EACEE1C40C7D2DADB65C74940A6EA38ADA2EE1C4054021ABD6AC7494005F52320C4EE1C40BA7C32286BC74940A16A850FCEEE1C40B992054766C74940DBB3969EACEE1C40C7D2DADB65C74940	2000-01-01	\N	\N
13	13958.0	DENW05AL10002Hum	18.0	DENW05AL10002Hum	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	76.06495346408337	377561.5418429976	5713831.6296263635	13958.0	010600000001000000010300000001000000070000000BCF9BC04CEF1C407F8639CDF8C74940F20484E745EF1C40FD7BE6AFF8C749401E526F0E4BEF1C4044A7C93EF7C74940CE34AD4129EF1C40E7BEB68BF6C7494051B32D9521EF1C401ECA89BAF8C74940B5CC61FC49EF1C4039226B93F9C749400BCF9BC04CEF1C407F8639CDF8C74940	2000-01-01	\N	\N
14	13972.0	DENW05AL10002HW9	19.0	DENW05AL10002HW9	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	160.6497503221035	377424.7432129133	5713672.071541164	13972.0	0106000000010000000103000000010000000900000080769BC243ED1C4028CFEBBCCAC7494029E7A5C161ED1C40DB04B7D5C7C74940029D4B3456ED1C408F29E918C7C74940803D909159ED1C40E58D4ECCC6C74940B35287A852ED1C404E276C5CC6C749406FAE64BF4FED1C40954E6EAFC6C749409CA52E4B3DED1C4055E3FD81C5C7494021BEC8671FED1C40A819B36DC8C7494080769BC243ED1C4028CFEBBCCAC74940	2000-01-01	\N	\N
15	13979.0	DENW05AL10002HWL	20.0	DENW05AL10002HWL	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	87.7043012881586	377688.6065636795	5713664.07885002	13979.0	01060000000100000001030000000100000009000000FB46DED217F11C4035158806C6C74940E3ABC62618F11C405F260A76C9C74940FEE71A9A25F11C407F4CBE74C9C74940C126F58925F11C4043754EEDC8C74940A50C9CB937F11C4024CB92EBC8C74940219149C337F11C403C3EE525C6C74940CF1D822A2AF11C4087653726C6C749403ED0D7282AF11C40D6E91306C6C74940FB46DED217F11C4035158806C6C74940	2000-01-01	\N	\N
16	13991.0	DENW05AL10002Hxy	21.0	DENW05AL10002Hxy	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	100.62335909547437	377688.5121797454	5713639.855675759	13991.0	0106000000010000000103000000010000000B000000BF8C76F639F11C4010FB31D6BEC74940B575A8F219F11C403B766BD9BEC749405679CD0C1AF11C40E57AC4F2BFC74940BDA99C2513F11C4080C184F3BFC74940F285A03C13F11C4037D4D4FAC0C74940D8A2536E1AF11C40D16938FAC0C749400A5FFE851AF11C40AD1AD221C2C749402CD6CF3829F11C40D7848520C2C74940E39A613A29F11C40E9E0152BC2C7494049D982E939F11C402DD1C229C2C74940BF8C76F639F11C4010FB31D6BEC74940	2000-01-01	\N	\N
17	13992.0	DENW05AL10002Hy0	22.0	DENW05AL10002Hy0	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	225.0199429905042	377460.7890130021	5713597.037641157	13992.0	01060000000100000001030000000100000009000000C7FA2994D7ED1C40B82CE189B0C749403DB5791EC5ED1C40C6E1DDA5B0C74940821FC6D7C4ED1C40AF6F0D5BB0C74940CA87B641ADED1C401994D37EB0C749405F461963B0ED1C40D2E17C53B4C749400FFF9EB4F2ED1C40A0F8CEF4B3C7494025164B8BEFED1C40BA3A661AB0C7494090BC864BD7ED1C4009CC0F3FB0C74940C7FA2994D7ED1C40B82CE189B0C74940	2000-01-01	\N	\N
18	14005.0	DENW05AL10002HZC	23.0	DENW05AL10002HZC	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	148.56527344026836	377493.6865068809	5713557.085301261	14005.0	010600000001000000010300000001000000090000004760A7875EEE1C40FA0FC533A8C749404BF7E6665EEE1C400CFC6804A8C74940FF0F60A36DEE1C402FE69DEFA7C74940ED9DAC1B6BEE1C4040209C21A5C749403EF5BDAF32EE1C40C1D85368A5C74940D26D33BE34EE1C40607E323DA8C7494041CAACFA43EE1C40E3936728A8C749402C0A1A2644EE1C40E442CD5AA8C749404760A7875EEE1C40FA0FC533A8C74940	2000-01-01	\N	\N
19	14012.0	DENW05AL10002I0b	24.0	DENW05AL10002I0b	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	89.56403532990953	377533.2439949308	5713352.514115823	14012.0	010600000001000000010300000001000000090000005FB467D3ECEE1C40CB7342D068C7494043B8FF0EE6EE1C402DE55F2F6CC74940D435C692F7EE1C40EAA795666CC7494037D073CFF7EE1C40D7AE5F486CC749406321CAC305EF1C40B33E70746CC749402233255B0BEF1C40859DA3BA69C749405C0F465BFDEE1C409594538E69C7494075A68067FEEE1C400B9BE00769C749405FB467D3ECEE1C40CB7342D068C74940	2000-01-01	\N	\N
20	14015.0	DENW05AL10002I0X	25.0	DENW05AL10002I0X	0	11	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	212.08696288615465	377708.8037982777	5713496.154099684	14015.0	010600000001000000010300000001000000050000001180588F6AF11C4014A5F1EA98C74940541AF77895F11C405C944E2D99C749408D1ECFCA9AF11C407FFD6DB293C74940CAE6C6DD6FF11C4039B6F67493C749401180588F6AF11C4014A5F1EA98C74940	2000-01-01	\N	\N
21	14020.0	DENW05AL10002I2F	26.0	DENW05AL10002I2F	0	16	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	271.4534351362381	377780.26460568124	5713562.315466967	14020.0	0106000000010000000103000000010000000E0000008B7A421F9FF21C408121D9F8AAC74940473100BE9EF21C408A507154AAC74940948CB240AAF21C4003F71E43AAC74940B4684FD0A7F21C40642C5F47A7C74940F0402FE875F21C406885668FA7C749400521467F6FF21C403833D01EA8C74940B468060073F21C402481D79AADC749403269EEF5A1F21C403A70066CADC7494014B0DEABA0F21C400B89C900ACC749404FA1EAFC97F21C402798300AACC74940AD9D2F9697F21C40B0F5DA80ABC749409A52284F95F21C40611C8B6BABC74940DC6E8ACA98F21C40FDD02C02ABC749408B7A421F9FF21C408121D9F8AAC74940	2000-01-01	\N	\N
22	14029.0	DENW05AL10002I6P	27.0	DENW05AL10002I6P	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	109.16523978998885	377633.1739705261	5713574.237894351	14029.0	01060000000100000001030000000100000009000000919C175B6AF01C405B80168DAAC74940DA412B2155F01C405AE3C5AAAAC7494057ADEE6D46F01C40F2342FDDADC749405F83213870F01C406B0C180DAFC749408FF68E3673F01C401FDB2C75AEC74940200991E96AF01C4079DA1C36AEC749404713AA506EF01C407AB4B981ADC74940FA70A20F6DF01C40A21A8983ADC74940919C175B6AF01C405B80168DAAC74940	2000-01-01	\N	\N
23	14031.0	DENW05AL10002I8j	28.0	DENW05AL10002I8j	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	88.07638187822886	377735.369977677	5713538.398231296	14031.0	01060000000100000001030000000100000009000000A965B681E3F11C40186F9719A1C74940975F9716E4F11C401108EBA3A1C74940C89B0F3AD1F11C405BF0B1BDA1C74940663B7DD1D3F11C40042EE782A4C74940376F95CEE1F11C401E7AA56DA4C74940ACC18FEDE1F11C403053EF8CA4C749404EBDD2DBF3F11C409B0D5F70A4C749407C6AD9B5F0F11C4047B81106A1C74940A965B681E3F11C40186F9719A1C74940	2000-01-01	\N	\N
24	14036.0	DENW05AL10002I9G	29.0	DENW05AL10002I9G	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	86.6669326943811	377941.59050862223	5713657.290319958	14036.0	0106000000010000000103000000010000000C00000021818A1ED3F41C4044E2E4F6C5C74940430A0909D3F41C4062B423B2C8C749409D6CD3B8E5F41C40C57E70B2C8C74940BF7A96A2E5F41C400AC10C39C9C7494067468B22F3F41C4004DB9C37C9C7494096FDC014F3F41C405CB5BE3DC8C749407A954702F3F41C400B2584E8C6C74940A576A1F2F2F41C40AE8977D8C5C74940A9A526E9EFF41C40245E84D8C5C74940AEAD23ECE0F41C4027BFA2D8C5C74940FC8E40B7E0F41C40C33CC9F6C5C7494021818A1ED3F41C4044E2E4F6C5C74940	2000-01-01	\N	\N
25	14038.0	DENW05AL10002I9t	30.0	DENW05AL10002I9t	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	62.988396309374366	377494.90010802285	5713797.805358019	14038.0	010600000001000000010300000001000000070000003257F25A34EE1C4067539140EFC749405AB544394AEE1C400099DB30EFC74940CA68761C4AEE1C40AE8B0CE2EEC74940FB34181049EE1C409D1CF901ECC749401F3114E832EE1C40837C1212ECC749407D32883734EE1C4029E837F1EEC749403257F25A34EE1C4067539140EFC74940	2000-01-01	\N	\N
26	14046.0	DENW05AL10002IAQ	31.0	DENW05AL10002IAQ	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	150.86361808225047	377664.2971891104	5713569.329289409	14046.0	01060000000100000001030000000100000009000000F5480BF5DFF01C40C3DE81E9A9C7494011F5D6C1C5F01C40085DDA0DAAC74940A967FDEEC5F01C4057F50141AAC7494067EA9DCBB5F01C405A6C5657AAC74940C389915DB8F01C4085B68C27ADC74940FF05CD8FF1F01C40B56E48DBACC749402404F777EFF01C40CA147407AAC749401EB71D23E0F01C40BB87D01CAAC74940F5480BF5DFF01C40C3DE81E9A9C74940	2000-01-01	\N	\N
27	14047.0	DENW05AL10002IaT	32.0	DENW05AL10002IaT	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	66.47441142727621	377651.1552083382	5713542.27095387	14047.0	0106000000010000000103000000010000000A0000000734008797F01C40117709F5A1C749403DB14E629AF01C4014750DE2A4C74940CEA99BA59AF01C40EC845528A5C74940112D917BB1F01C40CF588502A5C7494086FD07F0B1F01C40C5BD9B01A5C74940F4F74EAFB1F01C406A6E20B6A4C74940D128D83AB1F01C4075090AB7A4C74940CE332893AEF01C40DE1740CFA1C7494081F54D2AAEF01C40D1492FD0A1C749400734008797F01C40117709F5A1C74940	2000-01-01	\N	\N
28	14049.0	DENW05AL10002Iax	33.0	DENW05AL10002Iax	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	153.2381148160348	377342.81648958015	5713555.763935524	14049.0	0106000000010000000103000000010000000A000000C5AD336104EC1C40315FA75CA3C74940CDC94A6A04EC1C40392BE967A3C749400B40ED4CFBEB1C4028598F74A3C749405430FE56FDEB1C408295D185A5C74940420BFAB106EC1C40FF6A2C77A5C74940CDD2A69108EC1C40CC8B028EA7C749407B034D430EEC1C4096D70B86A7C7494025E70CAB2CEC1C402250C45BA7C74940DB9E307C28EC1C40E114902EA3C74940C5AD336104EC1C40315FA75CA3C74940	2000-01-01	\N	\N
29	14050.0	DENW05AL10002Ib1	34.0	DENW05AL10002Ib1	1	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	88.42064110469073	377622.4101121836	5713609.211793308	14050.0	010600000001000000010300000001000000090000002E4010BF23F01C4098446757B5C749404016AFA51DF01C4020A7D9A7B6C74940A0A524E81EF01C401C710EB1B6C74940B086D6191AF01C40F08EC8B9B7C74940500B94CB3BF01C40DDF4F9A9B8C74940E80C093742F01C40E6C0984AB7C749404E3E71BB48F01C4088BBE67BB7C749408702FB3A4DF01C403B51C180B6C749402E4010BF23F01C4098446757B5C74940	2000-01-01	\N	\N
30	14063.0	DENW05AL10002Icm	35.0	DENW05AL10002Icm	0	14	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	284.15882389061153	377315.1010623305	5713425.412275162	14063.0	0106000000010000000103000000010000000700000029BAF64A87EB1C40096271D57FC74940FA40DEDCE4EB1C405059AED580C749408DE11E38E7EB1C40CA7CB7847FC74940D0E215D3EAEB1C4073CE58817DC74940597BB248CFEB1C40577C7A377DC749405E5307ED8CEB1C405649618A7CC7494029BAF64A87EB1C40096271D57FC74940	2000-01-01	\N	\N
31	14064.0	DENW05AL10002ICO	36.0	DENW05AL10002ICO	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	149.59083562798332	377360.91184655833	5713624.668128817	14064.0	010600000001000000010300000001000000100000009E6EB84475EC1C402F5FDEF6B9C749403236DA8369EC1C4003E2C637B9C74940F3E44E8E6AEC1C40A7B02D1EB9C74940DD1F399755EC1C40E567B5CEB7C749400B17A79E54EC1C4080FED4E6B7C74940ED600A8149EC1C40748B4E32B7C74940E583EE8B32EC1C40677C586AB9C74940F58FDDC432EC1C40B6E9126EB9C749404EBB0A7032EC1C40223D3676B9C749408E09593153EC1C4099F5F088BBC74940808471795DEC1C4025978F2FBCC74940EC744BB65DEC1C4046482533BCC749404B441E0B5EEC1C40CFF3012BBCC7494013985A685EEC1C40B81F5030BCC749408750BCE172EC1C40C9A94A32BAC749409E6EB84475EC1C402F5FDEF6B9C74940	2000-01-01	\N	\N
32	14088.0	DENW05AL10002Ieo	38.0	DENW05AL10002Ieo	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	186.7908395077102	377878.00914264476	5713632.185291079	14088.0	0106000000010000000103000000010000000C000000EC426A4801F41C40C3535904BDC74940880B645901F41C4035F49818BDC749409FADCF18DEF31C40D8B9B347BDC7494016329EE7E1F31C40CF78AAB5C1C74940D137DC5CE6F31C40ADA8EB07C2C74940DC8448520BF41C4023244607C2C74940D63085AD09F41C406C88BBDBBFC74940937FD2D510F41C40588FEED3BFC749407AC5B21510F41C40453886D4BEC7494021B31ADF08F41C40837073D8BEC7494046C0CD5E07F41C40B2AF42FCBCC74940EC426A4801F41C40C3535904BDC74940	2000-01-01	\N	\N
33	14105.0	DENW05AL10002IHj	39.0	DENW05AL10002IHj	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	88.253686060154	377800.9347743116	5713660.914185252	14105.0	010600000001000000010300000001000000090000005699FD83D2F21C4029BA02E3C5C74940C41AC1A4C0F21C408BCD99E4C5C74940915B48D0C0F21C404C242057C9C74940E4C58795CDF21C4061D13155C9C74940C0E139A8CDF21C40481FACCDC8C74940A0C2B99FE0F21C401AA4A5CAC8C7494072824CE9E0F21C40CCBA5504C6C74940F5C16375D2F21C40E3F9AE05C6C749405699FD83D2F21C4029BA02E3C5C74940	2000-01-01	\N	\N
34	14112.0	DENW05AL10002IIK	40.0	DENW05AL10002IIK	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	184.07086030952632	377604.7179434484	5713670.279839887	14112.0	0106000000010000000103000000010000000C000000BD4EBFFCF4EF1C40A967EA37CBC74940CDE2162DF7EF1C40B8704196CAC749402DCF5D29FBEF1C40B00EADA9CAC7494064DE53CAFCEF1C40BD30E749CAC7494007142DF302F01C40460C4A6ACAC7494093F9989306F01C407C7B4F7DCAC74940D2461BED0CF01C407C231CC5C8C749401883F0B5F5EF1C40B20EE03FC8C749404CCBB1A2FAEF1C4064E614D8C6C74940AD2B5E6CD9EF1C4036A06E1EC6C7494052E4E05FCAEF1C400FBDA144CAC74940BD4EBFFCF4EF1C40A967EA37CBC74940	2000-01-01	\N	\N
35	14116.0	DENW05AL10002IJV	41.0	DENW05AL10002IJV	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	90.04800618661102	377607.057767776	5713362.379409334	14116.0	010600000001000000010300000001000000090000005B1558ABFAEF1C4031C058796FC749408D9946AC08F01C40AB696EA56FC749401759A06F08F01C40A61A91C36FC749402F9182271AF01C408AC765FB6FC74940184D5DE920F01C404681B59D6CC74940712E9A2F0FF01C40F254B9656CC74940788D8A200EF01C401F6404EC6CC749404C38BA1D00F01C400538C7BF6CC749405B1558ABFAEF1C4031C058796FC74940	2000-01-01	\N	\N
36	14117.0	DENW05AL10002IK3	42.0	DENW05AL10002IK3	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	90.11833971975283	377870.45038155594	5713553.555439575	14117.0	0106000000010000000103000000010000000D0000006D055423F2F31C4007B8C29FA9C7494073EDA2EAF0F31C408858871EA8C74940074F063BF8F31C401FC55E15A8C749406B9C1067F7F31C4007933F11A7C74940E39F08A5CCF31C40335B893FA7C749405100999ECCF31C40EA448428A7C74940DB6E58E2C9F31C40808B7B2CA7C7494064EF8C11CAF31C4041D7565FA7C749404B461F20CBF31C4028C6E25DA7C749404D8FA74CCCF31C40EED27AA8A8C74940AE15EEC4CDF31C40CD7078A6A8C749407A69D2D1CEF31C40E235A0CDA9C749406D055423F2F31C4007B8C29FA9C74940	2000-01-01	\N	\N
37	14126.0	DENW05AL10002IM9	43.0	DENW05AL10002IM9	1	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	102.8474235573085	377378.35978692444	5713603.554634006	14126.0	0106000000010000000103000000010000000600000010E4991086EC1C4099B5B2F5B1C74940489561FC86EC1C40550FDEE3B3C7494004396B5187EC1C40E3271E4EB5C74940EAC1E694A9EC1C40892D4F39B5C749407BE1D05FA8EC1C40BD8975E0B1C7494010E4991086EC1C4099B5B2F5B1C74940	2000-01-01	\N	\N
38	14135.0	DENW05AL10002Inp	44.0	DENW05AL10002Inp	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	100.17682692781091	377288.6851899612	5713191.315291186	14135.0	010600000001000000010300000001000000070000000B79649C61EB1C4077BEB82737C74940CFB8037F4FEB1C4079B8A54038C74940C8B7C3B361EB1C40F3AA31F739C7494035FA9A875EEB1C40857CE62B3AC74940553D3F0E71EB1C40066CFEE93BC74940034C02D485EB1C4025E944903AC749400B79649C61EB1C4077BEB82737C74940	2000-01-01	\N	\N
39	14142.0	DENW05AL10002Isq	46.0	DENW05AL10002Isq	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	87.10321951674995	377844.94558275834	5713659.574105211	14142.0	010600000001000000010300000001000000090000008921C9EC66F31C40944370D4C5C74940E2307CB567F31C405425D93CC9C74940F7A7BBEE74F31C409791823BC9C749403D58E6DC74F31C4064E316B3C8C74940126CD94887F31C40874A7AB0C8C74940DB633CEC86F31C408BFE0EEFC5C7494071D84A1079F31C401C4D8BF0C5C749402D14020E79F31C40239F5DD2C5C749408921C9EC66F31C40944370D4C5C74940	2000-01-01	\N	\N
40	14145.0	DENW05AL10002IUe	47.0	DENW05AL10002IUe	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	87.08748496833141	377689.14003518363	5713567.251445436	14145.0	0106000000010000000103000000010000000900000061A3B7D02BF11C40F0D7987FA9C74940ABC240EF2BF11C4017E0EEAFA9C74940D376C0D320F11C40704F68BFA9C74940A53B525F23F11C40032E85A7ACC7494084C797752EF11C40AF835199ACC74940D896F7A02EF11C40887296C2ACC7494018DF2C4842F11C40875D01ABACC7494087C9F9613FF11C409815D363A9C7494061A3B7D02BF11C40F0D7987FA9C74940	2000-01-01	\N	\N
41	14152.0	DENW05AL10002IVb	48.0	DENW05AL10002IVb	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	92.01226158736972	377730.72341830033	5713563.4471693095	14152.0	0106000000010000000103000000010000000900000003A3C75ABDF11C407D49D6B5A8C749405487D5EEBFF11C404D51AF98ABC7494019DB0646CDF11C4047DEB787ABC749409FCE3CE0CDF11C40CDD05826ACC74940F6941770E0F11C4015B0290AACC7494053479F44DDF11C40CF8021A5A8C749406B29621CCEF11C40832347BAA8C749404BF92700CEF11C4054909D9EA8C7494003A3C75ABDF11C407D49D6B5A8C74940	2000-01-01	\N	\N
42	14157.0	DENW05AL10002IVz	49.0	DENW05AL10002IVz	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	112.00410307943821	377371.300947908	5713633.234799697	14157.0	0106000000010000000103000000010000000A000000F6DDA1D65DEC1C400EFC5E3EBCC749403A1C9E0581EC1C40ECF16B79BEC749407FA31D3296EC1C4058C5E96EBCC74940F9915A5088EC1C40F04ED98CBBC7494071CDCDD68BEC1C40A5F73B35BBC74940322DAB3482EC1C400765CA99BAC749403C0471AA7EEC1C4072A818F1BAC749408750BCE172EC1C40C9A94A32BAC7494013985A685EEC1C40B81F5030BCC74940F6DDA1D65DEC1C400EFC5E3EBCC74940	2000-01-01	\N	\N
43	14160.0	DENW05AL10002IWk	50.0	DENW05AL10002IWk	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	86.36276526842265	377535.8613067345	5713635.400648094	14160.0	0106000000010000000103000000010000000700000029B1A3BFF2EE1C40FBCCFD6FBCC7494041CBC968F2EE1C4073E669F8BBC749402478F721DBEE1C4041364F16BCC7494091376B41DEEE1C40AE5E8D36C0C7494095411E65F5EE1C403D299219C0C749409D8946BEF3EE1C40205BD4D0BDC7494029B1A3BFF2EE1C40FBCCFD6FBCC74940	2000-01-01	\N	\N
44	14161.0	DENW05AL10002IWK	51.0	DENW05AL10002IWK	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	164.75933356489986	377542.1656752271	5713452.816888194	14161.0	01060000000100000001030000000100000009000000B8B2E89A24EF1C40CE4A2D7A8AC74940F5B0A1F22BEF1C40A8FC669786C749406E524F3302EF1C405AF2412386C74940CC2EF110FFEE1C402D41E9DD87C74940B0B8B19DF6EE1C40029126C687C7494076CA8ABEF2EE1C40D1750EEE89C74940AC65124005EF1C404D771F228AC74940067DC2891DEF1C40A2B253668AC74940B8B2E89A24EF1C40CE4A2D7A8AC74940	2000-01-01	\N	\N
45	14167.0	DENW05AL10002IWw	52.0	DENW05AL10002IWw	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	88.42520091219922	377924.651506849	5713633.940713681	14167.0	01060000000100000001030000000100000009000000F99A2D1195F41C40A5195520BFC74940F1B233C194F41C404AE8D7DFC1C7494058349532A3F41C405BA61BDAC1C749409C065B24A3F41C4037080105C2C74940D6F68D52B5F41C406792C204C2C7494077CFB63FB5F41C40866BFA95BEC74940F199B481A8F41C4077F57E96BEC7494030267E38A8F41C403F741F1FBFC74940F99A2D1195F41C40A5195520BFC74940	2000-01-01	\N	\N
46	14171.0	DENW05AL10002IXb	53.0	DENW05AL10002IXb	1	5	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	115.09576846612617	377424.3734302098	5713839.911967265	14171.0	01060000000100000001030000000100000008000000F1D4865646ED1C4093B1461CF8C74940DEB9690C20ED1C4082E8F7A7F7C7494050B86E651EED1C4005EAD39AF8C7494030457D911CED1C40613E01A8F9C749408F5C9B011AED1C40944DE4F3FAC749403B2A6FAE20ED1C4003F6F306FBC749408A188D5440ED1C40C84EA761FBC74940F1D4865646ED1C4093B1461CF8C74940	2000-01-01	\N	\N
47	14172.0	DENW05AL10002IXL	54.0	DENW05AL10002IXL	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	326.1136877465761	377845.22722621384	5713557.713304559	14172.0	0106000000010000000103000000010000000E00000077E620EF65F31C40C2A1E093ABC74940F560D81167F31C4022CF22FEACC7494064A9818D9EF31C409E15AFB1ACC7494055FED8EC98F31C40CCF14649A6C749408704AC8B93F31C4091B09AE9A5C74940652A578160F31C40401D8527A6C7494067CE67C062F31C4066560DEBA8C74940C6AD9C8B6CF31C4074A081D9A8C749401B04C94E6DF31C40AC6822A3A9C749408B5E435470F31C4066AD319DA9C74940797768BF70F31C40AEE0C03AAAC74940887DB37B67F31C40E7564F49AAC74940B99C696168F31C40C8B5098EABC7494077E620EF65F31C40C2A1E093ABC74940	2000-01-01	\N	\N
48	14178.0	DENW05AL10002IYA	55.0	DENW05AL10002IYA	2	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	160.38876468129456	377985.77887611924	5713748.702745592	14178.0	0106000000010000000103000000010000000A000000D0A89E1F77F51C40AFCD71DDE2C74940FE24C7937EF51C402B9EC41CE3C749400E1C42F975F51C40ECA91F1EE5C749406693434C8BF51C405006D3B0E5C749405B5DC0FC92F51C4065C4910CE4C749406E22763D9FF51C40C1AAED6EE1C749408C1E92D173F51C404C13210CE0C749404E4C877064F51C40609CBF0CE3C7494060A817F573F51C40912B598DE3C74940D0A89E1F77F51C40AFCD71DDE2C74940	2000-01-01	\N	\N
49	14179.0	DENW05AL10002IYG	56.0	DENW05AL10002IYG	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	173.85338752437383	377381.79720665753	5713399.204494241	14179.0	01060000000100000001030000000100000009000000D85972B7A0EC1C40903496F279C749403343CB5BC3EC1C401F987B5F7AC74940838C1E67CEEC1C4089FF2EE974C74940E8467DB7ABEC1C407A108C8174C74940C2152D27ABEC1C40EF8477C974C749403ED9576BA9EC1C4012D320A575C749405AA802FEA4EC1C4064C149D577C749406AED3242A3EC1C408EC1DFB078C74940D85972B7A0EC1C40903496F279C74940	2000-01-01	\N	\N
50	14182.0	DENW05AL10002IYS	57.0	DENW05AL10002IYS	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	145.5942665822804	377593.5552464615	5713714.136321464	14182.0	010600000001000000010300000001000000050000000519E912A8EF1C400D5F549BD3C749405CF516119DEF1C40E6B82DA6D6C749404E791F56CEEF1C40B69E1AC5D7C749408F7FB143D9EF1C407A21EAB9D4C749400519E912A8EF1C400D5F549BD3C74940	2000-01-01	\N	\N
51	14204.0	DENW05AL10002K0n	59.0	DENW05AL10002K0n	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	103.905950656801	377481.5245506968	5713588.461045061	14204.0	010600000001000000010300000001000000080000006045895C33EE1C40C8736E69AEC74940E2E1E2CC08EE1C401E3FBEA3AEC749404C89FC190BEE1C4000822957B1C7494093A89EEA19EE1C405FC4C446B1C74940D73AEA5621EE1C4015F71B3BB1C74940AE8DEC8635EE1C409A79931FB1C749401094E85335EE1C406E8F30E0B0C749406045895C33EE1C40C8736E69AEC74940	2000-01-01	\N	\N
52	14209.0	DENW05AL10002K4H	60.0	DENW05AL10002K4H	0	18	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	264.99654467168693	377613.6165994109	5713636.941140651	14209.0	0106000000010000000103000000010000001100000057198098EAEF1C40CAED5EA5C1C7494024589F45EEEF1C40BA94383BC2C749409F4FD7EB1EF01C4016AD483AC2C74940E7D46BED1EF01C406B5F625DC0C749406732E7E219F01C4089DDF959C0C74940DE52695F19F01C40956BC430C0C74940F966AEDE1EF01C40CE903816C0C74940557EC1D01EF01C40E3FA4F97BFC74940D80E5FF421F01C40319DEBF7BEC74940E2D0C9621EF01C404B38C7E0BEC749409345B79620F01C40D3A3425FBEC7494022354B3424F01C4043984F78BEC749406F3C4F3E27F01C409CF60AD4BDC749404A1590DA31F01C405B5D671ABEC74940DED0670438F01C4098A514CDBCC74940E9C6B57B07F01C40CD4AB26EBBC7494057198098EAEF1C40CAED5EA5C1C74940	2000-01-01	\N	\N
53	14210.0	DENW05AL10002K4W	61.0	DENW05AL10002K4W	0	16	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	260.9943459928036	378660.5745275432	5713843.4344503945	14210.0	01060000000100000001030000000100000005000000385ACA1491FF1C40B3E41A9406C84940B34712A5A4FF1C407301971204C849408FA2448C50FF1C401D60710F00C8494011C5C3CA3CFF1C40704EAC9602C84940385ACA1491FF1C40B3E41A9406C84940	2000-01-01	\N	\N
54	14219.0	DENW05AL10002KAz	62.0	DENW05AL10002KAz	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	87.68128957378212	377796.88876958773	5713556.386413422	14219.0	01060000000100000001030000000100000009000000CACC7288B9F21C409013A52DA7C74940F1E1D1BFBCF21C409F726E98AAC7494093BE4BEDC9F21C406C849784AAC7494055975666C9F21C402B5C02F9A9C749409A68150FDCF21C406562B2DDA9C74940EE4650A7D9F21C40E922A21DA7C749402F793D94CBF21C402875F231A7C749406D2EC178CBF21C40E247DF13A7C74940CACC7288B9F21C409013A52DA7C74940	2000-01-01	\N	\N
55	14221.0	DENW05AL10002KBb	63.0	DENW05AL10002KBb	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	118.67282545362832	377726.7410980978	5713537.312267837	14221.0	0106000000010000000103000000010000000B000000663B7DD1D3F11C40042EE782A4C74940C89B0F3AD1F11C405BF0B1BDA1C749404AE4626FD0F11C404159BFBEA1C74940152565B5CEF11C40C979E3FA9FC74940A270C028BBF11C40899F8017A0C7494064E3D461BCF11C40422E3452A1C74940E1AEFDC0B0F11C409379FE63A1C7494016E3ECD3B3F11C40230921CDA4C749407D3F40DFC5F11C40F36CA3B3A4C74940CD17A1BEC5F11C406BD18896A4C74940663B7DD1D3F11C40042EE782A4C74940	2000-01-01	\N	\N
56	14223.0	DENW05AL10002KBd	64.0	DENW05AL10002KBd	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	136.57784096640535	377450.4016710577	5713560.9003348835	14223.0	010600000001000000010300000001000000080000008070917590ED1C40EE5D0140A6C749403380AB8193ED1C40491A4A24A9C74940879EA0A4C6ED1C40C45BD8D8A8C7494041795B91C7ED1C40801841D7A8C74940108BA791C5ED1C40C9B164C6A6C74940B525EAC2C4ED1C405A7BBFF0A5C7494034CCF2C2B6ED1C403A41D505A6C749408070917590ED1C40EE5D0140A6C74940	2000-01-01	\N	\N
57	14234.0	DENW05AL10002KcJ	65.0	DENW05AL10002KcJ	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	148.5510793272406	377543.3369244512	5713404.684680204	14234.0	0106000000010000000103000000010000000900000073790BFF03EF1C404BCBCF677CC74940AD5BC76725EF1C40E5CDC0D17CC7494081ADB33E2FEF1C405664BBFD77C74940E6ACF8D50DEF1C40E9C6DD9377C749408D0C46450CEF1C408493395878C74940E491AE850AEF1C400A06CE3379C74940E35C448607EF1C40BDF597AC7AC749408286A6C605EF1C4042B43F887BC7494073790BFF03EF1C404BCBCF677CC74940	2000-01-01	\N	\N
58	14254.0	DENW05AL10002KDt	66.0	DENW05AL10002KDt	1	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	154.4694304801524	377552.57727502397	5713872.02883261	14254.0	01060000000100000001030000000100000005000000625D605F2EEF1C401CE5B29002C84940C8A94E4902EF1C4064D4E29A01C8494033370669F5EE1C405D32A53E05C84940CDA04F8C21EF1C40BFD3422C06C84940625D605F2EEF1C401CE5B29002C84940	2000-01-01	\N	\N
59	14260.0	DENW05AL10002KE2	67.0	DENW05AL10002KE2	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	213.79749417863786	377742.4359159029	5713474.49823345	14260.0	010600000001000000010300000001000000050000002615F69BEBF11C401EBDBEC992C74940F9452CAF16F21C40A7E61A0C93C74940BFB89C011CF21C408EC5E38E8DC74940516108CAF0F11C40EF436C4E8DC749402615F69BEBF11C401EBDBEC992C74940	2000-01-01	\N	\N
60	14268.0	DENW05AL10002KEE	68.0	DENW05AL10002KEE	0	16	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	356.8586338807363	377581.68924575584	5713639.240076913	14268.0	01060000000100000001030000000100000013000000BCC3B52090EF1C403BC8A08DBEC749409562FB6C8DEF1C40EE6B3912BFC74940FBB1585C85EF1C40D7E58610BFC7494057F73D9982EF1C4053787DAABEC7494042BD342D71EF1C404CD6F1A5BEC749402708E4716FEF1C40062590A5BEC749408C7973B76FEF1C40F4AB1D0DBFC749405AFE52A963EF1C40669F7008BFC74940388ECE9465EF1C40FEA73D93C1C74940A6894F2466EF1C405D7F1451C2C74940F4F31AB0A4EF1C40AFE7AD4BC2C7494096A99CB2ADEF1C402E9FE4CDC1C74940201A5804B9EF1C40082FA563BFC7494061D155E5C5EF1C400FB3D9A3BCC74940C76D1AB69DEF1C40A3555EC0BBC74940E9E3D2E994EF1C40558D0183BDC7494010738D798DEF1C4090AD3D4ABDC749401E04BC7488EF1C40C82BF056BEC74940BCC3B52090EF1C403BC8A08DBEC74940	2000-01-01	\N	\N
61	14269.0	DENW05AL10002KEH	69.0	DENW05AL10002KEH	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	152.72794089023955	377494.8789800285	5713282.298785221	14269.0	010600000001000000010300000001000000090000009767E5A44AEE1C40109E8FD355C74940B1D6A80258EE1C404A0ADD6156C74940B738320A57EE1C406145358656C74940B7C0A60772EE1C406CF8A6A557C74940318E25FF72EE1C402A444E8157C74940EEB0ED0881EE1C40AD1CDF1658C749400AF1042891EE1C40DB075AB955C749406854ECC45AEE1C40FCD6317653C749409767E5A44AEE1C40109E8FD355C74940	2000-01-01	\N	\N
62	14273.0	DENW05AL10002KEt	70.0	DENW05AL10002KEt	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	143.19830014789477	377596.6842891263	5713469.010030623	14273.0	0106000000010000000103000000010000000A00000007F7F168CBEF1C406DE9168F8AC74940080EAFC9BEEF1C405BCDC65B8BC74940ECFF371ECDEF1C4062993FBC8CC74940D5F23D0CCFEF1C409EAD8CB28FC74940037DCE2DF6EF1C408A79EF868FC74940FFB15F7CF4EF1C40C124F8118DC7494033E666ADE9EF1C401C0B49088CC749405C5FCF32DBEF1C40CC7248168CC749408EB8C8ABD9EF1C4030E06EF08BC7494007F7F168CBEF1C406DE9168F8AC74940	2000-01-01	\N	\N
63	14278.0	DENW05AL10002KF1	71.0	DENW05AL10002KF1	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	145.05469405301847	377598.6410608991	5713482.890819083	14278.0	010600000001000000010300000001000000090000003F7AE3D3CDEF1C40FFCF69C790C74940648E6C0ACFEF1C4082C52EA692C74940569795FAD0EF1C40AEC6B3A492C74940E5748DACD1EF1C40BDA40EB593C749407E2CF8F2F8EF1C40AB4D748C93C74940037DCE2DF6EF1C408A79EF868FC74940D5F23D0CCFEF1C409EAD8CB28FC74940DE362BC1CFEF1C40831EDAC590C749403F7AE3D3CDEF1C40FFCF69C790C74940	2000-01-01	\N	\N
64	14287.0	DENW05AL10002KFI	72.0	DENW05AL10002KFI	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	89.71814861688472	377780.27806535125	5713582.280873756	14287.0	0106000000010000000103000000010000000D0000004AB580D872F21C4076F91002AFC74940F9FF70FB72F21C4022BB5D40AFC74940998F240174F21C40B7AC6C3FAFC74940D6BA2EB374F21C4011267F75B0C74940273DE73476F21C40898E4274B0C74940E19F9DDB76F21C40A84A9F96B1C74940B7E201739AF21C402928E574B1C7494020B2B79499F21C40DB9F09F9AFC749404BECD394A0F21C40B9CCA7EFAFC74940DB41401EA0F21C404EBD2EE7AEC74940CC17412876F21C40FCD4CD0FAFC74940D630CB1F76F21C407DDD57FFAEC749404AB580D872F21C4076F91002AFC74940	2000-01-01	\N	\N
65	14295.0	DENW05AL10002KFU	73.0	DENW05AL10002KFU	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	138.9291679331218	377277.57485240645	5713510.857192882	14295.0	0106000000010000000103000000010000000C0000002A40FFEC31EB1C4030D04D9399C7494006B081EC33EB1C409A85B3AB98C74940E663D46A38EB1C40CC8CD8BA98C74940C1F4D30D3CEB1C4097A8A11D97C74940759380023EEB1C40A83EF73F96C749401739276A3FEB1C40ADB9B74496C74940D688AA8F3FEB1C404F7AED3596C749401ED1C16311EB1C40934E9A9895C74940EECD2D4011EB1C40B37C65A795C74940973A9ED30AEB1C4008D8567F98C749404F18AD9409EB1C4033E0C30999C749402A40FFEC31EB1C4030D04D9399C74940	2000-01-01	\N	\N
66	14298.0	DENW05AL10002KFY	74.0	DENW05AL10002KFY	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	118.92222891189158	377293.73844357324	5713572.033026092	14298.0	0106000000010000000103000000010000000800000054ED65933EEB1C404E6E1A12AAC74940BC1E473353EB1C40596C525EABC74940570CD2775DEB1C40F611BB03ACC7494054D25A6C75EB1C40215887B6A9C749406596DC1F6BEB1C4025BAC811A9C749400BC5D0646FEB1C40322B1BA5A8C74940E4092F9B5AEB1C40D3442B56A7C7494054ED65933EEB1C404E6E1A12AAC74940	2000-01-01	\N	\N
67	14301.0	DENW05AL10002KGa	75.0	DENW05AL10002KGa	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	150.26144437864423	377376.0265429902	5713444.600760319	14301.0	010600000001000000010300000001000000050000009E2E8CD391EC1C404090E21C82C74940DFD08B0F88EC1C406CD0300387C7494016B8C160A9EC1C403A69FF6A87C749401AF6471BB3EC1C40139FD38082C749409E2E8CD391EC1C404090E21C82C74940	2000-01-01	\N	\N
68	14308.0	DENW05AL10002KGu	76.0	DENW05AL10002KGu	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	87.40354793480947	377835.0192276332	5713636.261721986	14308.0	01060000000100000001030000000100000009000000B5536ED354F31C40871682A2BEC74940A72240D854F31C40F0336E2FBFC74940FE53A51742F31C406E9F5F30BFC749408D1F0D5042F31C40D783EEF2C1C74940D650713650F31C4017ED11F2C1C74940D037B63750F31C40BCBD6510C2C74940598C8A0062F31C40E914370FC2C749406B27D21F62F31C403B46CFA1BEC74940B5536ED354F31C40871682A2BEC74940	2000-01-01	\N	\N
69	14324.0	DENW05AL10002KHN	77.0	DENW05AL10002KHN	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	89.0766861406737	377787.9547245186	5713661.304255234	14324.0	01060000000100000001030000000100000009000000EF08E67CAEF21C40FD7E34E6C5C749408467FC939CF21C403CBFC6E7C5C749400CEA16849CF21C4096BB800BC6C74940EE03F5F88DF21C40378CCE0CC6C74940E98416A68DF21C400B62BED1C8C74940241EFA2BA0F21C40E9E2C9CFC8C74940FBA6CE3FA0F21C40AB5E145BC9C749407A614499ADF21C40633FE658C9C74940EF08E67CAEF21C40FD7E34E6C5C74940	2000-01-01	\N	\N
70	14326.0	DENW05AL10002KHq	78.0	DENW05AL10002KHq	0	9	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	251.33308459160617	377623.99465359823	5713428.034932602	14326.0	01060000000100000001030000000100000010000000BF97A00872F01C409B5AEA5983C74940C6C6735A71F01C40C78F377581C74940EB41C81970F01C401F76E57581C74940488460ED6FF01C40F1A658F580C749407DB480626FF01C4070EDB5667FC7494095B480515DF01C40DC5A7E707FC749404221C1D75DF01C4014D3880181C7494085BD183A58F01C40F0F37C0481C74940C9B8236658F01C40AA7D138381C74940AB4E28F64DF01C401EC3E98881C7494006D7FEB54CF01C400D03988A7FC749407239EF2321F01C4025882FB67FC7494024B419A123F01C4063F40CA783C7494035B6080752F01C40D8EF6C7983C7494076BC12E96DF01C4002BCE35D83C74940BF97A00872F01C409B5AEA5983C74940	2000-01-01	\N	\N
71	14328.0	DENW05AL10002KHU	79.0	DENW05AL10002KHU	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	142.8259081463184	377548.87968721637	5713669.161193311	14328.0	0106000000010000000103000000010000000A00000062351AF637EF1C4002177BC3C6C74940519ADD96F9EE1C40781AA8C8C6C74940C8C340F6F9EE1C40DFDD1B79C9C749409450052E08EF1C40B861487BC9C74940CD833C2808EF1C40BDB30AAAC9C74940AC8E90CB1FEF1C409CAFB8A6C9C74940BD0A4D2421EF1C40395C8AA6C9C749407E73E81F21EF1C4027E84076C9C749403644801A2EEF1C4081A72677C9C7494062351AF637EF1C4002177BC3C6C74940	2000-01-01	\N	\N
72	14332.0	DENW05AL10002KI8	80.0	DENW05AL10002KI8	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	26.04994295630604	377588.1476099376	5713589.015413546	14332.0	0106000000010000000103000000010000000500000088C34204A9EF1C402D997DFFAFC74940DD2D8D1EAAEF1C4018F0CBACB1C74940C9B29561BBEF1C408999719CB1C74940ADA94014BAEF1C40457C1EEBAFC7494088C34204A9EF1C402D997DFFAFC74940	2000-01-01	\N	\N
73	14340.0	DENW05AL10002KiI	81.0	DENW05AL10002KiI	0	16	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	321.0198104941519	377851.91798094794	5713630.127766086	14340.0	0106000000010000000103000000010000000E00000072963FB57FF31C40883A9E6CBFC74940A3A5D5D075F31C40B48E3D68BFC74940E1F2501575F31C401945810EC2C74940D973F8F9ABF31C40165DBB0DC2C749406AD262D7B0F31C405D8567A5C1C7494040FFEF3BABF31C40EC958E38BBC74940B28EC00575F31C400C6D0984BBC7494026E34B4F76F31C40CE6583FABCC74940A4F8A5937AF31C403F1383F3BCC74940E6BEDCF97BF31C40A12C4C55BEC74940596FDF0A84F31C401BDD844FBEC74940D9DCCE4784F31C404E5431D3BEC749408B76736E7FF31C4042F6BED6BEC7494072963FB57FF31C40883A9E6CBFC74940	2000-01-01	\N	\N
74	14348.0	DENW05AL10002KIt	82.0	DENW05AL10002KIt	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	243.72284710136591	377278.94946450513	5713523.460696625	14348.0	01060000000100000001030000000100000017000000D878621026EB1C406A64FDB49DC7494049C67D3127EB1C40496355339DC7494005EE8BB635EB1C40E81070649DC74940DBA4E5CC35EB1C403EFDD25A9DC74940C8357DD439EB1C4023F2D6689DC74940853FCF0C3CEB1C40588370439DC749400586DC0B3EEB1C4076033D769CC7494001F793A33CEB1C403DC0A8419CC749400E36878638EB1C4095D809319CC74940B38C194E36EB1C4081AA0B289CC749400488E05F36EB1C40B6B9AF209CC74940FA68767134EB1C4008D36A199CC74940599582AA36EB1C401D6A4A469BC7494042B38BC356EB1C40CC5FE0B29BC7494012791C7758EB1C402644CBEB9AC74940947519055EEB1C402C8834FC9AC74940A86AD4E35FEB1C404CDEC33F9AC7494039D29C0560EB1C402BF383309AC749402A40FFEC31EB1C4030D04D9399C749404F18AD9409EB1C4033E0C30999C74940131D095C09EB1C40479F061E99C749408A3F2F2C00EB1C401A42332F9DC74940D878621026EB1C406A64FDB49DC74940	2000-01-01	\N	\N
75	14349.0	DENW05AL10002KiW	83.0	DENW05AL10002KiW	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	160.36497669969685	377557.5215811213	5713555.126801095	14349.0	0106000000010000000103000000010000000700000030113D4F29EF1C4081CDD69EA5C7494049A50FAE2AEF1C406E603440A7C74940D8E3D5DA2BEF1C40FE4847A5A8C749406436F2915AEF1C404B962160A8C749409471D6F556EF1C40C97B1190A4C74940944A61A328EF1C408CDB4FD2A4C7494030113D4F29EF1C4081CDD69EA5C74940	2000-01-01	\N	\N
76	14358.0	DENW05AL10002Kje	84.0	DENW05AL10002Kje	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	87.08288366483612	377847.51334896096	5713527.468917707	14358.0	0106000000010000000103000000010000000A0000000EB7DFBA8CF31C406A55CF3C9FC749401A4E1C337AF31C40706909589FC74940F925BCBF7CF31C40192F0015A2C749403B590F548AF31C40D3F75E00A2C749409834DB5A8AF31C409A2D9D1FA2C749405E633F6A9CF31C4094757105A2C74940CA155E9B99F31C401BF5799A9EC749406FE77D808CF31C407F0FC0AD9EC749401CBDED318CF31C4085CA34AE9EC749400EB7DFBA8CF31C406A55CF3C9FC74940	2000-01-01	\N	\N
77	14363.0	DENW05AL10002KJt	85.0	DENW05AL10002KJt	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	127.87175791151823	377587.71613823855	5713732.3160723355	14363.0	010600000001000000010300000001000000090000006D8A27D1BCEF1C4061B108A4DBC74940D3C196C0C2EF1C4037D21110DAC749401BBC6FF3B7EF1C40D9A462D1D9C749404DC437D9A1EF1C40EA126154D9C749401F929C5B94EF1C403FB46209D9C74940ABE2846988EF1C40F607E34CDCC74940BFBF7546ABEF1C40B24FA20BDDC749401A9F2C7FB1EF1C406BF2ED65DBC749406D8A27D1BCEF1C4061B108A4DBC74940	2000-01-01	\N	\N
78	14367.0	DENW05AL10002Kk0	86.0	DENW05AL10002Kk0	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	254.11508734407835	377285.2786351803	5713558.051739396	14367.0	01060000000100000001030000000100000010000000580058C15CEB1C4008C57020A7C74940FED17DFC58EB1C40327C546AA6C74940E51B083358EB1C40FA8ED070A6C74940FB3C9FFF54EB1C4051500FD6A5C7494045A312CA55EB1C40736880CFA5C7494083E781CB50EB1C402DF042DEA4C749406E5DF30450EB1C405769C0E4A4C74940410B163B44EB1C40E9C8A6AAA2C749400F85A40145EB1C40595029A4A2C749407F4C52A241EB1C407E352D01A2C749405B55F65A40EB1C40D249E0B9A1C7494046D43CE13AEB1C407FE5DEE4A1C749406EBB401B19EB1C409AFB3CEEA2C7494054ED65933EEB1C404E6E1A12AAC74940E4092F9B5AEB1C40D3442B56A7C74940580058C15CEB1C4008C57020A7C74940	2000-01-01	\N	\N
79	14368.0	DENW05AL10002Kk2	87.0	DENW05AL10002Kk2	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	172.1975566144938	377386.7358966333	5713362.004864416	14368.0	0106000000010000000103000000010000000A0000000CAC7236BDEC1C4094003ADA6BC74940CC8DEDE1B8EC1C40D2351EFF6DC7494029A388DEB8EC1C401B1DB2006EC7494066641F26B7EC1C408139B4DA6EC74940A84CFFD4B6EC1C40837A9B026FC74940E6756381D9EC1C407CCD376B6FC74940FF00AA6CE4EC1C403014B3046AC74940C7283EBFC1EC1C402199639C69C74940410C3EF3BEEC1C40702691FE6AC749400CAC7236BDEC1C4094003ADA6BC74940	2000-01-01	\N	\N
80	14380.0	DENW05AL10002KlR	88.0	DENW05AL10002KlR	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	88.19914398847324	377875.80406712135	5713658.616074034	14380.0	0106000000010000000103000000010000000900000036C71FE0E7F31C4012B912C6C5C749401354D5F5E7F31C404DCD0FE4C5C74940B83D39D1D9F31C40DECAB6E5C5C7494083228335DAF31C40273D5BA4C8C7494038130370EDF31C40747BB2A0C8C74940F519DC75EDF31C40DD9C3527C9C7494024FC56BCFAF31C40AB33C823C9C7494081276E5BFAF31C40DB7FDDC3C5C7494036C71FE0E7F31C4012B912C6C5C74940	2000-01-01	\N	\N
81	14384.0	DENW05AL10002KlZ	89.0	DENW05AL10002KlZ	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	150.3740321341902	377470.5749857953	5713481.465443357	14384.0	01060000000100000001030000000100000005000000A2638DD5E2ED1C408F5A07A38EC74940897D6095DDED1C409FF8054091C749409ADA99AD1CEE1C40944BF0F091C74940FB9BA36421EE1C40DB83DF558FC74940A2638DD5E2ED1C408F5A07A38EC74940	2000-01-01	\N	\N
82	14385.0	DENW05AL10002KmA	90.0	DENW05AL10002KmA	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	88.048938397842	377871.28862393694	5713562.5506204525	14385.0	0106000000010000000103000000010000000D0000007A69D2D1CEF31C40E235A0CDA9C74940E2ADE1C5CFF31C403D48A2DAAAC74940B1164E57CEF31C40190496DCAAC74940ADD2F776CFF31C40A0D8F724ACC74940E3D0F655CEF31C40E3AD8926ACC749401468818DCEF31C4063AA2367ACC74940630B6831D1F31C401DDDA763ACC749407F4AC81CD1F31C4013998D4BACC7494067C94376FBF31C40C0FBAD0DACC7494053C0BC9AFAF31C40830A96FFAAC7494088EBC04AF3F31C409E4A8E0AABC749406D055423F2F31C4007B8C29FA9C749407A69D2D1CEF31C40E235A0CDA9C74940	2000-01-01	\N	\N
83	14386.0	DENW05AL10002Kmb	91.0	DENW05AL10002Kmb	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	124.46664030221291	377396.2747295822	5713572.406982171	14386.0	01060000000100000001030000000100000007000000274FDC3FC4EC1C40A7845D4EA9C7494073621252C7EC1C407BFD6818ACC749409D1EE197F8EC1C4012F26FC9ABC74940C422D5F6F7EC1C4086D2A831ABC74940A290C842F6EC1C4021A43D9AA9C74940718F2A9BF5EC1C401BC6ADFEA8C74940274FDC3FC4EC1C40A7845D4EA9C74940	2000-01-01	\N	\N
84	14391.0	DENW05AL10002KMK	92.0	DENW05AL10002KMK	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	106.88905513333157	377430.8314487895	5713567.133451994	14391.0	0106000000010000000103000000010000000A0000005ACC33874FED1C40DDC3539FA8C749408651E3E650ED1C405033F9FBA9C74940FCF64D1154ED1C40C75C94F5A9C749405ED7426B55ED1C40899F5F42ABC749401567189256ED1C40FCC9BD40ABC7494030B06CB172ED1C4058857118ABC74940EF47F2056FED1C40B1CF6939A7C74940DDEBE88451ED1C4018D9AF5FA7C749406A1A43C952ED1C40A6B99E97A8C749405ACC33874FED1C40DDC3539FA8C74940	2000-01-01	\N	\N
85	14400.0	DENW05AL10002KnA	93.0	DENW05AL10002KnA	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	150.5351422391832	377356.2822997854	5713433.835706243	14400.0	01060000000100000001030000000100000005000000A7002AA175EC1C40BED46A7A80C74940E9E141F536EC1C402471C0CD7FC7494089956B3132EC1C40688FF56B82C74940D32C950971EC1C40D51D9D1983C74940A7002AA175EC1C40BED46A7A80C74940	2000-01-01	\N	\N
86	14407.0	DENW05AL10002Knu	94.0	DENW05AL10002Knu	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	205.2658868600847	377346.2733607188	5713650.282882675	14407.0	01060000000100000001030000000100000007000000919C9AA3F3EB1C40483C8A33C1C74940114A02E8F3EB1C405D12BE37C1C74940C70F8BFD21EC1C4000C81D11C4C7494039D6D3E640EC1C407EFF470BC1C749405266ADD012EC1C4097ECAE2DBEC74940375CD1F6F5EB1C40463B29FCC0C74940919C9AA3F3EB1C40483C8A33C1C74940	2000-01-01	\N	\N
87	14427.0	DENW05AL10002KPD	95.0	DENW05AL10002KPD	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	76.75524909097294	377675.9534817856	5713640.649725437	14427.0	0106000000010000000103000000010000000700000041F1ECEBEAF01C40BD756E2EBFC749408B67A4CDEAF01C4021A64430C2C74940A653D262F8F01C40A341092FC2C7494017B28D5EF8F01C40A8FF4BFEC1C74940FDFBA15908F11C40BF6DDCFCC1C74940F194C04208F11C406F37B62CBFC7494041F1ECEBEAF01C40BD756E2EBFC74940	2000-01-01	\N	\N
88	14430.0	DENW05AL10002KpL	96.0	DENW05AL10002KpL	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	121.47753121062124	377443.2460432108	5713588.6258632075	14430.0	0106000000010000000103000000010000000A0000007203B44A77ED1C4022089D40AEC74940E33EFE5977ED1C402A5FDC50AEC749400C18A24C79ED1C403732A7BDB0C74940FD3990C279ED1C40C91FE650B1C7494087C1281D91ED1C40E58B722EB1C74940AACCD78EA5ED1C40C1495310B1C74940B5C76932A5ED1C4013779C8BB0C74940AB559875A3ED1C4077D16F10AEC74940608C6464A3ED1C40DB3E1C00AEC749407203B44A77ED1C4022089D40AEC74940	2000-01-01	\N	\N
89	14431.0	DENW05AL10002KpN	97.0	DENW05AL10002KpN	1	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	89.19213138544	377910.78335148306	5713658.054272344	14431.0	0106000000010000000103000000010000000900000044EDD09A5FF41C40A08CB6DAC5C74940726DA50960F41C40B6A3C43CC9C74940D81B3C516DF41C407B56263FC9C74940431FF2586DF41C40926996B8C8C74940BB461E7C80F41C40C7055AB8C8C74940FF2709B680F41C40EC2132F8C5C749400ED5EED871F41C4030B572F8C5C7494060C7A4D671F41C40FF0645DAC5C7494044EDD09A5FF41C40A08CB6DAC5C74940	2000-01-01	\N	\N
90	14433.0	DENW05AL10002Kpq	98.0	DENW05AL10002Kpq	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	62.07827654661378	377487.1153790379	5713823.1372875115	14433.0	0106000000010000000103000000010000000600000035081F0529EE1C4049ED0069F3C74940495C505113EE1C405295F178F3C7494060C231C614EE1C40942724A7F6C749407BC3FF782AEE1C40A0A05997F6C749409848EB2429EE1C40218E29AEF3C7494035081F0529EE1C4049ED0069F3C74940	2000-01-01	\N	\N
91	14434.0	DENW05AL10002Kps	99.0	DENW05AL10002Kps	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	149.77788878791034	377339.4687133625	5713431.926146731	14434.0	01060000000100000001030000000100000006000000E27D433336EC1C406747CDCB7FC7494085B5A5B3F7EB1C40FF51F81F7FC749409D1405B1F6EB1C407F58CAAF7FC74940F4294EFDF2EB1C40543047BE81C74940851B6D6F31EC1C406565026A82C74940E27D433336EC1C406747CDCB7FC74940	2000-01-01	\N	\N
92	14439.0	DENW05AL10002Kq4	100.0	DENW05AL10002Kq4	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	59.739350867806934	377511.9336906416	5713795.78455631	14439.0	01060000000100000001030000000100000006000000B773A80874EE1C4058492999EBC7494085170C2874EE1C406D17C5E2EBC749407A524C6A75EE1C4057D700C4EEC749405D02D5608AEE1C4035DF83B5EEC74940F81964FF88EE1C40999EFE89EBC74940B773A80874EE1C4058492999EBC74940	2000-01-01	\N	\N
93	14443.0	DENW05AL10002KqM	101.0	DENW05AL10002KqM	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	89.4130115666776	377563.63795047393	5713356.5771930935	14443.0	0106000000010000000103000000010000000900000006BAFD3F57EF1C40DC27B5756DC7494038EDA11265EF1C40C6F22DA16DC74940728EF2D664EF1C403F1851BF6DC749407A51A87876EF1C40E79DCEF66DC749403D86F2337DEF1C4018E6BA986AC749407A2217996BEF1C40F7C506616AC749404696EF8A6AEF1C4045D978E76AC7494095CB2FA25CEF1C402A8E81BB6AC7494006BAFD3F57EF1C40DC27B5756DC74940	2000-01-01	\N	\N
94	14449.0	DENW05AL10002KQx	102.0	DENW05AL10002KQx	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	79.57249296084046	377524.59043504775	5713868.747300888	14449.0	01060000000100000001030000000100000005000000E7BD06ACB0EE1C4005FD068704C84940A31B1374BBEE1C40882E338501C84940791AD2F99FEE1C40641A58EF00C849404BEF966895EE1C40039D54F203C84940E7BD06ACB0EE1C4005FD068704C84940	2000-01-01	\N	\N
95	14453.0	DENW05AL10002Kr8	103.0	DENW05AL10002Kr8	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	138.46746523678303	377296.6028621536	5713609.315054155	14453.0	01060000000100000001030000000100000005000000D3E32EF782EB1C40106A4CE4B4C74940B67A3C6858EB1C408E4D1E49B2C74940BF5452B641EB1C40B975C982B4C7494092A508366CEB1C4046204720B7C74940D3E32EF782EB1C40106A4CE4B4C74940	2000-01-01	\N	\N
96	14454.0	DENW05AL10002KR9	104.0	DENW05AL10002KR9	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	149.42157765105367	377454.2539100071	5713464.604141275	14454.0	010600000001000000010300000001000000050000003D0C5E0ED9ED1C400C8E97FC88C74940359A7DB0B7ED1C40A467D49188C74940061612DBADED1C401A76816F8DC749403194672BCFED1C408B7951DA8DC749403D0C5E0ED9ED1C400C8E97FC88C74940	2000-01-01	\N	\N
97	14466.0	DENW05AL10002KrZ	105.0	DENW05AL10002KrZ	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	74.44182403432205	377701.77107403736	5713565.71586135	14466.0	0106000000010000000103000000010000000700000014FAF17B61F11C405A875235A9C74940C1A82DA761F11C408F1C4E65A9C74940309424F751F11C403642407BA9C7494034446C5E54F11C40E2738E42ACC74940BBAE7F3471F11C40F806F31AACC749405D32E18B6EF11C403C741723A9C7494014FAF17B61F11C405A875235A9C74940	2000-01-01	\N	\N
98	14469.0	DENW05AL10002Kse	106.0	DENW05AL10002Kse	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	190.71732367301593	377345.2683342078	5713572.543157878	14469.0	010600000001000000010300000001000000100000000B34BCE9FEEB1C4055D04F10ABC74940EFE347E200EC1C40C8CC3CF6ACC749404DB2240300EC1C4063E3B3F7ACC74940E7BE801C00EC1C40356C0A10ADC7494072C4AF4B1DEC1C4004013BE2ACC74940F8A431841CEC1C40C3CF2508ACC74940EE067A2237EC1C40F298B8D8ABC749409D3F1E0735EC1C408EB13102AAC7494016C07BFF35EC1C4058D58C00AAC7494074BD3F1335EC1C40F8FEC432A9C7494002FBD91B34EC1C40B2526A34A9C74940A47C350B32EC1C40BA075454A7C7494025E70CAB2CEC1C402250C45BA7C749407B034D430EEC1C4096D70B86A7C74940A73E4A3C11EC1C404D5A14F2AAC749400B34BCE9FEEB1C4055D04F10ABC74940	2000-01-01	\N	\N
99	14480.0	DENW05AL10002Kt0	107.0	DENW05AL10002Kt0	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	154.84824235457927	377434.7190614687	5713319.499464503	14480.0	01060000000100000001030000000100000009000000356D8D8570ED1C40A116CB8B62C74940F83D62FE91ED1C40F4E536F362C749400C9E8CA295ED1C409B80C72261C74940618EE0FF9AED1C402A94D93361C74940114592609DED1C40615EC9FF5FC74940A547E30D98ED1C40C86DBCEE5FC749407D9A63BB9BED1C404F1E481C5EC749404CEA34457AED1C40CA67C5B55DC74940356D8D8570ED1C40A116CB8B62C74940	2000-01-01	\N	\N
100	14490.0	DENW05AL10002KtM	108.0	DENW05AL10002KtM	0	19	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	226.19592736667255	377739.58528475877	5713430.984311627	14490.0	010600000001000000010300000001000000130000002DAB8BC5E7F11C40E2B6D98E81C7494006F0C017D3F11C40C8289AA781C749404B835672D4F11C40039F100983C7494099476DBADDF11C403291CDFB82C749407D64CAB0DFF11C40F82852EA84C74940730DE1C7F9F11C4012A589C584C74940CC984385FAF11C404812026085C74940FEBB7BA706F21C404DAE4E5285C74940422D9A2A07F21C40EDBA9BF385C749408D6F674F14F21C408E92A3E585C749407B121AE413F21C40211D543F85C7494074AEF94421F21C40B1CA132E85C74940C89C962420F21C400DE1B7D883C749400F2990201DF21C408CCE26DD83C74940F879F7241BF21C40201B409881C749407E54650302F21C4094C3F8B481C74940AC90507B01F21C40F623583381C7494039715089E7F11C400C80375781C749402DAB8BC5E7F11C40E2B6D98E81C74940	2000-01-01	\N	\N
101	14494.0	DENW05AL10002KtS	109.0	DENW05AL10002KtS	2	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	226.39523549284786	377513.5529689644	5713559.309814593	14494.0	0106000000010000000103000000010000000C000000094BDC64BFEE1C406F83C83FA9C7494048A63FF9BBEE1C4050723EFCA4C749403E19CBA8A8EE1C40AC9F1B15A5C7494001A4850CAAEE1C408CAAA8A9A6C749403CB34677A5EE1C407F9D4BAFA6C749406607AE2B8DEE1C4018746ACBA6C749405AE164D48BEE1C4099A4FC2DA5C74940F1F0328E76EE1C403E969047A5C74940A4CC49DB77EE1C40F957A2E6A6C74940AEFA7C167AEE1C4007387E95A9C7494090542D9EA7EE1C4038AD1D5EA9C74940094BDC64BFEE1C406F83C83FA9C74940	2000-01-01	\N	\N
102	14502.0	DENW05AL10002Kud	110.0	DENW05AL10002Kud	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	89.847532762622	377778.92352630495	5713661.56315042	14502.0	01060000000100000001030000000100000009000000FC5A28867AF21C40983203D4C8C74940E98416A68DF21C400B62BED1C8C74940EE03F5F88DF21C40378CCE0CC6C74940D4F55D207FF21C40A0AD1D0EC6C749400C7FE6FD7EF21C405F1872EAC5C74940437799206DF21C4034B409ECC5C749403FBEC5656DF21C407F132363C9C7494040EB06A67AF21C40D2A20F61C9C74940FC5A28867AF21C40983203D4C8C74940	2000-01-01	\N	\N
103	14508.0	DENW05AL10002Kuq	111.0	DENW05AL10002Kuq	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	73.73933909094194	377709.20798199286	5713565.009947274	14508.0	010600000001000000010300000001000000070000005D32E18B6EF11C403C741723A9C74940BBAE7F3471F11C40F806F31AACC749400680E4A08DF11C400B55D2F3ABC7494003789A3B8BF11C40241F2029A9C7494093A3779A7BF11C40ED65FC40A9C749405DBE3B6F7BF11C40FED00011A9C749405D32E18B6EF11C403C741723A9C74940	2000-01-01	\N	\N
104	14510.0	DENW05AL10002Kus	112.0	DENW05AL10002Kus	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	112.91412434668746	377771.1081768776	5713533.35703521	14510.0	0106000000010000000103000000010000000E000000A9650EED58F21C40E70C4C6CA0C74940F74316CE5BF21C40182D73D7A3C74940CFD3C7136DF21C40F7D256BEA3C7494014AEDEF46CF21C404114D39EA3C74940276D84B77BF21C408EA26889A3C749406D8A816279F21C40F7F852C8A0C74940E609E91479F21C406725C8C8A0C749407F993BF977F21C404204A4709FC74940A6CA028078F21C401D19FD6F9FC7494069ECE16B78F21C407C854D569FC749402ECA0EE577F21C40530A1B579FC74940542BE56E64F21C40D3D82D769FC74940E80924F264F21C4060A9CE58A0C74940A9650EED58F21C40E70C4C6CA0C74940	2000-01-01	\N	\N
105	14511.0	DENW05AL10002KuT	113.0	DENW05AL10002KuT	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	183.19032988062827	377583.134285923	5713577.207550804	14511.0	01060000000100000001030000000100000017000000E5CA2E8287EF1C40DAAB39CDAEC74940A8ED4A7F88EF1C40641FE4CBAEC74940CC4F04CD92EF1C40E07D25BEAEC74940E20C446793EF1C40BA7F27BDAEC74940E5B763BA93EF1C4041F32D31AFC749402C59050F9EEF1C401F247893AFC749405A4BCC5AA3EF1C4071A0C9B7AEC74940CC39A966ABEF1C407DECD1AFAEC74940FBE6146CAEEF1C4030B6CC07AFC7494018C5F6B5A8EF1C4044B46188AFC7494088C34204A9EF1C402D997DFFAFC74940ADA94014BAEF1C40457C1EEBAFC749405E27D117B9EF1C401E1746A2AEC7494085CA8C61B6EF1C40149DBD1BABC74940C938B2B6ACEF1C4031BECF28ABC74940E2C6CF0CA7EF1C40D347B830ABC74940CE6171D38FEF1C40805C2C4FABC74940F94F257985EF1C402CEDE45CABC7494027498A6B84EF1C409F26595EABC749405E8ADDC083EF1C40CDEA3B5FABC749409DA0EAE383EF1C4038913487ABC749409AF281D786EF1C4025701CCEAEC74940E5CA2E8287EF1C40DAAB39CDAEC74940	2000-01-01	\N	\N
106	14515.0	DENW05AL10002Kv5	114.0	DENW05AL10002Kv5	0	20	Gemischt genutztes Gebäude mit Wohnen ist ein Gebäude, in dem sowohl gewohnt wird, als auch Teile des Gebäudes zum Anbieten von Dienstleistungen, zur Durchführung von öffentlichen oder privaten Verwaltungsarbeiten, zur gewerblichen oder industrielle	Gemischt genutztes Gebäude mit Wohnen	0	1100	340.08121463507086	377534.3423131844	5713814.273323462	14515.0	01060000000100000001030000000100000013000000F0BF6E56ADEE1C4076AC897FF1C74940E86E3A9BADEE1C40C5CAEE40F2C74940D4C22EB2AAEE1C403DE07842F2C74940E55B2D85ABEE1C40B8C05BB9F4C7494011E0A2AFBDEE1C40BEB398A9F4C74940E1076DB0BDEE1C4022584BADF4C749409A5D69F6C7EE1C40AEED2CA6F4C74940656F039AC8EE1C40EB92443FF6C749403275E7E2EDEE1C402BF51526F6C74940087BF639EDEE1C40C749918EF4C74940FB6225D6F1EE1C40B91BBC8BF4C749409F0E161AF1EE1C40C52A32D4F2C74940C5BA0F9EF0EE1C40A5957DD4F2C74940CE50E5BFEFEE1C40D43079CCF0C74940F295F13BF0EE1C4022791ACCF0C7494052D9E8ACEFEE1C4044D4087AEFC74940722BC680BBEE1C4012A8B19DEFC74940C509E653BCEE1C40B08AF574F1C74940F0BF6E56ADEE1C4076AC897FF1C74940	2000-01-01	\N	\N
107	14520.0	DENW05AL10002Kvo	115.0	DENW05AL10002Kvo	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	179.5572013219353	377475.4278761595	5713708.142878373	14520.0	0106000000010000000103000000010000000E0000002E186556E1ED1C40D4545D24D3C74940A47D5318E5ED1C40BAB02A61D3C749408D5EC2FEDBED1C409C080742D4C7494001983F22D8ED1C4079FF8303D4C74940AEBE8A84D7ED1C40C91EC212D4C74940D9F5B536F7ED1C408BABD613D6C749407804A6D320EE1C4078F4D10ED2C7494098EE61450FEE1C40A76B6EF5D0C7494042D756A500EE1C40AEDE510BD0C7494066AA5CD4F5ED1C40F5F1C220D1C749403437B075F9ED1C40B9BE6D59D1C7494026B56539F0ED1C40A98A5E46D2C749400A845C58ECED1C40CE10F609D2C749402E186556E1ED1C40D4545D24D3C74940	2000-01-01	\N	\N
108	14536.0	DENW05AL10002KWX	116.0	DENW05AL10002KWX	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	233.4058940956893	377282.0169142106	5713499.262309464	14536.0	0106000000010000000103000000010000001700000062619BEC45EB1C400994C8D891C7494030E228F51BEB1C40FE8B984B91C74940880F80C61BEB1C409D10E55E91C749409C424D9A19EB1C409267C14092C749401ED1C16311EB1C40934E9A9895C74940D688AA8F3FEB1C404F7AED3596C749401739276A3FEB1C40ADB9B74496C7494006A30FA85CEB1C40D97561A896C749407A5C6D2363EB1C40E4D271BE96C749403BA31DE765EB1C40F730987D95C74940C0B37A8064EB1C408F97B17895C7494017B4D0974EEB1C40A356FA2A95C7494053AE81AC50EB1C40731C453794C74940B800C0B645EB1C408C21A80B94C74940375E48CF47EB1C404991723D93C74940D1CF49E247EB1C40FD8B8D2293C74940B1B8409447EB1C406168610893C7494028D754EC46EB1C404264D4F092C749402D2576F745EB1C4001D8E2DD92C7494024D292C844EB1C40DF82F1D092C749402F95AAA843EB1C4029CEDFCB92C749409F993AB745EB1C407D0003EF91C7494062619BEC45EB1C400994C8D891C74940	2000-01-01	\N	\N
109	14537.0	DENW05AL10002Kx5	117.0	DENW05AL10002Kx5	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	75.58339753496693	377486.60983906954	5713598.245331964	14537.0	01060000000100000001030000000100000009000000D73AEA5621EE1C4015F71B3BB1C749409BAA11BA23EE1C40CD4ECD30B4C74940583D4A9445EE1C4051B23905B4C749400215678B45EE1C401794EFEFB3C74940644C880145EE1C40FC582FF1B3C749402408638143EE1C4002371C32B2C74940FF0CC56F36EE1C4048EC6B43B2C74940AE8DEC8635EE1C409A79931FB1C74940D73AEA5621EE1C4015F71B3BB1C74940	2000-01-01	\N	\N
110	14548.0	DENW05AL10002KXl	118.0	DENW05AL10002KXl	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	97.15315595176071	377536.4878654857	5713753.6626230385	14548.0	01060000000100000001030000000100000009000000830BB7A1C5EE1C40A65ABE3FE1C7494024F4D51AE1EE1C40899F48FEE2C74940E8902844EFEE1C40B478739CE1C7494025188375F3EE1C4044579433E1C749409319160BF6EE1C401DCEAB00E0C7494023FBF187E9EE1C40150F7E33DFC749408F8CC10CE5EE1C40016B4CA0DFC7494097B6A749DCEE1C40D27FD70FDFC74940830BB7A1C5EE1C40A65ABE3FE1C74940	2000-01-01	\N	\N
111	14550.0	DENW05AL10002Kxo	119.0	DENW05AL10002Kxo	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	89.41594597324729	377619.5525287085	5713617.708185135	14550.0	01060000000100000001030000000100000009000000B086D6191AF01C40F08EC8B9B7C749401514644B15F01C400A78F6C2B8C74940F198C90B14F01C40C3ACE9B9B8C749405AA31ACE0DF01C407CF12212BAC749409433791E37F01C40CFCC6338BBC7494088420ADD3BF01C40EAF71340BAC74940BD8A1A4135F01C40C4AFB50FBAC74940500B94CB3BF01C40DDF4F9A9B8C74940B086D6191AF01C40F08EC8B9B7C74940	2000-01-01	\N	\N
112	14556.0	DENW05AL10002KY2	120.0	DENW05AL10002KY2	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	64.14683436229825	377668.9381497007	5713539.515613729	14556.0	0106000000010000000103000000010000000A0000000EB7069BF3F01C404434D43DA3C7494010A74B9AF1F01C40540DDC22A1C7494012143778DBF01C4083E72043A1C74940850DB804DBF01C400FFB0A44A1C7494068A02A4FDBF01C40A558648FA1C7494047A8A9C2DBF01C400A457A8EA1C74940EBA96087DEF01C402B766576A4C74940EDAD2CF1DEF01C4005078A75A4C74940071EA7A8F4F01C40561AC458A4C749400EB7069BF3F01C404434D43DA3C74940	2000-01-01	\N	\N
113	14557.0	DENW05AL10002KY4	121.0	DENW05AL10002KY4	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	89.48229729719242	377733.2627238933	5713662.946771987	14557.0	010600000001000000010300000001000000090000004C0E7730C0F11C409A40C705C6C74940FA56A5B8C0F11C400AC0416CC9C74940FCB6135CCEF11C40A92CF46BC9C74940CCA4AD58CEF11C4005D532EAC8C74940C10F8E25E1F11C4042C23FE7C8C74940E84264FCE0F11C400CAEE822C6C74940B666CF53D2F11C40D6348325C6C749406FFB2C4DD2F11C40F31EA602C6C749404C0E7730C0F11C409A40C705C6C74940	2000-01-01	\N	\N
114	14560.0	DENW05AL10002KYF	122.0	DENW05AL10002KYF	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	91.37453102623112	377649.99736022844	5713367.805709841	14560.0	0106000000010000000103000000010000000A000000F7BC82BFB0F01C4041325A2E6EC74940C4EC214AAFF01C402A6EB6E56EC749407AA1593CA2F01C406F7B46BC6EC749401574FF719CF01C40DED4E89471C749402ADD5428ABF01C40FF11FEC271C7494028DA3770ABF01C4022E9D29F71C74940CCC749DABBF01C409E58EED371C74940B272935CC1F01C401735FE1E6FC74940AF02FCD0C2F01C40F67FA1676EC74940F7BC82BFB0F01C4041325A2E6EC74940	2000-01-01	\N	\N
115	14574.0	DENW05AL10002Kzl	123.0	DENW05AL10002Kzl	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	211.75971874967215	377367.36260687764	5713358.382753874	14574.0	01060000000100000001030000000100000009000000D8C9206168EC1C40905E8E3D6DC749409C011A096FEC1C4069EF3F536DC74940637E669273EC1C407D779FD46DC749404511995580EC1C404FC715FE6DC7494099CB70C586EC1C409CF754A06DC749401F76A52498EC1C4046E3E5D96DC7494010A924D8A1EC1C406FF7093569C74940EDC1880372EC1C409559DA9A68C74940D8C9206168EC1C40905E8E3D6DC74940	2000-01-01	\N	\N
116	14582.0	DENW05AL10002L0F	124.0	DENW05AL10002L0F	1	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	89.81904188776389	377542.04863610404	5713353.69092421	14582.0	010600000001000000010300000001000000090000006321CAC305EF1C40B33E70746CC74940255126D313EF1C40CAB5C7A06CC74940D3DA789613EF1C405CAFFDBE6CC7494032D0583225EF1C4016178CF66CC749405B3635E52BEF1C403455B39769C74940B2C1BF081AEF1C4036B9445F69C7494074158EFB18EF1C407E3DB7E569C749402233255B0BEF1C40859DA3BA69C749406321CAC305EF1C40B33E70746CC74940	2000-01-01	\N	\N
117	14588.0	DENW05AL10002L16	125.0	DENW05AL10002L16	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	65.05367489060154	377657.0466712138	5713540.645101487	14588.0	0106000000010000000103000000010000000D000000C62EBC48AEF01C40CE6CD383A1C749401437F0DEADF01C40A2DAAE84A1C7494081F54D2AAEF01C40D1492FD0A1C74940CE332893AEF01C40DE1740CFA1C74940D128D83AB1F01C4075090AB7A4C74940F4F74EAFB1F01C406A6E20B6A4C74940BEF3CF4FC7F01C4047836395A4C749405E1149C3C7F01C4035BD8C94A4C74940A1E74AFFC4F01C40534D76ADA1C7494007BD6E7DC5F01C40195A91ACA1C749409684264FC5F01C403B111064A1C74940D2F391BFC4F01C40EBEEFF64A1C74940C62EBC48AEF01C40CE6CD383A1C74940	2000-01-01	\N	\N
118	14590.0	DENW05AL10002L1a	126.0	DENW05AL10002L1a	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	169.13767624518368	377282.4730242686	5713601.325540317	14590.0	0106000000010000000103000000010000000A000000F76B9D3130EB1C4023DA34DAB4C7494061A7B3AD4FEB1C404FCE18C6B1C749401B609CE14FEB1C406CB010C1B1C74940523BB8DF2AEB1C405C51F07AAFC7494031D120300DEB1C406E1777B2B2C749409800E3F61BEB1C4016C0E398B3C749401171A81918EB1C40C1BAFD01B4C7494084C31FF822EB1C403D285FA4B4C749407AFC1CDE26EB1C40E32A9547B4C74940F76B9D3130EB1C4023DA34DAB4C74940	2000-01-01	\N	\N
119	14605.0	DENW05AL10002L4l	127.0	DENW05AL10002L4l	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	172.78607300436124	377486.34821783	5713654.801699661	14605.0	0106000000010000000103000000010000000D0000003C99210A26EE1C40199B0B15C5C74940CBF895953BEE1C408A90EF8CC4C74940FF03E2453CEE1C40B03F9ABEC4C74940646C35254FEE1C408DA1144BC4C749401D6602E742EE1C4045B1982FC1C749405B88703930EE1C4035F0EDA1C1C74940A82921EF30EE1C40EB990ED8C1C7494098468C791BEE1C407E913A5BC2C74940B3DD8EA51AEE1C40C9570626C2C74940EE8BFC8107EE1C4089A5139BC2C749406C8A02EE13EE1C4018E470B5C5C749402A71C0BC26EE1C4069595742C5C749403C99210A26EE1C40199B0B15C5C74940	2000-01-01	\N	\N
120	14609.0	DENW05AL10002L5F	128.0	DENW05AL10002L5F	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	143.81904322086484	377388.75547926093	5713644.88951494	14609.0	0106000000010000000103000000010000000C0000008E1521A39BEC1C405B20BE26C0C749407D67A232BEEC1C40074B9754C2C74940CE6B8F57BEEC1C4058280A51C2C7494062DD4F27DBEC1C408EE4C286BFC74940B2D4E808DBEC1C4028C0E484BFC74940F939D47ECFEC1C40B97521CABEC749408A2A66A1C6EC1C40519E993ABEC749405685DB9FB8EC1C4031D3F257BDC74940FFB32DEAB7EC1C403F4D8F69BDC74940B3992DFCACEC1C4035469B78BEC7494084B813D09BEC1C4004204D22C0C749408E1521A39BEC1C405B20BE26C0C74940	2000-01-01	\N	\N
121	14620.0	DENW05AL10002L9F	129.0	DENW05AL10002L9F	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	88.27402871847153	377506.6761592407	5713768.756898732	14620.0	0106000000010000000103000000010000000500000025A44FD986EE1C40F1B76B07E5C749400CF927526AEE1C400F52E335E3C74940B72AB8BD54EE1C40EA3BEC4AE5C7494039EC7C5771EE1C40A2E1A418E7C7494025A44FD986EE1C40F1B76B07E5C74940	2000-01-01	\N	\N
122	14637.0	DENW05AL10002Lbv	130.0	DENW05AL10002Lbv	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	88.55761465240903	377803.6555617532	5713637.112785474	14637.0	0106000000010000000103000000010000000E00000084D3D545CDF21C40F95244DEC1C74940E3CD2285CCF21C4010895BDEC1C74940D7579789CCF21C4030057224C2C74940CFD9FDB3CFF21C40D3266224C2C749409D30E2B1CFF21C40CAD84A15C2C7494095473503DFF21C401E41E314C2C74940ABBC2002DFF21C40B009F5F5C1C74940F0FC9498EDF21C40831794F5C1C74940BB7E7A1FEDF21C408BD59832BFC749408A556E55DAF21C40B114C432BFC749407D5DA250DAF21C4078BEEFA8BEC749400F529E5DD9F21C409DC3EEA8BEC74940F70768FFCCF21C4004C09FA9BEC7494084D3D545CDF21C40F95244DEC1C74940	2000-01-01	\N	\N
123	14652.0	DENW05AL10002Ld4	131.0	DENW05AL10002Ld4	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	142.12630469258875	377599.6772518709	5713496.348987629	14652.0	0106000000010000000103000000010000000A000000E6F16E37E9EF1C4028690F8D97C749402EF8AFA6FBEF1C405DF00B7997C749407E2CF8F2F8EF1C40AB4D748C93C74940E5748DACD1EF1C40BDA40EB593C7494077B14F56D2EF1C40EC4F4AB794C7494093EF9E8CD0EF1C409BF398B994C74940714DA6BCD1EF1C40B5A4008B96C7494081CAA888D3EF1C4040E8958A96C7494084699A40D4EF1C40A817C7A397C74940E6F16E37E9EF1C4028690F8D97C74940	2000-01-01	\N	\N
124	14658.0	DENW05AL10002LdL	132.0	DENW05AL10002LdL	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	89.09968026428942	377763.87750129163	5713661.993025005	14658.0	010600000001000000010300000001000000090000002CF65AD752F21C406E074D65C9C74940CBF4C30053F21C40B56994EDC5C74940A35CE6A340F21C40904667EEC5C7494041B320A540F21C40E276F90FC6C74940A5A5C0DE32F21C400B349710C6C74940909916D532F21C409511BDD9C8C74940A49C03C345F21C40D323C0DFC8C749403EC678C745F21C401BD35F64C9C749402CF65AD752F21C406E074D65C9C74940	2000-01-01	\N	\N
125	14671.0	DENW05AL10002LEM	133.0	DENW05AL10002LEM	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	87.58797161295115	377710.4222325196	5713639.5964573175	14671.0	01060000000100000001030000000100000009000000B1B60A626CF11C4070747BBEBEC74940F5127EB66CF11C4011622526C2C749409396BE0B7FF11C400107DC24C2C74940A0C8390A7FF11C40FA5D9F0DC2C74940D41A8C978CF11C40DF36C00CC2C74940DC23D9628CF11C40E72C2545BFC7494055A48CCB79F11C404F3D2347BFC749403FD721BD79F11C4044F436BDBEC74940B1B60A626CF11C4070747BBEBEC74940	2000-01-01	\N	\N
126	14679.0	DENW05AL10002LEX	134.0	DENW05AL10002LEX	0	18	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	390.85139498754864	377866.8747006192	5713530.807970343	14679.0	01060000000100000001030000000100000015000000E62A9F05EBF31C404C2E6B1AA0C74940BD6E6BF8E8F31C40DAE970BC9DC74940DA2E0221D4F31C404409FED79DC74940E05E7266D4F31C402F95452A9EC74940F29C81A4C9F31C40523743389EC74940E8FB855FC9F31C404DBDA4E79DC74940FFD762E1BEF31C400BFE88F59DC74940D97AA979BEF31C408677FB7E9DC749400C479076ABF31C4053A951989DC74940D8516AFBAEF31C40C97723EBA1C7494007596D07C6F31C40A9A823CFA1C74940F82526DEC9F31C40670200D2A5C74940F2E4CFBE02F41C4061122386A5C749406BEFC27E01F41C40A5A74C13A4C74940FE65E6F8FBF31C40F65E9A1AA4C74940B1747A44FBF31C40656EE949A3C74940ECE456C7F4F31C40DF797C52A3C7494077554317F3F31C406B515E5EA1C7494078604453E1F31C4091D9D075A1C7494073AC1633E0F31C4041C6D428A0C74940E62A9F05EBF31C404C2E6B1AA0C74940	2000-01-01	\N	\N
127	14681.0	DENW05AL10002LF3	135.0	DENW05AL10002LF3	1	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	104.55546598276123	377758.6000312018	5713615.897636858	14681.0	0106000000010000000103000000010000000B00000015994DC91DF21C4058EA3AA5B8C74940AFD96B4C1FF21C4096855C30BBC74940643BA46A2DF21C4038E7FD23BBC7494043CB66C02DF21C40DD62B1A8BBC7494020A902633BF21C407BE96D9EBBC74940AA1C99FF3AF21C400357E916BBC749407A6231FE49F21C40193E1405BBC749406B363C2F49F21C40B33A01D8B9C74940A05B00B549F21C400A7480D7B9C74940529FAEC648F21C4048ECBA7CB8C7494015994DC91DF21C4058EA3AA5B8C74940	2000-01-01	\N	\N
128	14688.0	DENW05AL10002LFv	136.0	DENW05AL10002LFv	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	151.1415659582708	377448.73647144355	5713602.840406112	14688.0	010600000001000000010300000001000000090000005F461963B0ED1C40D2E17C53B4C74940CA87B641ADED1C401994D37EB0C74940B5C76932A5ED1C4013779C8BB0C74940AACCD78EA5ED1C40C1495310B1C7494087C1281D91ED1C40E58B722EB1C74940B977C5B391ED1C40A9FBA9E1B1C74940F3048BF495ED1C40610DB3EBB6C749401393C55BB2ED1C40EA0085BCB6C749405F461963B0ED1C40D2E17C53B4C74940	2000-01-01	\N	\N
129	14701.0	DENW05AL10002LGX	137.0	DENW05AL10002LGX	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	143.6301459177048	377561.21555881435	5713453.395474925	14701.0	01060000000100000001030000000100000009000000B041C5953CEF1C4018DAF5E189C74940750358894AEF1C4002237A0A8AC749409D127E594AEF1C40D218CA248AC74940817453AF61EF1C40C2B69B688AC74940C0FF24E061EF1C40EA374C4E8AC74940C947D92B6FEF1C4015F4E9748AC749405D7BBEFD74EF1C405067656887C74940E370796042EF1C4019D4DCD686C74940B041C5953CEF1C4018DAF5E189C74940	2000-01-01	\N	\N
130	14707.0	DENW05AL10002LHd	138.0	DENW05AL10002LHd	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	193.11761789768934	377560.4941773275	5713732.735860241	14707.0	0106000000010000000103000000010000000500000057FC733520EF1C40049D1E2DDDC749408EA3636945EF1C40743AE405DEC749404FD985D658EF1C408978BEACD8C74940A772899233EF1C40462DFFD8D7C7494057FC733520EF1C40049D1E2DDDC74940	2000-01-01	\N	\N
131	14708.0	DENW05AL10002LHD	139.0	DENW05AL10002LHD	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	175.69001633633889	377898.32620979764	5713634.593898678	14708.0	0106000000010000000103000000010000000D0000008C8B7F6455F41C40866B439DBEC749409EC8CE4A55F41C407155571FBFC749406010D1A02FF41C40B2EA9C21BFC7494099D5B63F2FF41C4066C2009FBEC749406E9C574F22F41C407244939FBEC74940D5013C2C22F41C401F4EF006C2C74940F8B7330634F41C40639FB006C2C74940930E21F033F41C401A6C7AE0C1C74940BF294B4650F41C40B8B714DFC1C74940A72DEA4150F41C40B7914C06C2C749405BDD756662F41C40C68FF605C2C74940BF409BB862F41C4083B7A69CBEC749408C8B7F6455F41C40866B439DBEC74940	2000-01-01	\N	\N
132	14727.0	DENW05AL10002LIJ	140.0	DENW05AL10002LIJ	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	147.84397465579968	377630.69585920277	5713641.948997544	14727.0	010600000001000000010300000001000000090000001593368D31F01C409C04C73FBFC74940638A47A331F01C40756F180FC2C74940AE29321D41F01C4014BFED0EC2C749401725711E41F01C40B941C739C2C749404850AB255BF01C40ACAF7C39C2C74940AD455C225BF01C4065F8EA0BC2C74940CFDA88D26AF01C40B94CA00BC2C7494039D919CA6AF01C4010BF3742BFC749401593368D31F01C409C04C73FBFC74940	2000-01-01	\N	\N
133	14729.0	DENW05AL10002LIN	141.0	DENW05AL10002LIN	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	157.36864405032247	377432.5351776951	5713336.185179705	14729.0	0106000000010000000103000000010000000900000029CA79A266ED1C4023766F7967C74940C4ED9F0D88ED1C4095EF5BE167C74940DB3A98B18BED1C40F207B21466C74940F978370E91ED1C40975AEF2466C74940902F6FBF93ED1C404A7505CE64C7494088B922618EED1C4077E7F2BC64C74940AB3A90EC91ED1C40BD73B9FA62C749400A7F797370ED1C409AF1219462C7494029CA79A266ED1C4023766F7967C74940	2000-01-01	\N	\N
134	14741.0	DENW05AL10002LJJ	142.0	DENW05AL10002LJJ	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	64.27939103214885	377398.704094183	5713598.99874309	14741.0	0106000000010000000103000000010000000D00000041129CA4EEEC1C403A9D6E80B0C74940158B0CBDEEEC1C40A06A4BC4B0C74940FE22FB71DAEC1C4075142CD3B0C74940FAE58A59DAEC1C4001474F8FB0C74940D7E9AA7CD9EC1C40BE25B98FB0C74940AA5B48C9DAEC1C40CAF71826B4C749408713739DDBEC1C4081E5AA25B4C74940C88AFD92DBEC1C40F37DFB08B4C74940334407C5EFEC1C404030AEF9B3C7494062EB38CFEFEC1C40F61E1A14B4C74940A39392DCF0EC1C406B627A13B4C74940F624358BEFEC1C4088CEE27FB0C7494041129CA4EEEC1C403A9D6E80B0C74940	2000-01-01	\N	\N
135	14768.0	DENW05AL10002LLb	143.0	DENW05AL10002LLb	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	86.20993304927106	377866.89015429985	5713658.897457902	14768.0	0106000000010000000103000000010000000900000048BC4AFDB9F31C40CCFE40CBC5C74940C4E94BCFBAF31C402714C72EC9C74940E2561BD9C7F31C4002B96C2DC9C74940C7DC8FDFC7F31C40C63DD7A7C8C7494083228335DAF31C40273D5BA4C8C74940B83D39D1D9F31C40DECAB6E5C5C749402E226BF0CBF31C406E6144E7C5C74940379226ECCBF31C40FF5E3CC9C5C7494048BC4AFDB9F31C40CCFE40CBC5C74940	2000-01-01	\N	\N
136	14769.0	DENW05AL10002LlD	144.0	DENW05AL10002LlD	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	86.7583469026722	377479.8531431626	5713273.799545284	14769.0	010600000001000000010300000001000000090000000C68FDD22DEE1C404A96D79751C749409763F4C01CEE1C407B8D8B1A54C749407A6197F81DEE1C40A6405A2754C749405A891CF01EEE1C402E45EE0254C74940495DD08239EE1C40A91CE51C55C74940056B37B24DEE1C409231BB2452C749406925B9173EEE1C4094AF527F51C749405D4CD7033AEE1C404F590E1952C749400C68FDD22DEE1C404A96D79751C74940	2000-01-01	\N	\N
137	14776.0	DENW05AL10002LlX	145.0	DENW05AL10002LlX	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	88.13897723215632	377874.50238980463	5713598.3347623125	14776.0	0106000000010000000103000000010000000900000010DC89A9FBF31C400A178959B5C7494012E16AFD02F41C407976AA51B5C749409280BB2402F41C407298E546B4C7494093892188D6F31C40E9865B7AB4C749403DFAA1B8D7F31C40B1A1B3DDB5C74940B6611B1ED9F31C4078D003DDB5C74940D9136D16DAF31C40B243B3FEB6C74940C52F7EE7FCF31C4013606BD9B6C7494010DC89A9FBF31C400A178959B5C74940	2000-01-01	\N	\N
138	14779.0	DENW05AL10002LM3	146.0	DENW05AL10002LM3	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	85.62632962223142	377849.6970222852	5713587.073643948	14779.0	0106000000010000000103000000010000000900000062CB91667DF31C40BFB6E2E2B0C749404979BDCE7EF31C40EE251F51B2C7494010F63ECF77F31C401A5BA35BB2C74940CDD1D8CF78F31C4032F07B62B3C74940A7EA192CA4F31C40A3EDCC20B3C74940E67F87F6A2F31C40FF8F5EC1B1C749403E2BE06AA1F31C4065ED6AC3B1C74940BD338B7FA0F31C4059F541B3B0C7494062CB91667DF31C40BFB6E2E2B0C74940	2000-01-01	\N	\N
139	14783.0	DENW05AL10002LMh	147.0	DENW05AL10002LMh	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	202.95098594069717	377632.1616765708	5713510.8930213135	14783.0	0106000000010000000103000000010000000F0000000134466372F01C408CCD3A8A9CC74940D078B4F372F01C4080EAAB899CC7494067B117AA6FF01C40D6DC9EFC96C749403D64729B70F01C405776B7FB96C749404F61588F70F01C40FCD966E796C74940D76CD15C4BF01C40ED97640597C749406AE679D64CF01C40F6C9225D99C74940F9DC7CB34DF01C40E7E9445C99C7494083D9032A50F01C406DF98E469DC749406B020F4C4FF01C407A1559479DC74940D2A55C5A4FF01C406019EE5D9DC74940C6E2334F74F01C4083090D3C9DC7494016A5554374F01C40A06CFB269DC749407CE1ADDD72F01C40645245289DC749400134466372F01C408CCD3A8A9CC74940	2000-01-01	\N	\N
140	14789.0	DENW05AL10002LMU	148.0	DENW05AL10002LMU	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	89.91354566492373	377554.8317131401	5713355.400366467	14789.0	0106000000010000000103000000010000000900000043E2CD6037EF1C40E193F62F6DC74940C76A7E3749EF1C4023F44E686DC749406AE4397349EF1C407635054A6DC7494006BAFD3F57EF1C40DC27B5756DC7494095CB2FA25CEF1C402A8E81BB6AC74940129961D54EEF1C40033BF88F6AC74940D53FB9DE4FEF1C40548870096AC749405831CB0E3EEF1C4019C12ED169C7494043E2CD6037EF1C40E193F62F6DC74940	2000-01-01	\N	\N
141	14813.0	DENW05AL10002LOH	149.0	DENW05AL10002LOH	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	88.57833085726634	377719.33333762456	5713639.345448114	14813.0	010600000001000000010300000001000000090000002C276F299FF11C403075EEB6BEC74940A84637539FF11C4089402B43BFC74940DC23D9628CF11C40E72C2545BFC74940D41A8C978CF11C40DF36C00CC2C74940B14668639BF11C40EDC9DF0BC2C74940F324F9649BF11C4042D9F522C2C749405D236AFBACF11C4030F3EA21C2C749404603E774ACF11C40EF2016B6BEC749402C276F299FF11C403075EEB6BEC74940	2000-01-01	\N	\N
142	14815.0	DENW05AL10002LOL	150.0	DENW05AL10002LOL	1	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	59.07339132920606	377510.08951895306	5713825.754646139	14815.0	010600000001000000010300000001000000060000008C41E76D6AEE1C40AE524668F4C749407D0140C06BEE1C40B87FAB4AF7C74940CEEA3CE26BEE1C40CC9A4395F7C749400377529080EE1C40A2845686F7C74940255EE91D7FEE1C406E2C5A59F4C749408C41E76D6AEE1C40AE524668F4C74940	2000-01-01	\N	\N
143	14828.0	DENW05AL10002LPg	151.0	DENW05AL10002LPg	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	61.14623479772126	377506.4015236771	5713797.123294784	14828.0	0106000000010000000103000000010000000700000085170C2874EE1C406D17C5E2EBC74940F83483CC5EEE1C40033C46F2EBC749401DE2040E60EE1C400785C0D2EEC7494046BAC53060EE1C40A6911E21EFC749400BA33F8C75EE1C407A52D711EFC749407A524C6A75EE1C4057D700C4EEC7494085170C2874EE1C406D17C5E2EBC74940	2000-01-01	\N	\N
144	14831.0	DENW05AL10002LPl	152.0	DENW05AL10002LPl	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	83.52127577201465	377427.55940989987	5713602.061667363	14831.0	01060000000100000001030000000100000009000000FE9D6CA143ED1C401257AEA9B1C74940F52C579546ED1C404BAF174CB5C74940A6EA6FF461ED1C40C78D2432B5C74940BB55230B61ED1C4033202CFDB3C749406D54941E5FED1C40C8F67CFFB3C74940EA491F705DED1C40C93F5CF8B1C7494097E91A1057ED1C4081DB9900B2C74940115842BE56ED1C40364FD78EB1C74940FE9D6CA143ED1C401257AEA9B1C74940	2000-01-01	\N	\N
145	14835.0	DENW05AL10002LPO	153.0	DENW05AL10002LPO	0	16	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	225.34352508129084	377719.0518338277	5713424.181886514	14835.0	0106000000010000000103000000010000001300000057A780EE9AF11C40787A86657FC749402479396986F11C40E97B28887FC7494020CB5DBB87F11C4085792DDC80C74940FF05A88690F11C40BF3F9BCE80C74940B4116F7892F11C40B2CB78C282C7494007C22EFEACF11C40184F999982C74940A796A7A2ADF11C40FA0AB73F83C74940EB7D5009BAF11C40B367B62C83C74940B09FF7B2BAF11C40DF555AC883C7494061317807C8F11C40A79366B683C749404D21907AC7F11C408B37B81B83C749404B835672D4F11C40039F100983C7494006F0C017D3F11C40C8289AA781C7494095C825EFCFF11C40FEEE5CAB81C74940F39A6C7CCDF11C407B7136737FC74940A0D42E14B5F11C40B1BFE1947FC749409835D26FB4F11C40D8102C017FC74940325D76C99AF11C4089F5EA2A7FC7494057A780EE9AF11C40787A86657FC74940	2000-01-01	\N	\N
146	14836.0	DENW05AL10002LPp	154.0	DENW05AL10002LPp	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	125.70844505215064	377492.65556152194	5713530.2015840225	14836.0	010600000001000000010300000001000000070000000A6C36035CEE1C403134C6139DC74940A5738BF437EE1C4028BF26499DC74940E8C59AB43AEE1C4050F0048DA0C74940DF5C2E2465EE1C408087E355A0C74940F342BDC363EE1C40533013A49EC749406690FA7662EE1C40BE11360A9DC749400A6C36035CEE1C403134C6139DC74940	2000-01-01	\N	\N
147	14850.0	DENW05AL10002LQk	155.0	DENW05AL10002LQk	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	88.87590007572362	377754.9372981665	5713662.216304546	14850.0	0106000000010000000103000000010000000900000065049EAF12F21C40588583F0C5C74940B15D99BB12F21C406B05A867C9C74940E96595E41FF21C40A254B065C9C749402CBA24B81FF21C4040D79DD8C8C74940909916D532F21C409511BDD9C8C74940A5A5C0DE32F21C400B349710C6C74940B4E2468224F21C408E3F4D11C6C74940A2F71A8024F21C403A4BA7EFC5C7494065049EAF12F21C40588583F0C5C74940	2000-01-01	\N	\N
148	14851.0	DENW05AL10002LQL	156.0	DENW05AL10002LQL	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	88.17519938107579	377779.74147732044	5713534.05618121	14851.0	01060000000100000001030000000100000009000000547ED0CA8BF21C400064DD21A0C74940EFB7F6488CF21C40B691BBADA0C749406D8A816279F21C40F7F852C8A0C74940276D84B77BF21C408EA26889A3C74940ECD49B2989F21C4034DEEC75A3C74940AAC00F3989F21C40D0DD5595A3C7494022AD71E89BF21C4053F6697AA3C74940201100F498F21C401ADE4C0FA0C74940547ED0CA8BF21C400064DD21A0C74940	2000-01-01	\N	\N
149	14858.0	DENW05AL10002Lr8	157.0	DENW05AL10002Lr8	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	75.23169945832342	377556.80657109874	5713850.537215158	14858.0	010600000001000000010300000001000000070000003B0ACD4532EF1C40CBEA4D35FEC7494085CE324C37EF1C402A502FC9FCC749407DBC81B515EF1C40CA878316FCC7494034512D0B0EEF1C40C9616B41FEC7494053CC165C36EF1C409C1F7C1AFFC74940D82F5B0339EF1C40887E455AFEC749403B0ACD4532EF1C40CBEA4D35FEC74940	2000-01-01	\N	\N
150	14859.0	DENW05AL10002LRA	158.0	DENW05AL10002LRA	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	149.10883075743914	377490.5542019974	5713468.859458128	14859.0	010600000001000000010300000001000000050000008DAC7EE761EE1C4035B2F07E8AC749403BDA767240EE1C400936191A8AC74940EBD6449E36EE1C401B7910F18EC7494044288D0858EE1C40A97F6E598FC749408DAC7EE761EE1C4035B2F07E8AC74940	2000-01-01	\N	\N
151	14867.0	DENW05AL10002LRt	159.0	DENW05AL10002LRt	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	139.19906412344426	377601.6442701174	5713517.622685582	14867.0	010600000001000000010300000001000000050000001685B141DAEF1C4007C19A009EC74940A72D97D0FFEF1C4087763FDB9DC749402F9FAB2CFDEF1C4097AAC8BE99C74940FC2F7D88D7EF1C4097FC2CE499C749401685B141DAEF1C4007C19A009EC74940	2000-01-01	\N	\N
152	14878.0	DENW05AL10002Lsx	161.0	DENW05AL10002Lsx	1	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	148.6089217076078	377506.1568242879	5713648.4683450945	14878.0	01060000000100000001030000000100000009000000900192F155EE1C40065EC801C1C7494053967C6D60EE1C400CC926ADC3C74940590EC3756FEE1C40E0508550C3C74940AE37532D70EE1C40ADF39D80C3C749405A815A2989EE1C40B9094EE7C2C74940A327CA7188EE1C40146835B7C2C7494079908C5B97EE1C4026EC2D5CC2C74940CE992DE88CEE1C40FCA547B1BFC74940900192F155EE1C40065EC801C1C74940	2000-01-01	\N	\N
153	14885.0	DENW05AL10002Lto	162.0	DENW05AL10002Lto	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	97.10197790432721	377514.9469752057	5713523.253925132	14885.0	010600000001000000010300000001000000050000008AE09F358FEE1C4047B63F999BC749405FAFFC5391EE1C40A723AE669EC749402736C4B5B7EE1C401FDAB23B9EC74940261B9CB3B5EE1C40E2DCCA6D9BC749408AE09F358FEE1C4047B63F999BC74940	2000-01-01	\N	\N
154	14888.0	DENW05AL10002LtY	163.0	DENW05AL10002LtY	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	88.78942944435403	377567.0712611872	5713705.660656133	14888.0	010600000001000000010300000001000000090000009A9E296341EF1C400E8BE9B3D2C749408EC8D7B247EF1C40C37A59DDD2C74940151EC1DE43EF1C404350C5EAD3C749401D92DDD765EF1C4084784CAAD4C749401D8B5A8E69EF1C408FABE4A4D3C74940E20387016BEF1C402CA022ADD3C7494048C3BEE96FEF1C402D821E54D2C74940B49EB1F445EF1C407F45B65FD1C749409A9E296341EF1C400E8BE9B3D2C74940	2000-01-01	\N	\N
155	14890.0	DENW05AL10002Lu6	164.0	DENW05AL10002Lu6	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	88.67907430386185	377719.9144653216	5713663.311186355	14890.0	01060000000100000001030000000100000009000000C59DD4A59AF11C401DA2F425C6C749404A56E15B8CF11C400E243F26C6C74940169D1B7C8CF11C40396C2CEBC8C749400F33BBDD9FF11C40B1C180ECC8C749401F586806A0F11C40F308EE72C9C749409DF8A2FEACF11C4091451472C9C74940FC16D499ACF11C40E9DAD606C6C7494057D2BBA49AF11C400EB81907C6C74940C59DD4A59AF11C401DA2F425C6C74940	2000-01-01	\N	\N
156	14893.0	DENW05AL10002LUC	165.0	DENW05AL10002LUC	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	76.48808468785137	377555.0286448493	5713857.695968251	14893.0	0106000000010000000103000000010000000700000069EEAD4E06EF1C400C0D0F7800C84940E1D734D727EF1C400DC8A52901C849402BEE78DA2CEF1C4031CC46BEFFC749400E7A0D9833EF1C40A4152BE3FFC7494053CC165C36EF1C409C1F7C1AFFC7494034512D0B0EEF1C40C9616B41FEC7494069EEAD4E06EF1C400C0D0F7800C84940	2000-01-01	\N	\N
157	14895.0	DENW05AL10002LUE	166.0	DENW05AL10002LUE	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	148.23777746176344	377590.789417748	5713410.613507572	14895.0	010600000001000000010300000001000000090000003D82D3EEBAEF1C4089B90DDD79C749406599CA24BBEF1C407CD92AAF7AC74940F89AC45DBBEF1C4036926E8D7BC749408D6C29C3BBEF1C40F13A041B7DC749409A7523FCBBEF1C4080F347F97DC74940D89CC72FBCEF1C40EE8B26C07EC74940ACE79FEDDDEF1C401596BCB37EC749405456ECACDCEF1C401F2ABCCF79C749403D82D3EEBAEF1C4089B90DDD79C74940	2000-01-01	\N	\N
158	14896.0	DENW05AL10002LUG	167.0	DENW05AL10002LUG	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	88.0416224486271	377826.1125318774	5713636.516325264	14896.0	0106000000010000000103000000010000000900000072C9E43034F31C401BA8EF11C2C749402126882F34F31C40F50AE9F3C1C749408D1F0D5042F31C40D783EEF2C1C74940FE53A51742F31C406E9F5F30BFC74940EA4EDE3C2FF31C405AFD6A31BFC74940A0680D382FF31C4029E07EA4BEC7494062B6E80222F31C40875F29A5BEC7494092F9362922F31C40D142D912C2C7494072C9E43034F31C401BA8EF11C2C74940	2000-01-01	\N	\N
159	14897.0	DENW05AL10002LUj	168.0	DENW05AL10002LUj	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	489.420391650754	377313.521211037	5713576.7127906075	14897.0	01060000000100000001030000000100000014000000DADEF19FADEB1C405AC3DA7AA7C74940C5A5BF44AFEB1C407B038B1AA9C749405DC57CD384EB1C40A7CF075DA9C749402CFDDF3D86EB1C40ECCBD0AFAAC74940FEF02CD175EB1C40E1E7C2ACA9C7494054D25A6C75EB1C40215887B6A9C74940570CD2775DEB1C40F611BB03ACC749406427D5117BEB1C40D42471E0ADC74940D893D5DF7AEB1C40971EE8EEADC74940DBB33B837CEB1C40649EB1F7ADC7494094C4C6C582EB1C405DC45719AEC74940956634B484EB1C405867B423AEC749403AFFF7E584EB1C40D86DFE15AEC74940F177E193D7EB1C404E0DDB94ADC7494033188955D3EB1C40EF15E14EA9C74940104ADD68DDEB1C40DB76FF3EA9C749401A44BE02DCEB1C4081F30FD5A7C749403F988E19C1EB1C40021D71FFA7C749400EFADE78C0EB1C403C1F415DA7C74940DADEF19FADEB1C405AC3DA7AA7C74940	2000-01-01	\N	\N
160	14907.0	DENW05AL10002LV0	169.0	DENW05AL10002LV0	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	221.07044663652778	377286.6922856885	5713466.224350435	14907.0	0106000000010000000103000000010000000D000000475C676861EB1C406E61E71188C749409479DFC837EB1C409E0B4D7F87C74940670B5D4035EB1C40CBA649B388C74940D1F75C8537EB1C405DE74DBC88C749408D55E6A430EB1C401D8069FD8BC74940D249238D2EEB1C409F08FFFA8CC749404C20DE0C4BEB1C40D02545508DC74940906869EB59EB1C40A147CA7C8DC7494059419D125CEB1C4075F7EC8E8CC74940872678955DEB1C40F655F6E78BC74940E207659E61EB1C40264EA72A8AC74940CE95715366EB1C4017F2362388C74940475C676861EB1C406E61E71188C74940	2000-01-01	\N	\N
161	14911.0	DENW05AL10002Lvb	170.0	DENW05AL10002Lvb	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	155.82922389358282	377570.2377428444	5713815.551292271	14911.0	0106000000010000000103000000010000000500000083EDF47B40EF1C404E097671F5C7494072A1C88161EF1C405FFF522FF6C74940C39ACB2973EF1C4054C06456F1C74940255D60F351EF1C4009A53199F0C7494083EDF47B40EF1C404E097671F5C74940	2000-01-01	\N	\N
162	14913.0	DENW05AL10002Lvd	171.0	DENW05AL10002Lvd	1	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	90.01165838650195	377598.2009582877	5713361.199018595	14913.0	01060000000100000001030000000100000009000000415B4EAEDAEF1C40B30106336FC74940A36C0D4DECEF1C40057BBB6A6FC749401619C288ECEF1C405C06854C6FC749405B1558ABFAEF1C4031C058796FC749404C38BA1D00F01C400538C7BF6CC74940CB3BC903F2EF1C40189C31936CC7494043CAE111F3EF1C40E017E60C6CC74940F5902772E1EF1C40EE7C43D56BC74940415B4EAEDAEF1C40B30106336FC74940	2000-01-01	\N	\N
163	14930.0	DENW05AL10002Lwd	172.0	DENW05AL10002Lwd	1	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	86.56641919995309	377819.11988232174	5713554.07093604	14930.0	0106000000010000000103000000010000000D000000D3629D4110F31C40C1A2F697A6C74940C4E006500DF31C405CB0349CA6C74940057C6A610DF31C40352B67CEA6C74940EC0B0B270EF31C40971105CEA6C74940F9C5651F11F31C40E85D8E10AAC749408D2FD1521EF31C401B2146FCA9C749409C94A3A61DF31C4042020E72A9C74940C1E1F02230F31C4080506E56A9C74940E6D76DCB2DF31C4099E4049AA6C749409F431DE11FF31C402E9108AEA6C74940518C18C71FF31C40D8537891A6C74940BFAE1D5010F31C400564AEA7A6C74940D3629D4110F31C40C1A2F697A6C74940	2000-01-01	\N	\N
164	14943.0	DENW05AL10002LwX	173.0	DENW05AL10002LwX	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	193.78826633410063	377454.6016617739	5713411.914095125	14943.0	0106000000010000000103000000010000000F0000006677FF23CAED1C402112D1E77DC74940297C3DA6D6ED1C40954C960E7EC74940C0FC045DD7ED1C4019239EB17DC74940A1037BC3E0ED1C40B69CE4CE7DC7494087912226E8ED1C405535BF367AC74940BE3B4A59DDED1C40F229E9167AC74940DE5BBDCADDED1C40CEB32BDE79C74940B7663443B3ED1C4084862B5A79C74940B0E08496ABED1C402854B7287DC74940DCEBBC70B5ED1C40BB6757477DC7494044E141B0B4ED1C40D3315EA47DC74940FE805EF6C3ED1C409AF803D47DC74940744ED9B6C4ED1C40A22DFD767DC749409ADDBEDBCAED1C40B660D98A7DC749406677FF23CAED1C402112D1E77DC74940	2000-01-01	\N	\N
165	14950.0	DENW05AL10002LXN	175.0	DENW05AL10002LXN	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	139.01178064662963	377525.41454730125	5713580.612304581	14950.0	010600000001000000010300000001000000090000001547B033DEEE1C40CD00F242ACC74940E6E6CEE8A8EE1C403BF0049BACC749409D0D7A28ABEE1C4086D88554AFC74940DAF0183CD2EE1C4080C82518AFC74940307199C1D2EE1C4074505DAEAFC7494031E50122E0EE1C40D56CD79BAFC74940550D819CDFEE1C4044E59F05AFC749407B7731A6E0EE1C40EC735004AFC749401547B033DEEE1C40CD00F242ACC74940	2000-01-01	\N	\N
166	14988.0	DENW05AL10002M34	176.0	DENW05AL10002M34	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	102.03471001487924	377461.4928403279	5713564.301445073	14988.0	0106000000010000000103000000010000000B00000037AC6794E3ED1C40B051D399A7C74940ED77AAB7E2ED1C40EBF0E899A6C74940108BA791C5ED1C40C9B164C6A6C7494041795B91C7ED1C40801841D7A8C74940879EA0A4C6ED1C40C45BD8D8A8C74940EA9B7A4BC8ED1C4014721A9EAAC7494074F19847C9ED1C4028D9D79CAAC74940A158B9EDE5ED1C4043AAD073AAC74940599FCC0AE6ED1C408B0FB873AAC74940052CA95BE5ED1C4086138BA8A9C7494037AC6794E3ED1C40B051D399A7C74940	2000-01-01	\N	\N
167	15006.0	DENW05AL10002M5T	177.0	DENW05AL10002M5T	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	89.96447053784505	377722.06220757525	5713564.248092748	15006.0	010600000001000000010300000001000000090000006EA0FD6EADF11C4094200EE7A8C7494012D18A309EF11C40B14202FCA8C7494084759250A1F11C40620C9A66ACC749403C7193DFB2F11C408B3F764EACC749405373D150B2F11C40A3221FAAABC749405487D5EEBFF11C404D51AF98ABC7494003A3C75ABDF11C407D49D6B5A8C7494025D98C55ADF11C400073C6CBA8C749406EA0FD6EADF11C4094200EE7A8C74940	2000-01-01	\N	\N
168	15033.0	DENW05AL10002MA5	179.0	DENW05AL10002MA5	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	87.78018641710514	377805.77090060874	5713555.524083072	15033.0	01060000000100000001030000000100000009000000EE4650A7D9F21C40E922A21DA7C749409A68150FDCF21C406562B2DDA9C749403060A0DEEEF21C4062B927C2A9C749402A741864EFF21C40073E4D4CAAC74940E466479AFCF21C401C527A38AAC7494020808185F9F21C40C73787D1A6C749402A7C3395E7F21C40EA3B4DEBA6C74940DEEBAFB0E7F21C4006696009A7C74940EE4650A7D9F21C40E922A21DA7C74940	2000-01-01	\N	\N
169	15044.0	DENW05AL10002MAw	180.0	DENW05AL10002MAw	0	13	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	173.6937882063794	377677.43237997807	5713486.360125515	15044.0	0106000000010000000103000000010000001D000000C0F8433FFBF01C4067746AEB91C7494008C57734FAF01C40B54A4A0093C74940D693FD5AF9F01C40937F20FF92C7494011A53A46F9F01C4068BF651693C74940CDF35529FAF01C408CCCBA1793C74940A067FDEFF8F01C400935BD5B94C74940930CE20CF8F01C40D727685A94C74940E60EBEF1F7F01C4015E4A47694C74940C159D2F2F8F01C4046AE1B7894C7494077BFF2EDF7F01C409CF55A8695C7494075345636F7F01C405777418595C749408963DF09F7F01C400F9E28A195C74940CF9FDFE41DF11C40ECD171DC95C74940DCD591FB1DF11C404D802DC595C74940B8C3F17D1DF11C40BBDB69C495C749406A4457781FF11C40C97F0DB793C74940699005F51FF11C403D60BDB793C74940B9AB3AC120F11C40925465E392C74940355E924420F11C404C27A2E292C749404A707E3C22F11C40A1C300D790C749409B671EBA22F11C400868C4D790C74940FA3EB6C522F11C402B9857CB90C74940ABA2CC96FBF01C409914E28890C74940396FCB89FBF01C405D21BD9690C74940BED9E789FCF01C400874339890C7494002870E57FBF01C4056E0DDD691C749400F2E7981FAF01C405AA5A2D591C749409F6C936DFAF01C4074C91DEA91C74940C0F8433FFBF01C4067746AEB91C74940	2000-01-01	\N	\N
170	15052.0	DENW05AL10002MBn	181.0	DENW05AL10002MBn	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	188.18583422154188	377523.8547795777	5713677.856453284	15052.0	010600000001000000010300000001000000050000001EC5948B99EE1C40FE771E7DCCC749405EB9F97EBFEE1C40B582BF7BCDC74940A28E24A8D4EE1C40C141EB87C8C74940D8342E5FAEEE1C40071A908AC7C749401EC5948B99EE1C40FE771E7DCCC74940	2000-01-01	\N	\N
171	15059.0	DENW05AL10002MC2	182.0	DENW05AL10002MC2	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	87.4154440179045	377915.69183047634	5713634.135229988	15059.0	01060000000100000001030000000100000009000000CD382BFE74F41C404DD8D498BEC749400A12A21075F41C40356A9305C2C74940F8DE7BCF86F41C40839F5905C2C74940278C400387F41C400BD94BDEC1C74940F1B233C194F41C404AE8D7DFC1C74940F99A2D1195F41C40A5195520BFC749403212917682F41C4002F28520BFC74940360B127782F41C4091643698BEC74940CD382BFE74F41C404DD8D498BEC74940	2000-01-01	\N	\N
172	15062.0	DENW05AL10002MCb	183.0	DENW05AL10002MCb	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	108.9741713842377	377557.73147024657	5713577.249134787	15062.0	0106000000010000000103000000010000000500000034F57E5D29EF1C4058185DD8ABC749406998C69D2BEF1C402870949CAEC7494027A2282E57EF1C401E86F167AEC74940110F9CCF54EF1C40B3333D9EABC7494034F57E5D29EF1C4058185DD8ABC74940	2000-01-01	\N	\N
173	15069.0	DENW05AL10002MCo	184.0	DENW05AL10002MCo	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	95.36102380231023	377500.7744725421	5713726.384538945	15069.0	01060000000100000001030000000100000007000000B06BE0B740EE1C40D53FA5DED8C749400B05D1B45CEE1C401ADAB7A2DAC74940F9FE2F1A78EE1C407BDE84FED7C749407619D9686FEE1C4033BE4C73D7C749405DA80F286AEE1C40D68736F6D7C7494030EF2BEC56EE1C4009EB8AB9D6C74940B06BE0B740EE1C40D53FA5DED8C74940	2000-01-01	\N	\N
174	15071.0	DENW05AL10002MCt	185.0	DENW05AL10002MCt	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	151.16562822833657	377521.24848008336	5713289.237946916	15071.0	01060000000100000001030000000100000006000000596D353EBCEE1C402A5839B555C749401AFDE8ADACEE1C400B69040B58C74940456E86E7E1EE1C40766BA73F5AC74940B9A1F216E5EE1C40EC6E2C615AC7494029AC1BA4F4EE1C4098A8F50858C74940596D353EBCEE1C402A5839B555C74940	2000-01-01	\N	\N
175	15072.0	DENW05AL10002Mcw	186.0	DENW05AL10002Mcw	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	65.87203730165493	377663.11582329107	5713541.08414065	15072.0	0106000000010000000103000000010000000D00000047A8A9C2DBF01C400A457A8EA1C7494068A02A4FDBF01C40A558648FA1C7494007BD6E7DC5F01C40195A91ACA1C74940A1E74AFFC4F01C40534D76ADA1C749405E1149C3C7F01C4035BD8C94A4C74940BEF3CF4FC7F01C4047836395A4C7494060533C9AC7F01C40E72DD0E0A4C74940D76CBB0DC8F01C40F51AE6DFA4C749405BE4D5C7DEF01C40F64B9DBFA4C74940BBEA103CDFF01C4022B074BFA4C74940EDAD2CF1DEF01C4005078A75A4C74940EBA96087DEF01C402B766576A4C7494047A8A9C2DBF01C400A457A8EA1C74940	2000-01-01	\N	\N
176	15080.0	DENW05AL10002MdJ	187.0	DENW05AL10002MdJ	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	209.07084979582578	377549.4696326895	5713768.219917092	15080.0	0106000000010000000103000000010000000B0000006C32D33922EF1C40CE58C4CBE3C7494005FD3C7725EF1C406FF7B47BE3C74940D788392919EF1C40FE24C3ABE2C749403AD82AA415EF1C402163EEFEE2C7494056A02A000BEF1C40DE615B51E2C74940D318ABC5E9EE1C408BF52C79E5C74940CD0B965210EF1C40D46115E7E7C749406B6A5C8E17EF1C40580E065CE8C7494052792DB020EF1C40A1311D22E8C749408C25D1AF2DEF1C406E141783E4C749406C32D33922EF1C40CE58C4CBE3C74940	2000-01-01	\N	\N
177	15088.0	DENW05AL10002MEf	188.0	DENW05AL10002MEf	0	20	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	402.6770099258283	377464.38764742005	5713373.61967521	15088.0	010600000001000000010300000001000000190000003D363D5B02EE1C402D98061F72C7494047CD340D02EE1C40DEB9974C72C74940B0158BBF11EE1C404BEDD17C72C74940F6C5A83312EE1C4009DCD64472C749400F1D46BF1EEE1C40BB1B886C72C74940E80705501EEE1C40B33572A472C749407E8E261A2EEE1C40C80E00D672C74940A6653E0C35EE1C409B3C0E676FC749407096C7F300EE1C40361A89C26EC74940C6920AC6FFED1C40A81D6C5A6FC74940E5EA3080E9ED1C40DDF316146FC74940883B98BBEAED1C4029FAD97B6EC749409CCBAAA6B6ED1C40852F77D86DC74940B72456AFAFED1C40549F744871C749409CF9BF6BBFED1C40C480837A71C74940AAF3FBDABFED1C40C0B6AC4271C74940A3504D7CCCED1C40E4180D6971C7494016F1D60ECCED1C401FEC6BA171C74940C6E051C9DBED1C4065C079D371C74940FF889E24DCED1C40D7C1D6A671C749402AE1E1E4E5ED1C4003B4CFC471C74940278E68D2E2ED1C4010F4E04873C74940E7280589F5ED1C406362768373C74940E7FEBB92F8ED1C40F88487FF71C749403D363D5B02EE1C402D98061F72C74940	2000-01-01	\N	\N
178	15090.0	DENW05AL10002MEI	189.0	DENW05AL10002MEI	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	89.00748406842467	377838.576135567	5713528.360664387	15090.0	0106000000010000000103000000010000000900000091DFA84259F31C40E50FFFF89EC749407A41783F5CF31C40F5277762A2C749402C4DC3116EF31C40B928A248A2C749407AE0BFFE6DF31C409D2C542BA2C74940F925BCBF7CF31C40192F0015A2C749401A4E1C337AF31C40706909589FC74940B94CCCFA66F31C40CD735D749FC749400D563FA666F31C40713868E59EC7494091DFA84259F31C40E50FFFF89EC74940	2000-01-01	\N	\N
179	15108.0	DENW05AL10002MFX	190.0	DENW05AL10002MFX	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	127.34351870440878	377406.0405009755	5713658.591443486	15108.0	0106000000010000000103000000010000001400000065C65D6CFEEC1C4071ACDB47C6C74940A1F43C8B14ED1C40D988101DC4C749407D8DFA9D1AED1C401CCAD284C3C74940D54C867205ED1C401304262FC2C749401A75AB5CFFEC1C40200710C8C2C749404405C5D3F2EC1C4021D042FEC1C7494046587968DCEC1C405F93D528C4C749404A87EFFFDDEC1C409BFE4442C4C74940A0FAD230DEEC1C40FEF49B3DC4C74940947513BEE6EC1C40C0A659C6C4C7494016052A8DE6EC1C4067FD15CBC4C74940FB7F9BB3E7EC1C40178A71DDC4C74940AAE17B39E7EC1C4044D256EAC4C74940ACC1DD8EF2EC1C40B4FD3FA0C5C74940369EA915F3EC1C4040931393C5C74940C0688134F4EC1C40F295F7A4C5C749405CD86A65F4EC1C40213F3BA0C5C74940F408D304FDEC1C401AC3C229C6C749406197EFD3FCEC1C4027CD6B2EC6C7494065C65D6CFEEC1C4071ACDB47C6C74940	2000-01-01	\N	\N
180	15112.0	DENW05AL10002MGK	191.0	DENW05AL10002MGK	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	149.27035775315017	377411.57799509	5713862.773773797	15112.0	0106000000010000000103000000010000000B0000000929AEBBE6EC1C4037E62F87FFC7494025B08F45E2EC1C409BF76A79FFC74940E79DDB21E0EC1C40D515BA8700C849403ADCFE95E4EC1C40D1AFA49500C849404C5C47C8E2EC1C404DD1E37801C84940D76B04AA13ED1C405FD2451702C84940BAA08D181AED1C40BD8BBDD4FEC74940C9661CDA18ED1C40D71B46D1FEC74940B65454B2FDEC1C4094C2C582FEC74940CAC1CF44E9EC1C404B02BC47FEC749400929AEBBE6EC1C4037E62F87FFC74940	2000-01-01	\N	\N
181	15125.0	DENW05AL10002MhY	192.0	DENW05AL10002MhY	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	134.99166598347074	377372.37542794767	5713567.659990594	15125.0	010600000001000000010300000001000000070000004482638A75EC1C4068295CF0A6C74940128F7A9475EC1C402BE6A2FEA6C7494044185FFF70EC1C40655BD103A7C7494035870A5B74EC1C4041034028ABC74940234673DC97EC1C4017465FFFAAC74940B20DDDEB94EC1C4058E581CCA6C749404482638A75EC1C4068295CF0A6C74940	2000-01-01	\N	\N
182	15130.0	DENW05AL10002Mib	193.0	DENW05AL10002Mib	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	172.3721560688864	377675.12812229426	5713429.470528366	15130.0	0106000000010000000103000000010000001D00000056140513F8F01C409B9CB7D87FC74940F6C7B302F9F01C4090B712DA7FC749403BD22FE2F7F01C4076F8910F81C74940DA1181F2F6F01C4065DD360E81C749403DFBF9DDF6F01C40CD1CBB2481C749406970A0CEF7F01C401CAF162681C7494027C968CBF6F01C40B05A813B82C749406202B4DBF5F01C40718C393A82C749400B9D24C8F5F01C400A43BE5082C74940B264D9B7F6F01C405711065282C74940FC1B7384F5F01C407253DA9B83C74940B346BE94F4F01C400985929A83C7494054253D80F4F01C40917703B183C7494054B5E370F5F01C400A0A5FB283C74940D1D5B171F4F01C40A8B12CC484C749404E400581F3F01C40006CE4C284C74940B422BB5CF3F01C40EFD148DA84C74940ED06F0651AF11C40A61BF11285C74940C1FE767A1AF11C4005DC6CFC84C74940AF03C9FD19F11C4084FBBCFB84C749409FA093EB1BF11C401C022BE882C74940239141681CF11C4090E2DAE882C749406C5918221DF11C403063EC2082C74940BF6D6AA51CF11C40BC823C2082C74940DC8B7D911EF11C409EAC130F80C749401A6C2B0E1FF11C40F68CC30F80C7494032F25F181FF11C4048ADB10480C74940C9787B21F8F01C40FAB847C97FC7494056140513F8F01C409B9CB7D87FC74940	2000-01-01	\N	\N
183	15132.0	DENW05AL10002MIb	194.0	DENW05AL10002MIb	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	158.10885217762552	377393.79302787676	5713476.808889677	15132.0	0106000000010000000103000000010000000D000000A12885C0C6EC1C40459FD0B98FC749400275D7C3D1EC1C401F51EDD88FC749408FE21C5DD2EC1C404C5CBF838FC74940F28549CBE4EC1C40A4B6C9B78FC74940AF9DEF2DE4EC1C40E181A30D90C74940FB3C4831EFEC1C40EBD0AC2C90C749403293B2CCEFEC1C402616D2D68FC74940FA793D38FBEC1C40A2AC08F78FC74940BDBACFFCFFEC1C407EA1725C8DC749405FD99D91C0EC1C400B86BCA78CC7494062DB2FF0BBEC1C4040DB6C448FC749405927BA5BC7EC1C40FA99A3648FC74940A12885C0C6EC1C40459FD0B98FC74940	2000-01-01	\N	\N
184	15136.0	DENW05AL10002MID	195.0	DENW05AL10002MID	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	128.36971357651055	377372.5705081704	5713553.865698052	15136.0	0106000000010000000103000000010000000600000057FFF2E072EC1C40105F230DA3C749404482638A75EC1C4068295CF0A6C74940B20DDDEB94EC1C4058E581CCA6C749407CD3A74A9AEC1C407D1959C6A6C7494094BEC57D97EC1C405306F2E4A2C7494057FFF2E072EC1C40105F230DA3C74940	2000-01-01	\N	\N
185	15138.0	DENW05AL10002Mij	196.0	DENW05AL10002Mij	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	157.67814428871498	377523.38768520043	5713311.719212507	15138.0	010600000001000000010300000001000000060000001562BB94B7EE1C40A1F5649260C7494035876529D8EE1C40BDCF3E6961C74940D979270FF5EE1C40EFC7F7FA5CC7494028AD59B6D7EE1C40CE6C87CF5BC7494071FF50DCD6EE1C403617D2C65BC749401562BB94B7EE1C40A1F5649260C74940	2000-01-01	\N	\N
186	15142.0	DENW05AL10002MIQ	197.0	DENW05AL10002MIQ	0	18	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	269.6954500905704	377599.263210518	5713577.4593776185	15142.0	0106000000010000000103000000010000000C000000F2B3E61CB7EF1C40EFF218B0ABC7494086F6D4FDB9EF1C40AB602962AFC74940DCC1EC5ABAEF1C40C0A864D8AFC74940CCED6906E7EF1C40B0561E99AFC74940D332BB95E6EF1C40EABD9A23AFC74940A4D4D09F05F01C400EC242F7AEC7494051931BBD02F01C40DDE61B1CACC74940B91E40E901F01C40EE15F743ABC74940840943D9F6EF1C40106EC253ABC74940A6529C45C9EF1C4061929D95ABC749405FE88319C2EF1C40ACC557A0ABC74940F2B3E61CB7EF1C40EFF218B0ABC74940	2000-01-01	\N	\N
187	15145.0	DENW05AL10002MJ0	198.0	DENW05AL10002MJ0	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	110.75642824545503	377415.09700470045	5713570.221651543	15145.0	010600000001000000010300000001000000080000004E67E1ED0FED1C400704EAA9A8C74940B0DAFEA810ED1C40083F2796A9C74940A82B16D111ED1C40C397050DABC74940ED8B634712ED1C40A88027A2ABC74940186669C13BED1C40885A0767ABC749404CEA793239ED1C40589E4A6FA8C74940DB7A475627ED1C40E0CAAD89A8C749404E67E1ED0FED1C400704EAA9A8C74940	2000-01-01	\N	\N
188	15147.0	DENW05AL10002MJ7	199.0	DENW05AL10002MJ7	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	154.98997988551855	377518.3720069056	5713328.37573657	15147.0	01060000000100000001030000000100000005000000DBB3969EACEE1C40C7D2DADB65C74940A16A850FCEEE1C40B992054766C74940940524DFD7EE1C40394ECC7461C749401ACF7F4AB7EE1C40A226DF9D60C74940DBB3969EACEE1C40C7D2DADB65C74940	2000-01-01	\N	\N
189	15148.0	DENW05AL10002MJ9	200.0	DENW05AL10002MJ9	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	102.87982848938555	377757.9290254308	5713606.706787238	15148.0	0106000000010000000103000000010000000B000000FB38581C2AF21C403FA08688B5C74940524A81512AF21C402B15B518B6C74940CD877A4C1CF21C40B87E0C25B6C7494015994DC91DF21C4058EA3AA5B8C74940529FAEC648F21C4048ECBA7CB8C74940A30335E047F21C40368A062BB7C7494020512C6347F21C403D34782BB7C749403B6B0E9546F21C406F61AEFBB5C7494072670DF337F21C40F346930BB6C74940174C649A37F21C406DB2587AB5C74940FB38581C2AF21C403FA08688B5C74940	2000-01-01	\N	\N
190	15159.0	DENW05AL10002MK3	201.0	DENW05AL10002MK3	1	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	132.02942621707916	377518.76588845026	5713887.026833714	15159.0	01060000000100000001030000000100000009000000136853C49AEE1C4073378C980AC849402CB47685A9EE1C40A24C4D7906C849403CF942CE8EEE1C408A6518E505C84940A98EE0698BEE1C40BE3D2CD806C8494081F98BE278EE1C405B6FDF7006C84940D9218FCA73EE1C4056DE55DD07C849408E7FDC5286EE1C40D62AA34408C8494047A1181680EE1C40BFCC73030AC84940136853C49AEE1C4073378C980AC84940	2000-01-01	\N	\N
191	15162.0	DENW05AL10002Mkn	202.0	DENW05AL10002Mkn	1	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	87.45645595509268	377666.32452668634	5713664.691360318	15162.0	0106000000010000000103000000010000000900000084FDAE29D1F01C4038E3137CC9C74940DA48301BD1F01C40AACE74F2C8C7494053C98B99E3F01C408313D1EFC8C74940B4E9585DE3F01C40A214EE2DC6C749403A30354CD5F01C4079F93A2FC6C749405CEB4255D5F01C406FDD9F08C6C74940DA158285C3F01C4020F83B0AC6C74940DA899B05C4F01C4034D5D27DC9C7494084FDAE29D1F01C4038E3137CC9C74940	2000-01-01	\N	\N
192	15172.0	DENW05AL10002Mlc	203.0	DENW05AL10002Mlc	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	89.81118616269669	377780.87660739804	5713591.33931815	15172.0	0106000000010000000103000000010000000D000000602365FF75F21C405961E1B7B2C74940C45D5FAF76F21C40E6A53BEBB3C7494059FEA0AB75F21C40D1551AECB3C749404BC765D575F21C40BD5F9E33B4C749402802B11C79F21C406243E530B4C74940140A471479F21C4022B24820B4C74940ED91BCC0A2F21C4033BE81F4B3C74940096CA428A2F21C4004E5D6EAB2C74940FA12492D9BF21C40672C5DF1B2C74940B7E201739AF21C402928E574B1C74940E19F9DDB76F21C40A84A9F96B1C749406715268077F21C409352A4B6B2C74940602365FF75F21C405961E1B7B2C74940	2000-01-01	\N	\N
354	17993.0	DENW05AL10002s3i	987.0	DENW05AL10002s3i	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	42.145103324670345	377235.7604637365	5713530.860265648	17993.0	01060000000100000001030000000100000006000000B1576D4772EA1C406BD9FDA49DC7494073C1E83C81EA1C40FA6DD2969EC74940E26586BE92EA1C40D56B0EE69CC74940CD49428C93EA1C400F41A2969CC7494027FFEC0386EA1C40573F41BD9BC74940B1576D4772EA1C406BD9FDA49DC74940	2000-01-01	\N	\N
193	15177.0	DENW05AL10002Mln	204.0	DENW05AL10002Mln	1	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	87.22791736965155	377919.78279816563	5713657.863734321	15177.0	0106000000010000000103000000010000000900000098FF28AC8DF41C4072FEDBF7C5C74940FF2709B680F41C40EC2132F8C5C74940BB461E7C80F41C40C7055AB8C8C7494071CF3D6493F41C40337B14B8C8C74940755DF44F93F41C407B5D9E3EC9C74940EC162CD2A0F41C401D7D213CC9C74940EEDBD258A0F41C400D2E87D9C5C74940AE4AFCA48DF41C40F396D2D9C5C7494098FF28AC8DF41C4072FEDBF7C5C74940	2000-01-01	\N	\N
194	15182.0	DENW05AL10002Mmi	205.0	DENW05AL10002Mmi	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	107.12252220138907	377531.0911551664	5713849.8470508	15182.0	010600000001000000010300000001000000050000008996F93FB7EE1C406AC17E3BFBC74940DAFC5091ABEE1C4075BBF972FEC74940C6BDD543CEEE1C40C40A772BFFC7494094E05DCCD9EE1C40673179FEFBC749408996F93FB7EE1C406AC17E3BFBC74940	2000-01-01	\N	\N
195	15183.0	DENW05AL10002MmL	206.0	DENW05AL10002MmL	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	73.38132300262441	377668.4673781269	5713640.843435465	15183.0	010600000001000000010300000001000000070000003E9315A9CEF01C40B585FD2FBFC749401A4335D8CEF01C40FE3E0D03C2C7494001CA483ADEF01C40E7C2B401C2C74940C228EF3DDEF01C40BB0C5031C2C749408B67A4CDEAF01C4021A64430C2C7494041F1ECEBEAF01C40BD756E2EBFC749403E9315A9CEF01C40B585FD2FBFC74940	2000-01-01	\N	\N
196	15193.0	DENW05AL10002MnC	207.0	DENW05AL10002MnC	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	87.97323449701071	377274.18928305665	5713594.178437874	15193.0	01060000000100000001030000000100000005000000160EEF45F6EA1C40F9D495D5B0C74940DEA923AD0BEB1C400FF3CB31B2C7494020800B9A27EB1C402F339746AFC749407CE924C512EB1C40506ADAFFADC74940160EEF45F6EA1C40F9D495D5B0C74940	2000-01-01	\N	\N
197	15200.0	DENW05AL10002Moj	208.0	DENW05AL10002Moj	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	163.9317604675889	377569.90014658123	5713578.536981222	15200.0	010600000001000000010300000001000000060000006300E00F55EF1C40C86FA9C5ABC7494036D85B4958EF1C40E48EEDA4AFC74940B65AC45F87EF1C400E73DC64AFC749409AF281D786EF1C4025701CCEAEC749409DA0EAE383EF1C4038913487ABC749406300E00F55EF1C40C86FA9C5ABC74940	2000-01-01	\N	\N
198	15204.0	DENW05AL10002MoN	209.0	DENW05AL10002MoN	1	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	178.9993573129177	377600.3810800698	5713684.161611586	15204.0	01060000000100000001030000000100000008000000BD4EBFFCF4EF1C40A967EA37CBC7494052E4E05FCAEF1C400FBDA144CAC74940C33C147FC7EF1C403EEDAC0FCBC749406FFED793BAEF1C405DDD599FCEC749406DFA43A3DBEF1C4059029756CFC7494034B70DFDE4EF1C40877F778ACFC74940F20D3CF6F1EF1C4083001309CCC74940BD4EBFFCF4EF1C40A967EA37CBC74940	2000-01-01	\N	\N
199	15215.0	DENW05AL10002MpV	210.0	DENW05AL10002MpV	1	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	175.68504619986925	377753.0244742184	5713536.669076502	15215.0	010600000001000000010300000001000000170000008C5111BD04F21C40888992E7A0C7494025F06D6707F21C40663F7D2EA4C7494073551BB006F21C4067FA932FA4C749403E5132D206F21C40A75E7454A4C7494003A9E7E006F21C40066D7E63A4C749408D5645DB09F21C40DFDD0A5FA4C7494095FC8FCC09F21C408DCF0050A4C74940BD6DCBA119F21C407ADFB038A4C74940BC93508219F21C406C8EE417A4C74940498445B435F21C4075139DEEA3C749405B72D2D335F21C40C57D2F0FA4C7494013C726C645F21C40CE6DB3F7A3C74940A048DCD445F21C40F57BBD06A4C74940319A6DA848F21C40B8758402A4C74940E216B89948F21C4091677AF3A3C74940BF5C377A48F21C40F4897ECCA3C749405B666C1147F21C40703788CEA3C7494027CC7BB544F21C40D91CA18AA0C7494012A19A7C37F21C405198D79DA0C74940EA5B9BFF37F21C401FCFA429A1C7494093D8476E12F21C40DAA13760A1C74940FBB83FEC11F21C4031E16AD4A0C749408C5111BD04F21C40888992E7A0C74940	2000-01-01	\N	\N
200	15228.0	DENW05AL10002MrE	211.0	DENW05AL10002MrE	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	63.48135293845553	377498.61460542434	5713824.448249508	15228.0	01060000000100000001030000000100000007000000F0D1156F54EE1C40AF8E7DDAF3C749400FE891943EEE1C4044CE5BEAF3C74940EE0541EA3FEE1C406B15C6D7F6C749407C4E490D40EE1C40CF873C25F7C74940860AC8E855EE1C405FBE5E15F7C74940796E7A9254EE1C408746EA29F4C74940F0D1156F54EE1C40AF8E7DDAF3C74940	2000-01-01	\N	\N
201	15235.0	DENW05AL10002MrR	212.0	DENW05AL10002MrR	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	183.5249725356698	377524.8881389727	5713745.3157482445	15235.0	01060000000100000001030000000100000005000000EF82186F8DEE1C407ACE3FBCDDC749407965523CC5EE1C4048B0DF3EE1C74940AE6F513ADCEE1C4072631909DFC749400BCA0830A4EE1C40DEE49183DBC74940EF82186F8DEE1C407ACE3FBCDDC74940	2000-01-01	\N	\N
202	15242.0	DENW05AL10002MSN	213.0	DENW05AL10002MSN	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	183.07124429603576	377275.81942151027	5713539.134735487	15242.0	0106000000010000000103000000010000000F00000008388936FAEA1C403B7BF1A39FC749404EC40A3109EB1C408FEB52DA9FC749409EADE7800BEB1C40D7A3AEE29FC74940233D5F950DEB1C4043949949A0C74940D3E418BD0BEB1C404FEC8C58A0C749406EBB401B19EB1C409AFB3CEEA2C7494046D43CE13AEB1C407FE5DEE4A1C7494027D59E7F2DEB1C402DAED14D9FC7494004950E7725EB1C40772E88899FC74940596D193F29EB1C407D4724C69DC7494032CE63E225EB1C4068A8EABF9DC74940D878621026EB1C406A64FDB49DC749408A3F2F2C00EB1C401A42332F9DC749408FC66673FFEA1C40856288799DC7494008388936FAEA1C403B7BF1A39FC74940	2000-01-01	\N	\N
203	15245.0	DENW05AL10002Msx	214.0	DENW05AL10002Msx	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	233.79018218716374	377558.778069021	5713640.933179273	15245.0	010600000001000000010300000001000000060000005AFE52A963EF1C40669F7008BFC74940A6C927FC62EF1C40B654FF23BEC749407BE32E7D18EF1C406DDBA12BBEC74940EA01819818EF1C402FF28F9BC1C74940388ECE9465EF1C40FEA73D93C1C749405AFE52A963EF1C40669F7008BFC74940	2000-01-01	\N	\N
204	15255.0	DENW05AL10002Mty	215.0	DENW05AL10002Mty	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	148.62362703838153	377590.04764563055	5713393.811214661	15255.0	01060000000100000001030000000100000009000000581DFEA9B9EF1C40FDC73DE774C74940090CC0E4B9EF1C40215021C975C749404103B41DBAEF1C400F5678A776C74940CA29B078BAEF1C40AF11CA0E78C74940896FB2B0BAEF1C4055530DED78C74940BF87B8EABAEF1C4042632FCE79C74940CE40D7A8DCEF1C400587CAC079C74940DE9D0968DBEF1C401B86FFD974C74940581DFEA9B9EF1C40FDC73DE774C74940	2000-01-01	\N	\N
205	15258.0	DENW05AL10002Mu6	216.0	DENW05AL10002Mu6	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	179.27300411136824	377571.43606895604	5713688.779165005	15258.0	0106000000010000000103000000010000000D0000005004C5394BEF1C40683C25F1CFC74940115DDB0375EF1C40D08DF0ECD0C7494015D816FB79EF1C40CB08338FCFC749404B10C0C078EF1C40A2E3E487CFC74940E38DAD5F80EF1C40E581B16ECDC749402765B19681EF1C40B6A75977CDC749408236F47886EF1C40D781C61ECCC7494097DA7E935CEF1C404B172C2ACBC749403F1C0FF657EF1C405DB4547FCCC74940C0C8AC185EEF1C40B34953A7CCC74940B315C38D56EF1C406310A3C4CEC749402010B60850EF1C40CB63B89ECEC749405004C5394BEF1C40683C25F1CFC74940	2000-01-01	\N	\N
206	15259.0	DENW05AL10002Mu8	217.0	DENW05AL10002Mu8	0	16	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	259.5037629629951	377288.28188526	5713446.865221951	15259.0	0106000000010000000103000000010000000E000000027D5D5564EB1C40D568D5C886C74940E389F63667EB1C403F602C8585C7494082A3CD0D6AEB1C4009AB338C85C749402C66B3966EEB1C40BC78169383C7494051D9059271EB1C406A85674782C749403CE6915440EB1C40AB760F9981C749404F79F6FC34EB1C40E9706D8786C749407798784933EB1C40FC03EE4487C7494010B25DEA32EB1C40F8172A6E87C749409479DFC837EB1C409E0B4D7F87C74940475C676861EB1C406E61E71188C74940AD4ACBC961EB1C40B0BA8AE787C74940BE7BFC7363EB1C40886EE82B87C74940027D5D5564EB1C40D568D5C886C74940	2000-01-01	\N	\N
207	15268.0	DENW05AL10002MUu	218.0	DENW05AL10002MUu	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	22.49580906558549	377460.7995001343	5713556.302043857	15268.0	01060000000100000001030000000100000006000000D0FC4ABFC4ED1C40028AD1ECA5C74940B525EAC2C4ED1C405A7BBFF0A5C74940108BA791C5ED1C40C9B164C6A6C74940ED77AAB7E2ED1C40EBF0E899A6C7494013C3ED31E2ED1C40DC3EE0BFA5C74940D0FC4ABFC4ED1C40028AD1ECA5C74940	2000-01-01	\N	\N
208	15275.0	DENW05AL10002MvQ	219.0	DENW05AL10002MvQ	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	143.34136309148744	377574.595295667	5713455.025735577	15275.0	0106000000010000000103000000010000000900000089AED5D37BEF1C404C71F6B78AC749408569DA5D93EF1C40C5D21AFC8AC74940C17D839493EF1C4019BF8FDE8AC74940129152B9A1EF1C4002FB8B078BC7494035BA6A08A7EF1C40747324F887C749405D7BBEFD74EF1C405067656887C74940C947D92B6FEF1C4015F4E9748AC7494030653AF87BEF1C408D02029A8AC7494089AED5D37BEF1C404C71F6B78AC74940	2000-01-01	\N	\N
209	15277.0	DENW05AL10002MvU	220.0	DENW05AL10002MvU	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	149.71317533729598	377429.68161962886	5713372.459197217	15277.0	01060000000100000001030000000100000009000000DBF0FD9459ED1C40E059B12472C7494065328BF37AED1C40AA04BA8972C74940FD5DB56584ED1C40B0CF69A76DC7494031710D0663ED1C40D2DEE7426DC74940E101D94761ED1C4042F76C296EC749409432539F5FED1C40819959056FC74940D2F963DB5CED1C407FCE157370C749403DD1DD325BED1C40F96F024F71C74940DBF0FD9459ED1C40E059B12472C74940	2000-01-01	\N	\N
210	15283.0	DENW05AL10002MwG	221.0	DENW05AL10002MwG	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	76.60159084293991	377559.7435970875	5713838.809218423	15283.0	0106000000010000000103000000010000000700000051B32D9521EF1C401ECA89BAF8C7494028C104C119EF1C402F3F79EFFAC74940FF8E9E793BEF1C4074B50EA2FBC74940F482858B40EF1C40571C2B33FAC74940300AA83047EF1C404EC8EF5BFAC74940B5CC61FC49EF1C4039226B93F9C7494051B32D9521EF1C401ECA89BAF8C74940	2000-01-01	\N	\N
211	15287.0	DENW05AL10002Mwq	222.0	DENW05AL10002Mwq	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	151.83594095613807	377502.100435907	5713382.148921886	15287.0	01060000000100000001030000000100000009000000B83478ED69EE1C404ED2D87D75C74940D12DBBD08BEE1C408E5101E975C7494095E950B795EE1C40FD446F0B71C74940D4E51BD173EE1C40F05E7FA070C7494027C2180872EE1C4094536A8171C74940B9C3734970EE1C40FE29FF5C72C74940F9C64B6E6DEE1C40A572A7C473C74940066FA0AF6BEE1C400E954FA074C74940B83478ED69EE1C404ED2D87D75C74940	2000-01-01	\N	\N
212	15298.0	DENW05AL10002Mxb	223.0	DENW05AL10002Mxb	1	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	62.0955925580638	377500.6391406794	5713796.468976058	15298.0	0106000000010000000103000000010000000700000091018EF448EE1C40D17872B8EBC74940FB34181049EE1C409D1CF901ECC74940CA68761C4AEE1C40AE8B0CE2EEC749401DE2040E60EE1C400785C0D2EEC74940F83483CC5EEE1C40033C46F2EBC7494037D61FAD5EEE1C40D26DAAA8EBC7494091018EF448EE1C40D17872B8EBC74940	2000-01-01	\N	\N
213	15322.0	DENW05AL10002MZi	226.0	DENW05AL10002MZi	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	150.75111076422036	377434.220512299	5713477.260318576	15322.0	010600000001000000010300000001000000050000001D597C5F98ED1C4022E0CED78DC749400F7E023459ED1C400FA39A238DC74940D9E741D454ED1C40575005C18FC74940A93A18F493ED1C4042DC427290C749401D597C5F98ED1C4022E0CED78DC74940	2000-01-01	\N	\N
214	15330.0	DENW05AL10002N09	227.0	DENW05AL10002N09	0	16	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	459.911453036475	377698.26348479337	5713541.400923779	15330.0	0106000000010000000103000000010000000D0000004985464423F11C4091CEAADBA1C749407B857CAA23F11C40BFE6EC3DA2C74940AAB176C70BF11C40666D5E60A2C74940693B4C260FF11C40804334B5A5C74940FA449F80A1F11C4000E9B0E7A4C74940CD0F0E6E9EF11C40594F0A8DA1C749403F07EC8F86F11C40AE5858AFA1C749409801F41D86F11C407E79844DA1C74940C629A1A86CF11C4080009F71A1C74940C9A2661B6DF11C408071FAD3A1C74940D47F323A3DF11C4032240B19A2C749403879A2B83CF11C40145090B7A1C749404985464423F11C4091CEAADBA1C74940	2000-01-01	\N	\N
215	15332.0	DENW05AL10002N0C	228.0	DENW05AL10002N0C	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	92.27395728603005	377471.839849574	5713270.090326776	15332.0	0106000000010000000103000000010000000900000078942B8D0FEE1C4066622DBA50C74940640B2E550AEE1C40EF43BC7E51C74940FFF8A48D00EE1C40CFDFE5EE52C749409763F4C01CEE1C407B8D8B1A54C749400C68FDD22DEE1C404A96D79751C74940FA8A5B3021EE1C40ABDD091251C74940C43D2D4625EE1C40BC294F7850C74940991A7EAF15EE1C408E4122D34FC7494078942B8D0FEE1C4066622DBA50C74940	2000-01-01	\N	\N
216	15335.0	DENW05AL10002N0q	229.0	DENW05AL10002N0q	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	89.25640097330324	377850.89445684745	5713600.537365394	15335.0	010600000001000000010300000001000000090000009635AC36A6F31C408918064AB7C74940D397F434A5F31C404E9B5224B6C74940DE925DC9A6F31C405CD32322B6C74940C067A595A5F31C407884D8BFB4C74940753F9EB979F31C40DEAB45FEB4C749406EC90EAD7AF31C4067B6FA06B6C749404BF9047681F31C409CF57DFDB5C74940AD8B14D782F31C40841D767CB7C749409635AC36A6F31C408918064AB7C74940	2000-01-01	\N	\N
217	15347.0	DENW05AL10002N28	230.0	DENW05AL10002N28	0	18	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	292.6742348560365	377569.4337171985	5713669.782874252	15347.0	01060000000100000001030000000100000010000000BBD7D1A06AEF1C40714FC5F9C9C74940A07751A68BEF1C409330ACB1CAC7494044C4A16E97EF1C40F05AA371C7C74940CB05B38790EF1C40577C5CBCC6C7494062351AF637EF1C4002177BC3C6C749403644801A2EEF1C4081A72677C9C7494012F33C4530EF1C40CF304A77C9C7494025FD326C30EF1C40D7D8D6E3C9C74940E8F1873048EF1C4066005FE3C9C7494063E5FC3948EF1C40AA6DAA3ECAC74940B4CB97B25FEF1C4069869F38CAC749404AAE489B5FEF1C406E7948DEC9C74940C7F572B465EF1C40AFCFEBDCC9C749405D375ADC67EF1C40F198FBADC9C749401BBEC8FC6BEF1C40B7C976AAC9C74940BBD7D1A06AEF1C40714FC5F9C9C74940	2000-01-01	\N	\N
218	15350.0	DENW05AL10002N2o	231.0	DENW05AL10002N2o	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	87.47989261918701	377782.4421829943	5713613.026080606	15350.0	01060000000100000001030000000100000009000000F5E754A379F21C4080004317B9C7494068605D877AF21C40AB73AA83BAC7494040FFF56FA6F21C40B2B81D55BAC749409593C1B6A5F21C40BAC1104CB9C749404285F41F9FF21C4088550153B9C74940761E111D9EF21C40CEA5E7DFB7C749405499A4297BF21C4095388603B8C74940AFA28BD47BF21C4086223915B9C74940F5E754A379F21C4080004317B9C74940	2000-01-01	\N	\N
219	15356.0	DENW05AL10002N3R	232.0	DENW05AL10002N3R	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	139.75586496625328	377309.9997700575	5713619.323232752	15356.0	0106000000010000000103000000010000000A00000000AE66BBB4EB1C4085BE04EDB7C74940FFA0BD088AEB1C40B1533A4EB5C749405D962C0389EB1C4040F7C66AB5C749404BF7797473EB1C40FE637092B7C74940141C27477BEB1C408456A10DB8C7494042813A0296EB1C407768B7B2B9C74940B54BFCE49DEB1C405A07252FBAC749403CA6E727B3EB1C408139C414B8C7494004937396B4EB1C40712BA5F0B7C7494000AE66BBB4EB1C4085BE04EDB7C74940	2000-01-01	\N	\N
220	15357.0	DENW05AL10002N3Y	233.0	DENW05AL10002N3Y	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	59.51460136822425	377489.1651259541	5713797.147055144	15357.0	0106000000010000000103000000010000000600000033F2BBC632EE1C40290C89C8EBC74940598BD6D41DEE1C409390B5D7EBC749409EBE093F1FEE1C40FDC2C6FFEEC749407D32883734EE1C4029E837F1EEC749401F3114E832EE1C40837C1212ECC7494033F2BBC632EE1C40290C89C8EBC74940	2000-01-01	\N	\N
221	15362.0	DENW05AL10002N4J	234.0	DENW05AL10002N4J	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	150.31259251199663	377506.93495958834	5713485.708556446	15362.0	010600000001000000010300000001000000050000004EC4A97D6BEE1C4083C3C52790C74940FEFDACB666EE1C4094B64CC192C74940207F4CDEA5EE1C404CB49C7293C74940B066906FAAEE1C40703F66D790C749404EC4A97D6BEE1C4083C3C52790C74940	2000-01-01	\N	\N
222	15363.0	DENW05AL10002N4L	235.0	DENW05AL10002N4L	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	152.5029457808123	377348.96187174023	5713615.462384344	15363.0	0106000000010000000103000000010000000D000000BA4ABF9505EC1C4036F9FB94B6C749403B148AF705EC1C403117349BB6C74940A3ACB3AE05EC1C40CE3628A2B6C74940727E4BFB31EC1C4008AFAC6EB9C749409351245032EC1C40BD0E7666B9C74940E583EE8B32EC1C40677C586AB9C74940ED600A8149EC1C40748B4E32B7C74940289195153EEC1C40968FCE78B6C7494060F818173FEC1C40E92DF25FB6C749405CCCB59429EC1C4039560B0DB5C749409896F7A928EC1C4079D94924B5C749400E4C0E991CEC1C40D7491F61B4C74940BA4ABF9505EC1C4036F9FB94B6C74940	2000-01-01	\N	\N
223	15380.0	DENW05AL10002Na5	236.0	DENW05AL10002Na5	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	191.49495953693986	377594.0425893211	5713603.898050756	15380.0	0106000000010000000103000000010000000700000092A87F8CA2EF1C4067B2BFFDB5C749408F491A8DB3EF1C409F5FEB7BB6C74940E8EB2B62BFEF1C40DE47ACD4B6C74940FF79E1C9DCEF1C40F5FD43AFB7C749403B5FC2C8EBEF1C40F47E9A79B4C749407C746C3CB1EF1C40D1A4A3C3B2C7494092A87F8CA2EF1C4067B2BFFDB5C74940	2000-01-01	\N	\N
224	15382.0	DENW05AL10002NaB	237.0	DENW05AL10002NaB	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	105.22845765517559	377626.8538083859	5713597.056989196	15382.0	0106000000010000000103000000010000000B0000009686CE612FF01C407AE2F0D4B2C7494045DFDDD72FF01C40518141D8B2C749408E1504902AF01C40684EAFFBB3C74940EB64A35C38F01C40F592E266B4C749408134541D36F01C4094CD88E4B4C7494058B0D0D942F01C4093A15C40B5C74940F305CA3C45F01C40CA95F8BCB4C749407EAC78D952F01C40A3214B1DB5C749409E296A0E5EF01C40019A49BBB2C74940B5FE3F2635F01C40D4025D96B1C749409686CE612FF01C407AE2F0D4B2C74940	2000-01-01	\N	\N
225	15386.0	DENW05AL10002NaF	238.0	DENW05AL10002NaF	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	164.09114913875237	377646.38169377384	5713664.794022047	15386.0	01060000000100000001030000000100000005000000E7489F4DA6F01C4084475300C9C74940A75E3928A6F01C4095E6CE0AC6C7494047B34B7368F01C40A7FF5310C6C749403AE41F8A68F01C4094AEE405C9C74940E7489F4DA6F01C4084475300C9C74940	2000-01-01	\N	\N
226	15391.0	DENW05AL10002NaO	239.0	DENW05AL10002NaO	0	20	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	225.72354932375313	377760.10740726884	5713437.915248718	15391.0	0106000000010000000103000000010000001300000074AEF94421F21C40B1CA132E85C749404E0756572AF21C402C8E5F2285C749405C2DD3342CF21C4015B6031087C749403A7928A446F21C4080770DF186C7494001BCF83E47F21C406786269787C749406566179353F21C402AA4A38487C74940F155663754F21C407B33931888C74940CC6F2B9B61F21C409F1F7F0A88C74940A3B8413F61F21C40B4F1DE6D87C74940D12AC8A26EF21C402832315787C74940D88081996DF21C40EAAB2D0286C7494036FB51F369F21C401E60060586C74940FBB18CC967F21C40242B94CB83C749400E0CAFC94EF21C40B880FCEB83C7494011ADA24B4EF21C40D01CD15F83C74940D0E510D334F21C4084DF558283C749408B58EADC34F21C4030C819BA83C74940C89C962420F21C400DE1B7D883C7494074AEF94421F21C40B1CA132E85C74940	2000-01-01	\N	\N
227	15396.0	DENW05AL10002NB1	240.0	DENW05AL10002NB1	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	91.10179816989694	377641.35812459316	5713366.675365066	15396.0	0106000000010000000103000000010000000A0000007AA1593CA2F01C406F7B46BC6EC74940A2E2A86D94F01C402D8483906EC7494096D112E295F01C40F0D326D96DC749401D211C8184F01C40D0C303A26DC749402D5EA90D83F01C407BE960596EC749403EE74D8D7DF01C4045953E0E71C7494053CFCED08DF01C4082C8D34171C74940AD39A6878DF01C40A160F96571C749401574FF719CF01C40DED4E89471C749407AA1593CA2F01C406F7B46BC6EC74940	2000-01-01	\N	\N
228	15410.0	DENW05AL10002NbN	241.0	DENW05AL10002NbN	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	171.5106980795972	377384.2704681702	5713380.561121773	15410.0	01060000000100000001030000000100000009000000B632F325B6EC1C40DA7754596FC74940DCD31E6AB4EC1C40E9C7FD3470C74940510EB0FEADEC1C40523E6D6173C74940FA0ADB42ACEC1C40F48C163D74C7494026D63BD5ABEC1C40AB5DD17274C74940C405DD84CEEC1C40744C74DA74C74940000E9F63D9EC1C408DCD057A6FC7494034842CB8B6EC1C40A43E7D116FC74940B632F325B6EC1C40DA7754596FC74940	2000-01-01	\N	\N
229	15412.0	DENW05AL10002Nbs	242.0	DENW05AL10002Nbs	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	85.85709109777235	377647.22092514	5713641.208599679	15412.0	01060000000100000001030000000100000009000000C3DB0C737DF01C40B66FE1FDBEC74940A1C042F57DF01C40FC2F8538C2C7494027FC8A3E91F01C40B8FD1737C2C7494065B9214191F01C4080DE3B09C2C74940B7E3A3739CF01C40550E2807C2C749402727E58B9CF01C4094698928BFC74940F2D1AF5A91F01C40817D8F29BFC74940356AA75191F01C40BE0096F8BEC74940C3DB0C737DF01C40B66FE1FDBEC74940	2000-01-01	\N	\N
230	15413.0	DENW05AL10002NbT	243.0	DENW05AL10002NbT	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	174.03389343246815	377442.61422109033	5713286.165088592	15413.0	01060000000100000001030000000100000007000000DA8E9DF684ED1C40CD6CE76658C749401D534387A5ED1C4054DFD03A59C74940B229DEF9B2ED1C404C4BFE4D57C74940E248AE9ABBED1C402BF6F5A957C7494021FA3F45CBED1C404A2BC76655C74940F94D26D8A4ED1C40F7BEDECD53C74940DA8E9DF684ED1C40CD6CE76658C74940	2000-01-01	\N	\N
231	15418.0	DENW05AL10002Nby	244.0	DENW05AL10002Nby	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	83.22164818458259	377876.29899893055	5713619.836381489	15418.0	0106000000010000000103000000010000000800000006245C06DCF31C402CA0A4E1BAC749409FADCF18DEF31C40D8B9B347BDC74940880B645901F41C4035F49818BDC74940EC426A4801F41C40C3535904BDC74940DEE9285200F41C40270F63B6BBC74940A502A73E08F41C401BA472A9BBC74940A6E4255B07F41C408F8AE0AEBAC7494006245C06DCF31C402CA0A4E1BAC74940	2000-01-01	\N	\N
232	15424.0	DENW05AL10002NcB	245.0	DENW05AL10002NcB	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	152.319834491238	377497.6245053729	5713415.5627059	15424.0	01060000000100000001030000000100000009000000362C4A785CEE1C40C4825F1B7CC74940EE52897059EE1C408F8A0C997DC749407CB0EAB057EE1C402BE5A0747EC74940CFFB90EE55EE1C40A185C4527FC74940D22CDAE277EE1C4091B009B67FC74940B7C873C681EE1C401DD2D6D87AC74940384751E45FEE1C40404A146D7AC7494025B7F6365EEE1C400C63B73F7BC74940362C4A785CEE1C40C4825F1B7CC74940	2000-01-01	\N	\N
233	15425.0	DENW05AL10002Nce	246.0	DENW05AL10002Nce	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	89.42136100260541	377628.63541314175	5713364.876969765	15425.0	0106000000010000000103000000010000000700000041E2FD035FF01C407811C0EC6DC749408D61DD7E51F01C40EDF60CC16DC74940DE13A2EA4BF01C40ADC45E7470C7494098E48A046BF01C400B05BDD870C74940B804072C72F01C400E0D3B686DC74940AAA85F8860F01C40D8C6BD306DC7494041E2FD035FF01C407811C0EC6DC74940	2000-01-01	\N	\N
234	15443.0	DENW05AL10002NcW	248.0	DENW05AL10002NcW	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	88.78701098496094	377564.8790694882	5713714.226143657	15443.0	010600000001000000010300000001000000090000008727F5F361EF1C40B027EABBD5C749401D92DDD765EF1C4084784CAAD4C74940151EC1DE43EF1C404350C5EAD3C749409CBF790540EF1C40985050F9D4C749404C96F39A39EF1C40C3DB41D5D4C74940755FDFA334EF1C40317CF225D6C74940ED3E2A985EEF1C400D48A816D7C7494015BF216763EF1C401F1D28C4D5C749408727F5F361EF1C40B027EABBD5C74940	2000-01-01	\N	\N
235	15446.0	DENW05AL10002Ncz	249.0	DENW05AL10002Ncz	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	193.97603396163322	377468.89909797814	5713413.794236578	15446.0	0106000000010000000103000000010000000F000000B8EBF6EAE0ED1C40472492CF7DC7494030587550EAED1C406220D8EC7DC749401626A899E9ED1C40CA97E3497EC74940709BE61BF6ED1C4086B7A8707EC749401F9FADD2F6ED1C40558CB0137EC74940B2B68A00FDED1C40FF8FBC267EC74940A3CBC349FCED1C4084BBB4837EC7494081A4E18F0BEE1C4006385AB37EC749404F53A8460CEE1C40AE0B62567EC74940534FFD3416EE1C40075EB9757EC74940332802EC1DEE1C408FAFDBA47AC74940680BF28BF3ED1C40B9C289217AC749406B383223F3ED1C4019A633577AC74940FCBFA64CE8ED1C4054456C377AC74940B8EBF6EAE0ED1C40472492CF7DC74940	2000-01-01	\N	\N
236	15453.0	DENW05AL10002Ndl	250.0	DENW05AL10002Ndl	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	168.5246416500304	377621.0843519135	5713441.455556513	15453.0	0106000000010000000103000000010000000600000024B419A123F01C4063F40CA783C74940D1A1A03926F01C4041371BB087C74940CBE5E79E54F01C40861B938187C7494063891DE952F01C40C05DEDD884C7494035B6080752F01C40D8EF6C7983C7494024B419A123F01C4063F40CA783C74940	2000-01-01	\N	\N
237	15454.0	DENW05AL10002NDl	251.0	DENW05AL10002NDl	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	104.63655691695749	377876.4074457688	5713606.819683692	15454.0	0106000000010000000103000000010000000B000000B117C098D9F31C408AF97B0EB8C749406156EFCBDAF31C401140AE75B9C74940EF7F753306F41C404C48E944B9C7494033F1247005F41C409CEC1756B8C74940CA6DEAD70CF41C401EAC864CB8C74940520ADACA0BF41C4083E255D1B6C74940F40DB5EDFCF31C40D8AF80E1B6C74940C52F7EE7FCF31C4013606BD9B6C74940D9136D16DAF31C40B243B3FEB6C7494095BAA3FCDAF31C4024B9A90CB8C74940B117C098D9F31C408AF97B0EB8C74940	2000-01-01	\N	\N
238	15462.0	DENW05AL10002Ndx	252.0	DENW05AL10002Ndx	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	233.76872955122963	377321.7797025691	5713279.930930158	15462.0	0106000000010000000103000000010000000D000000474A93BFC3EB1C4099F7700956C749409796D868D9EB1C40A03E534856C74940E1BEB619D8EB1C4009254AF456C74940B49D6A7DF2EB1C40C4F3E64157C7494080BEC47FF4EB1C40CCA7CB3156C749406661D0B5EFEB1C40D423302356C7494008DB20C2F2EB1C4058A68E8454C749408C2639D1F7EB1C40A29DDC9154C74940631D632DFAEB1C40D8F4965053C749408FE6813BF5EB1C405E9ABC4253C74940DB939BEAF8EB1C4021B4C33C51C7494085993EBDCDEB1C40CB57DCBD50C74940474A93BFC3EB1C4099F7700956C74940	2000-01-01	\N	\N
239	15464.0	DENW05AL10002NdY	253.0	DENW05AL10002NdY	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	186.18981129024178	377260.62361465563	5713426.353424379	15464.0	0106000000010000000103000000010000000D000000DC468570D1EA1C40BE4BE8EA7EC74940BD1D71ECC2EA1C40B29E07BA7EC749408EF07858C0EA1C4096358FF07FC7494097FD711D00EB1C40E1A1FBCD80C7494070AD888009EB1C40077732AA7CC74940FF9A5AE1E0EA1C406CAAC91E7CC74940B5E57929DFEA1C40F3B508E17CC7494081BC2F4EDAEA1C409925ECCE7CC7494094CA25D3D6EA1C40DCCBFB487EC749402962CB39DCEA1C40955B485B7EC7494087CD1A99DAEA1C4088C3E8237FC7494063AD80D8D5EA1C40A8E825647FC74940DC468570D1EA1C40BE4BE8EA7EC74940	2000-01-01	\N	\N
240	15466.0	DENW05AL10002NDZ	254.0	DENW05AL10002NDZ	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	104.67113538831472	377756.85435263015	5713592.646636808	15466.0	0106000000010000000103000000010000000B000000F68A508D44F21C4058C390F9B2C74940B707AC0045F21C40E3711AF9B2C7494002EE801144F21C40CCF1F39DB1C749404A652F5B19F21C40BE1261C5B1C7494001013AFC1AF21C401104CB50B4C74940E5C4F93D29F21C40A0EE5145B4C74940B281A29629F21C406C838CD6B4C74940F68CB14637F21C40E6B071C9B4C749401EA065F836F21C4047D52339B4C749400E73495E45F21C409F958229B4C74940F68A508D44F21C4058C390F9B2C74940	2000-01-01	\N	\N
241	15468.0	DENW05AL10002Ne3	255.0	DENW05AL10002Ne3	0	7	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	211.55345275811848	377774.175147362	5713490.042644494	15468.0	010600000001000000010300000001000000050000000DD7A14262F21C40E043079697C74940B21E03048DF21C407BB805D797C74940A74BD26C92F21C40DD2C435C92C749402269F98D67F21C4084E9E31F92C749400DD7A14262F21C40E043079697C74940	2000-01-01	\N	\N
242	15482.0	DENW05AL10002NEN	256.0	DENW05AL10002NEN	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	224.8821408378426	377581.1602045771	5713551.785703091	15482.0	0106000000010000000103000000010000000600000055DB77F7BDEF1C40B58C3AE3A3C74940A2F3C9AD75EF1C409D268E3DA4C7494066E2C58578EF1C4034C901B8A7C74940E1C01CE2C0EF1C40AA85584DA7C749407EC5AE81BEEF1C4048E36D86A4C7494055DB77F7BDEF1C40B58C3AE3A3C74940	2000-01-01	\N	\N
243	15484.0	DENW05AL10002NEv	257.0	DENW05AL10002NEv	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	149.6493579237722	377545.57782242965	5713387.979350656	15484.0	01060000000100000001030000000100000009000000AD1C636C14EF1C4017B0A55874C749403242187D11EF1C40DE232BC975C74940363081BD0FEF1C404597BFA476C74940C1B2BBF30DEF1C4002C20F8577C7494069A2705C2FEF1C40FAAB00EF77C74940B05AB14639EF1C4060EBA91173C749402B62F1DD17EF1C407F00F3A772C74940F7DD481E16EF1C40A05BC18373C74940AD1C636C14EF1C4017B0A55874C74940	2000-01-01	\N	\N
244	15487.0	DENW05AL10002NEX	258.0	DENW05AL10002NEX	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	61.739953984331805	377492.85414290713	5713823.778938637	15487.0	010600000001000000010300000001000000070000009848EB2429EE1C40218E29AEF3C749407BC3FF782AEE1C40A0A05997F6C749401C52359E2AEE1C40B6C727E7F6C74940EE0541EA3FEE1C406B15C6D7F6C749400FE891943EEE1C4044CE5BEAF3C7494070F2FF703EEE1C404B43A19EF3C749409848EB2429EE1C40218E29AEF3C74940	2000-01-01	\N	\N
245	15489.0	DENW05AL10002Nf4	259.0	DENW05AL10002Nf4	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	221.28527087136172	377591.31814164657	5713618.882158751	15489.0	010600000001000000010300000001000000110000007088A4F79AEF1C40EABA9157B9C749400CDF764D9EEF1C405AFC06F1B9C7494062B6D3CCA2EF1C40DE15CD12BAC7494042B6DE9A9FEF1C40BF4570C7BAC749400D264DF09BEF1C4005DDDA96BBC74940CD855D6F9BEF1C40ED0B81B3BBC74940C76D1AB69DEF1C40A3555EC0BBC7494061D155E5C5EF1C400FB3D9A3BCC74940BCCE216BC6EF1C40558A2287BCC74940EADD76F1C9EF1C40F0C387C5BBC7494045F4F9F7DCEF1C4067DD7BB0B7C74940FF79E1C9DCEF1C40F5FD43AFB7C74940E8EB2B62BFEF1C40DE47ACD4B6C749408F491A8DB3EF1C409F5FEB7BB6C749405C546779A8EF1C40EF483EECB8C749400A1A7D99A7EF1C407EDFD7E6B8C749407088A4F79AEF1C40EABA9157B9C74940	2000-01-01	\N	\N
246	15493.0	DENW05AL10002NFH	260.0	DENW05AL10002NFH	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	212.3500469699502	377741.4974140021	5713493.113143364	15493.0	010600000001000000010300000001000000050000002615F69BEBF11C401EBDBEC992C74940798C4072E6F11C408AAC524098C749405138546111F21C402E7DD28398C74940F9452CAF16F21C40A7E61A0C93C749402615F69BEBF11C401EBDBEC992C74940	2000-01-01	\N	\N
247	15498.0	DENW05AL10002NfN	261.0	DENW05AL10002NfN	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	90.41848898277385	377585.3969272636	5713359.483335904	15498.0	010600000001000000010300000001000000090000001B509F9AB6EF1C409C8A3DC16EC74940CB81EE97C8EF1C407B28F5F96EC74940F3CAF956CFEF1C406C0B1D9C6BC74940E3E0A45ABDEF1C40DDED65636BC749401A8A744EBCEF1C405FA9C5E96BC749402E1C0C77AEEF1C40A6F510BE6BC74940CA21EA0CA9EF1C401AF601796EC749402DD108D5B6EF1C4083D314A46EC749401B509F9AB6EF1C409C8A3DC16EC74940	2000-01-01	\N	\N
248	15511.0	DENW05AL10002Ngc	262.0	DENW05AL10002Ngc	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	177.4509186538926	377798.40750102425	5713532.213093059	15511.0	0106000000010000000103000000010000000D000000CCB4DC6CE3F21C40AE5A16A09FC74940C8FADCE8E3F21C4039858929A0C749402516AB6ABEF21C407C86A55AA0C74940A7C811FEBDF21C407BA0E1DA9FC749409782745BB0F21C40DE58A2EB9FC74940665B107DB3F21C40FF7FE357A3C74940B8EAFA7CC5F21C40645FB13DA3C74940AF3C1D5EC5F21C408907071EA3C74940046D7B36E1F21C4082A862F6A2C74940C56C3D61E1F21C401DFB2A15A3C74940676FC6CEF3F21C40F39945FAA2C74940E8962957F0F21C40EC0E7F909FC74940CCB4DC6CE3F21C40AE5A16A09FC74940	2000-01-01	\N	\N
249	15537.0	DENW05AL10002Nhc	263.0	DENW05AL10002Nhc	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	86.05292739113791	377873.31460811436	5713584.833713675	15537.0	01060000000100000001030000000100000009000000BAA9649FD4F31C401A33FB63B0C74940A0042C80D5F31C406937776AB1C74940C19AD7EAD3F31C40B2F37E6CB1C7494071990C23D5F31C406B015CD9B2C749402D0400D200F41C409B3802A6B2C74940FADB52FCFFF31C407352099EB1C74940F38E1DC9F8F31C40B2C1B8A6B1C74940B9BC67A0F7F31C40E0D9CF39B0C74940BAA9649FD4F31C401A33FB63B0C74940	2000-01-01	\N	\N
250	15538.0	DENW05AL10002NHd	264.0	DENW05AL10002NHd	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	148.11247691465542	377427.5701609463	5713389.198850674	15538.0	010600000001000000010300000001000000090000009EAC691F50ED1C409908820877C74940977E2B7F71ED1C40C78EDD6C77C74940A6E4B8D67AED1C4071CA9B9872C74940288B317859ED1C4072D27F3372C74940702A70CC57ED1C40CE40791073C74940E8E7F12256ED1C40F06965EC73C74940DF22E65653ED1C404F746A5E75C74940A7395FAE51ED1C402214573A76C749409EAC691F50ED1C409908820877C74940	2000-01-01	\N	\N
251	15540.0	DENW05AL10002NhH	265.0	DENW05AL10002NhH	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	150.81339946505614	377591.5359153215	5713427.538155835	15540.0	01060000000100000001030000000100000009000000429DDC33BCEF1C40072F18CF7EC749404A99D36FBCEF1C4021CD95B97FC749404BAFC7A8BCEF1C4066D2EC9780C7494078874A07BDEF1C40E18ABC0982C7494083A43E40BDEF1C40EE8F13E882C74940E8BF687ABDEF1C401CD2C1C883C74940CE498A38DFEF1C40248E83BB83C749407AF9BAF1DDEF1C404EEC9AC27EC74940429DDC33BCEF1C40072F18CF7EC74940	2000-01-01	\N	\N
252	15543.0	DENW05AL10002NHJ	266.0	DENW05AL10002NHJ	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	89.22045078712472	377697.5534539807	5713663.843557021	15543.0	01060000000100000001030000000100000009000000EBE4DE3F46F11C40AE1E6A05C6C74940115A894146F11C406C9A8D25C6C74940219149C337F11C403C3EE525C6C74940A50C9CB937F11C4024CB92EBC8C74940C953826E4BF11C40D5EFBDE9C8C749402FBC0C744BF11C4055212D74C9C7494009D6F57758F11C40AA581F73C9C7494051BCA82158F11C4004BFF704C6C74940EBE4DE3F46F11C40AE1E6A05C6C74940	2000-01-01	\N	\N
253	15546.0	DENW05AL10002Nhn	267.0	DENW05AL10002Nhn	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	87.85178188620921	377809.8245886703	5713660.688410315	15546.0	0106000000010000000103000000010000000A000000A0C2B99FE0F21C401AA4A5CAC8C749409EC5F707F3F21C400FCF80C7C8C749404032241BF3F21C40B0ECCF51C9C749400C11F89A00F31C40908BAA4DC9C749407ADFF49500F31C4002AFD5DEC5C74940A5F41979F5F21C407EC0C0DFC5C74940BD5CBAF3EEF21C4047B063E0C5C749406CA22CE5EEF21C407956E902C6C7494072824CE9E0F21C40CCBA5504C6C74940A0C2B99FE0F21C401AA4A5CAC8C74940	2000-01-01	\N	\N
254	15551.0	DENW05AL10002Nhv	268.0	DENW05AL10002Nhv	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	184.18142446130514	378499.00115011795	5713787.666879454	15551.0	01060000000100000001030000000100000005000000663B4676FCFC1C4068AA601FEFC74940F18CDB64EAFC1C40CCBEF18BF1C74940361B6B6729FD1C40E2266966F4C74940BAFD199C3BFD1C40ECA24EF5F1C74940663B4676FCFC1C4068AA601FEFC74940	2000-01-01	\N	\N
255	15552.0	DENW05AL10002NhW	269.0	DENW05AL10002NhW	0	14	Gemischt genutztes Gebäude mit Wohnen ist ein Gebäude, in dem sowohl gewohnt wird, als auch Teile des Gebäudes zum Anbieten von Dienstleistungen, zur Durchführung von öffentlichen oder privaten Verwaltungsarbeiten, zur gewerblichen oder industrielle	Gemischt genutztes Gebäude mit Wohnen	0	1100	499.93718448001897	377325.6257258233	5713637.574525761	15552.0	01060000000100000001030000000100000015000000828A8C1FDCEB1C40A1F9B523C0C74940DF175075E0EB1C4043BBEEB5BFC74940375CD1F6F5EB1C40463B29FCC0C749405266ADD012EC1C4097ECAE2DBEC749407100CE46FCEB1C40A8EC92CBBCC7494066C589E9F7EB1C40C3769538BDC7494012F23E94C5EB1C40B9AB861FBAC74940E589C700CBEB1C4066E7E895B9C74940B6D449BFCCEB1C40F07CB769B9C74940CF3CC88AC3EB1C40904E18DAB8C74940B7F58275B8EB1C40A7490D2DB8C7494004937396B4EB1C40712BA5F0B7C749403CA6E727B3EB1C408139C414B8C74940B54BFCE49DEB1C405A07252FBAC7494082305CC9A1EB1C40C446256DBAC7494069A348CEACEB1C40B2FEF21CBBC749400BE7D321A2EB1C409BA4CB2CBCC74940BB6A58DD9FEB1C4098AC9D66BCC749402661182E94EB1C409D0D4D90BDC749403621CB78D0EB1C4040ACFF4AC1C74940828A8C1FDCEB1C40A1F9B523C0C74940	2000-01-01	\N	\N
256	15563.0	DENW05AL10002Nig	270.0	DENW05AL10002Nig	1	13	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	210.94890417344868	377807.8199288772	5713468.305458479	15563.0	0106000000010000000103000000010000000500000014A590F9E8F21C40DADA80F08BC74940126FA46FE3F21C40DAA52E6C91C74940896C1E0B0EF31C40F70DA5B091C749408298136E13F31C409A817A328CC7494014A590F9E8F21C40DADA80F08BC74940	2000-01-01	\N	\N
257	15566.0	DENW05AL10002NIl	271.0	DENW05AL10002NIl	0	9	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	212.56509626097977	377709.75442801655	5713477.533211826	15566.0	01060000000100000001030000000100000005000000CAE6C6DD6FF11C4039B6F67493C749408D1ECFCA9AF11C407FFD6DB293C74940B28D191AA0F11C40694182398EC74940DA47B23375F11C4035DC65F68DC74940CAE6C6DD6FF11C4039B6F67493C74940	2000-01-01	\N	\N
258	15575.0	DENW05AL10002Nix	272.0	DENW05AL10002Nix	0	14	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	210.65619382075965	377806.8217652511	5713486.915802228	15575.0	01060000000100000001030000000100000005000000478BDDE7DDF21C40819204E496C74940CD2842B208F31C4047E70A2497C74940896C1E0B0EF31C40F70DA5B091C74940126FA46FE3F21C40DAA52E6C91C74940478BDDE7DDF21C40819204E496C74940	2000-01-01	\N	\N
259	15578.0	DENW05AL10002Niz	273.0	DENW05AL10002Niz	0	20	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	256.60435917259747	377758.7604175104	5713634.9936974775	15578.0	0106000000010000000103000000010000000D0000003A820A101FF21C40D081BAA5BCC74940188AD2E91FF21C40D71EE1FABDC74940CD6F12AE26F21C40050545F7BDC74940B1D027D726F21C40460BAD82BEC7494084C51C2825F21C40770DBEBEBEC74940AEF8F0031FF21C40BB8B4BC1BEC74940793825231FF21C40E517FA5CBFC74940CB7576A511F21C40AD328560BFC749400BBB6EA211F21C402B59711AC2C749407CB96C9D49F21C402E1B2D18C2C74940C6263AFC4EF21C40014C8DA4C1C74940CFF40A854BF21C40EA35507ABCC749403A820A101FF21C40D081BAA5BCC74940	2000-01-01	\N	\N
260	15590.0	DENW05AL10002Njo	274.0	DENW05AL10002Njo	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	87.54714665561916	377848.9261074043	5713578.231295226	15590.0	01060000000100000001030000000100000009000000FF111EBD74F31C407E6B8D6BAEC74940BB3513B875F31C40C742996BAFC749400CC8D1EC7BF31C40C6745C62AFC7494062CB91667DF31C40BFB6E2E2B0C74940BD338B7FA0F31C4059F541B3B0C74940C76A9B869FF31C40059A9B93AFC7494046775B0FA1F31C409DD78D91AFC74940BDD173D69FF31C408CDB1E2AAEC74940FF111EBD74F31C407E6B8D6BAEC74940	2000-01-01	\N	\N
261	15597.0	DENW05AL10002NjW	275.0	DENW05AL10002NjW	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	90.25269847380696	377576.5311061538	5713358.305684358	15597.0	010600000001000000010300000001000000090000005261ABC78FEF1C40211A64D36AC749407FE6A90589EF1C4049FE4D316EC749400A24F5CB9AEF1C40917577696EC74940C7264F059BEF1C401D7B9B4C6EC74940CA21EA0CA9EF1C401AF601796EC749402E1C0C77AEEF1C40A6F510BE6BC7494092B6D37FA0EF1C403853EC916BC74940005B028DA1EF1C4063C4790B6BC749405261ABC78FEF1C40211A64D36AC74940	2000-01-01	\N	\N
262	15598.0	DENW05AL10002Njy	276.0	DENW05AL10002Njy	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	149.88024253305048	377541.09477268066	5713421.403105555	15598.0	01060000000100000001030000000100000009000000AA647E78FDEE1C40D158849B7FC749408AC3DFB8FBEE1C4093152C7780C74940BFCE78F4F9EE1C40CEA9C25581C749409DAA475D1BEF1C408F2B8DBF81C7494062A90C4925EF1C40AA5B8EE07CC74940F66548E103EF1C4017D09D767CC74940E5B9350D02EF1C4072300A5C7DC749402075974D00EF1C40FAEDB1377EC74940AA647E78FDEE1C40D158849B7FC74940	2000-01-01	\N	\N
263	15603.0	DENW05AL10002NKb	277.0	DENW05AL10002NKb	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	166.72738348087296	377623.5960203981	5713480.409484363	15603.0	0106000000010000000103000000010000000600000001B16E082BF01C40D37D24058FC74940519F44DB2DF01C40DF96034C93C74940AB7E4D1859F01C40B744562093C749406C6CD67457F01C40165726B090C7494012C1293556F01C40AE18BDD58EC7494001B16E082BF01C40D37D24058FC74940	2000-01-01	\N	\N
264	15606.0	DENW05AL10002NKf	278.0	DENW05AL10002NKf	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	152.15428445115685	377545.7583740349	5713894.658924148	15606.0	01060000000100000001030000000100000009000000951DCAE00EEF1C40B721DB390AC849409041B86308EF1C40D224F9120AC84940B2EB203B0DEF1C40876E93A808C8494080992CC8EBEE1C40D0E29DEC07C84940A1575527DCEE1C405091EF530CC84940F2B0C284FDEE1C400DAE54070DC8494047C5E8A402EF1C40CDB3CDA20BC84940E3CA766009EF1C400690E6C40BC84940951DCAE00EEF1C40B721DB390AC84940	2000-01-01	\N	\N
265	15607.0	DENW05AL10002Nkg	279.0	DENW05AL10002Nkg	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	177.76086343384122	377736.6047188482	5713638.888379155	15607.0	0106000000010000000103000000010000001900000064893177BDF11C40C5CDCCF1C1C749402578017FBDF11C409EAD6236C2C749408BAAECF7C0F11C4035F20436C2C749409FC6FEF5C0F11C40F8763B23C2C74940241A781BCFF11C402229E421C2C7494024BE091CCFF11C4088946F29C2C749406C6DA511D1F11C4017EC2B29C2C74940F73BD80DD1F11C4048228A06C2C749405654F7CDECF11C40A3B6EF01C2C7494060B6BED1ECF11C4052CDA424C2C749400C41ADBDEEF11C4037795C24C2C74940C4D9D9BCEEF11C40485BA51DC2C749404269C278FCF11C40B957681CC2C7494023B8307BFCF11C40544BB430C2C74940AEA7BBE0FFF11C40977E6030C2C74940E5661EDAFFF11C403B150AEBC1C74940676CA3D5FEF11C40F64427EBC1C749406FD211F6FEF11C406407BFACBEC74940707B9DF7F1F11C4072FE04AFBEC74940B59B55E2F1F11C4039DB9238BFC74940F0E58CDDCBF11C40FB4A6240BFC74940854A73B3CBF11C4098A008B2BEC749400D5333D7BEF11C40E54768B6BEC749406D335868BEF11C40180693F1C1C7494064893177BDF11C40C5CDCCF1C1C74940	2000-01-01	\N	\N
266	15612.0	DENW05AL10002NKM	280.0	DENW05AL10002NKM	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	181.66060145758092	377502.46044717514	5713591.341517756	15612.0	01060000000100000001030000000100000006000000E87EEF7B4CEE1C40E7280E80AFC7494083B27F214EEE1C40E9D5FE39B1C74940E8B210714FEE1C40EA5B3AA2B2C74940B845DDB08FEE1C4025DBBA40B2C74940F177E5AD8CEE1C403D785C1FAFC74940E87EEF7B4CEE1C40E7280E80AFC74940	2000-01-01	\N	\N
267	15615.0	DENW05AL10002NkS	281.0	DENW05AL10002NkS	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	152.91407123289537	377602.7519444766	5713532.329459888	15615.0	010600000001000000010300000001000000060000002456F144DAEF1C40AA7FBD059EC74940030D68E0DCEF1C40821670F2A1C7494084D30D36DDEF1C40E2C2128AA2C74940A1B293BE02F01C40E63BC269A2C74940AB0BD1D3FFEF1C40FD8175E09DC749402456F144DAEF1C40AA7FBD059EC74940	2000-01-01	\N	\N
268	15634.0	DENW05AL10002NLk	283.0	DENW05AL10002NLk	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	87.99267481965944	377781.79560124263	5713604.073556281	15634.0	01060000000100000001030000000100000009000000290DD96177F21C402BCC2487B5C749408AB19A4178F21C40110435E5B6C749402409B6767AF21C40E9B519E3B6C749405499A4297BF21C4095388603B8C74940761E111D9EF21C40CEA5E7DFB7C74940E5F678119DF21C404D124460B6C74940506FC1F7A3F21C40E9D90559B6C74940DA11673FA3F21C4002DA5950B5C74940290DD96177F21C402BCC2487B5C74940	2000-01-01	\N	\N
269	15635.0	DENW05AL10002NlL	284.0	DENW05AL10002NlL	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	86.21839913804433	377680.84936476295	5713568.0354664065	15635.0	010600000001000000010300000001000000090000000F83036718F11C405746C6E4ACC74940CECE725C18F11C40B0869BB5ACC74940A53B525F23F11C40032E85A7ACC74940D376C0D320F11C40704F68BFA9C749409B3972D215F11C40CA62B4CEA9C74940559D60A215F11C40D278B69EA9C749402852083802F11C40C8F0E0B9A9C749407A12721F05F11C40051F2800ADC749400F83036718F11C405746C6E4ACC74940	2000-01-01	\N	\N
270	15638.0	DENW05AL10002NLq	285.0	DENW05AL10002NLq	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	149.33407779131085	377425.462580526	5713405.917274954	15638.0	010600000001000000010300000001000000090000002A3A9D0250ED1C401E81501777C7494068D4B65D4EED1C407838E8F077C7494000D337B44CED1C40E65FD4CC78C749406A4ABDEC49ED1C40FC43983C7AC74940D9EE3D4348ED1C40B36A84187BC74940F0934D9646ED1C403B122BF67BC74940CB6D10F667ED1C40DEFC995A7CC749403F215F6271ED1C409207AC7B77C749402A3A9D0250ED1C401E81501777C74940	2000-01-01	\N	\N
271	15639.0	DENW05AL10002Nlu	286.0	DENW05AL10002Nlu	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	87.83919023047201	377439.06139624154	5713562.117904151	15639.0	01060000000100000001030000000100000008000000D2D4CC8D6EED1C402FEDB69DA6C74940D6068E2371ED1C406C030157A9C749403380AB8193ED1C40491A4A24A9C749408070917590ED1C40EE5D0140A6C749405B95E1B579ED1C4057049962A6C749409498785F78ED1C401419AB64A6C7494041922E9578ED1C4032CDDC8EA6C74940D2D4CC8D6EED1C402FEDB69DA6C74940	2000-01-01	\N	\N
272	15651.0	DENW05AL10002Nml	287.0	DENW05AL10002Nml	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	94.83891854248941	377507.9452206675	5713731.94461136	15651.0	01060000000100000001030000000100000007000000C6BD838D8EEE1C40B3731A43DAC749401E4FBB487BEE1C404FC6340DD9C74940B7CC609580EE1C40AE7B6486D8C74940F9FE2F1A78EE1C407BDE84FED7C749400B05D1B45CEE1C401ADAB7A2DAC749403A66CFD678EE1C4005721F69DCC74940C6BD838D8EEE1C40B3731A43DAC74940	2000-01-01	\N	\N
273	15653.0	DENW05AL10002NML	288.0	DENW05AL10002NML	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	62.29084676722414	377504.4284260675	5713825.082777417	15653.0	01060000000100000001030000000100000007000000796E7A9254EE1C408746EA29F4C74940860AC8E855EE1C405FBE5E15F7C749409316A90756EE1C40C84D605AF7C749407D0140C06BEE1C40B87FAB4AF7C749408C41E76D6AEE1C40AE524668F4C749401853084B6AEE1C407FC6481AF4C74940796E7A9254EE1C408746EA29F4C74940	2000-01-01	\N	\N
274	15655.0	DENW05AL10002NMq	289.0	DENW05AL10002NMq	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	149.87808034196496	377492.7874705529	5713452.111816299	15655.0	010600000001000000010300000001000000050000009F0EACE76BEE1C4061BCC39385C74940A43DF1774AEE1C407B33682A85C74940047C409040EE1C4020E6370B8AC74940F23C420562EE1C40E6AE22708AC749409F0EACE76BEE1C4061BCC39385C74940	2000-01-01	\N	\N
275	15656.0	DENW05AL10002NmR	290.0	DENW05AL10002NmR	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	150.41840475378558	377499.86683159217	5713398.842971165	15656.0	0106000000010000000103000000010000000900000010C2140260EE1C40D546465E7AC74940022E37E481EE1C406BCE08CA7AC7494028D6F7B28BEE1C405C55CFF775C749400914BDCE69EE1C40605EA68C75C7494024FDFC2768EE1C405210BC5C76C749404987596866EE1C4072BA633877C749407725C98A63EE1C407F128DA178C749405E5225CB61EE1C40BDBB347D79C7494010C2140260EE1C40D546465E7AC74940	2000-01-01	\N	\N
276	15659.0	DENW05AL10002NMT	291.0	DENW05AL10002NMT	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	87.97203414748947	377827.99628797313	5713553.189708624	15659.0	0106000000010000000103000000010000000D000000BEB03DE63BF31C4093ECB785A6C74940E6D76DCB2DF31C4099E4049AA6C74940C1E1F02230F31C4080506E56A9C74940938B280143F31C408D1B633AA9C749409519447A43F31C4001DED4C3A9C7494067402BC750F31C40A7578AAEA9C74940C46D6DF64DF31C40F827AD78A6C74940BDBA41DD4EF31C404CF45F77A6C7494072C487A84EF31C40A668573DA6C749400B2C94E24BF31C40DD3D5D41A6C749407884AEEF4BF31C40F228584FA6C74940BFCF04CA3BF31C403D48E366A6C74940BEB03DE63BF31C4093ECB785A6C74940	2000-01-01	\N	\N
277	15661.0	DENW05AL10002NMz	292.0	DENW05AL10002NMz	1	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	165.56408721162006	377534.83637754194	5713554.095746745	15661.0	0106000000010000000103000000010000000A000000C0B3DCDCD2EE1C40DEAAE7CFA4C74940059ADDC2D1EE1C40EE60BBD0A4C74940655A36ADD3EE1C402EFE439AA6C74940A2829040D5EE1C40184C2A12A8C74940922585E508EF1C4018E9E8C8A7C74940C322836805EF1C40F392668BA4C7494003311D54E6EE1C401CB9CFB6A4C749408FAA6297E5EE1C408A7884E8A3C749408D75EE06D2EE1C4093E3B601A4C74940C0B3DCDCD2EE1C40DEAAE7CFA4C74940	2000-01-01	\N	\N
278	15668.0	DENW05AL10002Nna	293.0	DENW05AL10002Nna	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	102.73217733879575	377756.14129775495	5713583.409947433	15668.0	0106000000010000000103000000010000000B000000028932B625F21C4057224AB1AEC7494001A97F0526F21C401A62D431AFC74940092DC69217F21C40E7FD2B3FAFC749404A652F5B19F21C40BE1261C5B1C7494002EE801144F21C40CCF1F39DB1C74940364E023643F21C4038F3D35AB0C7494015C1F9B842F21C40229D455BB0C74940CB4375DD41F21C4036EB3818AFC749406C3C889133F21C400D0D5625AFC74940CF8C2C4333F21C408591DFA4AEC74940028932B625F21C4057224AB1AEC74940	2000-01-01	\N	\N
279	15693.0	DENW05AL10002NOd	294.0	DENW05AL10002NOd	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	87.66816705429983	377932.6386663892	5713657.488685312	15693.0	01060000000100000001030000000100000009000000D88FACE5C4F41C401DD8FAD8C5C749403E5EB192B2F41C40C4B627D9C5C74940D324E6CCB2F41C407E1D783CC9C74940D6E30ADEBFF41C40EEF15039C9C749404E67CDCEBFF41C405042CEB1C8C74940430A0909D3F41C4062B423B2C8C7494021818A1ED3F41C4044E2E4F6C5C749400E940DE6C4F41C409C4B14F7C5C74940D88FACE5C4F41C401DD8FAD8C5C74940	2000-01-01	\N	\N
280	15694.0	DENW05AL10002NoF	295.0	DENW05AL10002NoF	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	88.85593253829029	377812.65185935464	5713636.889388524	15694.0	0106000000010000000103000000010000000D000000F59BA0D9FFF21C40BEF7EAA6BEC749407BC9E7DEFFF21C406D135532BFC74940BB7E7A1FEDF21C408BD59832BFC74940F0FC9498EDF21C40831794F5C1C74940A6D65BACFBF21C4023E21AF5C1C74940433F68AEFBF21C40A5900914C2C74940ACDD422A0BF31C40DFDCDC13C2C74940DB144F2B0BF31C4047E74023C2C74940A2B8CECB0EF31C4031234323C2C74940450C19C90EF31C40F2FBC7DDC1C74940B7E0B8FE0DF31C40748EDADDC1C74940C86EAC110DF31C4073FC41A6BEC74940F59BA0D9FFF21C40BEF7EAA6BEC74940	2000-01-01	\N	\N
281	15695.0	DENW05AL10002NOf	296.0	DENW05AL10002NOf	0	13	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	212.82538760080934	377775.1389179141	5713471.408787208	15695.0	010600000001000000010300000001000000050000002269F98D67F21C4084E9E31F92C74940A74BD26C92F21C40DD2C435C92C749404DE6EFD697F21C4023925FE08CC749409B0EFBE16CF21C40CF667DA08CC749402269F98D67F21C4084E9E31F92C74940	2000-01-01	\N	\N
282	15699.0	DENW05AL10002NOl	297.0	DENW05AL10002NOl	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	87.39892737915216	377655.64921821066	5713640.9742666595	15699.0	01060000000100000001030000000100000009000000B1FA3CEBA7F01C40884A79F3BEC74940B00015DDA7F01C40B3126C27BFC749402727E58B9CF01C4094698928BFC74940B7E3A3739CF01C40550E2807C2C7494021C4C1CFA7F01C407E3D2805C2C7494037A951CDA7F01C40FC55A835C2C749406C5DEAC4BBF01C401BF81A34C2C7494036701DB2BBF01C4036D5E2F2BEC74940B1FA3CEBA7F01C40884A79F3BEC74940	2000-01-01	\N	\N
283	15709.0	DENW05AL10002NPA	298.0	DENW05AL10002NPA	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	86.51130484199892	377711.02929336275	5713663.535517124	15709.0	010600000001000000010300000001000000090000001D271CBC6CF11C4051EB1209C6C749407AE4FC066DF11C40BDC18273C9C74940A508E00A7AF11C4026288872C9C749409C4E84297AF11C405E290DEAC8C74940169D1B7C8CF11C40396C2CEBC8C749404A56E15B8CF11C400E243F26C6C749401222229A7EF11C408A3F8C27C6C74940D38203997EF11C4069A2C408C6C749401D271CBC6CF11C4051EB1209C6C74940	2000-01-01	\N	\N
284	15716.0	DENW05AL10002NpQ	299.0	DENW05AL10002NpQ	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	150.19541930779815	377420.12561669236	5713443.638275258	15716.0	01060000000100000001030000000100000005000000591D9EF859ED1C40EEAD638F82C7494011F0537938ED1C40DBBF5E2682C74940375B78CB2EED1C40F1A9490787C74940F915793850ED1C4095EB0B7087C74940591D9EF859ED1C40EEAD638F82C74940	2000-01-01	\N	\N
285	15726.0	DENW05AL10002NQ6	300.0	DENW05AL10002NQ6	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	207.22077471297234	377283.1429595297	5713483.865557841	15726.0	0106000000010000000103000000010000000D000000DE1ADAC756EB1C40E03FB51692C7494096AE0A2759EB1C4075F8560D91C74940F57D7B2E5DEB1C40E00BA7FC90C74940FBD2BEC85FEB1C40F2CA2ED78FC74940924CC0624BEB1C408346928E8FC74940FDBBBC994DEB1C4011264F938EC749400C3A1B6D48EB1C40081432818EC749404C20DE0C4BEB1C40D02545508DC74940D249238D2EEB1C409F08FFFA8CC74940DE57981326EB1C4042E0B4E18CC7494030E228F51BEB1C40FE8B984B91C7494062619BEC45EB1C400994C8D891C74940DE1ADAC756EB1C40E03FB51692C74940	2000-01-01	\N	\N
286	15728.0	DENW05AL10002NqA	301.0	DENW05AL10002NqA	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	149.51059487834573	377456.4874006518	5713447.85034605	15728.0	01060000000100000001030000000100000005000000FFDBA50FE3ED1C404A28581184C749401DA3D69DC1ED1C40DF9381A883C7494089481CCCB7ED1C408D2AB38388C749404061E82AD9ED1C40D6619DEE88C74940FFDBA50FE3ED1C404A28581184C74940	2000-01-01	\N	\N
287	15739.0	DENW05AL10002NqS	302.0	DENW05AL10002NqS	0	18	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	268.03622162435204	377600.68741305993	5713549.866193632	15739.0	0106000000010000000103000000010000000C00000097B180C2DEEF1C404769115AA4C749407EC5AE81BEEF1C4048E36D86A4C74940E1C01CE2C0EF1C40AA85584DA7C74940DE96E959C1EF1C40D3349ED7A7C74940F3E33C66FEEF1C40551A6A83A7C74940C59BC79F05F01C404D510CE3A6C749402E943FC402F01C40AE749373A2C74940ED8F033ADDEF1C402C460A90A2C7494044C036D6D8EF1C40942A7895A2C749401F8AA9B8D9EF1C40A513D8C4A3C749403E12BA20DEEF1C4050CB66C4A3C7494097B180C2DEEF1C404769115AA4C74940	2000-01-01	\N	\N
288	15743.0	DENW05AL10002Nrd	303.0	DENW05AL10002Nrd	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	67.32224732880422	377392.739606396	5713599.353786475	15743.0	0106000000010000000103000000010000000D000000F0F2F785C2EC1C401A6BE59EB0C74940D15012D1C3EC1C402F74183AB4C74940FE300796C5EC1C40ADA77A37B4C74940087C838CC5EC1C406704DF1AB4C749402ABAE6E1D9EC1C409008FA09B4C749403B8670EBD9EC1C40F65E8226B4C74940AA5B48C9DAEC1C40CAF71826B4C74940D7E9AA7CD9EC1C40BE25B98FB0C74940140978A9D8EC1C406FAF2790B0C74940B48AF0C0D8EC1C40510504D4B0C749405D973159C4EC1C40C40EB5E1B0C74940DF52B941C4EC1C40D4B8D89DB0C74940F0F2F785C2EC1C401A6BE59EB0C74940	2000-01-01	\N	\N
289	15745.0	DENW05AL10002NrO	304.0	DENW05AL10002NrO	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	189.57532333524432	377618.1544100441	5713410.011103396	15745.0	0106000000010000000103000000010000000D000000E70CB2C04DF01C400B673FC47EC749404F63F0C44CF01C40B58220477DC749408E3F7F5343F01C40887662507DC749405BF42CF941F01C40F0B3C42F7BC74940682CA96A4BF01C40F8265C267BC749405BDA60754AF01C408E92F8A379C74940E1449DC31DF01C40A97E3AD079C749400C9B64901EF01C40D13513207BC749403778181C1EF01C4080B275207BC74940A22842B91FF01C40543105A87DC749402E53942D20F01C40B7678FA77DC74940B037990021F01C40706FE4F27EC74940E70CB2C04DF01C400B673FC47EC74940	2000-01-01	\N	\N
290	15760.0	DENW05AL10002NSM	305.0	DENW05AL10002NSM	1	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	88.5446499048703	377853.88340848876	5713659.302637439	15760.0	01060000000100000001030000000100000009000000DB633CEC86F31C408BFE0EEFC5C74940126CD94887F31C40874A7AB0C8C7494000EE60789AF31C40080CDBADC8C749409F1859A29AF31C400D2E6133C9C749406C7C85F4A7F31C406484D732C9C749407C4F0645A7F31C40629A58CDC5C7494017E76DF294F31C40D30C67CFC5C74940FEDF57E394F31C400BC265EDC5C74940DB633CEC86F31C408BFE0EEFC5C74940	2000-01-01	\N	\N
291	15761.0	DENW05AL10002NSO	306.0	DENW05AL10002NSO	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	218.08448965707794	377487.42976413027	5713755.894003545	15761.0	01060000000100000001030000000100000009000000F2A67416FAED1C4030C21DAFE1C74940CAB181CE12EE1C4076868F45E3C7494014BC360220EE1C403FE53605E2C74940E86DC2AD3CEE1C400014F3D7E3C74940599184FB52EE1C40643D6BBBE1C749406410AD3636EE1C4077E616E9DFC7494070AB43DC36EE1C4079B168D9DFC74940A45C70291EEE1C409D77DC44DEC74940F2A67416FAED1C4030C21DAFE1C74940	2000-01-01	\N	\N
292	15768.0	DENW05AL10002NT8	307.0	DENW05AL10002NT8	0	9	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	175.46290887180655	377678.3030660554	5713468.980006077	15768.0	0106000000010000000103000000010000001D000000AE3F8703FDF01C40099AE2318FC7494056F5E5FBFDF01C40C53255338FC749401A1B8FBCFCF01C404B11327E90C74940FD9A58A2FBF01C4098DE9B7C90C74940ABA2CC96FBF01C409914E28890C74940FA3EB6C522F11C402B9857CB90C74940F3D7DECF22F11C403D526CC090C749403A9C305322F11C40E571BCBF90C74940BBC36E5D24F11C40284095A18EC749408B21CBC524F11C40DB583BA28EC74940379EDF8E25F11C40CFADBAD18DC74940ACD519DC24F11C40F485A3D08DC7494042CD8FDA26F11C40FC8983BF8BC749408313A51127F11C40ECFBD7BF8BC749408CAF912E27F11C404834F8A08BC7494012C4317800F11C4077846E668BC749405798B05F00F11C40972D69808BC74940DDD7796901F11C402228E4818BC7494086FDA05C00F11C407C9123978CC74940DC12677CFFF01C406337E3958CC74940E4F8105EFFF01C40A63B31B68CC74940E259072900F11C40FC0954B78CC74940C78CD9FBFEF01C40E33532F08DC749407E7B9839FEF01C40909813EF8DC74940864F1121FEF01C40908E21098EC7494098A6E02AFFF01C40733C890A8EC749403247F91EFEF01C406D69DC1F8FC74940C38C2D16FDF01C40F9984E1E8FC74940AE3F8703FDF01C40099AE2318FC74940	2000-01-01	\N	\N
293	15777.0	DENW05AL10002NTN	308.0	DENW05AL10002NTN	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	85.5963118232321	377523.91646800516	5713636.459709145	15777.0	0106000000010000000103000000010000000700000070787126C8EE1C40D9883852C0C74940494B2FFBC4EE1C401E78A232BCC749401CD02BFAADEE1C4016463550BCC74940CA424835AEEE1C4015E2179EBCC74940D29F64C1AFEE1C4001BC35AABEC74940AD021617B1EE1C40FFF4296FC0C7494070787126C8EE1C40D9883852C0C74940	2000-01-01	\N	\N
294	15787.0	DENW05AL10002NUn	309.0	DENW05AL10002NUn	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	101.38175420230255	377586.12375448074	5713456.326594487	15787.0	01060000000100000001030000000100000008000000129152B9A1EF1C4002FB8B078BC74940080EAFC9BEEF1C405BCDC65B8BC7494007F7F168CBEF1C406DE9168F8AC749406C9F24DEC9EF1C409544EE688AC749406D0D0754CDEF1C406AF2B64F89C74940A5D1628FC2EF1C40FB101B4788C7494035BA6A08A7EF1C40747324F887C74940129152B9A1EF1C4002FB8B078BC74940	2000-01-01	\N	\N
295	15788.0	DENW05AL10002NUN	310.0	DENW05AL10002NUN	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	135.77869465783442	377581.1902237976	5713761.39871917	15788.0	01060000000100000001030000000100000010000000FD3F1A5C6BEF1C401A91E958E4C74940B7FCCB566BEF1C40773D695AE4C74940AEFBBC0E95EF1C403C8F834CE5C7494092A9ECA695EF1C4028CB3720E5C749405CDDB6C7A3EF1C40EC96FC72E5C749403F4AE1B0A8EF1C404CA5A929E4C74940C087A26A9AEF1C409F16EBD5E3C74940AD06C2F59DEF1C40169059DCE2C7494045740B3B9EEF1C40B0ADFACAE2C749407E34A47B92EF1C40A637A286E2C7494007C4328094EF1C4043F898FBE1C749401A37BF6876EF1C40C1CACC50E1C7494079AF285E76EF1C409BD6B853E1C7494090C3F43376EF1C4060866F52E1C7494021060C2C6BEF1C40670EC457E4C74940FD3F1A5C6BEF1C401A91E958E4C74940	2000-01-01	\N	\N
296	15790.0	DENW05AL10002Nut	311.0	DENW05AL10002Nut	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	150.255756739527	377373.85326102166	5713461.299373267	15790.0	010600000001000000010300000001000000050000002504E04E7EEC1C4062B911E88BC74940C99E1CAE9FEC1C409E0590518CC7494016B8C160A9EC1C403A69FF6A87C74940DFD08B0F88EC1C406CD0300387C749402504E04E7EEC1C4062B911E88BC74940	2000-01-01	\N	\N
297	15791.0	DENW05AL10002NUt	312.0	DENW05AL10002NUt	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	87.57044332101941	377851.72326639714	5713609.472546478	15791.0	010600000001000000010300000001000000090000009ED33D2D84F31C4065C1B7EFB8C7494081E8C62E7DF31C40F08802FAB8C74940B2E3D91F7EF31C40F245FA00BAC749402EC312F5A9F31C4092B9C3C2B9C74940A5BC30B4A8F31C40772DCF55B8C74940718A5421A7F31C400BEB1B56B8C749409635AC36A6F31C408918064AB7C74940AD8B14D782F31C40841D767CB7C749409ED33D2D84F31C4065C1B7EFB8C74940	2000-01-01	\N	\N
298	15816.0	DENW05AL10002NVu	313.0	DENW05AL10002NVu	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	88.54623126336081	377675.24312239274	5713664.419204586	15816.0	01060000000100000001030000000100000009000000497C0069F1F01C406D561206C6C74940A25EE261F1F01C400F61AE2CC6C74940B4E9585DE3F01C40A214EE2DC6C7494053C98B99E3F01C408313D1EFC8C749405818E5CFF6F01C4014F211EDC8C7494058AB6ADEF6F01C40EBB99D76C9C7494012D023EF03F11C40BE49D574C9C749401712D39103F11C405A437A04C6C74940497C0069F1F01C406D561206C6C74940	2000-01-01	\N	\N
299	15820.0	DENW05AL10002NVZ	314.0	DENW05AL10002NVZ	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	160.84508647583425	377436.8818331308	5713302.576726237	15820.0	01060000000100000001030000000100000009000000BE90CC6F9FED1C40B2A408405CC74940DA6D6CC3A4ED1C40B75629515CC7494080CAE237A7ED1C40280CC71B5BC7494029363DE4A1ED1C4000A8B90A5BC74940EC5B7775A5ED1C406720404259C74940AB93C5E484ED1C4068477D6E58C749409B289E4C7AED1C408EB77CAD5DC74940CE9C88C39BED1C40F5E5C0145EC74940BE90CC6F9FED1C40B2A408405CC74940	2000-01-01	\N	\N
300	15823.0	DENW05AL10002Nw8	315.0	DENW05AL10002Nw8	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	136.02785500138998	377477.03183262906	5713562.992500409	15823.0	01060000000100000001030000000100000009000000AD588242FDED1C409F40A954A7C74940A4F18340FCED1C4015F72256A7C74940AC8CD110FFED1C400B00D352AAC74940D157F48528EE1C40316CA914AAC749400F895DD625EE1C40A15F9018A7C749409B10419613EE1C40F5ED9833A7C7494036A9358512EE1C4006C7CB01A6C749400AB2D40EFCED1C4079AC4825A6C74940AD588242FDED1C409F40A954A7C74940	2000-01-01	\N	\N
301	15831.0	DENW05AL10002Nwj	316.0	DENW05AL10002Nwj	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	87.6278098653638	377897.7691889274	5713658.416723995	15831.0	010600000001000000010300000001000000090000000851040B3BF41C40CD1A67DBC5C74940E25C90053BF41C40D11091F9C5C74940179D0B472DF41C407BE1D3F9C5C7494091A1C0542DF41C4030550FBDC8C74940EF0CE70840F41C409B80C9BBC8C749403E62D90040F41C40C0DA4F40C9C74940CE5B16794DF41C403B88C93EC9C74940C734CC464DF41C40465C1CDBC5C749400851040B3BF41C40CD1A67DBC5C74940	2000-01-01	\N	\N
302	15841.0	DENW05AL10002NWu	317.0	DENW05AL10002NWu	0	11	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	174.63665561247035	377675.9724471108	5713412.146410945	15841.0	0106000000010000000103000000010000001D00000040A4F7DDFCF01C4063562EC07AC74940A922A6CDFDF01C40037189C17AC749403BCCBDC7FCF01C405C0445D67BC7494064420FD8FBF01C40AEE9E9D47BC749406B8290C2FBF01C40F5B16DEB7BC749409DC036B3FCF01C40D343C9EC7BC7494017E7757CFBF01C40840FF3347DC74940439BCF8BFAF01C408A7D97337DC749400B924277FAF01C40D3092F4A7DC74940D5D8EE67FBF01C40FB4E774B7DC7494083470C66FAF01C405DDE955C7EC7494048A35D76F9F01C4085C33A5B7EC74940C74BC862F9F01C400BC7D2717EC74940FA3C7F51FAF01C40B46A2D737EC74940B3DBF71CF9F01C40695088BD7FC749404FDD402EF8F01C40B2AC2DBC7FC74940C9787B21F8F01C40FAB847C97FC7494032F25F181FF11C4048ADB10480C749406CA0C0211FF11C4037892BF97FC74940EF7FFEA51EF11C40D0B9A2F87FC749404BFEA79820F11C4094B2D4E17DC749402ECD5B1521F11C40FD4571E27DC74940AA06C9D921F11C40F6DE53117DC7494042361B5D21F11C40ADFEA3107DC749405034604E23F11C4068C073017BC7494049F90DCB23F11C4096A023027BC74940A847E4EE23F11C402A4ED3E27AC749401CAE7EF2FCF01C40EC16AAA97AC7494040A4F7DDFCF01C4063562EC07AC74940	2000-01-01	\N	\N
303	15850.0	DENW05AL10002Nxb	318.0	DENW05AL10002Nxb	0	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	132.7500695195049	377333.6018877186	5713602.367932825	15850.0	0106000000010000000103000000010000000700000091F843A2EAEB1C40D14E4FC0B0C74940154CAD26D0EB1C40B8AA6B40B3C749401672BADEF0EB1C40F8408D51B5C74940250998670DEC1C407BB26791B2C7494040D2ABC9EFEB1C404E5DB5B7B0C7494044EC9CE8ECEB1C4044D6CF89B0C7494091F843A2EAEB1C40D14E4FC0B0C74940	2000-01-01	\N	\N
304	15851.0	DENW05AL10002NxB	319.0	DENW05AL10002NxB	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	103.42384603759274	377697.6460346264	5713639.621174244	15851.0	0106000000010000000103000000010000000B000000BF8C76F639F11C4010FB31D6BEC7494049D982E939F11C402DD1C229C2C74940C637CB664BF11C40A044AC28C2C74940B46833654BF11C405F352F1EC2C74940AC5BA09A5AF11C404498341DC2C749406FF9C39B5AF11C406F49E0F9C0C7494068290B6161F11C40D62E36F9C0C74940A5F3194761F11C4089EFCCEEBFC749408A4C51B05AF11C4059CA66EFBFC74940B55F39935AF11C4016E607D3BEC74940BF8C76F639F11C4010FB31D6BEC74940	2000-01-01	\N	\N
305	15867.0	DENW05AL10002NXR	320.0	DENW05AL10002NXR	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	87.22450637035945	377742.20477817976	5713662.693929219	15867.0	0106000000010000000103000000010000000900000092463175EEF11C40641AAD22C6C74940E84264FCE0F11C400CAEE822C6C74940C10F8E25E1F11C4042C23FE7C8C74940D826469BF3F11C40E9985CE4C8C74940FFF98E88F3F11C405F48E26BC9C74940157BF8F700F21C404962BA6AC9C749408FF8138500F21C4025E6C8FAC5C74940C02C1172EEF11C40B09BDBFDC5C7494092463175EEF11C40641AAD22C6C74940	2000-01-01	\N	\N
306	15872.0	DENW05AL10002NxX	321.0	DENW05AL10002NxX	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	160.93710642209044	377630.2172861438	5713665.256364909	15872.0	010600000001000000010300000001000000050000003AE41F8A68F01C4094AEE405C9C7494047B34B7368F01C40A7FF5310C6C74940978D8BEA2BF01C40B2D3BA15C6C74940B9DF91FA2BF01C408F3D480BC9C749403AE41F8A68F01C4094AEE405C9C74940	2000-01-01	\N	\N
307	15876.0	DENW05AL10002NXZ	322.0	DENW05AL10002NXZ	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	82.2917032809928	377529.8770634889	5713635.930701637	15876.0	010600000001000000010300000001000000050000002478F721DBEE1C4041364F16BCC74940494B2FFBC4EE1C401E78A232BCC7494070787126C8EE1C40D9883852C0C7494091376B41DEEE1C40AE5E8D36C0C749402478F721DBEE1C4041364F16BCC74940	2000-01-01	\N	\N
308	15879.0	DENW05AL10002NY3	323.0	DENW05AL10002NY3	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	87.89760777877382	377888.84519107285	5713658.630383548	15879.0	010600000001000000010300000001000000090000009540E36D1AF41C40BC16E93FC9C749406BDCCF5D1AF41C40094A48BEC8C7494091A1C0542DF41C4030550FBDC8C74940179D0B472DF41C407BE1D3F9C5C74940B9EECBE81EF41C40DED403FAC5C74940AB5F76E61EF41C407BC0FCDBC5C749400A20D9000DF41C401B0D4ADCC5C74940D9C64B320DF41C40EFA56F3FC9C749409540E36D1AF41C40BC16E93FC9C74940	2000-01-01	\N	\N
309	15886.0	DENW05AL10002NYF	324.0	DENW05AL10002NYF	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	94.0058114231797	377619.83191630035	5713363.933746323	15886.0	010600000001000000010300000001000000080000001E39173A2CF01C40F1783A3470C749405753FAA24BF01C40F9EAC89670C74940DE13A2EA4BF01C40ADC45E7470C749408D61DD7E51F01C40EDF60CC16DC74940ABC20BD743F01C40013DD5946DC74940C33CD05645F01C40BCB33ADB6CC7494075FD429533F01C40D19261A36CC749401E39173A2CF01C40F1783A3470C74940	2000-01-01	\N	\N
310	15891.0	DENW05AL10002NyN	326.0	DENW05AL10002NyN	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	104.14327986061107	377629.79800893273	5713588.331783819	15891.0	0106000000010000000103000000010000000B000000AE1552E73AF01C40D4BB4959B0C74940B5FE3F2635F01C40D4025D96B1C749409E296A0E5EF01C40019A49BBB2C749408F604D2569F01C408F0AA35FB0C749407FEAC2575BF01C40CCBC8BFAAFC749401C7E7DBD5DF01C40F9B8DF7DAFC749401FD1530051F01C4079EB2321AFC749408D73FB9B4EF01C40A0D6B7A2AFC749401D84719340F01C4058B7703DAFC7494042AD695C3BF01C40FCE2995CB0C74940AE1552E73AF01C40D4BB4959B0C74940	2000-01-01	\N	\N
311	15904.0	DENW05AL10002Nyz	327.0	DENW05AL10002Nyz	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	138.195977931784	377422.3132863208	5713591.460751746	15904.0	0106000000010000000103000000010000000D000000F3FC97BC28ED1C40551FA9C9AEC749409BA1939D2BED1C406CC86AC8B1C74940BB3357462CED1C40C4E373C7B1C749407042CD2A2DED1C40701627A8B2C7494015C70DC93FED1C4002B5A38FB2C74940424BC6303FED1C4046AFE9AFB1C74940FE9D6CA143ED1C401257AEA9B1C74940115842BE56ED1C40364FD78EB1C74940683E3BC057ED1C402BF1708DB1C7494063A83FD854ED1C40FEE41689AEC74940F1CAFBB954ED1C4071B50F74AEC74940C2FDBBCD28ED1C40EF07A1B1AEC74940F3FC97BC28ED1C40551FA9C9AEC74940	2000-01-01	\N	\N
312	15905.0	DENW05AL10002NyZ	328.0	DENW05AL10002NyZ	2	18	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	320.47503074513224	377751.2864422935	5713564.327030826	15905.0	01060000000100000001030000000100000014000000BE4ACB5841F21C40DA88E8A0ADC749403CF94EB73FF21C40FD1A6B3CABC749400D8F403A3FF21C40AC11F03CABC749405FEF88073DF21C400AB6BF03A8C7494058A8E57517F21C4037190F38A8C74940EC47717F17F21C40082EE241A8C7494012CF1B01F0F11C40616EF678A8C74940B96DF209F3F11C401904E2A1ABC7494004B7D33DFCF11C40EB876E94ABC74940CA1EBFB7FCF11C40D4A9E614ACC74940FE6BB2EF0AF21C40FA9B5B00ACC74940BCF968550EF21C408B7C5EB4ABC74940096A90920DF21C40870BD6E9AAC74940FB00574916F21C40B10D0EDDAAC749401F52EECA16F21C4080A80664ABC74940164E869715F21C402A24837BABC749404D709C7B16F21C406C018B6AACC7494073C7DEC910F21C40DD40D172ACC749402067502012F21C40587F58D8ADC74940BE4ACB5841F21C40DA88E8A0ADC74940	2000-01-01	\N	\N
313	15914.0	DENW05AL10002NZg	329.0	DENW05AL10002NZg	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	152.01119748922065	377644.31941720715	5713570.936955649	15914.0	01060000000100000001030000000100000006000000919C175B6AF01C405B80168DAAC74940FA70A20F6DF01C40A21A8983ADC749404713AA506EF01C407AB4B981ADC749406D3BDCE6A5F01C40CF022934ADC7494085793334A3F01C4014ACCA3DAAC74940919C175B6AF01C405B80168DAAC74940	2000-01-01	\N	\N
314	15923.0	DENW05AL10002NZt	330.0	DENW05AL10002NZt	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	189.9319997744169	377291.0872898675	5713430.096407021	15923.0	01060000000100000001030000000100000007000000B343D7397BEB1C405190A1297EC749408E9428AC49EB1C409F43FC7A7DC749403CE6915440EB1C40AB760F9981C7494051D9059271EB1C406A85674782C74940E24BC25372EB1C409F062F4A82C749406D62934075EB1C40C597DBEE80C74940B343D7397BEB1C405190A1297EC74940	2000-01-01	\N	\N
315	15925.0	DENW05AL10002NZV	331.0	DENW05AL10002NZV	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	88.40597928898569	377822.9373796376	5713660.256907059	15925.0	010600000001000000010300000001000000090000005F8A682F21F31C4008246A49C9C7494064023C2B21F31C40458CCFC3C8C749405E11A4F133F31C40489EDCBFC8C74940696AAD0634F31C40D1CB1CF7C5C7494028AFB48C25F31C40D2DF47F9C5C74940F560668A25F31C40C77E2DDBC5C749404ACB4EC313F31C406F32F7DCC5C749407BB30D1014F31C4075FC8D4BC9C749405F8A682F21F31C4008246A49C9C74940	2000-01-01	\N	\N
316	16028.0	DENW05AL10002rca	370.0	DENW05AL10002rca	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	20.171022695372812	377322.3289308462	5713373.05292986	16028.0	0106000000010000000103000000010000000600000082D9A67CCFEB1C406CF5FDDC6FC7494047800B3AE0EB1C4034E2BF1070C749408661F368E0EB1C400F4787F96FC749409CC26DDEE2EB1C40389D34C16EC7494037A6C128D2EB1C4030BD898D6EC7494082D9A67CCFEB1C406CF5FDDC6FC74940	2000-01-01	\N	\N
317	16033.0	DENW05AL10002rcD	373.0	DENW05AL10002rcD	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	28.29728871677071	377310.6553296018	5713390.220588421	16033.0	010600000001000000010300000001000000050000005B4AB9BC9BEB1C4063C2049C74C7494028B879EFB8EB1C403E18CA0075C7494009678A35BBEB1C4083EA0DF473C7494035B302189EEB1C40DEC68C8F73C749405B4AB9BC9BEB1C4063C2049C74C74940	2000-01-01	\N	\N
318	16075.0	DENW05AL10002rd3	389.0	DENW05AL10002rd3	0	2	Gemischt genutztes Gebäude mit Wohnen ist ein Gebäude, in dem sowohl gewohnt wird, als auch Teile des Gebäudes zum Anbieten von Dienstleistungen, zur Durchführung von öffentlichen oder privaten Verwaltungsarbeiten, zur gewerblichen oder industrielle	Gemischt genutztes Gebäude mit Wohnen	0	1100	22.2092990167439	377275.5649642974	5713176.570983773	16075.0	0106000000010000000103000000010000000500000007AAB16E2DEB1C400658B92435C7494021CDF3F636EB1C40F521A61236C749403BF3C66447EB1C4019140C1535C749401ED69EDB3DEB1C4078F6E42634C7494007AAB16E2DEB1C400658B92435C74940	2000-01-01	\N	\N
319	16097.0	DENW05AL10002rdk	397.0	DENW05AL10002rdk	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	75.0691221569432	377331.42655931815	5713373.491620632	16097.0	0106000000010000000103000000010000000D0000007628FC090EEC1C40D350A6A76EC7494042C2262207EC1C405BC1D5916EC74940BEFFD66502EC1C40954BE0826EC7494059A243E001EC1C4077CF40C46EC749402071A5B7F1EB1C40E7F587916EC7494099DBD597E3EB1C408FDB38656EC749409CC26DDEE2EB1C40389D34C16EC749408661F368E0EB1C400F4787F96FC7494042C061AB15EC1C40C68FBBA170C74940675C201216EC1C404DC5756F70C74940A7EDCAE017EC1C40B128378C6FC74940A9070A810CEC1C40503A8D686FC749407628FC090EEC1C40D350A6A76EC74940	2000-01-01	\N	\N
320	16105.0	DENW05AL10002rdp	402.0	DENW05AL10002rdp	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	208.55000997707248	378487.2568008909	5713779.051062556	16105.0	01060000000100000001030000000100000007000000818E811CC3FC1C4035AEF734F1C74940B6198066E2FC1C4063E44E9FF2C74940F18CDB64EAFC1C40CCBEF18BF1C74940663B4676FCFC1C4068AA601FEFC7494040785D9A0BFD1C408983E910EDC7494073E67469ECFC1C4052E1EBA6EBC74940818E811CC3FC1C4035AEF734F1C74940	2000-01-01	\N	\N
321	16142.0	DENW05AL10002reH	413.0	DENW05AL10002reH	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	9.28749631937717	377946.63276880776	5713657.684974937	16142.0	01060000000100000001030000000100000007000000D2149D88F9F41C408BAB4FC2C6C74940F000D989F9F41C4023CA4FEDC6C749407A954702F3F41C400B2584E8C6C7494096FDC014F3F41C405CB5BE3DC8C749400BE643A3FAF41C40500FDD43C8C74940403C09ACFAF41C40C07254C2C6C74940D2149D88F9F41C408BAB4FC2C6C74940	2000-01-01	\N	\N
322	16232.0	DENW05AL10002rgn	444.0	DENW05AL10002rgn	0	4	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	90.23820144461932	378598.39252607437	5713807.558294793	16232.0	01060000000100000001030000000100000006000000D94E556384FE1C40460D255CF6C749403329B89170FE1C405EEF0EE2F8C74940A4744D618DFE1C40EB484747FAC749400A0BFC3EA1FE1C40D0C9E0BFF7C74940CDF1D4D584FE1C40818CA361F6C74940D94E556384FE1C40460D255CF6C74940	2000-01-01	\N	\N
323	16346.0	DENW05AL10002rj8	483.0	DENW05AL10002rj8	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	154.461922859773	377575.5671438966	5713776.848125659	16346.0	0106000000010000000103000000010000000A0000007CE7FC5079EF1C405FDB318EEAC749405F427A8B7EEF1C404E09751FE9C74940DDC3A80985EF1C40FA19A542E9C74940521E74A687EF1C40F37F298BE8C749409468418C8AEF1C408CE7ACBFE7C749404C1B481084EF1C4092677E98E7C749405AE81D0E89EF1C406712C12BE6C7494022BA413367EF1C4074ED3E6EE5C74940F1AA753857EF1C4015C004D9E9C749407CE7FC5079EF1C405FDB318EEAC74940	2000-01-01	\N	\N
324	16348.0	DENW05AL10002rja	485.0	DENW05AL10002rja	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	61.860482608899474	377482.48887930554	5713642.828977691	16348.0	010600000001000000010300000001000000060000002DDD840A2CEE1C403F85F295BEC74940341F33632AEE1C40D24C03A0BEC74940886FA4B808EE1C40A492F56CBFC749409AC5E7C60FEE1C40D6ECE035C1C74940E0976EFE32EE1C409B37925FC0C749402DDD840A2CEE1C403F85F295BEC74940	2000-01-01	\N	\N
325	16356.0	DENW05AL10002rjG	488.0	DENW05AL10002rjG	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	20.918129204699653	377805.35712298274	5713630.581411802	16356.0	01060000000100000001030000000100000007000000CECAB830D9F21C4068BAFCFDBDC749400F529E5DD9F21C409DC3EEA8BEC749407D5DA250DAF21C4078BEEFA8BEC749408A556E55DAF21C40B114C432BFC74940BB7E7A1FEDF21C408BD59832BFC7494056752EEBECF21C408F29D6FCBDC74940CECAB830D9F21C4068BAFCFDBDC74940	2000-01-01	\N	\N
326	16419.0	DENW05AL10002rkP	515.0	DENW05AL10002rkP	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	157.53018636419438	377249.8799192279	5713146.9567619115	16419.0	0106000000010000000103000000010000000A000000DA0EEEF2E9EA1C40548994022EC7494094794698EEEA1C40E7B34CD52DC749407319005FE0EA1C403DF642A52BC7494091C06B3D04EB1C40521D23352BC74940FFF0CE3E02EB1C40C6A6CBFB29C74940D2E4CCD5D8EA1C4098138E7C2AC74940CF139995BAEA1C40ED6D5D9C2BC7494000C98006D0EA1C408C3237FF2EC74940AEC205DFD0EA1C40D0F3F2F62EC74940DA0EEEF2E9EA1C40548994022EC74940	2000-01-01	\N	\N
327	16431.0	DENW05AL10002rkW	517.0	DENW05AL10002rkW	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	137.17559456522577	377256.0073469095	5713163.464841027	16431.0	01060000000100000001030000000100000007000000997D2C44D6EA1C40E11339D52FC74940714C8B72D5EA1C401F1820DD2FC7494005FF9AF1ECEA1C405BC6049C33C749401B4A89F10DEB1C4045654E5A32C74940CA8C8F7DF6EA1C4097E62FA02EC749402AABBE66EFEA1C40019C85E32EC74940997D2C44D6EA1C40E11339D52FC74940	2000-01-01	\N	\N
328	16439.0	DENW05AL10002rl3	518.0	DENW05AL10002rl3	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	70.0502841527923	377312.5346212145	5713371.8536171755	16439.0	0106000000010000000103000000010000000A00000037A6C128D2EB1C4030BD898D6EC74940A72CF462D2EB1C408E1722716EC749400B385DC1BFEB1C406D1F8F376EC749407921187BB5EB1C40EED2D1176EC7494018E688D0B4EB1C409C86836C6EC74940C2E4BB409CEB1C40FA3DC3206EC74940C46A615B94EB1C40ECC8FD166EC74940C8A0F04592EB1C407838E51F6FC7494082D9A67CCFEB1C406CF5FDDC6FC7494037A6C128D2EB1C4030BD898D6EC74940	2000-01-01	\N	\N
329	16606.0	DENW05AL10002rMz	570.0	DENW05AL10002rMz	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	223.63327920250595	377356.2788811407	5713536.414647382	16606.0	01060000000100000001030000000100000005000000C20AE5B46FEC1C40F8AA1CDF9DC749403888DC0423EC1C40659C8D379EC74940D4DB203525EC1C4077319C6FA1C74940F8EB431B72EC1C40FEB6E81DA1C74940C20AE5B46FEC1C40F8AA1CDF9DC74940	2000-01-01	\N	\N
330	16699.0	DENW05AL10002rnZ	604.0	DENW05AL10002rnZ	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	40.94831516779959	377398.6480542648	5713638.22669405	16699.0	01060000000100000001030000000100000007000000F939D47ECFEC1C40B97521CABEC74940B2D4E808DBEC1C4028C0E484BFC74940E29782F3E0EC1C407CF615EEBEC749404118DFD8E7EC1C409F2B543EBEC7494049322149F3EC1C40A985DB1ABDC74940862201CCE7EC1C403C92E95EBCC74940F939D47ECFEC1C40B97521CABEC74940	2000-01-01	\N	\N
331	16732.0	DENW05AL10002roF	614.0	DENW05AL10002roF	1	12	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	217.18810094561195	377239.0360301803	5713123.102808109	16732.0	010600000001000000010300000001000000110000007C7B458F96EA1C40EBAE77AE22C749402475436AA1EA1C4091C8F4C527C749407C453F9CBBEA1C40330EB76B27C749405AAFA507DCEA1C40A42FE3FB26C749403DBD8EF2D8EA1C40D8A4D8CA25C749401B5728AED9EA1C40C2B968C825C7494061EDCC70D7EA1C40CA94B6C924C749407E6135EEC4EA1C40300C230425C74940F01CFFFFC4EA1C40B547510C25C74940F52E17EDB6EA1C409D4E0A3D25C749405AC9A2ABB4EA1C4081FCC70024C74940430D88F7C5EA1C409F1726C623C74940D49BD24AC2EA1C406695D90A22C74940BCC0C850B0EA1C40C41D3F4822C749405C07F371B0EA1C404FE0045722C7494022AA7A88A7EA1C40EBE71C7522C749407C7B458F96EA1C40EBAE77AE22C74940	2000-01-01	\N	\N
332	16816.0	DENW05AL10002rPA	632.0	DENW05AL10002rPA	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	12.642853394150734	377596.29217655445	5713731.916633281	16816.0	01060000000100000001030000000100000005000000D3C196C0C2EF1C4037D21110DAC749406D8A27D1BCEF1C4061B108A4DBC74940BACE9323C5EF1C40FF0BC2D1DBC749403BF47BF3CAEF1C40C6738B3FDAC74940D3C196C0C2EF1C4037D21110DAC74940	2000-01-01	\N	\N
333	16847.0	DENW05AL10002rpm	645.0	DENW05AL10002rpm	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	68.26441438309848	377268.667959694	5713590.705898256	16847.0	01060000000100000001030000000100000007000000882042CBF8EA1C40D3A3BB7DAEC749402B52B666F2EA1C4074CECE14AEC749408E7A077DE2EA1C40A2989892AFC74940160EEF45F6EA1C40F9D495D5B0C749407CE924C512EB1C40506ADAFFADC74940FD74C7F105EB1C4026812136ADC74940882042CBF8EA1C40D3A3BB7DAEC74940	2000-01-01	\N	\N
334	16866.0	DENW05AL10002rps	652.0	DENW05AL10002rps	0	14	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	280.0611823005602	377492.58491711895	5713692.81872802	16866.0	0106000000010000000103000000010000000E0000004EDB368840EE1C40B361EFE2D0C749402E146E1F5BEE1C4049687C5ACEC74940DBF17B4A5CEE1C40BC2D9B6DCEC74940AD58B8A562EE1C40BEB48ED2CDC749400BC9AC7961EE1C4033C582BFCDC749400CA368596FEE1C40E8683B6DCCC74940CA570B4E52EE1C40BC545791CAC7494098EE61450FEE1C40A76B6EF5D0C749407804A6D320EE1C4078F4D10ED2C74940C4A718892CEE1C40A5857DCAD2C74940229429EE39EE1C404A1FD383D1C7494064DF030A3BEE1C4095D60296D1C74940EE6525A341EE1C406507F8F4D0C749404EDB368840EE1C40B361EFE2D0C74940	2000-01-01	\N	\N
335	16870.0	DENW05AL10002rpT	653.0	DENW05AL10002rpT	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	70.3053845425602	377634.1671053362	5713475.803848963	16870.0	0106000000010000000103000000010000000C00000056FE91947DF01C406CB303C490C7494076089F3F7DF01C40339AB35290C74940B5352D057CF01C403DDE1FAC8EC74940851B1BAB5BF01C40E4B2C4CF8EC7494012C1293556F01C40AE18BDD58EC749406C6CD67457F01C40165726B090C749400E63021866F01C404DED73A290C749401D8F818466F01C405701C11291C749407986135D6CF01C404A01320D91C74940C40DA97C6CF01C4012B53FF290C74940021A19CD70F01C407B7885E690C7494056FE91947DF01C406CB303C490C74940	2000-01-01	\N	\N
336	16899.0	DENW05AL10002rq8	662.0	DENW05AL10002rq8	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	58.09441247978248	377300.90059176774	5713441.877471198	16899.0	01060000000100000001030000000100000009000000E24BC25372EB1C409F062F4A82C7494051D9059271EB1C406A85674782C749402C66B3966EEB1C40BC78169383C74940A078E0BA78EB1C401870714F84C7494043D0C28085EB1C404451BE7984C749403B20648290EB1C404542369E84C74940C584411E95EB1C408ECC7EC582C749403BD647B482EB1C40D8AE1A8482C74940E24BC25372EB1C409F062F4A82C74940	2000-01-01	\N	\N
337	16911.0	DENW05AL10002rQC	668.0	DENW05AL10002rQC	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	211.3886035371106	377296.5820774429	5713394.646087848	16911.0	0106000000010000000103000000010000000E000000D3F5431B59EB1C402AAC972F77C74940A4B9C5A860EB1C402D07FCE377C74940B4C9229587EB1C40498E8B5078C74940F6A68DE78BEB1C40B6FDACA975C74940860D2D4D7EEB1C4061B71A8475C749408C0CEFBA7FEB1C4000AB2CBA74C749406466B60088EB1C406EE4353F74C74940A18B5D898AEB1C404334CC8374C749401A32546F9BEB1C40BCCE1EBE74C749405B4AB9BC9BEB1C4063C2049C74C7494035B302189EEB1C40DEC68C8F73C7494083825B6C8EEB1C4003E1705973C749400D7DD3EA62EB1C405342BEC372C74940D3F5431B59EB1C402AAC972F77C74940	2000-01-01	\N	\N
338	17024.0	DENW05AL10002rrH	699.0	DENW05AL10002rrH	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	161.13809859065805	377347.438051474	5713354.759888617	17024.0	0106000000010000000103000000010000000E00000016579E701FEC1C40223847826CC74940D1B6D4762CEC1C4009BC09AB6CC74940054DD7CB2EEC1C40F96659B26CC74940D0EC99FA2FEC1C4033CA8E1D6CC74940C2A0C5832BEC1C409EAD608C6BC74940E0EEF25F4EEC1C40E1D4E4F66BC7494074B1234855EC1C404C96B77368C749402F9D1EB646EC1C40FE5C584768C74940D0A0431347EC1C4046C5EB1768C749408B0B2EF138EC1C40A88FBDEC67C74940D9EC029438EC1C40DD733D1C68C7494079257F7728EC1C40A53720EB67C7494017A4658F21EC1C40FBDEEC6D6BC7494016579E701FEC1C40223847826CC74940	2000-01-01	\N	\N
339	17147.0	DENW05AL10002rSq	732.0	DENW05AL10002rSq	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	167.2027113554068	377304.0613146141	5713349.497984497	17147.0	0106000000010000000103000000010000000C00000011E7629877EB1C4061F44A7169C749404E89EAD29CEB1C40391A20E469C749407C5AFEF5ACEB1C4098E8EE156AC74940196E5CFCB9EB1C4094B72A3E6AC749401C061F2ABDEB1C408DF662AA68C74940EA5E0A6FB0EB1C404F00E68268C74940BAA4D982A5EB1C409104436168C74940FFE7B5F3A6EB1C4006E55DA967C7494016E88673A1EB1C4093964D9867C749400A84A807A4EB1C40B8A47A5166C74940E7D9967F7FEB1C40E532CBE065C7494011E7629877EB1C4061F44A7169C74940	2000-01-01	\N	\N
340	17185.0	DENW05AL10002rt7	747.0	DENW05AL10002rt7	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	154.04799238219857	377570.9050125641	5713795.038679405	17185.0	010600000001000000010300000001000000090000009D5A6FA570EF1C4020B658EDECC74940B0D9DBAE75EF1C4080879C7DEBC749405814E4EB53EF1C40F13B25C4EAC74940E9B1E5E843EF1C405002E826EFC749404DECDCA665EF1C406086F7E0EFC74940441D69216BEF1C4075F30178EEC74940DC9BDAB571EF1C40CCC53C9BEEC74940DF1E705F77EF1C40EFE05714EDC749409D5A6FA570EF1C4020B658EDECC74940	2000-01-01	\N	\N
341	17343.0	DENW05AL10002rUU	789.0	DENW05AL10002rUU	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	188.84556580288336	377288.8491010879	5713154.377640567	17343.0	0106000000010000000103000000010000000900000030692AD661EB1C40CEB20FE92BC74940F99FA31662EB1C403D8050EA2BC74940093CD85F52EB1C40F00244B730C7494096AEF5FC7AEB1C4050FEC47F31C74940D990A82187EB1C4008238CC22DC74940FB7D1F6387EB1C40811ABAC32DC749406D6CFCFB8AEB1C4033FE39A12CC74940E56FF70C62EB1C40F99496D72BC7494030692AD661EB1C40CEB20FE92BC74940	2000-01-01	\N	\N
342	17472.0	DENW05AL10002rw7	820.0	DENW05AL10002rw7	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	238.89191599492915	377313.99777440977	5713400.427750912	17472.0	0106000000010000000103000000010000000D00000003461430C9EB1C4073CE68F275C74940FFFFA21BC0EB1C4062C634D975C7494043F4D9879CEB1C40538EC97675C74940D9330ADC9BEB1C408A02BDD575C74940F6A68DE78BEB1C40B6FDACA975C74940B4C9229587EB1C40498E8B5078C749404F637F0CB4EB1C402D7679C778C74940E2EFAF7EBAEB1C40EE50B1D878C7494089B65995C3EB1C40DEB1FEF078C74940844FD0C3C6EB1C407ED28BF978C749406E878A3AE0EB1C404DA5953D79C749409D4018A5E5EB1C40656E524176C7494003461430C9EB1C4073CE68F275C74940	2000-01-01	\N	\N
343	17679.0	DENW05AL10002rYC	879.0	DENW05AL10002rYC	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	150.8987716771662	377279.70274115383	5713279.616563963	17679.0	010600000001000000010300000001000000050000001DB9144754EB1C40C5802A6C51C749403014A36128EB1C4051BDA2C151C74940B9363B1B2DEB1C40FB5EAD8F55C74940EEEC34C558EB1C40C8D1823855C749401DB9144754EB1C40C5802A6C51C74940	2000-01-01	\N	\N
344	17692.0	DENW05AL10002ryI	882.0	DENW05AL10002ryI	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	36.05865279817954	377338.303362853	5713368.096424347	17692.0	01060000000100000001030000000100000008000000A9070A810CEC1C40503A8D686FC74940A7EDCAE017EC1C40B128378C6FC74940C3FD336D19EC1C40124D09916FC749406652018319EC1C40FA5810866FC7494016579E701FEC1C40223847826CC749401EE385B812EC1C40A9C97E5A6CC749407628FC090EEC1C40D350A6A76EC74940A9070A810CEC1C40503A8D686FC74940	2000-01-01	\N	\N
345	17707.0	DENW05AL10002ryM	889.0	DENW05AL10002ryM	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	162.9691351610236	377298.16527021135	5713379.50563113	17707.0	01060000000100000001030000000100000007000000334425EF8FEB1C407B0B89AF72C74940E3B736E895EB1C408D8B401070C74940460E4EAE97EB1C40432AAD486FC7494029FE37CF6BEB1C401B3783C16EC749400D7DD3EA62EB1C405342BEC372C7494083825B6C8EEB1C4003E1705973C74940334425EF8FEB1C407B0B89AF72C74940	2000-01-01	\N	\N
346	17832.0	DENW05AL10002rzZ	926.0	DENW05AL10002rzZ	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	165.10772941622417	377344.2846157212	5713401.954815085	17832.0	010600000001000000010300000001000000130000006DC6A84634EC1C40F5BB491E7AC74940CCB166B240EC1C40FBB8833F7AC749401D5588C745EC1C4053E5D4AD77C74940D4E4EFDF46EC1C4092968F1F77C74940E256203E3AEC1C408732C3FA76C74940134B4FF92CEC1C40073EFFD376C74940F6F0DDDC2AEC1C40FAD738FD76C7494048F63B812AEC1C4000C5012E77C749408BF39E5E24EC1C40D6652F1C77C749408718134120EC1C404DBA3CA376C749403B2F11B626EC1C40555EC64A76C749405B2E6F6429EC1C40381EBFED74C74940F950CB1D27EC1C407740EAE674C7494018CD928E27EC1C4009C744AD74C749402295A91825EC1C40293AE5A574C74940B74E50461AEC1C40A77C238574C749400BF2580919EC1C407D945E2575C74940E88854FE0FEC1C4020A644BD79C749406DC6A84634EC1C40F5BB491E7AC74940	2000-01-01	\N	\N
347	17846.0	DENW05AL10002s0d	931.0	DENW05AL10002s0d	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	148.39720804989338	377359.49425189913	5713406.110577819	17846.0	010600000001000000010300000001000000090000001D5588C745EC1C4053E5D4AD77C74940CCB166B240EC1C40FBB8833F7AC74940B85C54977FEC1C40F2538CF27AC7494020000E5584EC1C4031716B5B78C74940366B7CC379EC1C405DA1073E78C749406BC15CB76EEC1C401D4A5A1F78C749405C31D8155CEC1C40086FAAEB77C749405D1D73F550EC1C409499CCCC77C749401D5588C745EC1C4053E5D4AD77C74940	2000-01-01	\N	\N
348	17869.0	DENW05AL10002s0T	938.0	DENW05AL10002s0T	0	6	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	140.34682408359367	377243.5044074604	5713135.270660329	17869.0	0106000000010000000103000000010000000C0000007C453F9CBBEA1C40330EB76B27C749402475436AA1EA1C4091C8F4C527C74940B03D593BB2EA1C402DC855542AC74940A95066EAC7EA1C40CFCE0E2F2AC74940804AE154E3EA1C40FC50FDFD29C74940D9BF1730E1EA1C4072DA061729C74940D679E655DFEA1C408FD00E4F28C749406AFE9CD1DEEA1C40B044125128C74940B63012F7DBEA1C4054DC002B27C74940FAA55B7BDCEA1C404168FD2827C749405AAFA507DCEA1C40A42FE3FB26C749407C453F9CBBEA1C40330EB76B27C74940	2000-01-01	\N	\N
349	17876.0	DENW05AL10002s0X	941.0	DENW05AL10002s0X	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	30.650941852480173	377306.0496528076	5713624.585316942	17876.0	010600000001000000010300000001000000050000001891085573EB1C40A7D708D8B8C74940FD879CF48DEB1C40CB37427BBAC7494042813A0296EB1C407768B7B2B9C74940141C27477BEB1C408456A10DB8C749401891085573EB1C40A7D708D8B8C74940	2000-01-01	\N	\N
350	17930.0	DENW05AL10002s25	963.0	DENW05AL10002s25	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	179.02963865594938	377244.11323411687	5713534.378816572	17930.0	0106000000010000000103000000010000000A0000004826D579A7EA1C402EDDFE8C9BC7494001CDD4EA96EA1C407EE08D499BC74940CD49428C93EA1C400F41A2969CC74940E26586BE92EA1C40D56B0EE69CC7494073C1E83C81EA1C40FA6DD2969EC74940BD0B5C1EA9EA1C404869851BA1C74940F37A8A1DB4EA1C40075888CEA0C7494081831C40BEEA1C40B2F04BD49CC749409C99B01FA5EA1C4007DD33709CC749404826D579A7EA1C402EDDFE8C9BC74940	2000-01-01	\N	\N
351	17948.0	DENW05AL10002s2K	970.0	DENW05AL10002s2K	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	26.947229847079143	377439.5232865217	5713595.559667771	17948.0	01060000000100000001030000000100000009000000B7AC6C5580ED1C4076E13F02B2C74940B977C5B391ED1C40A9FBA9E1B1C7494087C1281D91ED1C40E58B722EB1C74940FD3990C279ED1C40C91FE650B1C749400C18A24C79ED1C403732A7BDB0C74940A87F744273ED1C4096FCF5C6B0C74940C9DBD5BA74ED1C408613C782B2C74940F29F0F9580ED1C40AA3B8A76B2C74940B7AC6C5580ED1C4076E13F02B2C74940	2000-01-01	\N	\N
352	17959.0	DENW05AL10002s2r	975.0	DENW05AL10002s2r	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	120.80108355684206	377280.6689074843	5713297.658160089	17959.0	010600000001000000010300000001000000070000002D5438813CEB1C4096B73F785AC749407612F1E652EB1C4071E13EB85AC749403311F83A59EB1C403B96C65457C74940DE45D4B458EB1C408725645357C74940CDB3385A32EB1C40032DD2E556C749401EAD42042CEB1C40C92936495AC749402D5438813CEB1C4096B73F785AC74940	2000-01-01	\N	\N
353	17966.0	DENW05AL10002s2w	979.0	DENW05AL10002s2w	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	145.90892338007689	377246.364409036	5713264.359704257	17966.0	0106000000010000000103000000010000000500000025A2FF34A3EA1C40FDA470E64DC7494048D51D7BCAEA1C4024512D6751C74940FBBFD1DEE4EA1C4001D9A8994FC74940B3F4B966BDEA1C40467EF51D4CC7494025A2FF34A3EA1C40FDA470E64DC74940	2000-01-01	\N	\N
355	18119.0	DENW05AL10002s65	1027.0	DENW05AL10002s65	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	32.15810805931687	377288.47674166487	5713508.785340181	18119.0	01060000000100000001030000000100000008000000C1F4D30D3CEB1C4097A8A11D97C7494065FB8CE742EB1C4057DE613597C74940F71FD72D42EB1C40A4692D8F97C74940BA084DDE59EB1C40E22F9ADD97C7494006A30FA85CEB1C40D97561A896C749401739276A3FEB1C40ADB9B74496C74940759380023EEB1C40A83EF73F96C74940C1F4D30D3CEB1C4097A8A11D97C74940	2000-01-01	\N	\N
356	18127.0	DENW05AL10002s6D	1032.0	DENW05AL10002s6D	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	151.7540750466287	377466.75577758695	5713661.879938378	18127.0	01060000000100000001030000000100000005000000C70649BDBFED1C402407BCA4C4C74940D3606BF2CAED1C4050858777C7C74940BB759E8201EE1C403B849D26C6C74940A2D0388EF6ED1C40F7552B54C3C74940C70649BDBFED1C402407BCA4C4C74940	2000-01-01	\N	\N
357	18128.0	DENW05AL10002s6E	1033.0	DENW05AL10002s6E	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	92.86836804146878	377392.46695080027	5713632.182879148	18128.0	010600000001000000010300000001000000080000007AA87184B0EC1C400956E0F2BCC74940FFB32DEAB7EC1C403F4D8F69BDC749405685DB9FB8EC1C4031D3F257BDC749408A2A66A1C6EC1C40519E993ABEC749400C52DB79E4EC1C40300A655FBBC7494032430193CEEC1C408E2E1BFFB9C749404765A765B4EC1C407FD8968FBCC749407AA87184B0EC1C400956E0F2BCC74940	2000-01-01	\N	\N
358	18149.0	DENW05AL10002s6R	1039.0	DENW05AL10002s6R	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	5.075881902128458	377400.18456606276	5713640.8957360545	18149.0	010600000001000000010300000001000000050000004118DFD8E7EC1C409F2B543EBEC74940E29782F3E0EC1C407CF615EEBEC74940A6EA0E16E6EC1C406254E73CBFC749401CEC72F6ECEC1C40DDC4AE90BEC749404118DFD8E7EC1C409F2B543EBEC74940	2000-01-01	\N	\N
359	18184.0	DENW05AL10002s7M	1049.0	DENW05AL10002s7M	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	154.47919528535567	377332.6480442935	5713401.209745611	18184.0	0106000000010000000103000000010000000F000000C4B50A5A0CEC1C40799E728F76C74940CCFA33AC07EC1C40FEAD54C876C749409782B6A200EC1C4006D5DDB476C74940AC527F0DFFEB1C4041CDA23376C74940FEBCA989F0EB1C40A6EA5C0B76C7494080A71AF4EFEB1C4040BBE85D76C749409D4018A5E5EB1C40656E524176C749406E878A3AE0EB1C404DA5953D79C749404BF3E7F703EC1C407123239D79C74940E88854FE0FEC1C4020A644BD79C749400BF2580919EC1C407D945E2575C749403CFAF50B0DEC1C40CD531B0175C74940BC82FC7C0AEC1C40B56A62F974C74940DE14B66108EC1C40CD57C80B76C74940C4B50A5A0CEC1C40799E728F76C74940	2000-01-01	\N	\N
360	18257.0	DENW05AL10002s99	1077.0	DENW05AL10002s99	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	148.9014997556806	377300.1031694466	5713365.467525998	18257.0	0106000000010000000103000000010000000800000072CF08036CEB1C40020D13AA6EC74940C8A0F04592EB1C407838E51F6FC74940C46A615B94EB1C40ECC8FD166EC749407D87644696EB1C4072035B236DC7494071D5AE989FEB1C4048B6FE3F6DC7494097552E4BA3EB1C40FA83756A6BC749403981E67874EB1C40CF4F2DDA6AC7494072CF08036CEB1C40020D13AA6EC74940	2000-01-01	\N	\N
361	18258.0	DENW05AL10002s9A	1078.0	DENW05AL10002s9A	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	167.2560665338533	377568.1569210155	5713527.086707742	18258.0	01060000000100000001030000000100000008000000AC5FD5DA78EF1C40F547D2339BC74940EB8E52235FEF1C408AE1F9559BC74940D5D3176A5BEF1C40B824FD5D9BC74940A0021DAF5BEF1C409B9446C79BC74940B3B13D815FEF1C406E9B6F9EA1C74940179699317DEF1C40ACB6A57EA1C74940D5615D057CEF1C404C3FB0C99FC74940AC5FD5DA78EF1C40F547D2339BC74940	2000-01-01	\N	\N
362	18295.0	DENW05AL10002s9y	1090.0	DENW05AL10002s9y	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	40.23228112026118	377411.51248093136	5713561.807697471	18295.0	01060000000100000001030000000100000007000000A6AAF8220EED1C403A8CB465A6C749404E67E1ED0FED1C400704EAA9A8C74940DB7A475627ED1C40E0CAAD89A8C74940327516A026ED1C40DAC125EBA7C74940BF998BD321ED1C40046E21F1A7C749402763FF1220ED1C4086BFAD46A6C74940A6AAF8220EED1C403A8CB465A6C74940	2000-01-01	\N	\N
363	18340.0	DENW05AL10002sAt	1102.0	DENW05AL10002sAt	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	39.93750651460141	377309.2743944107	5713386.496152376	18340.0	01060000000100000001030000000100000007000000334425EF8FEB1C407B0B89AF72C7494083825B6C8EEB1C4003E1705973C7494035B302189EEB1C40DEC68C8F73C7494009678A35BBEB1C4083EA0DF473C74940B2EE9660BDEB1C4061277DF372C749405601AE519AEB1C40A1FC897A72C74940334425EF8FEB1C407B0B89AF72C74940	2000-01-01	\N	\N
364	18351.0	DENW05AL10002sB0	1108.0	DENW05AL10002sB0	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	20.505048551036452	377810.39833155397	5713630.472095718	18351.0	0106000000010000000103000000010000000600000056752EEBECF21C408F29D6FCBDC74940BB7E7A1FEDF21C408BD59832BFC749407BC9E7DEFFF21C406D135532BFC74940F59BA0D9FFF21C40BEF7EAA6BEC74940376312E1FFF21C4077DAC4FBBDC7494056752EEBECF21C408F29D6FCBDC74940	2000-01-01	\N	\N
365	18386.0	DENW05AL10002sBQ	1118.0	DENW05AL10002sBQ	0	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	145.67354294878896	377336.04885648564	5713352.5766699435	18386.0	0106000000010000000103000000010000000A00000058F520251AEC1C40D7578DBF67C7494034FF55831AEC1C407505D48F67C74940BDEA028E0BEC1C407BF7226267C749401E6BE9300BEC1C40F7F3689167C7494004948E21FCEB1C4009075E6367C74940C2755639F5EB1C4001CB77E66AC749408711E14309EC1C406ADCA9236BC7494017A4658F21EC1C40FBDEEC6D6BC7494079257F7728EC1C40A53720EB67C7494058F520251AEC1C40D7578DBF67C74940	2000-01-01	\N	\N
366	18450.0	DENW05AL10002sCZ	1138.0	DENW05AL10002sCZ	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	4.849361130967736	377468.18750733085	5713266.598828327	18450.0	01060000000100000001030000000100000005000000DC4814D804EE1C405E95914451C74940640B2E550AEE1C40EF43BC7E51C7494078942B8D0FEE1C4066622DBA50C7494034F60B100AEE1C40A202168050C74940DC4814D804EE1C405E95914451C74940	2000-01-01	\N	\N
367	18480.0	DENW05AL10002sDn	1148.0	DENW05AL10002sDn	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	11.555856358259916	377385.24160459975	5713637.741909845	18480.0	0106000000010000000103000000010000000500000002F6CBA8A5EC1C40F2AEF0FEBDC74940B3992DFCACEC1C4035469B78BEC74940FFB32DEAB7EC1C403F4D8F69BDC749407AA87184B0EC1C400956E0F2BCC7494002F6CBA8A5EC1C40F2AEF0FEBDC74940	2000-01-01	\N	\N
368	18623.0	DENW05AL10002sGL	1185.0	DENW05AL10002sGL	1	8	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	125.84065164881758	377413.8817397338	5713844.927184603	18623.0	0106000000010000000103000000010000000F00000079D3E0A017ED1C40CEFEB898F9C74940B268418818ED1C40ED34E331F9C74940EB5876A512ED1C4056CAE21FF9C74940E1A813DA11ED1C409F030087F9C74940FDED735110ED1C406D6E5682F9C7494083E3AC57E5EC1C40F18D7DFEF8C7494006F0BD9CE2EC1C400B91303CFAC749408987909FF0EC1C40B3B46B69FAC74940C8EB075A05ED1C40804E4CACFAC749402A62879C00ED1C408DAB7D0DFDC749404F0702D21BED1C400A47C061FDC749403B2A6FAE20ED1C4003F6F306FBC749408F5C9B011AED1C40944DE4F3FAC7494030457D911CED1C40613E01A8F9C7494079D3E0A017ED1C40CEFEB898F9C74940	2000-01-01	\N	\N
369	18645.0	DENW05AL10002sGZ	1190.0	DENW05AL10002sGZ	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	64.19977427809499	377325.32774250535	5713352.386283857	18645.0	01060000000100000001030000000100000008000000654A4E11F3EB1C403F33541767C74940C88E4996E3EB1C404DDDD1E666C749406F30B92AE0EB1C40447D037768C7494008C75F0ADAEB1C401997DC436BC74940F248DCBFD9EB1C4085580B666BC749409185D142E9EB1C405D0FF7956BC749407FBE7A87E9EB1C40FC19EC736BC74940654A4E11F3EB1C403F33541767C74940	2000-01-01	\N	\N
370	18655.0	DENW05AL10002sHB	1193.0	DENW05AL10002sHB	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	115.52044569171267	377269.0272597861	5713252.809976473	18655.0	010600000001000000010300000001000000080000001745E3AD21EB1C40BF51B84C49C7494044169DE316EB1C401BF1EEAA49C74940B9B586610EEB1C40FB6E20F549C749409945F93A0EEB1C40EE1757EE49C74940219BBF3101EB1C408D47C35B4AC74940966C240214EB1C40E69F05BE4DC74940EA66401F34EB1C409ADF4AA94CC749401745E3AD21EB1C40BF51B84C49C74940	2000-01-01	\N	\N
371	50288.0	DENW05AL10008ESv	1215.0	DENW05AL10008ESv	0	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	185.09582575641252	377618.2974491242	5713389.617832914	50288.0	01060000000100000001030000000100000016000000844FBC8943F01C40F8CC003378C7494042849FBA45F01C4013BB129F77C749404CB5DF3952F01C404CA521C677C74940620823C657F01C40C176CCE774C74940F636A7C038F01C401D1B2F8674C74940C5E630AD38F01C40E7E9E08F74C749405EA711221FF01C40D3BD753F74C74940FD20D65D1EF01C4055C07C3E74C749404905BB991DF01C40E1083B4074C7494073EB83DD1CF01C40F904A14474C74940D14F0D2E1CF01C401BBC9D4B74C74940A1523D911BF01C4090C6E65474C74940E515FA0C1BF01C40ADBC316074C749408F9E42A41AF01C40E5D0326D74C74940AFE9215A1AF01C40E89B777B74C74940E2A1A0321AF01C40E3E07A8A74C749405DA9E22D1AF01C40BED2C89974C7494091B65E561AF01C406865D9D874C74940F5004C8D1BF01C409D53881D77C74940710904151CF01C401542F51C77C74940011225DE1CF01C40CEDB555978C74940844FBC8943F01C40F8CC003378C74940	2000-01-01	\N	\N
372	50291.0	DENW05AL10008ETK	1216.0	DENW05AL10008ETK	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	91.03192902699811	377630.6008939655	5713390.941223329	50291.0	01060000000100000001030000000100000009000000472F5D1F59F01C40F84338EC74C74940620823C657F01C40C176CCE774C749404CB5DF3952F01C404CA521C677C749403C5BD41F5FF01C402C1AEEEC77C7494031B8B6CB5DF01C40207CE29C78C749406C3FC1C66FF01C401C558AD078C749402C98046976F01C40578C725575C749408A90F50F59F01C40298951F574C74940472F5D1F59F01C40F84338EC74C74940	2000-01-01	\N	\N
373	53701.0	DENW05AL100097o0	1234.0	DENW05AL100097o0	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	23.87967292056419	377636.52249999985	5713422.684	53701.0	0106000000010000000103000000010000000500000073E1ACFC80F01C40046C22EC80C7494007E7CB7180F01C40BCB27F5D7FC749407DB480626FF01C4070EDB5667FC74940488460ED6FF01C40F1A658F580C7494073E1ACFC80F01C40046C22EC80C74940	2000-01-01	\N	\N
374	53704.0	DENW05AL100097od	1236.0	DENW05AL100097od	0	2	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	48.72789353877305	377336.44434225984	5713363.6385609	53704.0	010600000001000000010300000001000000090000007628FC090EEC1C40D350A6A76EC749401EE385B812EC1C40A9C97E5A6CC7494016579E701FEC1C40223847826CC7494017A4658F21EC1C40FBDEEC6D6BC749408711E14309EC1C406ADCA9236BC749400E44511607EC1C4092B7B9356CC74940BEFFD66502EC1C40954BE0826EC7494042C2262207EC1C405BC1D5916EC749407628FC090EEC1C40D350A6A76EC74940	2000-01-01	\N	\N
375	55119.0	DENW05AL10009BOL	1254.0	DENW05AL10009BOL	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	21.87327247299254	377410.8253937598	5713464.573437993	55119.0	01060000000100000001030000000100000005000000DC15DB7B28ED1C402976AE348AC7494074F48F3419ED1C40D1FAA1058AC7494026CECA1E16ED1C40C2741A948BC74940EE43136525ED1C40D9154DC38BC74940DC15DB7B28ED1C402976AE348AC74940	2000-01-01	\N	\N
376	55190.0	DENW05AL10009BUs	1316.0	DENW05AL10009BUs	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	27.64187442541879	377690.8051495289	5713671.329978226	55190.0	01060000000100000001030000000100000006000000FB6845B237F11C40480DF49FCAC74940A50C9CB937F11C4024CB92EBC8C74940C126F58925F11C4043754EEDC8C74940FEE71A9A25F11C407F4CBE74C9C7494043BCC6C025F11C407D840CA1CAC74940FB6845B237F11C40480DF49FCAC74940	2000-01-01	\N	\N
377	55192.0	DENW05AL10009BUx	1318.0	DENW05AL10009BUx	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	30.272124226212327	377695.80537908245	5713671.198969895	55192.0	010600000001000000010300000001000000060000002FBC0C744BF11C4055212D74C9C74940C953826E4BF11C40D5EFBDE9C8C74940A50C9CB937F11C4024CB92EBC8C74940FB6845B237F11C40480DF49FCAC749401EAD1D814BF11C40042CC69ECAC749402FBC0C744BF11C4055212D74C9C74940	2000-01-01	\N	\N
378	55220.0	DENW05AL10009BXZ	1337.0	DENW05AL10009BXZ	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	41.11942806094885	377586.50793250615	5713777.113598601	55220.0	0106000000010000000103000000010000000700000027F0624CA6EF1C406570B738E9C74940BF30FD94ABEF1C40AD7926AFE7C749403B2D78F792EF1C400827A823E7C749400485A39490EF1C40AAC7CFE1E7C749409468418C8AEF1C408CE7ACBFE7C74940521E74A687EF1C40F37F298BE8C7494027F0624CA6EF1C406570B738E9C74940	2000-01-01	\N	\N
379	56759.0	DENW05AL540000FT	1372.0	DENW05AL540000FT	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	104.01284538209438	377454.67775681976	5713665.933133169	56759.0	01060000000100000001030000000100000007000000D3606BF2CAED1C4050858777C7C74940C70649BDBFED1C402407BCA4C4C74940BD56735D9AED1C403D5FC888C5C74940D7525D9AA5ED1C409AE0885EC8C74940AEE3D876AAED1C405EC95841C8C749400E702CA7C1ED1C408EB3E7B0C7C74940D3606BF2CAED1C4050858777C7C74940	2000-01-01	\N	\N
380	57019.0	DENW05AL630000PU	1375.0	DENW05AL630000PU	1	10	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	1	1000	275.09192864538636	377900.09498757584	5713502.236870965	57019.0	01060000000100000001030000000100000013000000E78E9EF656F41C406F2F3E1D9DC74940E866E3DE75F41C407CB807119BC7494045DDC3D46BF41C401217EC249AC749408B12D0DF76F41C40E095096999C749407E58A4F36DF41C40CFF6049898C74940CC45AB3B77F41C403198F8FA97C74940946A0E3766F41C40CE17B86C96C74940743826E75CF41C40E380340A97C74940E7D160E353F41C408AB1413796C74940F9A29FFF2BF41C40DF9D5BE098C74940C75CD6E629F41C4030B1290499C74940E61B568838F41C40DD8064549AC74940BF1DC5AD39F41C40FC8B53709AC74940F3801D0338F41C40A61A838B9AC74940F055D4AB3BF41C40E45E9BE19AC749403524D4543DF41C40674783C59AC74940217303D34CF41C40F99624329CC74940B83364F04CF41C40490811319CC74940E78E9EF656F41C406F2F3E1D9DC74940	2000-01-01	\N	\N
381	60919.0	DENW05ALAr000061	1440.0	DENW05ALAr000061	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	17.52076786197722	377542.3295	5713460.608	60919.0	01060000000100000001030000000100000005000000067DC2891DEF1C40A2B253668AC74940AC65124005EF1C404D771F228AC7494097DE0BE003EF1C40A383DAEB8AC749402BC8BC291CEF1C407FC10E308BC74940067DC2891DEF1C40A2B253668AC74940	2000-01-01	\N	\N
382	60920.0	DENW05ALAr00007j	1441.0	DENW05ALAr00007j	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	8.683881215751171	377609.8809487016	5713677.06205451	60920.0	01060000000100000001030000000100000007000000863C942AFFEF1C4095EEFF71CBC7494007142DF302F01C40460C4A6ACAC7494064DE53CAFCEF1C40BD30E749CAC749402DCF5D29FBEF1C40B00EADA9CAC74940CDE2162DF7EF1C40B8704196CAC74940BD4EBFFCF4EF1C40A967EA37CBC74940863C942AFFEF1C4095EEFF71CBC74940	2000-01-01	\N	\N
383	60988.0	DENW05ALAs0000HG	1446.0	DENW05ALAs0000HG	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	10.50674675218761	377293.32168589137	5713468.061481169	60988.0	010600000001000000010300000001000000050000003DF20A2168EB1C40D4182A428AC74940E207659E61EB1C40264EA72A8AC74940872678955DEB1C40F655F6E78BC749406C3E1C1964EB1C40514D66FF8BC749403DF20A2168EB1C40D4182A428AC74940	2000-01-01	\N	\N
384	61033.0	DENW05ALAs0000MF	1491.0	DENW05ALAs0000MF	0	1	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	10.502124296035618	377466.1461985804	5713564.16190139	61033.0	0106000000010000000103000000010000000500000073578403EBED1C40227CEFA0A9C74940FA0D343DE9ED1C40227F4B92A7C7494037AC6794E3ED1C40B051D399A7C74940052CA95BE5ED1C4086138BA8A9C7494073578403EBED1C40227CEFA0A9C74940	2000-01-01	\N	\N
385	64795.0	DENW05ALp00001G0	1574.0	DENW05ALp00001G0	0	3	Wohngebäude ist ein Gebäude, das zum Wohnen genutzt wird.	Wohngebäude	0	1000	105.67720005428419	377480.6271813081	5713773.188246771	64795.0	010600000001000000010300000001000000070000001E1A5A371AEE1C403E6CBA8FE8C74940B813EE7D16EE1C40CF7D065AE5C749402D4F2BC514EE1C409046FBDDE3C749400B5EF59EFBED1C4090B4560BE4C74940779318F000EE1C405AA756A1E8C74940192608FA15EE1C40F0C1A992E8C749401E1A5A371AEE1C403E6CBA8FE8C74940	2000-01-01	\N	\N
\.


--
-- Data for Name: SPATIAL_UNIT_0; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public."SPATIAL_UNIT_0" (fid, "ID", "NAME", fid_1, "Name", geometry, "validStartDate", "validEndDate", "arisenFrom") FROM stdin;
1	1	Felherrenviertel	1	Felherrenviertel	0103000000010000002C0000007526F332DFE41C40DCDF407CDBC74940459E2B1DF7E31C4075C82BC1CEC74940336CE3976EE31C40265D0BADC4C74940AEAA7D3E19E41C40275A4D7D84C749401A80AFCDECE61C4012775CBD6EC74940023841B73EE71C40CEE8C93B5DC74940B63C3D1A7CE91C40615C9E2D42C749407A903EF9BCE81C403707304E2AC74940D3F15052AFE81C40132587200DC749406C866A89B9E91C40805957A80DC74940840541DEA4F11C40E5FA616471C74940B2A76B8F60F31C400778462F7FC749404DC38D83C3F41C40DE08EB3388C74940C4D659B941F81C4065175DAAA1C74940C7FECDCEC6F91C40D0B8B579B8C7494030AC8B4815FB1C40A1656592CBC74940AAEA25EFBFFB1C4074F088FFD2C7494028B0C852C3FC1C401830135DD9C74940BBD73C6848FE1C4093EE19BFE8C749404ACF2751D4FF1C405AC98011F7C7494054AE2D50AB011D40C4CEF51500C84940C0E2F38652031D4096E4FB290AC84940D2143C0CDB031D4087AC5BD515C849404CB26A5A59031D40C681393725C849408BE5713871041D40CBEE0C9934C849404D9FF8FD83041D409D3ED62035C8494071621DB068041D40AE1457D738C84940A7000B5776041D405C1A4EE13DC84940FF15FB646A041D40C33217693EC849409855CB8E46041D408C4FD78D3CC84940B891E783D2031D409EDB7BF63AC84940B4C8071621011D4099AEB26E3AC84940233FF0733EFB1C4045C67A5B31C8494017C66F5B39FA1C40013AFC1135C84940B616AB5A6EF61C40072E2CA22FC84940011BD6B960F51C40D5AFC72229C84940C4250FA94AF01C40B965DB7121C849405845F7BD38F01C406CBC2CA620C84940EACC9A3C2AF01C402BB1A6741FC849407DA060061AF01C40830B6B881DC84940A16385B8FEEF1C407ABD56BB1DC84940B9F94B9DDCEE1C405BCE57361BC849406F46D367C1EA1C40305B384802C849407526F332DFE41C40DCDF407CDBC74940	2000-01-01	\N	\N
\.


--
-- Data for Name: SPATIAL_UNIT_1; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public."SPATIAL_UNIT_1" (fid, "ID", "NAME", "Block_ID", "Block_Name", geometry, "validStartDate", "validEndDate", "arisenFrom") FROM stdin;
1	1	Block 1	1	Block 1	010300000001000000060000009906102E64F21C40B32E61BACEC749409A2966B145F21C40A4B0C1DD9BC749403AD158BFE1F31C40ECD0CB0999C749402ED3E23382F41C407E4F2C9191C7494019215F0559F51C402D14C940CEC749409906102E64F21C40B32E61BACEC74940	2000-01-01	\N	\N
2	2	Block 2	2	Block 2	010300000001000000080000009906102E64F21C40B32E61BACEC7494083AFCB832BF01C40F4046CF9CFC749407D13C5E31EF01C407B5D28A2C4C74940968B9517D4EF1C407DD02B39C1C7494000C436C541F01C40C3CC7666A7C749403F0DBE8AACF01C40D8B17E289CC749409A2966B145F21C40A4B0C1DD9BC749409906102E64F21C40B32E61BACEC74940	2000-01-01	\N	\N
3	3	Block 3	3	Block 3	010300000001000000070000003F0DBE8AACF01C40D8B17E289CC74940487FAF18F0F01C40E111734572C74940110F532889F41C406E7600698BC749402ED3E23382F41C407E4F2C9191C749403AD158BFE1F31C40ECD0CB0999C749409A2966B145F21C40A4B0C1DD9BC749403F0DBE8AACF01C40D8B17E289CC74940	2000-01-01	\N	\N
4	4	Block 4	4	Block 4	01030000000100000007000000968B9517D4EF1C407DD02B39C1C74940E850DF0685EF1C40C3AFCFE5C4C74940447137F98CEE1C40244B8F23C5C749401AE41F0682ED1C40E9F51811D0C7494055E5882590ED1C4024CE06CFD5C7494017E05D7227EF1C408C16D635EDC74940968B9517D4EF1C407DD02B39C1C74940	2000-01-01	\N	\N
5	5	Block 5	5	Block 5	0103000000010000000700000017E05D7227EF1C408C16D635EDC7494013AC449DB3EE1C40785D7BAD0EC849404C6EF3395BEF1C40CD7B8E4712C8494083AFCB832BF01C40F4046CF9CFC749407D13C5E31EF01C407B5D28A2C4C74940968B9517D4EF1C407DD02B39C1C7494017E05D7227EF1C408C16D635EDC74940	2000-01-01	\N	\N
6	6	Block 6	6	Block 6	0103000000010000000600000013AC449DB3EE1C40785D7BAD0EC84940BB295C7C4EED1C40FD4D3F1A0AC849403E532F0C55EC1C40808EE555FEC7494055E5882590ED1C4024CE06CFD5C7494017E05D7227EF1C408C16D635EDC7494013AC449DB3EE1C40785D7BAD0EC84940	2000-01-01	\N	\N
7	7	Block 7	7	Block 7	0103000000010000000600000000C436C541F01C40C3CC7666A7C749404C62A35A26F01C400CE7AD059FC74940F0FC1032FAEF1C40B4EC185E72C74940487FAF18F0F01C40E111734572C749403F0DBE8AACF01C40D8B17E289CC7494000C436C541F01C40C3CC7666A7C74940	2000-01-01	\N	\N
8	8	Block 8	8	Block 8	010300000001000000060000003C83B2D544ED1C408B7121146AC74940F0FC1032FAEF1C40B4EC185E72C74940487FAF18F0F01C40E111734572C74940C43799A4F4F01C40B87211CD69C74940248E518F97ED1C40766A14DA44C749403C83B2D544ED1C408B7121146AC74940	2000-01-01	\N	\N
9	9	Block 9	9	Block 9	010300000001000000090000001AE41F0682ED1C40E9F51811D0C74940C87C1E687FED1C401AED8D2BBDC7494064E20A8A1DEF1C403BD1A8E2B3C74940B64A6A530BEF1C404B6CB09BAAC7494000C436C541F01C40C3CC7666A7C74940968B9517D4EF1C407DD02B39C1C74940E850DF0685EF1C40C3AFCFE5C4C74940447137F98CEE1C40244B8F23C5C749401AE41F0682ED1C40E9F51811D0C74940	2000-01-01	\N	\N
10	10	Block 10	10	Block 10	01030000000100000007000000B64A6A530BEF1C404B6CB09BAAC749402EF2BD0F1EEF1C4047A2F031A1C74940D751F2B1DAEE1C4057C8D1E683C749407EA8F25F0BF01C4048CB76BD83C749404C62A35A26F01C400CE7AD059FC7494000C436C541F01C40C3CC7666A7C74940B64A6A530BEF1C404B6CB09BAAC74940	2000-01-01	\N	\N
11	11	Block 11	11	Block 11	01030000000100000007000000CD5E3D7FFAEC1C40125A8F3C95C74940EF8FF6FA09EF1C40F8E5907698C74940D751F2B1DAEE1C4057C8D1E683C749407EA8F25F0BF01C4048CB76BD83C74940F0FC1032FAEF1C40B4EC185E72C749403C83B2D544ED1C408B7121146AC74940CD5E3D7FFAEC1C40125A8F3C95C74940	2000-01-01	\N	\N
12	12	Block 12	12	Block 12	0103000000010000000A000000C87C1E687FED1C401AED8D2BBDC749403352B59D31ED1C40644982E7BAC74940B31CF26A1FED1C403F012ECAB5C749407FAC1C8CE3EC1C40F22212219BC74940CD5E3D7FFAEC1C40125A8F3C95C74940EF8FF6FA09EF1C40F8E5907698C749402EF2BD0F1EEF1C4047A2F031A1C74940B64A6A530BEF1C404B6CB09BAAC7494064E20A8A1DEF1C403BD1A8E2B3C74940C87C1E687FED1C401AED8D2BBDC74940	2000-01-01	\N	\N
13	13	Block 13	13	Block 13	0103000000010000000500000040A7B5E53BEB1C404E21AAE879C7494066BFFDFE20ED1C404121BCE27EC749403C83B2D544ED1C408B7121146AC74940CCA0EB0466EB1C402909688E62C7494040A7B5E53BEB1C404E21AAE879C74940	2000-01-01	\N	\N
14	14	Block 14	14	Block 14	0103000000010000000B0000006E673ABA4AEA1C40D25A089677C7494062FEE42D27EA1C405E9707D6A3C74940CB695B01ECEA1C40839B469FA8C7494099B6CAE181EB1C40A1F09439B1C7494049F0A6D75CEC1C409D62F8E6ADC749406C47201F0EED1C40CACF7916AEC749407FAC1C8CE3EC1C40F22212219BC74940CD5E3D7FFAEC1C40125A8F3C95C7494066BFFDFE20ED1C404121BCE27EC7494040A7B5E53BEB1C404E21AAE879C749406E673ABA4AEA1C40D25A089677C74940	2000-01-01	\N	\N
15	15	Block 15	15	Block 15	0103000000010000000C000000998DC2EB5CEA1C40D3E8ED3CB4C74940BDAD8778CEEC1C40A3889909D7C7494055E5882590ED1C4024CE06CFD5C749401AE41F0682ED1C40E9F51811D0C74940C87C1E687FED1C401AED8D2BBDC749403352B59D31ED1C40644982E7BAC74940B31CF26A1FED1C403F012ECAB5C749406C47201F0EED1C40CACF7916AEC7494049F0A6D75CEC1C409D62F8E6ADC7494099B6CAE181EB1C40A1F09439B1C74940CB695B01ECEA1C40839B469FA8C74940998DC2EB5CEA1C40D3E8ED3CB4C74940	2000-01-01	\N	\N
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
kommonitor-5.0.0-1	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:34.629351	1	EXECUTED	9:5186dc0083fc36e1d430056872758403	createTable tableName=metadatageoresources		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-2	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:34.716922	2	EXECUTED	9:c3c59ff0598fd6ac2f600b4daef82a89	createTable tableName=metadataindicators		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-3	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:34.760603	3	EXECUTED	9:8854baf11c47ce99c5f72486dcb08a1e	createTable tableName=gt_pk_metadata		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-4	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:34.840321	4	EXECUTED	9:80b3e44301775bc044670dfbeddd24f5	createTable tableName=metadataspatialunits		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-5	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:34.890203	5	EXECUTED	9:a8091fe5ac46ec6564965a82417e61cd	createTable tableName=permissions		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-6	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:34.939392	6	EXECUTED	9:3ef1b8a89f2c256af539a105d810f852	createTable tableName=scriptinputparameters		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-8	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:34.978018	7	EXECUTED	9:26a6009f79f1f6d68113fbf6e4fd6dab	createTable tableName=topics		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-9	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.024242	8	EXECUTED	9:c836dfdcf4dd85eea16e12251efe4365	createTable tableName=metadataindicators_defaultclassification		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-10	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.054418	9	EXECUTED	9:29d6a6363813815724d8e1a2852e4cf4	createTable tableName=metadataindicators_regionalreferencevalues		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-11	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.104155	10	EXECUTED	9:cbcaf64a9598a6fb1867092127ba4b78	createTable tableName=organizationalunits		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-12	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.138818	11	EXECUTED	9:11a09ea4f5a88e963c1da943cc2d402c	createTable tableName=topics_subtopics		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-15	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.176565	12	EXECUTED	9:1e3af82bbb85ee86d129fc7cad1f4f71	addUniqueConstraint constraintName=gt_pk_metadata_table_schema_table_name_pk_column_key, tableName=gt_pk_metadata		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-69	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.220909	13	EXECUTED	9:e72c7e2699c4f0b880e42dea9b787bef	sql		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-16	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.25144	14	EXECUTED	9:d172fb22beed9dc11488d761b7872d75	addUniqueConstraint constraintName=metadataindicators_defaultclassification_mapping_id_key, tableName=metadataindicators_defaultclassification		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-17	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.27473	15	EXECUTED	9:1e7aeb3da0b1924cf2ced2df994b2813	addUniqueConstraint constraintName=metadataindicators_regionalreferencevalues_mapping_id_key, tableName=metadataindicators_regionalreferencevalues		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-18	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.296749	16	EXECUTED	9:2691e9bd3686b5b6801ca09b4b964d11	addUniqueConstraint constraintName=organizationalunits_keycloakid_key, tableName=organizationalunits		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-19	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.324152	17	EXECUTED	9:470859ca7a9bf6ea90550086d60016f0	addUniqueConstraint constraintName=organizationalunits_name_key, tableName=organizationalunits		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-20	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.353348	18	EXECUTED	9:b4e65c61a6dd8e8e29c75cb06ec630e6	addUniqueConstraint constraintName=topics_subtopics_subtopics_topicid_key, tableName=topics_subtopics		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-21	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.386843	19	EXECUTED	9:ea7965b446a37b9f8da540574f96e4fb	createTable tableName=defaultclassificationmappingitemtype		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-22	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.424201	20	EXECUTED	9:7d1b8b19a98a728c6da44ab4b642958c	createTable tableName=georesourcereference		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-23	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.455264	21	EXECUTED	9:a90cbeee02689c7f1304eacafcf2d543	createTable tableName=indicator_tags		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-24	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.484847	22	EXECUTED	9:a404b52282e41ad943b195dd36898d88	createTable tableName=indicator_timestamps		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-25	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.535916	23	EXECUTED	9:a829527bee3eaaaca3c3adb3f43c11cf	createTable tableName=indicatorreference		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-26	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.568683	24	EXECUTED	9:812724f0b8bdc9f5fb9c217985aa7e97	createTable tableName=indicatorspatialunits		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-27	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.622819	25	EXECUTED	9:04428d092ded66b30c262402adfa81d3	createTable tableName=indicatorspatialunits_permissions		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-28	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.651414	26	EXECUTED	9:a7e3f25a165d4e8a6d6d35a0a5cfddd8	createTable tableName=lastmodification		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-29	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.678713	27	EXECUTED	9:a249992fb5ff282b6082466df8ac9b4f	createTable tableName=metadatageoresources_permissions		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-30	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.714417	28	EXECUTED	9:88d635fe55c49f37930e6ce10f07d83a	createTable tableName=metadataindicators_permissions		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-31	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.747326	29	EXECUTED	9:d473e73f04624d06e66a9310b9fa9c49	createTable tableName=metadataspatialunits_permissions		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-32	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.78424	30	EXECUTED	9:a425c2f68fc5c7bb3477d352195010fa	createTable tableName=regionalreferencevaluetype		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-33	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.819075	31	EXECUTED	9:2867a87e7a35665fb25d14642f4be446	createTable tableName=scriptmetadata		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-34	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.842242	32	EXECUTED	9:b62751818041e25cbccdde97b27983d6	createTable tableName=scripts_inputparameters		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-35	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.869193	33	EXECUTED	9:d203196ef76a5da3b993133087c6ab9a	createTable tableName=scripts_requiredgeoresources		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-36	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.894525	34	EXECUTED	9:52e993cbb734b2dad61a4324bf183def	createTable tableName=scripts_requiredindicators		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-37	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.929477	35	EXECUTED	9:6c2a358c46ee4291c8de8e7a2268e400	addForeignKeyConstraint baseTableName=scripts_requiredindicators, constraintName=fk1i8b0onfvo84rvlcsk9ct2qgy, referencedTableName=scriptmetadata		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-38	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.94941	36	EXECUTED	9:44591c720bcfea74b1c65dfbf704c493	addForeignKeyConstraint baseTableName=indicatorspatialunits, constraintName=fk2ku1ipstuan4pp16i4h2qip0p, referencedTableName=metadataindicators		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-39	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.966392	37	EXECUTED	9:fb845939248976780d0075e636edab19	addForeignKeyConstraint baseTableName=indicatorspatialunits_permissions, constraintName=fk2l0fpfwnn8u4k9dk5a8pixc89, referencedTableName=indicatorspatialunits		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-40	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.982161	38	EXECUTED	9:2a8a03187b9c75fe88693da30283f7e2	addForeignKeyConstraint baseTableName=organizationalunits, constraintName=fk3bm4ecg8sr4fyce8gpgcoifc2, referencedTableName=organizationalunits		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-41	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:35.993628	39	EXECUTED	9:ff8528f921616755365f5b42c9a943f4	addForeignKeyConstraint baseTableName=metadataspatialunits, constraintName=fk3j5hwqpw067o40i0pc5n7y81w, referencedTableName=organizationalunits		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-42	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.008634	40	EXECUTED	9:6d7c5cc0210a6c8b8b39a63801662fe4	addForeignKeyConstraint baseTableName=scripts_requiredgeoresources, constraintName=fk5ml1rn4axdld687al3cwy915o, referencedTableName=metadatageoresources		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-43	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.022209	41	EXECUTED	9:138ee53f2878aaf5c99a472a5b0952f9	addForeignKeyConstraint baseTableName=indicatorspatialunits, constraintName=fk5qiyu7wg29c5u5gne280ha0h5, referencedTableName=organizationalunits		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-44	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.037744	42	EXECUTED	9:4d5b57278dad639e47d576bfbd3e47da	addForeignKeyConstraint baseTableName=scripts_inputparameters, constraintName=fk76tojnk9a13moulj92abwtoie, referencedTableName=scriptmetadata		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-45	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.051705	43	EXECUTED	9:71111a87e0e4477441901e13e8e4fcbe	addForeignKeyConstraint baseTableName=metadataspatialunits_permissions, constraintName=fk7ls7o1jla5e9dldak6yrrqxdq, referencedTableName=permissions		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-46	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.063107	44	EXECUTED	9:3a19eec905cd02832c2c8a57cc39da86	addForeignKeyConstraint baseTableName=organizationalunits, constraintName=fk7mscc9wm82n23nmirr394h0ne, referencedTableName=organizationalunits		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-47	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.074395	45	EXECUTED	9:d75b3570006582e6444c9f96229fa909	addForeignKeyConstraint baseTableName=metadatageoresources_permissions, constraintName=fk87qg1sgxo3pcmo3189tlas2cu, referencedTableName=permissions		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-48	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.090812	46	EXECUTED	9:91308d2ccd5ba7c9afb284527accaa68	addForeignKeyConstraint baseTableName=metadataspatialunits_permissions, constraintName=fk9d89b761lh3m7dn612cw06888, referencedTableName=metadataspatialunits		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-49	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.10326	47	EXECUTED	9:f53148ab984cbf247c110e12e9212150	addForeignKeyConstraint baseTableName=scripts_requiredindicators, constraintName=fka5k490rs0ck8ba60311vcw2ff, referencedTableName=metadataindicators		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-50	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.117602	48	EXECUTED	9:4d5af029440346f0eae134cbfec4b658	addForeignKeyConstraint baseTableName=metadataindicators_defaultclassification, constraintName=fkaht0q849jrsr22wqslthqnvfu, referencedTableName=defaultclassificationmappingitemtype		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-51	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.129133	49	EXECUTED	9:d0d7f50b45c7bd058cda0522bd7084d2	addForeignKeyConstraint baseTableName=indicator_tags, constraintName=fkapilr4sy9fst78wiee6iy0oh2, referencedTableName=metadataindicators		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-52	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.143898	50	EXECUTED	9:0c2474f1a87308ec0c2ac804b9554591	addForeignKeyConstraint baseTableName=topics_subtopics, constraintName=fkb49kmbcprv7266rvy6qhhuh3h, referencedTableName=topics		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-53	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.15619	51	EXECUTED	9:8aaa92a27a620c4a7bd9c9b84052c7cb	addForeignKeyConstraint baseTableName=scriptmetadata, constraintName=fkbnaoo122y2j9g0m9ymywf5rf2, referencedTableName=metadataindicators		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-54	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.170755	52	EXECUTED	9:58f68cc44ccf6f4505ac10feacb6b356	addForeignKeyConstraint baseTableName=metadataindicators_regionalreferencevalues, constraintName=fkdot0sxkbo9b643qps9bjkbp36, referencedTableName=regionalreferencevaluetype		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-55	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.185385	53	EXECUTED	9:1640e1616f50d2f567adec801218dc43	addForeignKeyConstraint baseTableName=metadataindicators, constraintName=fkf7wi42jyhwx6yvdxgjwr84dam, referencedTableName=organizationalunits		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-56	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.199725	54	EXECUTED	9:ad77cfd0493c0e837185d3402f5006bc	addForeignKeyConstraint baseTableName=metadataindicators_permissions, constraintName=fkgm5resvbkqcle93avd0bhts8h, referencedTableName=permissions		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-57	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.215289	55	EXECUTED	9:6ff6ab64f9ebd32b4b7e82fcc721c9dc	addForeignKeyConstraint baseTableName=metadatageoresources, constraintName=fkhgfrv0npwlxkfadhhanw1e0dh, referencedTableName=organizationalunits		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-58	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.228454	56	EXECUTED	9:9a5e94f19d36890b03356c90436710ed	addForeignKeyConstraint baseTableName=indicator_timestamps, constraintName=fkhuntisly758v07f1s0e0xjav0, referencedTableName=metadataindicators		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-59	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.245807	57	EXECUTED	9:5f7c4635dc162b6b630ea0e8f291784c	addForeignKeyConstraint baseTableName=scripts_inputparameters, constraintName=fkhvw7wqyhrcb6y2ymf6do9yquv, referencedTableName=scriptinputparameters		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-60	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.262475	58	EXECUTED	9:e7b595efe48600d380ff2926ceacd22d	addForeignKeyConstraint baseTableName=metadatageoresources_permissions, constraintName=fkis8vhkd37va7ltxydm5y5weyi, referencedTableName=metadatageoresources		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-61	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.276728	59	EXECUTED	9:00a31176144aa5f7fda7421c7b1444fb	addForeignKeyConstraint baseTableName=metadataindicators_permissions, constraintName=fkklghgtx2rtav334soqdo8as31, referencedTableName=metadataindicators		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-62	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.291137	60	EXECUTED	9:6d419e5ea6a2cdeca9c996d385b76c89	addForeignKeyConstraint baseTableName=metadataindicators_regionalreferencevalues, constraintName=fklt1s456rj49ceb4ugy4wt48nh, referencedTableName=metadataindicators		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-63	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.305247	61	EXECUTED	9:42f26f6d58733699a875778125b6514e	addForeignKeyConstraint baseTableName=scripts_requiredgeoresources, constraintName=fkm2lpv28s8utghc3079dobulhk, referencedTableName=scriptmetadata		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-64	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.318899	62	EXECUTED	9:93b5714a6e859cfad1953a598f575048	addForeignKeyConstraint baseTableName=indicatorspatialunits, constraintName=fkmphrkhhdqhmxomq0iji7euwtl, referencedTableName=metadataspatialunits		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-65	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.331938	63	EXECUTED	9:06682bc394e8b12cfb5b06ef621cd960	addForeignKeyConstraint baseTableName=topics_subtopics, constraintName=fkppmweumhynwtfu7dv304o8oto, referencedTableName=topics		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-66	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.343717	64	EXECUTED	9:e11d31d5c7609d9ae26c1940124f11ec	addForeignKeyConstraint baseTableName=indicatorspatialunits_permissions, constraintName=fkpu4dye5vlufhimkqtyn5368eb, referencedTableName=permissions		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-67	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.355876	65	EXECUTED	9:d49632235d445aa90b61435ceb815e2a	addForeignKeyConstraint baseTableName=metadataindicators_defaultclassification, constraintName=fkq0us248wnb2j151csjtrkfa8n, referencedTableName=metadataindicators		\N	4.32.0	\N	\N	9840951542
kommonitor-5.0.0-68	kommonitor	db/changelog/kommonitor-changelog-5.0.0.xml	2025-10-07 12:42:36.369708	66	EXECUTED	9:181b6fcdb1bc7b6dbdefac81409373db	addForeignKeyConstraint baseTableName=permissions, constraintName=fkrf83pb1ulbpvgjq14ndhy15nx, referencedTableName=organizationalunits		\N	4.32.0	\N	\N	9840951542
kommonitor-5.1.0-1	kommonitor	db/changelog/kommonitor-changelog-5.1.0.xml	2025-10-07 12:42:36.405084	67	EXECUTED	9:7b579f327d484a45ca497666345f62cf	createTable tableName=userinfo		\N	4.32.0	\N	\N	9840951542
kommonitor-5.1.0-2	kommonitor	db/changelog/kommonitor-changelog-5.1.0.xml	2025-10-07 12:42:36.433331	68	EXECUTED	9:286ba0f054690ec8cc5fdc54da01b4a1	addUniqueConstraint constraintName=userinfoid_key, tableName=userinfo		\N	4.32.0	\N	\N	9840951542
kommonitor-5.1.0-3	kommonitor	db/changelog/kommonitor-changelog-5.1.0.xml	2025-10-07 12:42:36.459494	69	EXECUTED	9:d9927ee13aa8a9ba759f0ba0653e6af3	createTable tableName=georesources_favourites		\N	4.32.0	\N	\N	9840951542
kommonitor-5.1.0-4	kommonitor	db/changelog/kommonitor-changelog-5.1.0.xml	2025-10-07 12:42:36.484634	70	EXECUTED	9:88a76cb3ef92231c0f295e231cf7daa7	createTable tableName=indicators_favourites		\N	4.32.0	\N	\N	9840951542
kommonitor-5.1.0-5	kommonitor	db/changelog/kommonitor-changelog-5.1.0.xml	2025-10-07 12:42:36.508976	71	EXECUTED	9:da07bb38a7f4f0ca95590ca0050aaf42	createTable tableName=topics_favourites		\N	4.32.0	\N	\N	9840951542
kommonitor-5.1.0-6	kommonitor	db/changelog/kommonitor-changelog-5.1.0.xml	2025-10-07 12:42:36.525871	72	EXECUTED	9:6b2c16a27ea59208aa750e0d5d42cabe	addForeignKeyConstraint baseTableName=georesources_favourites, constraintName=fk_georesource_favourites_userinfo, referencedTableName=userinfo		\N	4.32.0	\N	\N	9840951542
kommonitor-5.1.0-7	kommonitor	db/changelog/kommonitor-changelog-5.1.0.xml	2025-10-07 12:42:36.540831	73	EXECUTED	9:52303fbc41e8510199febe0b898eda8e	addForeignKeyConstraint baseTableName=georesources_favourites, constraintName=fk_georesource_favourites_dataset, referencedTableName=metadatageoresources		\N	4.32.0	\N	\N	9840951542
kommonitor-5.1.0-8	kommonitor	db/changelog/kommonitor-changelog-5.1.0.xml	2025-10-07 12:42:36.554819	74	EXECUTED	9:a74ec7262542da385219fe3eacead4f4	addForeignKeyConstraint baseTableName=indicators_favourites, constraintName=fk_indicator_favourites_userinfo, referencedTableName=userinfo		\N	4.32.0	\N	\N	9840951542
kommonitor-5.1.0-9	kommonitor	db/changelog/kommonitor-changelog-5.1.0.xml	2025-10-07 12:42:36.571898	75	EXECUTED	9:218797c7a0a2fba50a9f84678ce64267	addForeignKeyConstraint baseTableName=indicators_favourites, constraintName=fk_indicator_favourites_dataset, referencedTableName=metadataindicators		\N	4.32.0	\N	\N	9840951542
kommonitor-5.1.0-10	kommonitor	db/changelog/kommonitor-changelog-5.1.0.xml	2025-10-07 12:42:36.593566	76	EXECUTED	9:6fe4e2330431ece37cc680f70e874207	addForeignKeyConstraint baseTableName=topics_favourites, constraintName=fk_topics_favourites_userinfo, referencedTableName=userinfo		\N	4.32.0	\N	\N	9840951542
kommonitor-5.1.0-11	kommonitor	db/changelog/kommonitor-changelog-5.1.0.xml	2025-10-07 12:42:36.618066	77	EXECUTED	9:eabbe773de8cedad5341a11f762bfe5c	addForeignKeyConstraint baseTableName=topics_favourites, constraintName=fk_topics_favourites_topic, referencedTableName=topics		\N	4.32.0	\N	\N	9840951542
kommonitor-5.1.0-12	kommonitor	db/changelog/kommonitor-changelog-5.1.0.xml	2025-10-07 12:42:36.630279	78	EXECUTED	9:ba33b5ab2974913327f21c851d86a0d8	addColumn tableName=metadataindicators		\N	4.32.0	\N	\N	9840951542
kommonitor-5.1.1-1	kommonitor	db/changelog/kommonitor-changelog-5.1.1.xml	2025-10-07 12:42:36.683516	79	EXECUTED	9:6be3e29bf8b47cea75a16ac958363eb5	addUniqueConstraint constraintName=keycloakid_unique, tableName=userinfo		\N	4.32.0	\N	\N	9840951542
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: defaultclassificationmappingitemtype; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.defaultclassificationmappingitemtype (mappingid, spatialunitid, breaks) FROM stdin;
\.


--
-- Data for Name: georesourcereference; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.georesourcereference (entryid, mainindicatorid, referencedescription, referencedgeoresourceid) FROM stdin;
\.


--
-- Data for Name: georesources_favourites; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.georesources_favourites (user_id, dataset_id) FROM stdin;
\.


--
-- Data for Name: gt_pk_metadata; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.gt_pk_metadata (table_schema, table_name, pk_column, pk_column_idx, pk_policy, pk_sequence) FROM stdin;
\.


--
-- Data for Name: indicator_tags; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.indicator_tags (dataset_id, tag) FROM stdin;
\.


--
-- Data for Name: indicator_timestamps; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.indicator_timestamps (dataset_id, "timestamp") FROM stdin;
\.


--
-- Data for Name: indicatorreference; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.indicatorreference (entryid, indicatorid, referencedescription, referencedindicatorid) FROM stdin;
\.


--
-- Data for Name: indicators_favourites; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.indicators_favourites (user_id, dataset_id) FROM stdin;
\.


--
-- Data for Name: indicatorspatialunits; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.indicatorspatialunits (ispublic, defaultstylename, entryid, indicatormetadataid, indicatorname, indicatorvaluetablename, owner_organizationalunitid, spatialunitid, spatialunitname, wfsurl, wmsurl) FROM stdin;
\.


--
-- Data for Name: indicatorspatialunits_permissions; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.indicatorspatialunits_permissions (indicatorspatialunit_id, permission_id) FROM stdin;
\.


--
-- Data for Name: lastmodification; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.lastmodification (accesscontrol, georesources, indicators, processscripts, spatialunits, topics, id) FROM stdin;
2025-10-07 14:03:45.246+00	2025-10-08 06:42:31.231+00	2025-10-08 06:46:50.14+00	2025-10-07 12:45:25.047+00	2025-10-07 14:23:21.09+00	2025-10-08 06:46:12.891+00	b3239cf7-a5da-4c3c-9d7e-631fdb1292ba
\.


--
-- Data for Name: metadatageoresources; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.metadatageoresources (isaoi, isloi, ispoi, ispublic, loiwidth, poimarkercolor, poimarkerstyle, poisymbolcolor, sridepsg, lastupdate, aoicolor, contact, databasis, datasource, datasetid, datasetname, dbtablename, description, jsonschema, literature, loicolor, loidasharraystring, note, owner_organizationalunitid, poimarkertext, poisymbolbootstrap3name, topicreference, updateintervall, wfsurl, wmsurl) FROM stdin;
t	f	f	t	3	\N	\N	\N	4326	2025-10-07 00:00:00+00	#939393	OSM	\N	OSM	3748f2e3-2cb9-422f-9cef-97c5b6b10675	Wohngebäude	GEORESOURCE_0	Gebäude wohnlicher Nutzung	{"E_Auto":"Integer","ID":"Double","Lat":"Double","Lon":"Double","NAME":"String","WPumpe":"Integer","_uid_":"Double","fid_1":"Double","gebaeude_1":"String","gebaeude_2":"String","gebaeudefu":"Integer","gml_id":"String","grundflaec":"Double","persons":"Integer","validStartDate":"Date"}	\N	\N	\N	\N	15689dda-e081-42a8-a4e5-153b9cb6477e	\N	\N	28124ba8-9a2b-40bb-8496-7e95b8749930	ARBITRARY		
\.


--
-- Data for Name: metadatageoresources_permissions; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.metadatageoresources_permissions (metadatageoresources_id, permission_id) FROM stdin;
3748f2e3-2cb9-422f-9cef-97c5b6b10675	6f662421-e803-43e0-82a3-dc86bda4eaf0
3748f2e3-2cb9-422f-9cef-97c5b6b10675	c8d5ba0a-8408-4fe5-9229-9eca87e3c93c
\.


--
-- Data for Name: metadataindicators; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.metadataindicators (classificationmethod, creationtype, displayorder, indicatortype, isheadlineindicator, ispublic, numclasses, lastupdate, abbreviation, characteristicvalue, colorbrewerschemename, contact, databasis, datasource, datasetid, datasetname, dbtablename, description, interpretation, jsonschema, literature, lowestspatialunitforcomputation, note, owner_organizationalunitid, processdescription, referencedatenote, topicreference, unit, updateintervall, wfsurl, wmsurl, "precision") FROM stdin;
2	0	0	0	f	f	5	2025-10-08 00:00:00+00	\N	\N	YlOrRd	52N	\N	52N	1b861454-ca20-4333-bd66-e663b07286c0	Durchschnittlicher Energieverbrauch Gebäude	\N	Durchschnittlicher Energieverbrauch Gebäude	Durchschnittlicher Energieverbrauch von Gebäuden wohnlicher Nutzung	\N	\N	\N	\N	15689dda-e081-42a8-a4e5-153b9cb6477e			c6593382-be32-4dfd-b1fb-85bb370256f9	kWh	DAILY	\N	\N	2
\.


--
-- Data for Name: metadataindicators_defaultclassification; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.metadataindicators_defaultclassification (dataset_id, mapping_id) FROM stdin;
\.


--
-- Data for Name: metadataindicators_permissions; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.metadataindicators_permissions (metadataindicators_id, permission_id) FROM stdin;
1b861454-ca20-4333-bd66-e663b07286c0	c8d5ba0a-8408-4fe5-9229-9eca87e3c93c
1b861454-ca20-4333-bd66-e663b07286c0	6f662421-e803-43e0-82a3-dc86bda4eaf0
\.


--
-- Data for Name: metadataindicators_regionalreferencevalues; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.metadataindicators_regionalreferencevalues (dataset_id, mapping_id) FROM stdin;
\.


--
-- Data for Name: metadataspatialunits; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.metadataspatialunits (isoutlinelayer, ispublic, outlinewidth, sridepsg, lastupdate, contact, databasis, datasource, datasetid, datasetname, dbtablename, description, jsonschema, literature, nextlowerhierarchylevel, nextupperhierarchylevel, note, outlinecolor, outlinedasharraystring, owner_organizationalunitid, updateintervall, wfsurl, wmsurl) FROM stdin;
f	t	3	4326	2025-10-07 00:00:00+00	52N	\N	52N	5e43a840-43ed-4933-bfd6-0a167938bc6d	Baublöcke Bochum	SPATIAL_UNIT_1	Baublöcke Bochum	\N	\N	\N	Quartiere Bochum	\N	#000000		15689dda-e081-42a8-a4e5-153b9cb6477e	ARBITRARY		
f	t	3	4326	2025-10-07 00:00:00+00	52N	\N	52N	de6e761b-9288-445b-a32e-dceb4893d000	Quartiere Bochum	SPATIAL_UNIT_0	Quartiere Bochum	\N	\N	Baublöcke Bochum	\N	\N	#000000		15689dda-e081-42a8-a4e5-153b9cb6477e	ARBITRARY		
\.


--
-- Data for Name: metadataspatialunits_permissions; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.metadataspatialunits_permissions (metadataspatialunits_id, permission_id) FROM stdin;
de6e761b-9288-445b-a32e-dceb4893d000	c8d5ba0a-8408-4fe5-9229-9eca87e3c93c
de6e761b-9288-445b-a32e-dceb4893d000	6f662421-e803-43e0-82a3-dc86bda4eaf0
5e43a840-43ed-4933-bfd6-0a167938bc6d	c8d5ba0a-8408-4fe5-9229-9eca87e3c93c
5e43a840-43ed-4933-bfd6-0a167938bc6d	6f662421-e803-43e0-82a3-dc86bda4eaf0
\.


--
-- Data for Name: organizationalunits; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.organizationalunits (ismandant, keycloakid, contact, description, mandant, name, organizationalunitid, parent) FROM stdin;
t	83d2e48c-a3bc-445f-9644-ab063dff7644	52N	52N	15689dda-e081-42a8-a4e5-153b9cb6477e	52N	15689dda-e081-42a8-a4e5-153b9cb6477e	\N
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.permissions (permissionlevel, name, organizationalunit, permissionid, permissiontype) FROM stdin;
0	\N	15689dda-e081-42a8-a4e5-153b9cb6477e	96c89083-7f65-4025-9943-e10bc1218c6c	resources
1	\N	15689dda-e081-42a8-a4e5-153b9cb6477e	6f662421-e803-43e0-82a3-dc86bda4eaf0	resources
2	\N	15689dda-e081-42a8-a4e5-153b9cb6477e	c8d5ba0a-8408-4fe5-9229-9eca87e3c93c	resources
0	\N	15689dda-e081-42a8-a4e5-153b9cb6477e	0ae9c2bd-a46e-4d5c-829e-93e2c2d0077f	users
0	\N	15689dda-e081-42a8-a4e5-153b9cb6477e	66306bc3-fa64-4181-99c6-ac57e9ac2028	themes
\.


--
-- Data for Name: regionalreferencevaluetype; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.regionalreferencevaluetype (regionalaverage, regionalsum, spatiallyunassignable, mappingid, referencedate) FROM stdin;
\.


--
-- Data for Name: scriptinputparameters; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.scriptinputparameters (datatype, maxparametervaluefornumericinputs, minparametervaluefornumericinputs, defaultvalue, description, inputparameterid, name) FROM stdin;
\.


--
-- Data for Name: scriptmetadata; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.scriptmetadata (lastupdate, description, indicatorid, name, scriptid, scripttype, scriptcode) FROM stdin;
\.


--
-- Data for Name: scripts_inputparameters; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.scripts_inputparameters (inputparameter_id, script_id) FROM stdin;
\.


--
-- Data for Name: scripts_requiredgeoresources; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.scripts_requiredgeoresources (dataset_id, script_id) FROM stdin;
\.


--
-- Data for Name: scripts_requiredindicators; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.scripts_requiredindicators (dataset_id, script_id) FROM stdin;
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.topics (topicresource, topictype, topicdescription, topicid, topicname) FROM stdin;
1	0	Wohnen	28124ba8-9a2b-40bb-8496-7e95b8749930	Wohnen
0	0	Energie	c6593382-be32-4dfd-b1fb-85bb370256f9	Energie
\.


--
-- Data for Name: topics_favourites; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.topics_favourites (user_id, topic_id) FROM stdin;
\.


--
-- Data for Name: topics_subtopics; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.topics_subtopics (main_topic_id, subtopics_topicid) FROM stdin;
\.


--
-- Data for Name: userinfo; Type: TABLE DATA; Schema: public; Owner: kommonitor
--

COPY public.userinfo (userinfoid, keycloakid) FROM stdin;
\.


--
-- Data for Name: geocode_settings; Type: TABLE DATA; Schema: tiger; Owner: kommonitor
--

COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
\.


--
-- Data for Name: pagc_gaz; Type: TABLE DATA; Schema: tiger; Owner: kommonitor
--

COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: pagc_lex; Type: TABLE DATA; Schema: tiger; Owner: kommonitor
--

COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: pagc_rules; Type: TABLE DATA; Schema: tiger; Owner: kommonitor
--

COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
\.


--
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: kommonitor
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: kommonitor
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- Name: GEORESOURCE_0_fid_seq; Type: SEQUENCE SET; Schema: public; Owner: kommonitor
--

SELECT pg_catalog.setval('public."GEORESOURCE_0_fid_seq"', 385, true);


--
-- Name: SPATIAL_UNIT_0_fid_seq; Type: SEQUENCE SET; Schema: public; Owner: kommonitor
--

SELECT pg_catalog.setval('public."SPATIAL_UNIT_0_fid_seq"', 1, true);


--
-- Name: SPATIAL_UNIT_1_fid_seq; Type: SEQUENCE SET; Schema: public; Owner: kommonitor
--

SELECT pg_catalog.setval('public."SPATIAL_UNIT_1_fid_seq"', 15, true);


--
-- Name: topology_id_seq; Type: SEQUENCE SET; Schema: topology; Owner: kommonitor
--

SELECT pg_catalog.setval('topology.topology_id_seq', 1, false);


--
-- Name: GEORESOURCE_0 GEORESOURCE_0_pkey; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public."GEORESOURCE_0"
    ADD CONSTRAINT "GEORESOURCE_0_pkey" PRIMARY KEY (fid);


--
-- Name: SPATIAL_UNIT_0 SPATIAL_UNIT_0_pkey; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public."SPATIAL_UNIT_0"
    ADD CONSTRAINT "SPATIAL_UNIT_0_pkey" PRIMARY KEY (fid);


--
-- Name: SPATIAL_UNIT_1 SPATIAL_UNIT_1_pkey; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public."SPATIAL_UNIT_1"
    ADD CONSTRAINT "SPATIAL_UNIT_1_pkey" PRIMARY KEY (fid);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: defaultclassificationmappingitemtype defaultclassificationmappingitemtype_pkey; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.defaultclassificationmappingitemtype
    ADD CONSTRAINT defaultclassificationmappingitemtype_pkey PRIMARY KEY (mappingid);


--
-- Name: georesourcereference georesourcereference_pkey; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.georesourcereference
    ADD CONSTRAINT georesourcereference_pkey PRIMARY KEY (entryid);


--
-- Name: gt_pk_metadata gt_pk_metadata_table_schema_table_name_pk_column_key; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.gt_pk_metadata
    ADD CONSTRAINT gt_pk_metadata_table_schema_table_name_pk_column_key UNIQUE (table_schema, table_name, pk_column);


--
-- Name: indicatorreference indicatorreference_pkey; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.indicatorreference
    ADD CONSTRAINT indicatorreference_pkey PRIMARY KEY (entryid);


--
-- Name: indicatorspatialunits indicatorspatialunits_pkey; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.indicatorspatialunits
    ADD CONSTRAINT indicatorspatialunits_pkey PRIMARY KEY (entryid);


--
-- Name: userinfo keycloakid_unique; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.userinfo
    ADD CONSTRAINT keycloakid_unique UNIQUE (keycloakid);


--
-- Name: lastmodification lastmodification_pkey; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.lastmodification
    ADD CONSTRAINT lastmodification_pkey PRIMARY KEY (id);


--
-- Name: metadatageoresources metadatageoresources_pkey; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.metadatageoresources
    ADD CONSTRAINT metadatageoresources_pkey PRIMARY KEY (datasetid);


--
-- Name: metadataindicators_defaultclassification metadataindicators_defaultclassification_mapping_id_key; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.metadataindicators_defaultclassification
    ADD CONSTRAINT metadataindicators_defaultclassification_mapping_id_key UNIQUE (mapping_id);


--
-- Name: metadataindicators metadataindicators_pkey; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.metadataindicators
    ADD CONSTRAINT metadataindicators_pkey PRIMARY KEY (datasetid);


--
-- Name: metadataindicators_regionalreferencevalues metadataindicators_regionalreferencevalues_mapping_id_key; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.metadataindicators_regionalreferencevalues
    ADD CONSTRAINT metadataindicators_regionalreferencevalues_mapping_id_key UNIQUE (mapping_id);


--
-- Name: metadataspatialunits metadataspatialunits_pkey; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.metadataspatialunits
    ADD CONSTRAINT metadataspatialunits_pkey PRIMARY KEY (datasetid);


--
-- Name: organizationalunits organizationalunits_keycloakid_key; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.organizationalunits
    ADD CONSTRAINT organizationalunits_keycloakid_key UNIQUE (keycloakid);


--
-- Name: organizationalunits organizationalunits_name_key; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.organizationalunits
    ADD CONSTRAINT organizationalunits_name_key UNIQUE (name);


--
-- Name: organizationalunits organizationalunits_pkey; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.organizationalunits
    ADD CONSTRAINT organizationalunits_pkey PRIMARY KEY (organizationalunitid);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (permissionid);


--
-- Name: regionalreferencevaluetype regionalreferencevaluetype_pkey; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.regionalreferencevaluetype
    ADD CONSTRAINT regionalreferencevaluetype_pkey PRIMARY KEY (mappingid);


--
-- Name: scriptinputparameters scriptinputparameters_pkey; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.scriptinputparameters
    ADD CONSTRAINT scriptinputparameters_pkey PRIMARY KEY (inputparameterid);


--
-- Name: scriptmetadata scriptmetadata_pkey; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.scriptmetadata
    ADD CONSTRAINT scriptmetadata_pkey PRIMARY KEY (scriptid);


--
-- Name: topics topics_pkey; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (topicid);


--
-- Name: topics_subtopics topics_subtopics_subtopics_topicid_key; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.topics_subtopics
    ADD CONSTRAINT topics_subtopics_subtopics_topicid_key UNIQUE (subtopics_topicid);


--
-- Name: userinfo userinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.userinfo
    ADD CONSTRAINT userinfo_pkey PRIMARY KEY (userinfoid, keycloakid);


--
-- Name: userinfo userinfoid_key; Type: CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.userinfo
    ADD CONSTRAINT userinfoid_key UNIQUE (userinfoid);


--
-- Name: spatial_GEORESOURCE_0_geometry; Type: INDEX; Schema: public; Owner: kommonitor
--

CREATE INDEX "spatial_GEORESOURCE_0_geometry" ON public."GEORESOURCE_0" USING gist (geometry);


--
-- Name: spatial_SPATIAL_UNIT_0_geometry; Type: INDEX; Schema: public; Owner: kommonitor
--

CREATE INDEX "spatial_SPATIAL_UNIT_0_geometry" ON public."SPATIAL_UNIT_0" USING gist (geometry);


--
-- Name: spatial_SPATIAL_UNIT_1_geometry; Type: INDEX; Schema: public; Owner: kommonitor
--

CREATE INDEX "spatial_SPATIAL_UNIT_1_geometry" ON public."SPATIAL_UNIT_1" USING gist (geometry);


--
-- Name: scripts_requiredindicators fk1i8b0onfvo84rvlcsk9ct2qgy; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.scripts_requiredindicators
    ADD CONSTRAINT fk1i8b0onfvo84rvlcsk9ct2qgy FOREIGN KEY (script_id) REFERENCES public.scriptmetadata(scriptid);


--
-- Name: indicatorspatialunits fk2ku1ipstuan4pp16i4h2qip0p; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.indicatorspatialunits
    ADD CONSTRAINT fk2ku1ipstuan4pp16i4h2qip0p FOREIGN KEY (indicatormetadataid) REFERENCES public.metadataindicators(datasetid);


--
-- Name: indicatorspatialunits_permissions fk2l0fpfwnn8u4k9dk5a8pixc89; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.indicatorspatialunits_permissions
    ADD CONSTRAINT fk2l0fpfwnn8u4k9dk5a8pixc89 FOREIGN KEY (indicatorspatialunit_id) REFERENCES public.indicatorspatialunits(entryid);


--
-- Name: organizationalunits fk3bm4ecg8sr4fyce8gpgcoifc2; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.organizationalunits
    ADD CONSTRAINT fk3bm4ecg8sr4fyce8gpgcoifc2 FOREIGN KEY (parent) REFERENCES public.organizationalunits(organizationalunitid);


--
-- Name: metadataspatialunits fk3j5hwqpw067o40i0pc5n7y81w; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.metadataspatialunits
    ADD CONSTRAINT fk3j5hwqpw067o40i0pc5n7y81w FOREIGN KEY (owner_organizationalunitid) REFERENCES public.organizationalunits(organizationalunitid);


--
-- Name: scripts_requiredgeoresources fk5ml1rn4axdld687al3cwy915o; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.scripts_requiredgeoresources
    ADD CONSTRAINT fk5ml1rn4axdld687al3cwy915o FOREIGN KEY (dataset_id) REFERENCES public.metadatageoresources(datasetid);


--
-- Name: indicatorspatialunits fk5qiyu7wg29c5u5gne280ha0h5; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.indicatorspatialunits
    ADD CONSTRAINT fk5qiyu7wg29c5u5gne280ha0h5 FOREIGN KEY (owner_organizationalunitid) REFERENCES public.organizationalunits(organizationalunitid);


--
-- Name: scripts_inputparameters fk76tojnk9a13moulj92abwtoie; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.scripts_inputparameters
    ADD CONSTRAINT fk76tojnk9a13moulj92abwtoie FOREIGN KEY (script_id) REFERENCES public.scriptmetadata(scriptid);


--
-- Name: metadataspatialunits_permissions fk7ls7o1jla5e9dldak6yrrqxdq; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.metadataspatialunits_permissions
    ADD CONSTRAINT fk7ls7o1jla5e9dldak6yrrqxdq FOREIGN KEY (permission_id) REFERENCES public.permissions(permissionid);


--
-- Name: organizationalunits fk7mscc9wm82n23nmirr394h0ne; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.organizationalunits
    ADD CONSTRAINT fk7mscc9wm82n23nmirr394h0ne FOREIGN KEY (mandant) REFERENCES public.organizationalunits(organizationalunitid);


--
-- Name: metadatageoresources_permissions fk87qg1sgxo3pcmo3189tlas2cu; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.metadatageoresources_permissions
    ADD CONSTRAINT fk87qg1sgxo3pcmo3189tlas2cu FOREIGN KEY (permission_id) REFERENCES public.permissions(permissionid);


--
-- Name: metadataspatialunits_permissions fk9d89b761lh3m7dn612cw06888; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.metadataspatialunits_permissions
    ADD CONSTRAINT fk9d89b761lh3m7dn612cw06888 FOREIGN KEY (metadataspatialunits_id) REFERENCES public.metadataspatialunits(datasetid);


--
-- Name: georesources_favourites fk_georesource_favourites_dataset; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.georesources_favourites
    ADD CONSTRAINT fk_georesource_favourites_dataset FOREIGN KEY (dataset_id) REFERENCES public.metadatageoresources(datasetid);


--
-- Name: georesources_favourites fk_georesource_favourites_userinfo; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.georesources_favourites
    ADD CONSTRAINT fk_georesource_favourites_userinfo FOREIGN KEY (user_id) REFERENCES public.userinfo(userinfoid);


--
-- Name: indicators_favourites fk_indicator_favourites_dataset; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.indicators_favourites
    ADD CONSTRAINT fk_indicator_favourites_dataset FOREIGN KEY (dataset_id) REFERENCES public.metadataindicators(datasetid);


--
-- Name: indicators_favourites fk_indicator_favourites_userinfo; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.indicators_favourites
    ADD CONSTRAINT fk_indicator_favourites_userinfo FOREIGN KEY (user_id) REFERENCES public.userinfo(userinfoid);


--
-- Name: topics_favourites fk_topics_favourites_topic; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.topics_favourites
    ADD CONSTRAINT fk_topics_favourites_topic FOREIGN KEY (topic_id) REFERENCES public.topics(topicid);


--
-- Name: topics_favourites fk_topics_favourites_userinfo; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.topics_favourites
    ADD CONSTRAINT fk_topics_favourites_userinfo FOREIGN KEY (user_id) REFERENCES public.userinfo(userinfoid);


--
-- Name: scripts_requiredindicators fka5k490rs0ck8ba60311vcw2ff; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.scripts_requiredindicators
    ADD CONSTRAINT fka5k490rs0ck8ba60311vcw2ff FOREIGN KEY (dataset_id) REFERENCES public.metadataindicators(datasetid);


--
-- Name: metadataindicators_defaultclassification fkaht0q849jrsr22wqslthqnvfu; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.metadataindicators_defaultclassification
    ADD CONSTRAINT fkaht0q849jrsr22wqslthqnvfu FOREIGN KEY (mapping_id) REFERENCES public.defaultclassificationmappingitemtype(mappingid);


--
-- Name: indicator_tags fkapilr4sy9fst78wiee6iy0oh2; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.indicator_tags
    ADD CONSTRAINT fkapilr4sy9fst78wiee6iy0oh2 FOREIGN KEY (dataset_id) REFERENCES public.metadataindicators(datasetid);


--
-- Name: topics_subtopics fkb49kmbcprv7266rvy6qhhuh3h; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.topics_subtopics
    ADD CONSTRAINT fkb49kmbcprv7266rvy6qhhuh3h FOREIGN KEY (main_topic_id) REFERENCES public.topics(topicid);


--
-- Name: scriptmetadata fkbnaoo122y2j9g0m9ymywf5rf2; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.scriptmetadata
    ADD CONSTRAINT fkbnaoo122y2j9g0m9ymywf5rf2 FOREIGN KEY (indicatorid) REFERENCES public.metadataindicators(datasetid);


--
-- Name: metadataindicators_regionalreferencevalues fkdot0sxkbo9b643qps9bjkbp36; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.metadataindicators_regionalreferencevalues
    ADD CONSTRAINT fkdot0sxkbo9b643qps9bjkbp36 FOREIGN KEY (mapping_id) REFERENCES public.regionalreferencevaluetype(mappingid);


--
-- Name: metadataindicators fkf7wi42jyhwx6yvdxgjwr84dam; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.metadataindicators
    ADD CONSTRAINT fkf7wi42jyhwx6yvdxgjwr84dam FOREIGN KEY (owner_organizationalunitid) REFERENCES public.organizationalunits(organizationalunitid);


--
-- Name: metadataindicators_permissions fkgm5resvbkqcle93avd0bhts8h; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.metadataindicators_permissions
    ADD CONSTRAINT fkgm5resvbkqcle93avd0bhts8h FOREIGN KEY (permission_id) REFERENCES public.permissions(permissionid);


--
-- Name: metadatageoresources fkhgfrv0npwlxkfadhhanw1e0dh; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.metadatageoresources
    ADD CONSTRAINT fkhgfrv0npwlxkfadhhanw1e0dh FOREIGN KEY (owner_organizationalunitid) REFERENCES public.organizationalunits(organizationalunitid);


--
-- Name: indicator_timestamps fkhuntisly758v07f1s0e0xjav0; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.indicator_timestamps
    ADD CONSTRAINT fkhuntisly758v07f1s0e0xjav0 FOREIGN KEY (dataset_id) REFERENCES public.metadataindicators(datasetid);


--
-- Name: scripts_inputparameters fkhvw7wqyhrcb6y2ymf6do9yquv; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.scripts_inputparameters
    ADD CONSTRAINT fkhvw7wqyhrcb6y2ymf6do9yquv FOREIGN KEY (inputparameter_id) REFERENCES public.scriptinputparameters(inputparameterid);


--
-- Name: metadatageoresources_permissions fkis8vhkd37va7ltxydm5y5weyi; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.metadatageoresources_permissions
    ADD CONSTRAINT fkis8vhkd37va7ltxydm5y5weyi FOREIGN KEY (metadatageoresources_id) REFERENCES public.metadatageoresources(datasetid);


--
-- Name: metadataindicators_permissions fkklghgtx2rtav334soqdo8as31; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.metadataindicators_permissions
    ADD CONSTRAINT fkklghgtx2rtav334soqdo8as31 FOREIGN KEY (metadataindicators_id) REFERENCES public.metadataindicators(datasetid);


--
-- Name: metadataindicators_regionalreferencevalues fklt1s456rj49ceb4ugy4wt48nh; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.metadataindicators_regionalreferencevalues
    ADD CONSTRAINT fklt1s456rj49ceb4ugy4wt48nh FOREIGN KEY (dataset_id) REFERENCES public.metadataindicators(datasetid);


--
-- Name: scripts_requiredgeoresources fkm2lpv28s8utghc3079dobulhk; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.scripts_requiredgeoresources
    ADD CONSTRAINT fkm2lpv28s8utghc3079dobulhk FOREIGN KEY (script_id) REFERENCES public.scriptmetadata(scriptid);


--
-- Name: indicatorspatialunits fkmphrkhhdqhmxomq0iji7euwtl; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.indicatorspatialunits
    ADD CONSTRAINT fkmphrkhhdqhmxomq0iji7euwtl FOREIGN KEY (spatialunitid) REFERENCES public.metadataspatialunits(datasetid);


--
-- Name: topics_subtopics fkppmweumhynwtfu7dv304o8oto; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.topics_subtopics
    ADD CONSTRAINT fkppmweumhynwtfu7dv304o8oto FOREIGN KEY (subtopics_topicid) REFERENCES public.topics(topicid);


--
-- Name: indicatorspatialunits_permissions fkpu4dye5vlufhimkqtyn5368eb; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.indicatorspatialunits_permissions
    ADD CONSTRAINT fkpu4dye5vlufhimkqtyn5368eb FOREIGN KEY (permission_id) REFERENCES public.permissions(permissionid);


--
-- Name: metadataindicators_defaultclassification fkq0us248wnb2j151csjtrkfa8n; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.metadataindicators_defaultclassification
    ADD CONSTRAINT fkq0us248wnb2j151csjtrkfa8n FOREIGN KEY (dataset_id) REFERENCES public.metadataindicators(datasetid);


--
-- Name: permissions fkrf83pb1ulbpvgjq14ndhy15nx; Type: FK CONSTRAINT; Schema: public; Owner: kommonitor
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT fkrf83pb1ulbpvgjq14ndhy15nx FOREIGN KEY (organizationalunit) REFERENCES public.organizationalunits(organizationalunitid);


--
-- PostgreSQL database dump complete
--

