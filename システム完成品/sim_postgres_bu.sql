--
-- PostgreSQL database dump
--

-- Dumped from database version 10.17
-- Dumped by pg_dump version 10.17

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO sim_admin;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO sim_admin;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO sim_admin;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO sim_admin;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO sim_admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO sim_admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO sim_admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO sim_admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO sim_admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO sim_admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: benchmas_cpubench; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.benchmas_cpubench (
    cpu_bench_id integer NOT NULL,
    cpu_name character varying(60) NOT NULL,
    passmark integer NOT NULL,
    core integer NOT NULL,
    thread integer NOT NULL,
    tdp integer NOT NULL,
    rated_clock double precision NOT NULL,
    max_clock double precision NOT NULL,
    list_price integer NOT NULL,
    cost_performance double precision NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.benchmas_cpubench OWNER TO sim_admin;

--
-- Name: benchmas_cpubench_cpu_bench_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.benchmas_cpubench_cpu_bench_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.benchmas_cpubench_cpu_bench_id_seq OWNER TO sim_admin;

--
-- Name: benchmas_cpubench_cpu_bench_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.benchmas_cpubench_cpu_bench_id_seq OWNED BY public.benchmas_cpubench.cpu_bench_id;


--
-- Name: benchmas_gpubench; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.benchmas_gpubench (
    gpu_bench_id integer NOT NULL,
    gpu_name character varying(60) NOT NULL,
    marktimespygraphics integer NOT NULL,
    tdp integer NOT NULL,
    cost_performance double precision NOT NULL,
    wattage_performance double precision NOT NULL,
    list_price integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.benchmas_gpubench OWNER TO sim_admin;

--
-- Name: benchmas_gpubench_gpu_bench_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.benchmas_gpubench_gpu_bench_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.benchmas_gpubench_gpu_bench_id_seq OWNER TO sim_admin;

--
-- Name: benchmas_gpubench_gpu_bench_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.benchmas_gpubench_gpu_bench_id_seq OWNED BY public.benchmas_gpubench.gpu_bench_id;


--
-- Name: bottleneckmas_bottleneck; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.bottleneckmas_bottleneck (
    bottleneck_id integer NOT NULL,
    cpu_name character varying(60) NOT NULL,
    gpu_name character varying(60) NOT NULL,
    balance smallint NOT NULL,
    wqhd smallint NOT NULL,
    four_k smallint NOT NULL,
    game_appropriate smallint NOT NULL,
    game_delivery smallint NOT NULL,
    video_editing smallint NOT NULL,
    encode smallint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.bottleneckmas_bottleneck OWNER TO sim_admin;

--
-- Name: bottleneckmas_bottleneck_bottleneck_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.bottleneckmas_bottleneck_bottleneck_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bottleneckmas_bottleneck_bottleneck_id_seq OWNER TO sim_admin;

--
-- Name: bottleneckmas_bottleneck_bottleneck_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.bottleneckmas_bottleneck_bottleneck_id_seq OWNED BY public.bottleneckmas_bottleneck.bottleneck_id;


--
-- Name: custom_user; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.custom_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    username character varying(8),
    employment_status smallint NOT NULL,
    name character varying(30),
    ruby_name character varying(30),
    tel_num character varying(13),
    gender smallint,
    birthday date,
    invalid_flg boolean,
    store_id integer
);


ALTER TABLE public.custom_user OWNER TO sim_admin;

--
-- Name: custom_user_groups; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.custom_user_groups (
    id integer NOT NULL,
    customuser_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.custom_user_groups OWNER TO sim_admin;

--
-- Name: custom_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.custom_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_user_groups_id_seq OWNER TO sim_admin;

--
-- Name: custom_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.custom_user_groups_id_seq OWNED BY public.custom_user_groups.id;


--
-- Name: custom_user_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.custom_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_user_id_seq OWNER TO sim_admin;

--
-- Name: custom_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.custom_user_id_seq OWNED BY public.custom_user.id;


--
-- Name: custom_user_user_permissions; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.custom_user_user_permissions (
    id integer NOT NULL,
    customuser_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.custom_user_user_permissions OWNER TO sim_admin;

--
-- Name: custom_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.custom_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_user_user_permissions_id_seq OWNER TO sim_admin;

--
-- Name: custom_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.custom_user_user_permissions_id_seq OWNED BY public.custom_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO sim_admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO sim_admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO sim_admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO sim_admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO sim_admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO sim_admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO sim_admin;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO sim_admin;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO sim_admin;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: earningmas_earninginfo; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.earningmas_earninginfo (
    earning_id integer NOT NULL,
    selling_price integer NOT NULL,
    sale_date date NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    employee_id integer NOT NULL,
    item_code character varying(9) NOT NULL,
    store_id integer NOT NULL
);


ALTER TABLE public.earningmas_earninginfo OWNER TO sim_admin;

--
-- Name: earningmas_earninginfo_earning_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.earningmas_earninginfo_earning_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.earningmas_earninginfo_earning_id_seq OWNER TO sim_admin;

--
-- Name: earningmas_earninginfo_earning_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.earningmas_earninginfo_earning_id_seq OWNED BY public.earningmas_earninginfo.earning_id;


--
-- Name: employeemas_employeeinfo; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.employeemas_employeeinfo (
    id integer NOT NULL,
    employee_id character varying(8),
    employment_status smallint NOT NULL,
    name character varying(30) NOT NULL,
    ruby_name character varying(30) NOT NULL,
    tel_num character varying(13) NOT NULL,
    gender smallint NOT NULL,
    birthday date NOT NULL,
    invalid_flg boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    lastlogin_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    store_id integer
);


ALTER TABLE public.employeemas_employeeinfo OWNER TO sim_admin;

--
-- Name: employeemas_employeeinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.employeemas_employeeinfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employeemas_employeeinfo_id_seq OWNER TO sim_admin;

--
-- Name: employeemas_employeeinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.employeemas_employeeinfo_id_seq OWNED BY public.employeemas_employeeinfo.id;


--
-- Name: itemmas_iteminfo; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.itemmas_iteminfo (
    item_code character varying(9) NOT NULL,
    model_number character varying(60) NOT NULL,
    category smallint NOT NULL,
    manufacturer_name character varying(30) NOT NULL,
    item_status smallint NOT NULL,
    purchase_price integer NOT NULL,
    item_image character varying(100),
    remarks text,
    created_at date NOT NULL,
    updated_at date NOT NULL,
    store_id integer NOT NULL
);


ALTER TABLE public.itemmas_iteminfo OWNER TO sim_admin;

--
-- Name: itemmas_itemspecification; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.itemmas_itemspecification (
    spec_id integer NOT NULL,
    model_number character varying(60) NOT NULL,
    cpu character varying(60) NOT NULL,
    hdd double precision NOT NULL,
    ssd smallint NOT NULL,
    monitor_size double precision NOT NULL,
    monitor_vertical smallint NOT NULL,
    monitor_horizon smallint NOT NULL,
    camera boolean NOT NULL,
    wifi boolean NOT NULL,
    optical_drive boolean NOT NULL,
    graphic character varying(40) NOT NULL,
    os character varying(40) NOT NULL,
    category smallint NOT NULL,
    memory smallint NOT NULL
);


ALTER TABLE public.itemmas_itemspecification OWNER TO sim_admin;

--
-- Name: itemmas_itemspecification_spec_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.itemmas_itemspecification_spec_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itemmas_itemspecification_spec_id_seq OWNER TO sim_admin;

--
-- Name: itemmas_itemspecification_spec_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.itemmas_itemspecification_spec_id_seq OWNED BY public.itemmas_itemspecification.spec_id;


--
-- Name: reserve_reserve; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.reserve_reserve (
    reserve_id integer NOT NULL,
    reserver_name character varying(20) NOT NULL,
    reserver_tel character varying(14) NOT NULL,
    reserve_at date NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    item_code character varying(9) NOT NULL,
    store_id integer NOT NULL,
    invalid_flg boolean NOT NULL
);


ALTER TABLE public.reserve_reserve OWNER TO sim_admin;

--
-- Name: reserve_reserve_reserve_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.reserve_reserve_reserve_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reserve_reserve_reserve_id_seq OWNER TO sim_admin;

--
-- Name: reserve_reserve_reserve_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.reserve_reserve_reserve_id_seq OWNED BY public.reserve_reserve.reserve_id;


--
-- Name: setitem_setitems; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.setitem_setitems (
    set_item_id integer NOT NULL,
    set_name character varying(30),
    created_at date NOT NULL,
    updated_at date NOT NULL,
    desktop character varying(9),
    hdd character varying(9),
    memory character varying(9),
    monitor character varying(9),
    notepc character varying(9),
    office character varying(9),
    others character varying(9),
    ssd character varying(9),
    store_id integer NOT NULL,
    counter smallint NOT NULL
);


ALTER TABLE public.setitem_setitems OWNER TO sim_admin;

--
-- Name: setitem_setitems_set_item_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.setitem_setitems_set_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.setitem_setitems_set_item_id_seq OWNER TO sim_admin;

--
-- Name: setitem_setitems_set_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.setitem_setitems_set_item_id_seq OWNED BY public.setitem_setitems.set_item_id;


--
-- Name: storemas_storeinfo; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.storemas_storeinfo (
    store_id integer NOT NULL,
    place_category smallint NOT NULL,
    store_name character varying(40) NOT NULL,
    address text NOT NULL,
    tel character varying(13) NOT NULL,
    invalid_flg boolean NOT NULL,
    created_at date NOT NULL,
    updated_at date NOT NULL
);


ALTER TABLE public.storemas_storeinfo OWNER TO sim_admin;

--
-- Name: storemas_storeinfo_store_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.storemas_storeinfo_store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.storemas_storeinfo_store_id_seq OWNER TO sim_admin;

--
-- Name: storemas_storeinfo_store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.storemas_storeinfo_store_id_seq OWNED BY public.storemas_storeinfo.store_id;


--
-- Name: workstatus_workstatus; Type: TABLE; Schema: public; Owner: sim_admin
--

CREATE TABLE public.workstatus_workstatus (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    store_id integer NOT NULL
);


ALTER TABLE public.workstatus_workstatus OWNER TO sim_admin;

--
-- Name: workstatus_workstatus_id_seq; Type: SEQUENCE; Schema: public; Owner: sim_admin
--

CREATE SEQUENCE public.workstatus_workstatus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workstatus_workstatus_id_seq OWNER TO sim_admin;

--
-- Name: workstatus_workstatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sim_admin
--

ALTER SEQUENCE public.workstatus_workstatus_id_seq OWNED BY public.workstatus_workstatus.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: benchmas_cpubench cpu_bench_id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.benchmas_cpubench ALTER COLUMN cpu_bench_id SET DEFAULT nextval('public.benchmas_cpubench_cpu_bench_id_seq'::regclass);


--
-- Name: benchmas_gpubench gpu_bench_id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.benchmas_gpubench ALTER COLUMN gpu_bench_id SET DEFAULT nextval('public.benchmas_gpubench_gpu_bench_id_seq'::regclass);


--
-- Name: bottleneckmas_bottleneck bottleneck_id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.bottleneckmas_bottleneck ALTER COLUMN bottleneck_id SET DEFAULT nextval('public.bottleneckmas_bottleneck_bottleneck_id_seq'::regclass);


--
-- Name: custom_user id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.custom_user ALTER COLUMN id SET DEFAULT nextval('public.custom_user_id_seq'::regclass);


--
-- Name: custom_user_groups id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.custom_user_groups ALTER COLUMN id SET DEFAULT nextval('public.custom_user_groups_id_seq'::regclass);


--
-- Name: custom_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.custom_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.custom_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: earningmas_earninginfo earning_id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.earningmas_earninginfo ALTER COLUMN earning_id SET DEFAULT nextval('public.earningmas_earninginfo_earning_id_seq'::regclass);


--
-- Name: employeemas_employeeinfo id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.employeemas_employeeinfo ALTER COLUMN id SET DEFAULT nextval('public.employeemas_employeeinfo_id_seq'::regclass);


--
-- Name: itemmas_itemspecification spec_id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.itemmas_itemspecification ALTER COLUMN spec_id SET DEFAULT nextval('public.itemmas_itemspecification_spec_id_seq'::regclass);


--
-- Name: reserve_reserve reserve_id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.reserve_reserve ALTER COLUMN reserve_id SET DEFAULT nextval('public.reserve_reserve_reserve_id_seq'::regclass);


--
-- Name: setitem_setitems set_item_id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.setitem_setitems ALTER COLUMN set_item_id SET DEFAULT nextval('public.setitem_setitems_set_item_id_seq'::regclass);


--
-- Name: storemas_storeinfo store_id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.storemas_storeinfo ALTER COLUMN store_id SET DEFAULT nextval('public.storemas_storeinfo_store_id_seq'::regclass);


--
-- Name: workstatus_workstatus id; Type: DEFAULT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.workstatus_workstatus ALTER COLUMN id SET DEFAULT nextval('public.workstatus_workstatus_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.auth_group (id, name) FROM stdin;
1	管理者
2	店長
3	従業員
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	1	10
11	1	11
12	1	12
13	1	13
14	1	14
15	1	15
16	1	16
17	1	17
18	1	18
19	1	19
20	1	20
21	1	21
22	1	22
23	1	23
24	1	24
25	1	25
26	1	26
27	1	27
28	1	28
29	1	29
30	1	30
31	1	31
32	1	32
33	1	33
34	1	34
35	1	35
36	1	36
37	1	37
38	1	38
39	1	39
40	1	40
41	1	41
42	1	42
43	1	43
44	1	44
45	1	45
46	1	46
47	1	47
48	1	48
49	1	49
50	1	50
51	1	51
52	1	52
53	1	53
54	1	54
55	1	55
56	1	56
57	1	57
58	1	58
59	1	59
60	1	60
61	1	61
62	1	62
63	1	63
64	1	64
65	1	65
66	1	66
67	1	67
68	1	68
69	1	69
70	1	70
71	1	71
72	1	72
73	1	73
74	1	74
75	1	75
76	1	76
77	1	77
78	1	78
79	1	79
80	1	80
81	2	1
82	2	2
83	2	3
84	2	4
85	2	5
86	2	6
87	2	7
88	2	8
89	2	9
90	2	10
91	2	11
92	2	12
93	2	13
94	2	14
95	2	15
96	2	16
97	2	17
98	2	18
99	2	19
100	2	20
101	2	21
102	2	22
103	2	23
104	2	24
105	2	25
106	2	26
107	2	27
108	2	28
109	2	29
110	2	30
111	2	31
112	2	32
113	2	33
114	2	34
115	2	35
116	2	36
117	2	37
118	2	38
119	2	39
120	2	40
121	2	41
122	2	42
123	2	43
124	2	44
125	2	45
126	2	46
127	2	47
128	2	48
129	2	49
130	2	50
131	2	51
132	2	52
133	2	53
134	2	54
135	2	55
136	2	56
137	2	57
138	2	58
139	2	59
140	2	60
141	2	61
142	2	62
143	2	63
144	2	64
145	2	65
146	2	66
147	2	67
148	2	68
149	2	69
150	2	70
151	2	71
152	2	72
153	2	73
154	2	74
155	2	75
156	2	76
157	2	77
158	2	78
159	2	79
160	2	80
161	3	1
162	3	2
163	3	3
164	3	4
165	3	5
166	3	6
167	3	7
168	3	8
169	3	9
170	3	10
171	3	11
172	3	12
173	3	13
174	3	14
175	3	15
176	3	16
177	3	17
178	3	18
179	3	19
180	3	20
181	3	21
182	3	22
183	3	23
184	3	24
185	3	25
186	3	26
187	3	27
188	3	28
189	3	29
190	3	30
191	3	31
192	3	32
193	3	33
194	3	34
195	3	35
196	3	36
197	3	37
198	3	38
199	3	39
200	3	40
201	3	41
202	3	42
203	3	43
204	3	44
205	3	45
206	3	46
207	3	47
208	3	48
209	3	49
210	3	50
211	3	51
212	3	52
213	3	53
214	3	54
215	3	55
216	3	56
217	3	57
218	3	58
219	3	59
220	3	60
221	3	61
222	3	62
223	3	63
224	3	64
225	3	65
226	3	66
227	3	67
228	3	68
229	3	69
230	3	70
231	3	71
232	3	72
233	3	73
234	3	74
235	3	75
236	3	76
237	3	77
238	3	78
239	3	79
240	3	80
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_customuser
22	Can change user	6	change_customuser
23	Can delete user	6	delete_customuser
24	Can view user	6	view_customuser
25	Can add employee info	7	add_employeeinfo
26	Can change employee info	7	change_employeeinfo
27	Can delete employee info	7	delete_employeeinfo
28	Can view employee info	7	view_employeeinfo
29	Can add store info	8	add_storeinfo
30	Can change store info	8	change_storeinfo
31	Can delete store info	8	delete_storeinfo
32	Can view store info	8	view_storeinfo
33	Can add item specification	9	add_itemspecification
34	Can change item specification	9	change_itemspecification
35	Can delete item specification	9	delete_itemspecification
36	Can view item specification	9	view_itemspecification
37	Can add item info	10	add_iteminfo
38	Can change item info	10	change_iteminfo
39	Can delete item info	10	delete_iteminfo
40	Can view item info	10	view_iteminfo
41	Can add earning info	11	add_earninginfo
42	Can change earning info	11	change_earninginfo
43	Can delete earning info	11	delete_earninginfo
44	Can view earning info	11	view_earninginfo
45	Can add cpu bench	12	add_cpubench
46	Can change cpu bench	12	change_cpubench
47	Can delete cpu bench	12	delete_cpubench
48	Can view cpu bench	12	view_cpubench
49	Can add gpu bench	13	add_gpubench
50	Can change gpu bench	13	change_gpubench
51	Can delete gpu bench	13	delete_gpubench
52	Can view gpu bench	13	view_gpubench
53	Can add bottleneck	14	add_bottleneck
54	Can change bottleneck	14	change_bottleneck
55	Can delete bottleneck	14	delete_bottleneck
56	Can view bottleneck	14	view_bottleneck
57	Can add set items	15	add_setitems
58	Can change set items	15	change_setitems
59	Can delete set items	15	delete_setitems
60	Can view set items	15	view_setitems
61	Can add reserve	16	add_reserve
62	Can change reserve	16	change_reserve
63	Can delete reserve	16	delete_reserve
64	Can view reserve	16	view_reserve
65	Can add work status	17	add_workstatus
66	Can change work status	17	change_workstatus
67	Can delete work status	17	delete_workstatus
68	Can view work status	17	view_workstatus
69	Can add site	18	add_site
70	Can change site	18	change_site
71	Can delete site	18	delete_site
72	Can view site	18	view_site
73	Can add email address	19	add_emailaddress
74	Can change email address	19	change_emailaddress
75	Can delete email address	19	delete_emailaddress
76	Can view email address	19	view_emailaddress
77	Can add email confirmation	20	add_emailconfirmation
78	Can change email confirmation	20	change_emailconfirmation
79	Can delete email confirmation	20	delete_emailconfirmation
80	Can view email confirmation	20	view_emailconfirmation
\.


--
-- Data for Name: benchmas_cpubench; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.benchmas_cpubench (cpu_bench_id, cpu_name, passmark, core, thread, tdp, rated_clock, max_clock, list_price, cost_performance, created_at, updated_at) FROM stdin;
3	Ryzen 9 3950X	39314	16	32	105	3.5	4.70000000000000018	73000	0.540000000000000036	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
4	Core i9 12900K	38462	16	24	125	3.20000000000000018	5.09999999999999964	79800	0.479999999999999982	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
5	Core i9 12900KF	38462	16	24	125	3.20000000000000018	5.09999999999999964	76800	0.5	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
6	Ryzen 9 5900	35253	12	24	65	3	4.70000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
8	Ryzen 9 3900X	32858	12	24	105	3.79999999999999982	4.59999999999999964	58000	0.569999999999999951	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
9	Ryzen 9 3900	30939	12	24	65	3.10000000000000009	4.29999999999999982	59000	0.520000000000000018	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
10	Core i7 12700K	29989	12	20	125	3.60000000000000009	4.90000000000000036	58000	0.520000000000000018	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
11	Core i7 12700KF	29989	12	20	125	3.60000000000000009	4.90000000000000036	53000	0.569999999999999951	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
12	Ryzen 7 5800X	28379	8	16	105	3.79999999999999982	4.70000000000000018	59000	0.479999999999999982	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
13	Ryzen 7 5800	25958	8	16	65	3.39999999999999991	4.59999999999999964	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
14	Core i9 11900KF	25611	8	16	125	3.5	5.29999999999999982	65000	0.390000000000000013	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
15	Core i9 11900K	25575	8	16	125	3.5	5.29999999999999982	72000	0.359999999999999987	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
16	Ryzen 7 PRO 5750G	25562	8	16	65	3.79999999999999982	4.59999999999999964	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
17	Core i7 11700K	25194	8	16	125	3.60000000000000009	5	49000	0.510000000000000009	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
18	Ryzen 7 5700G	24754	8	16	65	3.79999999999999982	4.59999999999999964	51800	0.479999999999999982	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
19	Core i5 12600K	24612	10	16	125	3.70000000000000018	4.90000000000000036	39000	0.630000000000000004	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
20	Core i5 12600KF	24612	10	16	125	3.70000000000000018	4.90000000000000036	37000	0.67000000000000004	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
21	Core i7 11700KF	24458	8	16	125	3.60000000000000009	5	46000	0.530000000000000027	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
22	Ryzen 7 3800XT	24294	8	16	105	3.89999999999999991	4.70000000000000018	52000	0.469999999999999973	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
23	Core i9 10900K	24046	10	20	125	3.70000000000000018	5.29999999999999982	55000	0.440000000000000002	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
24	Core i9 11900F	23815	8	16	65	2.5	5.20000000000000018	50000	0.479999999999999982	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
25	Core i9 10900KF	23704	10	20	125	3.70000000000000018	5.29999999999999982	51000	0.46000000000000002	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
26	Core i9 11900	23533	8	16	65	2.5	5.20000000000000018	53000	0.440000000000000002	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
27	Ryzen 7 3800X	23340	8	16	105	3.89999999999999991	4.5	45000	0.520000000000000018	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
28	Core i9 10850K	22992	10	20	125	3.60000000000000009	5.09999999999999964	46000	0.5	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
29	Ryzen 7 3700X	22711	8	16	65	3.60000000000000009	4.40000000000000036	40000	0.569999999999999951	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
30	Ryzen 5 5600X	22596	6	12	65	3.70000000000000018	4.59999999999999964	39500	0.569999999999999951	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
31	Ryzen 7 4700G	21667	8	16	65	3.60000000000000009	4.40000000000000036	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
32	Core i7 11700F	21485	8	16	65	2.5	4.90000000000000036	39000	0.550000000000000044	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
33	Core i7 11700	21110	8	16	65	2.5	4.90000000000000036	41000	0.510000000000000009	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
34	Ryzen 5 PRO 5650G	21087	6	12	65	3.89999999999999991	4.40000000000000036	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
35	Core i9 10900	21045	10	20	65	2.79999999999999982	5.20000000000000018	47000	0.450000000000000011	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
36	Ryzen 7 PRO 4750G	20999	8	16	65	3.60000000000000009	4.40000000000000036	44000	0.479999999999999982	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
37	Core i9 10900F	20939	10	20	65	2.79999999999999982	5.20000000000000018	46000	0.46000000000000002	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
38	Ryzen 5 5600G	20247	6	12	65	3.89999999999999991	4.40000000000000036	36800	0.550000000000000044	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
39	Core i9 9900KS	19980	8	16	127	4	5	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
40	Ryzen 7 PRO 4750GE	19810	8	16	35	3.10000000000000009	4.29999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
41	Core i5 11600K	19740	6	12	125	3.89999999999999991	4.90000000000000036	32000	0.619999999999999996	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
42	Core i5 11600KF	19740	6	12	125	3.89999999999999991	4.90000000000000036	34000	0.57999999999999996	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
43	Core i7 10700K	19701	8	16	125	3.79999999999999982	5.09999999999999964	40000	0.489999999999999991	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
44	Core i7 10700KF	19701	8	16	125	3.79999999999999982	5.09999999999999964	38000	0.520000000000000018	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
45	Ryzen 5 3600XT	19021	6	12	95	3.79999999999999982	4.5	33000	0.57999999999999996	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
46	Core i9 9900K	18913	8	16	95	3.60000000000000009	5	50000	0.380000000000000004	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
47	Core i9 9900KF	18768	8	16	95	3.60000000000000009	5	48000	0.390000000000000013	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
48	Ryzen 5 3600X	18332	6	12	95	3.79999999999999982	4.40000000000000036	30000	0.609999999999999987	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
49	Core i7 10700	18089	8	16	65	2.89999999999999991	4.79999999999999982	35000	0.520000000000000018	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
50	Core i7 10700F	18089	8	16	65	2.89999999999999991	4.79999999999999982	31000	0.57999999999999996	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
51	Core i5 11500	18039	6	12	65	2.70000000000000018	4.59999999999999964	28000	0.640000000000000013	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
52	Ryzen 5 3600	17781	6	12	65	3.60000000000000009	4.20000000000000018	25000	0.709999999999999964	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
53	AMD 4700S	17756	8	16	65	3.60000000000000009	4	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
54	Core i5 11400	17629	6	12	65	2.60000000000000009	4.40000000000000036	25000	0.709999999999999964	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
55	Core i5 11400F	17629	6	12	65	2.60000000000000009	4.40000000000000036	21000	0.839999999999999969	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
56	Ryzen 7 2700X	17618	8	16	105	3.70000000000000018	4.29999999999999982	29000	0.609999999999999987	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
57	Core i9 9900	17264	8	16	65	3.10000000000000009	5	46000	0.380000000000000004	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
58	Ryzen 5 4600G	17197	6	12	65	3.70000000000000018	4.20000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
59	Ryzen 5 PRO 4650G	17086	6	12	65	3.70000000000000018	4.20000000000000018	30000	0.569999999999999951	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
60	Ryzen 7 1800X	16133	8	16	95	3.60000000000000009	4	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
61	Ryzen 5 PRO 4650GE	16070	6	12	35	3.29999999999999982	4.20000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
62	Ryzen 7 2700	15725	8	16	65	3.20000000000000018	4.09999999999999964	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
63	Ryzen 7 1700X	15573	8	16	95	3.39999999999999991	3.79999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
64	Core i5 10600K	15155	6	12	125	4.09999999999999964	4.79999999999999982	28000	0.540000000000000036	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
65	Core i5 10600KF	15155	6	12	125	4.09999999999999964	4.79999999999999982	27000	0.560000000000000053	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
66	Apple M1 (Rosetta 2)	15138	8	8	15	3.20000000000000018	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
67	Core i7 8086K	14705	6	12	95	4	5	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
68	Core i7 9700K	14673	8	8	95	3.60000000000000009	4.90000000000000036	37000	0.400000000000000022	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
69	Core i7 9700KF	14595	8	8	95	3.60000000000000009	4.90000000000000036	37000	0.390000000000000013	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
70	Ryzen 7 1700	14331	8	16	65	3	3.70000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
1	Ryzen 9 5950X	46132	16	32	105	3.39999999999999991	4.90000000000000036	106500	0.429999999999999993	2021-11-12 12:14:00+09	2022-02-16 18:32:37.850917+09
7	Ryzen 9 3900XT	32898	12	24	105	3.79999999999999982	4.70000000000000018	60000	0.550000000000000044	2021-11-12 12:14:00+09	2022-02-07 14:13:50.869374+09
71	Ryzen 5 2600X	14185	6	12	95	3.60000000000000009	4.20000000000000018	21000	0.680000000000000049	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
72	Core i7 9700F	14129	8	8	65	3	4.70000000000000018	32000	0.440000000000000002	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
73	Core i5 10600	14039	6	12	65	3.29999999999999982	4.79999999999999982	27000	0.520000000000000018	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
74	Ryzen 3 PRO 5350G	14025	4	8	65	4	4.20000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
75	Core i9 9900T	13993	8	16	35	2.10000000000000009	4.40000000000000036	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
76	Ryzen 3 5300G	13932	4	8	65	4	4.20000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
77	Core i7 9700	13913	8	8	65	3	4.70000000000000018	32000	0.429999999999999993	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
78	Core i7 8700K	13865	6	12	95	3.70000000000000018	4.70000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
79	Ryzen 5 3500X	13428	6	6	65	3.60000000000000009	4.09999999999999964	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
80	Core i5 10500	13321	6	12	65	3.10000000000000009	4.5	23000	0.57999999999999996	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
81	Core i7 8700	13319	6	12	65	3.20000000000000018	4.59999999999999964	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
82	Ryzen 5 2600	13306	6	12	65	3.39999999999999991	3.89999999999999991	17000	0.780000000000000027	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
83	Core i5 10400	13073	6	12	65	2.89999999999999991	4.29999999999999982	19000	0.689999999999999947	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
84	Core i5 10400F	13073	6	12	65	2.89999999999999991	4.29999999999999982	18000	0.729999999999999982	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
85	Ryzen 5 1600X	13065	6	12	95	3.29999999999999982	4	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
86	Ryzen 5 1600 AF	13000	6	12	65	3.20000000000000018	3.60000000000000009	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
87	Ryzen 3 3300X	12920	4	8	65	3.79999999999999982	4.29999999999999982	15500	0.82999999999999996	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
88	Ryzen 5 3500	12627	6	6	65	3.60000000000000009	4.09999999999999964	16000	0.790000000000000036	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
89	Ryzen 5 1600	12547	6	12	65	3.20000000000000018	3.60000000000000009	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
90	Ryzen 3 3100	11757	4	8	65	3.60000000000000009	3.89999999999999991	13000	0.900000000000000022	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
91	Ryzen 3 4300G	11714	4	8	65	3.79999999999999982	4	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
92	Ryzen 3 PRO 4350G	11446	4	8	65	3.79999999999999982	4	22000	0.520000000000000018	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
93	Core i7 9700T	10972	8	8	35	2	4.29999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
94	Core i5 9600K	10876	6	6	95	3.70000000000000018	4.59999999999999964	26000	0.419999999999999984	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
95	Core i5 9600KF	10857	6	6	95	3.70000000000000018	4.59999999999999964	23000	0.469999999999999973	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
96	Core i7 8700T	10830	6	12	35	2.39999999999999991	4	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
97	Core i5 9600	10200	6	6	65	3.10000000000000009	4.59999999999999964	26000	0.390000000000000013	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
98	Core i5 8600K	10172	6	6	95	3.60000000000000009	4.29999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
99	Core i5 8600	10058	6	6	65	3.10000000000000009	4.29999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
100	Core i7 7700K	9794	4	8	95	4.20000000000000018	4.5	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
101	Core i5 9500	9692	6	6	65	3	4.40000000000000036	23000	0.419999999999999984	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
102	Core i5 9400F	9616	6	6	65	2.89999999999999991	4.09999999999999964	18000	0.530000000000000027	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
103	Core i5 9400	9482	6	6	65	2.89999999999999991	4.09999999999999964	20000	0.469999999999999973	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
104	Ryzen 5 3400G	9425	4	8	65	3.70000000000000018	4.20000000000000018	20500	0.46000000000000002	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
105	Core i3 10300	9381	4	8	65	3.70000000000000018	4.40000000000000036	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
106	Core i5 8500	9370	6	6	65	3	4.09999999999999964	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
107	Core i5 8400	9262	6	6	65	2.79999999999999982	4	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
108	Core i3 10105F	9070	4	8	65	3.70000000000000018	4.40000000000000036	12000	0.760000000000000009	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
109	Core i3 10105	9070	4	8	65	3.70000000000000018	4.40000000000000036	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
110	Core i7 6700K	9061	4	8	95	4	4.20000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
111	Ryzen 5 1500X	8982	4	8	65	3.5	3.70000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
112	Core i3 10100	8932	4	8	65	3.60000000000000009	4.29999999999999982	14000	0.640000000000000013	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
113	Ryzen 5 2400G	8913	4	8	65	3.60000000000000009	3.89999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
114	Core i3 10100F	8730	4	8	65	3.60000000000000009	4.29999999999999982	11000	0.790000000000000036	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
115	Core i7 7700	8657	4	8	65	3.60000000000000009	4.20000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
116	Ryzen 5 3400GE	8565	4	8	35	3.29999999999999982	4	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
117	Core i7 4790K	8151	4	8	88	4	4.40000000000000036	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
118	Core i7 6700	8108	4	8	65	3.39999999999999991	4	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
119	Core i7 7700T	7989	4	8	35	2.89999999999999991	3.79999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
120	Core i7 7820HK	7958	4	8	45	2.89999999999999991	3.89999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
121	Ryzen 5 1400	7935	4	8	65	3.20000000000000018	3.39999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
122	Core i5 8400T	7764	6	6	35	1.69999999999999996	3.29999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
123	Core i7 5775C	7747	4	8	65	3.29999999999999982	3.70000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
124	Core i5 9400T	7683	6	6	35	1.80000000000000004	3.39999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
125	Ryzen 3 3200GE	7631	4	4	35	3.29999999999999982	3.79999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
126	Core i7 6700T	7417	4	8	35	2.79999999999999982	3.60000000000000009	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
127	Ryzen 3 3200G	7271	4	4	65	3.60000000000000009	4	13000	0.560000000000000053	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
128	Core i7 990X	7247	6	12	130	3.4700000000000002	3.72999999999999998	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
129	Core i7 4790	7207	4	8	84	3.60000000000000009	4	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
130	Ryzen 3 1300X	7161	4	4	65	3.20000000000000018	3.70000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
131	Core i7 4770	7074	4	8	84	3.39999999999999991	3.89999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
132	Core i7 7700HQ	6908	4	8	45	2.79999999999999982	3.79999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
133	Core i3 8350K	6833	4	4	91	4	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
134	Core i3 9100F	6808	4	4	65	3.60000000000000009	4.20000000000000018	10000	0.680000000000000049	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
135	FX-9590	6798	8	8	220	4.70000000000000018	5	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
136	Core i7 4770S	6786	4	8	65	3.10000000000000009	3.89999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
137	Ryzen 3 2200G	6785	4	4	65	3.20000000000000018	3.70000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
138	Core i5 7600K	6731	4	4	91	3.79999999999999982	4.20000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
139	Core i7 4790S	6676	4	8	65	3.20000000000000018	4	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
140	Core i5 7600	6629	4	4	65	3.5	4.09999999999999964	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
141	Core i3 8300	6512	4	4	62	3.70000000000000018	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
142	Core i7 6700HQ	6488	4	8	45	2.60000000000000009	3.5	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
143	Core i7 3770K	6409	4	8	77	3.5	3.89999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
144	Core i7 3770	6371	4	8	77	3.39999999999999991	3.89999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
145	Ryzen 3 1200	6304	4	4	65	3.10000000000000009	3.39999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
146	Core i5 6600K	6258	4	4	91	3.5	3.89999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
147	Core i5 7600T	6252	4	4	35	2.79999999999999982	3.70000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
148	Core i3 8100	6250	4	4	65	3.60000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
149	Core i3 8100F	6250	4	4	65	3.60000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
150	Core i7 3770S	6231	4	8	65	3.10000000000000009	3.89999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
151	Core i5 7500	6210	4	4	65	3.39999999999999991	3.79999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
152	Core i5 6600	6171	4	4	65	3.29999999999999982	3.89999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
153	FX-8370	6162	8	8	95	3.29999999999999982	4.20000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
154	FX-9370	5969	8	8	220	4.40000000000000036	4.70000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
155	FX-8350	5929	8	8	125	4	4.20000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
156	Core i5 5675C	5900	4	4	65	3.10000000000000009	3.60000000000000009	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
157	Core i5 6500	5700	4	4	65	3.20000000000000018	3.60000000000000009	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
158	Core i5 4690	5585	4	4	84	3.5	3.89999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
159	Core i5 4690K	5562	4	4	88	3.5	3.89999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
160	Core i7 4785T	5508	4	8	35	2.20000000000000018	3.20000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
161	Core i7 2700K	5496	4	8	95	3.5	3.89999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
162	Core i5 7400	5498	4	4	65	3	3.5	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
163	Core i5 4670	5466	4	4	84	3.39999999999999991	3.79999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
164	Core i7 2600K	5460	4	8	95	3.39999999999999991	3.79999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
165	Core i5 7500T	5432	4	4	35	2.70000000000000018	3.29999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
166	Core i7 2600	5352	4	8	95	3.39999999999999991	3.79999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
167	Core i5 4590	5291	4	4	84	3.29999999999999982	3.70000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
168	Core i5 4690S	5285	4	4	65	3.20000000000000018	3.89999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
169	FX-8300	5279	8	8	95	3.29999999999999982	4.20000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
170	FX-8320	5253	8	8	125	3.5	4	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
171	Core i5 4590S	5196	4	4	65	3	3.70000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
172	Core i5 4570	5126	4	4	84	3.20000000000000018	3.60000000000000009	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
173	Core i5 6400	5105	4	4	65	2.70000000000000018	3.29999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
174	Core i3 7350K	5100	2	4	60	4.20000000000000018	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
175	Core i5 4570S	5013	4	4	65	2.89999999999999991	3.60000000000000009	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
176	FX-8370E	5006	8	8	95	3.29999999999999982	4.29999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
177	FX-8320E	4973	8	8	95	3.20000000000000018	4	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
178	Core i5 6500T	4969	4	4	35	2.5	3.10000000000000009	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
179	Core i3 7320	4936	2	4	51	4.09999999999999964	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
180	Core i3 7300	4927	2	4	51	4	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
181	Core i5 3570	4911	4	4	77	3.39999999999999991	3.79999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
182	Core i5 4460	4773	4	4	84	3.20000000000000018	3.39999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
183	Athlon 240GE	4752	2	4	35	3.5	0	9000	0.530000000000000027	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
184	Core i3 6320	4672	2	4	51	3.89999999999999991	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
185	Core i5 3470	4668	4	4	77	3.20000000000000018	3.60000000000000009	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
186	Core i7 4712HQ	4666	4	8	37	2.29999999999999982	3.29999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
187	Core i5 4430	4660	4	4	84	3	3.20000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
188	Athlon 3000G	4617	2	4	35	3.5	0	7800	0.589999999999999969	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
189	Core i5 4440	4588	4	4	84	3.10000000000000009	3.29999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
190	Core i5 6400T	4540	4	4	35	2.20000000000000018	2.79999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
191	Pentium Gold G6605	4536	2	4	58	4.29999999999999982	0	11500	0.390000000000000013	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
192	Core i3 6300	4508	2	4	51	3.79999999999999982	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
193	Core i5 7400T	4472	4	4	35	2.39999999999999991	3	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
194	Athlon 220GE	4472	2	4	35	3.39999999999999991	0	8400	0.530000000000000027	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
195	Core i5 3450	4440	4	4	77	3.10000000000000009	3.5	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
196	Core i7 2600S	4430	4	8	65	2.79999999999999982	3.79999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
197	Core i5 4440S	4406	4	4	65	2.79999999999999982	3.29999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
198	Core i3 7100	4366	2	4	51	3.89999999999999991	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
199	Core i5 4430S	4320	4	4	65	2.70000000000000018	3.20000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
200	Core i5 3470S	4304	4	4	65	2.89999999999999991	3.60000000000000009	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
201	Pentium Gold G6400	4271	2	4	58	4	0	6800	0.630000000000000004	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
202	Core i3 6100	4183	2	4	51	3.70000000000000018	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
203	Core i5 4590T	4146	4	4	35	2	3	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
204	Athlon 200GE	4138	2	4	35	3.20000000000000018	0	7000	0.589999999999999969	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
205	Core i3 6098P	4133	2	4	54	3.60000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
206	FX-6300	4110	6	6	95	3.5	4.09999999999999964	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
207	Core i5 2500K	4097	4	4	95	3.29999999999999982	3.70000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
208	Core i5 3330	4091	4	4	77	3	3.20000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
209	Core i3 6300T	4057	2	4	35	3.29999999999999982	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
210	Pentium G5500	3984	2	4	54	3.79999999999999982	0	9400	0.419999999999999984	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
211	Core i3 4370	3956	2	4	54	3.79999999999999982	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
212	Pentium G4620	3932	2	4	51	3.70000000000000018	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
213	Pentium G5600	3880	2	4	54	3.89999999999999991	0	8200	0.469999999999999973	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
214	Core i5 3330S	3828	4	4	65	2.70000000000000018	3.20000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
215	Pentium G5420	3801	2	4	54	3.79999999999999982	0	6900	0.550000000000000044	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
216	Core i5 2400	3799	4	4	95	3.10000000000000009	3.39999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
217	Core i3 7100T	3732	2	4	35	3.39999999999999991	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
218	Pentium G5400	3705	2	4	54	3.70000000000000018	0	6900	0.540000000000000036	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
219	Athlon X4 880K	3705	4	4	95	4	4.20000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
220	Core i3 6100T	3663	2	4	35	3.20000000000000018	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
221	Core i3 4170	3645	2	4	54	3.70000000000000018	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
222	Core i5 4460T	3627	4	4	35	1.89999999999999991	2.70000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
223	A10-7870K	3612	4	4	95	3.89999999999999991	4.09999999999999964	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
224	A10-7890K	3611	4	4	95	4.09999999999999964	4.29999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
225	Core i5 2320	3605	4	4	95	3	3.29999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
226	Core i5 2310	3592	4	4	95	2.89999999999999991	3.20000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
227	Core i3 4360	3584	2	4	54	3.70000000000000018	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
228	Pentium G4560	3575	2	4	54	3.5	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
229	Pentium G4600	3509	2	4	51	3.60000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
230	Core i3 4160	3449	2	4	54	3.60000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
231	A10-8750	3445	4	4	65	3.60000000000000009	4	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
232	Core i3 4150	3377	2	4	54	3.5	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
233	A8-7670K	3360	4	4	95	3.60000000000000009	3.89999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
234	A12-9800E	3289	4	4	35	3.10000000000000009	3.79999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
235	A10-9700E	3267	4	4	35	3	3.5	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
236	Core i3 4130	3266	2	4	54	3.39999999999999991	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
237	Phenom II X6 1065T	3230	6	6	95	2.89999999999999991	3.39999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
238	Core i5 2400S	3223	4	4	65	2.5	3.29999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
239	Core i7 960	3197	4	8	130	3.20000000000000018	3.45999999999999996	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
240	A8-7600	3194	4	4	65	3.10000000000000009	3.79999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
241	A10-7860K	3183	4	4	65	3.60000000000000009	4	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
242	Celeron J4125	3175	4	4	10	2	2.70000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
243	A10-7700K	3171	4	4	95	3.39999999999999991	3.79999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
244	Pentium Silver J5005	3165	4	4	10	1.5	2.79999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
245	Phenom II X6 1055T	3153	6	6	125	2.79999999999999982	3.29999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
246	A10-6700	3114	4	4	65	3.70000000000000018	4.29999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
247	Core i3 4160T	3086	2	4	35	3.10000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
248	Core i7 870	3080	4	8	95	2.93000000000000016	3.60000000000000009	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
249	Core i7 950	3031	4	8	130	3.06999999999999984	3.33000000000000007	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
250	Core i7 875K	2985	4	8	95	2.93000000000000016	3.60000000000000009	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
251	A10 PRO-7800B	2983	4	4	65	3.5	3.89999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
252	FX-4300	2978	4	4	95	3.79999999999999982	4	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
253	A10-7800	2970	4	4	65	3.5	3.89999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
254	Pentium G4520	2960	2	2	51	3.60000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
255	Core i7 930	2960	4	8	130	2.79999999999999982	3.06000000000000005	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
256	A10-5800K	2931	4	4	100	3.79999999999999982	4.20000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
257	Core i7 860	2928	4	8	95	2.79999999999999982	3.45999999999999996	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
258	A8-7650K	2915	4	4	65	3.29999999999999982	3.70000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
259	Pentium G4500	2855	2	2	51	3.5	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
260	Celeron G5905	2825	2	2	58	3.5	0	5000	0.560000000000000053	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
261	Celeron G5900	2759	2	2	58	3.39999999999999991	0	4200	0.660000000000000031	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
262	Core i7 860S	2734	4	8	82	2.5	3.45999999999999996	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
263	Celeron J4115	2727	4	4	10	1.80000000000000004	2.5	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
264	A10-5700	2722	4	4	65	3.39999999999999991	4	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
265	A8-5600K	2702	4	4	100	3.60000000000000009	3.89999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
266	Core i7 920	2695	4	8	130	2.70000000000000018	2.93000000000000016	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
267	A8 PRO-7600B	2647	4	4	65	3.10000000000000009	3.79999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
268	Pentium G4400	2616	2	2	54	3.29999999999999982	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
269	Pentium G4500T	2593	2	2	35	3	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
270	A8-5500	2563	4	4	65	3.20000000000000018	3.70000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
271	Core i5 760	2558	4	4	95	2.79999999999999982	3.33000000000000007	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
272	Pentium G3470	2444	2	2	53	3.60000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
273	Celeron G4900	2407	2	2	54	3.10000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
274	Celeron G3950	2399	2	2	51	3	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
275	Core i5 750	2386	4	4	95	2.66999999999999993	3.20000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
276	A8-3870K	2377	4	4	100	3	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
277	Core i3 3240	2319	2	4	55	3.39999999999999991	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
278	Pentium G3460	2302	2	2	53	3.5	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
279	Celeron G3930	2298	2	2	51	2.89999999999999991	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
280	Celeron G3900	2222	2	2	51	2.79999999999999982	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
281	Pentium G3440	2221	2	2	53	3.29999999999999982	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
282	Core i3 3220	2199	2	4	55	3.29999999999999982	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
283	Core i5 650	2195	2	4	73	3.20000000000000018	3.45999999999999996	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
284	Celeron G3920	2181	2	2	51	2.89999999999999991	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
285	Pentium G3258	2114	2	2	53	3.20000000000000018	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
286	Core i3 3240T	2076	2	4	35	2.89999999999999991	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
287	Pentium G3260	2044	2	2	53	3.29999999999999982	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
288	Core 2 Quad Q6700	2043	4	4	105	2.66000000000000014	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
289	Core i3 3210	2034	2	4	55	3.20000000000000018	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
290	Core 2 Quad Q9400	2032	4	4	95	2.66000000000000014	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
291	Core i3 3220T	2030	2	4	35	2.79999999999999982	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
292	Core 2 Quad Q8400	2021	4	4	95	2.66000000000000014	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
293	Celeron G1850	2006	2	2	54	2.89999999999999991	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
294	Core i3 2120	1963	2	4	65	3.29999999999999982	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
295	Celeron J4025	1946	2	2	10	2	2.89999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
296	Core 2 Quad Q9450	1942	4	4	95	2.66000000000000014	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
297	Pentium G2120	1899	2	2	55	3.10000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
298	Pentium G3240	1885	2	2	53	3.10000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
299	Celeron G1840	1814	2	2	53	2.79999999999999982	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
300	Core i3 2100	1801	2	4	65	3.10000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
301	Athlon Quad-Core 5350	1794	4	4	25	2.10000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
302	Core 2 Quad Q6600	1777	4	4	105	2.39999999999999991	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
303	Athlon Quad-Core 5370	1771	4	4	25	2.20000000000000018	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
304	Core 2 Quad Q8300	1766	4	4	95	2.5	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
305	Core 2 Quad Q8200	1752	4	4	95	2.33000000000000007	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
306	Pentium G2030	1711	2	2	55	3	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
308	A6-7400K	1638	2	2	65	3.5	3.89999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
309	Phenom 9650	1631	4	4	95	2.29999999999999982	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
310	Core i3 550	1625	2	4	73	3.20000000000000018	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
311	Celeron G1830	1615	2	2	53	2.79999999999999982	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
312	Core i3 2120T	1613	2	4	35	2.60000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
313	Core i3 530	1523	2	4	73	2.93000000000000016	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
314	Core i3 540	1518	2	4	73	3.06999999999999984	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
315	Celeron G1610	1443	2	2	55	2.60000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
316	A4-7300	1429	2	2	65	3.79999999999999982	4	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
317	Core 2 Duo E8600	1418	2	2	65	3.33000000000000007	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
318	Athlon Quad-Core 5150	1392	4	4	25	1.60000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
319	Celeron G1620	1372	2	2	55	2.70000000000000018	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
320	Celeron J3160	1284	4	4	6	1.60000000000000009	2.20000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
321	A6-5400K	1265	2	2	65	3.60000000000000009	3.79999999999999982	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
322	Pentium E5800	1212	2	2	65	3.20000000000000018	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
323	A4 PRO-5300B	1206	2	2	65	3.39999999999999991	3.70000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
324	Core 2 Duo E7600	1202	2	2	65	3.06000000000000005	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
325	Celeron J3355	1186	2	2	10	2	2.5	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
326	Core 2 Duo E8400	1168	2	2	65	3	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
327	Core 2 Duo E6700	1147	2	2	65	2.66000000000000014	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
328	A4-5300	1138	2	2	65	3.39999999999999991	3.70000000000000018	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
329	Athlon II X2 255	1134	2	2	65	3.10000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
330	Pentium E5700	1125	2	2	65	3	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
331	Sempron 3850	1089	4	4	25	1.30000000000000004	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
332	Athlon II X2 250	1054	2	2	65	3	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
333	Core 2 Duo E7500	1030	2	2	65	2.93000000000000016	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
334	Phenom 8400	1004	3	3	95	2.10000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
335	Athlon II X2 235e	972	2	2	45	2.70000000000000018	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
336	A6-1450	971	4	4	8	1	1.39999999999999991	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
337	Core 2 Duo E6300	963	2	2	65	1.8600000000000001	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
338	Core 2 Duo P8700	960	2	2	25	2.5299999999999998	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
339	Athlon II X2 220	955	2	2	65	2.79999999999999982	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
340	Athlon II X2 215	943	2	2	65	2.70000000000000018	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
341	Core 2 Duo E6750	931	2	2	65	2.66000000000000014	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
342	Core 2 Duo E7400	925	2	2	65	2.79999999999999982	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
343	Core 2 Duo E7200	917	2	2	65	2.5299999999999998	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
344	Core 2 Duo E6600	856	2	2	65	2.39999999999999991	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
345	Core 2 Duo T7500	849	2	2	35	2.20000000000000018	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
346	Pentium E5200	825	2	2	65	2.5	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
347	Core 2 Duo P8400	816	2	2	25	2.25999999999999979	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
348	Core 2 Duo E6400	771	2	2	65	2.12999999999999989	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
349	Pentium E2220	761	2	2	65	2.39999999999999991	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
350	Core 2 Duo T8100	726	2	2	35	2.10000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
351	Core 2 Duo E4600	701	2	2	65	2.39999999999999991	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
352	Core 2 Duo E4500	693	2	2	65	2.20000000000000018	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
353	Celeron J3060	641	2	2	6	1.60000000000000009	2.5	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
354	Core 2 Duo T7100	629	2	2	35	1.80000000000000004	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
355	Celeron J1800	628	2	2	10	2.41000000000000014	2.60000000000000009	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
356	Core 2 Duo E4400	616	2	2	65	2	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
357	E1-2500	592	2	2	15	1.39999999999999991	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
358	Sempron 2650	579	2	2	25	1.5	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
359	Atom 330	571	2	4	8	1.60000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
360	Sempron 3800+	554	1	1	62	2.20000000000000018	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
361	E1-6010	538	2	2	10	1.39999999999999991	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
362	Pentium D 940	525	2	2	130	3.20000000000000018	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
363	Core 2 Duo T5500	505	2	2	34	1.65999999999999992	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
364	Core Duo T2300	505	2	2	31	1.65999999999999992	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
365	Core 2 Duo E4300	500	2	2	65	1.80000000000000004	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
366	Pentium D 830	472	2	2	95	3	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
367	Sempron 3100+	458	1	1	62	1.80000000000000004	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
368	Pentium 4 550	455	1	2	89	3.39999999999999991	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
369	E2-1800	420	2	2	18	1.69999999999999996	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
370	E-350	407	2	2	18	1.60000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
371	E-450	399	2	2	18	1.69999999999999996	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
372	E1-1200	384	2	2	18	1.39999999999999991	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
373	Pentium 4 630	338	1	2	82	3	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
374	Atom 230	324	1	2	4	1.60000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
375	Celeron M 420	139	1	1	27	1.60000000000000009	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
377	Ryzen 9 5900test	232	16	32	5	4	10	18990	0.429999999999999993	2022-02-14 13:29:39.645597+09	2022-02-14 13:29:39.648569+09
376	Pentuim G2020	1661	2	2	55	2.89999999999999991	2.89999999999999991	6000	0.429999999999999993	2022-02-07 13:45:54.798443+09	2022-02-16 11:23:31.614617+09
307	Pentium G2020	1656	2	2	55	2.89999999999999991	0	6000	0	2021-11-12 12:14:00+09	2022-02-16 11:24:20.367727+09
2	Ryzen 9 5900X	39641	12	24	105	3.70000000000000018	4.79999999999999982	71500	0.559899999999999953	2021-11-12 12:14:00+09	2022-02-16 18:33:02.411997+09
\.


--
-- Data for Name: benchmas_gpubench; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.benchmas_gpubench (gpu_bench_id, gpu_name, marktimespygraphics, tdp, cost_performance, wattage_performance, list_price, created_at, updated_at) FROM stdin;
2	GeForce RTX 3080 Ti	19506	350	0.102999999999999994	55.7000000000000028	190000	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
3	Radeon RX 6900 XT	18782	300	0.110000000000000001	62.6000000000000014	170000	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
4	Radeon RX 6800 XT	17918	300	0.106999999999999998	59.7000000000000028	167000	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
5	GeForce RTX 3080	17692	320	0.117000000000000007	55.2999999999999972	151000	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
6	Titan RTX	15301	280	0	54.6000000000000014	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
7	Radeon RX 6800	15110	250	0.106999999999999998	60.3999999999999986	141000	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
8	GeForce RTX 3070 Ti	14774	290	0	50.8999999999999986	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
9	GeForce RTX 2080 Ti	14650	250	0	58.6000000000000014	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
10	GeForce RTX 3070	13789	220	0.137000000000000011	62.7000000000000028	101000	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
11	Titan V	13195	250	0	52.7999999999999972	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
12	Radeon RX 6700 XT	11986	230	0.121999999999999997	52.1000000000000014	98000	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
13	GeForce RTX 3060 Ti	11893	200	0.142999999999999988	59.5	83000	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
14	GeForce RTX 2080 SUPER	11642	250	0	46.6000000000000014	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
15	GeForce RTX 2080	11118	215	0	51.7000000000000028	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
16	Titan Xp	10849	250	0	43.3999999999999986	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
17	Titan X	10376	250	0	41.5	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
18	GeForce RTX 2070 SUPER	10204	215	0	47.5	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
19	GeForce GTX 1080 Ti	10012	250	0	40	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
20	Radeon RX 6600 XT	9698	160	0.142999999999999988	60.6000000000000014	68000	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
21	Radeon RX 5700 XT	9335	225	0	41.5	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
22	GeForce RTX 2070	9160	175	0	52.2999999999999972	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
23	Radeon VII	8900	300	0	29.6999999999999993	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
24	GeForce RTX 3060	8867	170	0.125	52.2000000000000028	71000	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
25	GeForce RTX 2060 SUPER	8827	175	0	50.3999999999999986	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
26	Radeon RX 5700	8248	180	0	45.7999999999999972	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
27	Radeon RX 6600	8065	132	0.128000000000000003	61.1000000000000014	63000	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
28	GeForce RTX 2060	7661	160	0.139000000000000012	47.8999999999999986	55000	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
29	GeForce GTX 1080	7605	180	0	42.2999999999999972	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
30	Radeon RX 5600 XT(14Gbps)	7532	150	0	50.2000000000000028	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
31	Radeon RX Vega 64	7339	295	0	24.8999999999999986	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
32	Radeon RX 5600 XT(12Gbps)	6927	150	0	46.2000000000000028	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
33	Radeon RX 5600	6927	150	0	46.2000000000000028	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
34	GeForce GTX 1070 Ti	6864	180	0	38.1000000000000014	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
35	Radeon RX Vega 56	6759	210	0	32.2000000000000028	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
36	GeForce GTX 1660 Ti	6403	120	0.106999999999999998	53.3999999999999986	60000	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
37	GeForce GTX 1660 SUPER	6122	125	0.128000000000000003	49	48000	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
38	GeForce GTX 1070	6100	150	0	40.7000000000000028	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
39	GeForce GTX TITAN X	5863	250	0	23.5	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
40	GeForce GTX 980 Ti	5790	250	0	23.1999999999999993	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
41	GeForce GTX 1660	5473	120	0	45.6000000000000014	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
42	Radeon R9 Fury X	5300	275	0	19.3000000000000007	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
43	Radeon R9 Fury	4884	275	0	17.8000000000000007	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
44	Radeon RX 5500 XT 8GB	4830	130	0	37.2000000000000028	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
45	Radeon RX 5500 XT 4GB	4819	130	0	37.1000000000000014	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
46	Radeon RX 590	4794	225	0	21.3000000000000007	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
47	Radeon R9 Nano	4717	175	0	27	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
48	GeForce GTX 1650 SUPER	4707	100	0	47.1000000000000014	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
49	GeForce GTX TITAN Z	4681	375	0	12.5	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
50	GeForce GTX 980	4366	165	0	26.5	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
51	Radeon RX 580	4355	185	0	23.5	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
52	Radeon R9 390X	4263	275	0	15.5	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
53	GeForce GTX 1060 6GB	4210	120	0	35.1000000000000014	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
54	Radeon RX 480	4139	150	0	27.6000000000000014	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
55	GeForce GTX 1060 3GB	3889	120	0	32.3999999999999986	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
56	Radeon RX 570 8GB	3854	150	0	25.6999999999999993	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
57	Radeon RX 470	3684	120	0	30.6999999999999993	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
58	GeForce GTX 970	3647	145	0	25.1999999999999993	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
59	GeForce GTX 1650 GDDR6	3669	75	0.131000000000000005	48.8999999999999986	28000	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
60	GeForce GTX 1650	3428	75	0.117999999999999994	45.7000000000000028	29000	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
61	Radeon R9 380X	2999	175	0	17.1000000000000014	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
62	GeForce GTX TITAN	2880	250	0	11.5	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
63	GeForce GTX 780	2863	250	0	11.5	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
64	GeForce GTX 1050 Ti	2363	75	0.106999999999999998	31.5	22000	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
65	Radeon HD 7970	2319	250	0	9.30000000000000071	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
66	GeForce GTX 960	2307	120	0	19.1999999999999993	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
67	GeForce GTX 770	2136	250	0	8.5	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
68	GeForce GTX 680	2026	195	0	10.4000000000000004	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
69	GeForce GTX 950	1914	90	0	21.3000000000000007	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
70	GeForce GTX 1050	1884	75	0	25.1000000000000014	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
71	Radeon RX 560	1866	80	0	23.3000000000000007	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
72	Radeon RX 460	1758	75	0	23.3999999999999986	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
73	GeForce GTX 760	1665	170	0	9.80000000000000071	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
74	Radeon R9 270	1630	175	0	9.30000000000000071	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
75	Radeon RX Vega 8(Ryzen 5000)	1570	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
76	Radeon R7 370	1525	110	0	13.9000000000000004	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
77	Radeon RX Vega 7(Ryzen 5000)	1403	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
78	Radeon RX Vega 8(Ryzen 4000)	1402	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
79	Radeon R7 360	1363	100	0	13.5999999999999996	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
80	GeForce GTX 660	1315	140	0	9.40000000000000036	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
81	Radeon RX Vega 7(Ryzen 4000)	1288	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
82	GeForce GTX 750 Ti	1279	60	0	21.3000000000000007	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
83	Radeon RX 550	1196	50	0.0660000000000000031	23.8999999999999986	18000	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
84	Radeon RX Vega 11(Ryzen 2,3000)	1193	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
85	Radeon RX Vega 6(Ryzen 4000)	1110	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
86	GeForce GT 1030	1089	30	0.109	36.2999999999999972	10000	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
87	Radeon RX Vega 8(Ryzen 2,3000)	931	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
88	GeForce GTX 650 Ti	903	110	0	8.19999999999999929	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
89	Radeon HD 6850	0	127	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
90	GeForce GTX 480	719	250	0	2.89999999999999991	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
91	Intel UHD Graphics 750	663	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
92	GeForce GTX 745	654	55	0	11.9000000000000004	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
93	GeForce GT 1030(DDR4)	645	30	0	21.5	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
94	GeForce GTX 570	577	219	0	2.60000000000000009	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
95	Iris Pro Graphics 6200	559	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
96	Radeon HD 5850	544	151	0	3.60000000000000009	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
97	GeForce GTX 650	541	64	0	8.5	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
98	Radeon HD 7750	505	55	0	9.19999999999999929	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
99	Intel UHD Graphics 730	0	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
100	Radeon RX Vega 3	441	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
101	GeForce GTX 470	438	215	0	2	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
102	Intel UHD Graphics 630	433	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
103	GeForce GTX 560 Ti	398	170	0	2.29999999999999982	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
104	Intel HD Graphics 630	393	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
105	Radeon R7 240	377	30	0	12.5999999999999996	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
106	GeForce GT730(GDDR5)	368	38	0.0739999999999999963	9.69999999999999929	5000	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
107	Intel HD Graphics 530	336	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
108	GeForce GT730(GDDR3)	310	49	0	6.29999999999999982	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
109	GeForce GTX 460	278	160	0	1.69999999999999996	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
110	Radeon HD 5770	0	108	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
111	Radeon R7 Graphics	0	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
112	GeForce GTS 450	255	106	0	2.39999999999999991	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
113	Radeon HD 6670	0	66	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
114	Radeon HD 5670	0	64	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
115	GeForce GT 440	154	65	0	2.39999999999999991	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
116	GeForce GTS 250	0	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
117	Radeon HD 8670D	0	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
118	Radeon HD 7660D	0	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
119	GeForce 9800 GT	0	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
120	GeForce 9600 GT	0	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
121	GeForce GT 710	0	19	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
122	GeForce GT 430	0	49	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
123	Radeon HD 7560D	0	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
124	Radeon HD 6550D	0	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
125	Intel HD Graphics 4600	195	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
126	Intel HD Graphics 510	190	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
127	Intel HD Graphics 4400	0	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
128	Intel HD Graphics 4000	0	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
129	Radeon R5 230	0	19	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
130	GeForce GT 610	87	29	0	3	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
131	GeForce GT 520	84	29	0	2.89999999999999991	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
132	Radeon HD 6450	0	27	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
133	Radeon HD 5450	0	19	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
134	Intel HD Graphics 3000	0	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
135	Intel HD Graphics 2500	0	0	0	0	0	2021-11-12 12:14:00+09	2021-11-12 12:14:00+09
1	GeForce RTX 3090	19867	350	0.0690000000000000058	56.7999999999999972	290000	2021-11-12 12:14:00+09	2022-02-07 11:41:20.388357+09
136	RTX 3090	19867	34	32	45.5	2323	2022-02-14 13:35:37.045974+09	2022-02-14 13:35:37.068823+09
137	Ge Fors	19874444	555	0.880000000000000004	66.7999999999999972	10000	2022-02-17 14:15:25.722098+09	2022-02-17 14:15:25.7257+09
\.


--
-- Data for Name: bottleneckmas_bottleneck; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.bottleneckmas_bottleneck (bottleneck_id, cpu_name, gpu_name, balance, wqhd, four_k, game_appropriate, game_delivery, video_editing, encode, created_at, updated_at) FROM stdin;
3	Core i9 10900K	RTX 3090	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
4	Core i9 10900	RTX 3090	3	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
5	Core i7 11700K	RTX 3090	3	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
6	Core i7 11700	RTX 3090	2	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
7	Core i7 10700K	RTX 3090	3	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
9	Core i5 11400	RTX 3090	1	4	3	0	3	4	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
10	Core i5 10400	RTX 3090	1	4	2	0	2	2	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
11	Ryzen 9 5900X	RTX 3090	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
12	Ryzen 9 5950X	RTX 3090	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
13	Ryzen 7 5800X	RTX 3090	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
14	Ryzen 7 3700X	RTX 3090	2	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
15	Ryzen 5 5600X	RTX 3090	2	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
16	Ryzen 5 3600	RTX 3090	1	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
17	Ryzen 5 3500X	RTX 3090	1	4	2	0	3	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
18	Ryzen 5 3500	RTX 3090	1	4	2	0	2	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
19	Core i9 11900K	RX 6900 XT	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
20	Core i9 11900	RX 6900 XT	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
21	Core i9 10900K	RX 6900 XT	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
22	Core i9 10900	RX 6900 XT	3	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
23	Core i7 11700K	RX 6900 XT	3	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
24	Core i7 11700	RX 6900 XT	2	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
25	Core i7 10700K	RX 6900 XT	3	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
26	Core i7 10700	RX 6900 XT	2	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
27	Core i5 11400	RX 6900 XT	1	4	3	0	3	4	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
28	Core i5 10400	RX 6900 XT	1	4	2	0	2	2	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
29	Ryzen 9 5900X	RX 6900 XT	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
30	Ryzen 9 5950X	RX 6900 XT	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
31	Ryzen 7 5800X	RX 6900 XT	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
32	Ryzen 7 3700X	RX 6900 XT	2	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
33	Ryzen 5 5600X	RX 6900 XT	2	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
34	Ryzen 5 3600	RX 6900 XT	1	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
35	Ryzen 5 3500X	RX 6900 XT	1	4	2	0	3	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
36	Ryzen 5 3500	RX 6900 XT	1	4	2	0	2	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
37	Core i9 11900K	RTX 3080	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
38	Core i9 11900	RTX 3080	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
39	Core i9 10900K	RTX 3080	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
40	Core i9 10900	RTX 3080	3	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
41	Core i7 11700K	RTX 3080	3	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
42	Core i7 11700	RTX 3080	2	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
43	Core i7 10700K	RTX 3080	3	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
44	Core i7 10700	RTX 3080	2	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
45	Core i5 11400	RTX 3080	2	4	3	0	3	4	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
46	Core i5 10400	RTX 3080	1	4	2	0	2	2	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
47	Ryzen 9 5900X	RTX 3080	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
48	Ryzen 9 5950X	RTX 3080	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
49	Ryzen 7 5800X	RTX 3080	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
50	Ryzen 7 3700X	RTX 3080	3	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
51	Ryzen 5 5600X	RTX 3080	3	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
52	Ryzen 5 3600	RTX 3080	3	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
53	Ryzen 5 3500X	RTX 3080	1	4	2	0	3	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
54	Ryzen 5 3500	RTX 3080	1	4	2	0	2	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
55	Core i9 11900K	RX 6800 XT	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
56	Core i9 11900	RX 6800 XT	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
57	Core i9 10900K	RX 6800 XT	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
58	Core i9 10900	RX 6800 XT	3	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
59	Core i7 11700K	RX 6800 XT	3	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
60	Core i7 11700	RX 6800 XT	2	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
61	Core i7 10700K	RX 6800 XT	3	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
62	Core i7 10700	RX 6800 XT	2	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
63	Core i5 11400	RX 6800 XT	2	4	3	0	3	4	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
64	Core i5 10400	RX 6800 XT	1	4	2	0	2	2	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
65	Ryzen 9 5900X	RX 6800 XT	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
66	Ryzen 9 5950X	RX 6800 XT	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
67	Ryzen 7 5800X	RX 6800 XT	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
68	Ryzen 7 3700X	RX 6800 XT	3	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
69	Ryzen 5 5600X	RX 6800 XT	3	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
70	Ryzen 5 3600	RX 6800 XT	3	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
71	Ryzen 5 3500X	RX 6800 XT	1	4	2	0	3	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
72	Ryzen 5 3500	RX 6800 XT	1	4	2	0	2	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
73	Core i9 11900K	RTX 3070	3	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
74	Core i9 11900	RTX 3070	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
75	Core i9 10900K	RTX 3070	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
76	Core i9 10900	RTX 3070	4	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
77	Core i7 11700K	RTX 3070	4	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
78	Core i7 11700	RTX 3070	3	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
79	Core i7 10700K	RTX 3070	4	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
80	Core i7 10700	RTX 3070	3	4	4	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
81	Core i5 11400	RTX 3070	2	4	3	0	3	4	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
82	Core i5 10400	RTX 3070	2	4	2	0	2	2	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
83	Ryzen 9 5900X	RTX 3070	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
84	Ryzen 9 5950X	RTX 3070	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
85	Ryzen 7 5800X	RTX 3070	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
86	Ryzen 7 3700X	RTX 3070	3	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
87	Ryzen 5 5600X	RTX 3070	3	4	4	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
88	Ryzen 5 3600	RTX 3070	2	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
89	Ryzen 5 3500X	RTX 3070	1	4	2	0	3	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
2	Core i9 11900	RTX 3090	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2022-02-15 15:17:25.131859+09
8	Core i7 10700	RTX 3090	2	4	4	0	4	4	3	2021-11-10 12:14:00+09	2022-02-17 14:15:50.026786+09
90	Ryzen 5 3500	RTX 3070	1	4	2	0	2	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
91	Core i9 11900K	RTX 3060 Ti	3	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
92	Core i9 11900	RTX 3060 Ti	4	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
93	Core i9 10900K	RTX 3060 Ti	4	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
94	Core i9 10900	RTX 3060 Ti	4	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
95	Core i7 11700K	RTX 3060 Ti	4	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
96	Core i7 11700	RTX 3060 Ti	3	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
97	Core i7 10700K	RTX 3060 Ti	4	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
98	Core i7 10700	RTX 3060 Ti	3	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
99	Core i5 11400	RTX 3060 Ti	2	3	2	0	3	4	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
100	Core i5 10400	RTX 3060 Ti	2	3	2	0	2	2	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
101	Ryzen 9 5900X	RTX 3060 Ti	3	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
102	Ryzen 9 5950X	RTX 3060 Ti	4	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
103	Ryzen 7 5800X	RTX 3060 Ti	4	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
104	Ryzen 7 3700X	RTX 3060 Ti	3	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
105	Ryzen 5 5600X	RTX 3060 Ti	3	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
106	Ryzen 5 3600	RTX 3060 Ti	2	3	2	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
107	Ryzen 5 3500X	RTX 3060 Ti	2	3	2	0	3	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
108	Ryzen 5 3500	RTX 3060 Ti	2	3	2	0	2	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
109	Core i9 11900K	RX 6800	3	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
110	Core i9 11900	RX 6800	4	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
111	Core i9 10900K	RX 6800	4	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
112	Core i9 10900	RX 6800	4	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
113	Core i7 11700K	RX 6800	4	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
114	Core i7 11700	RX 6800	3	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
115	Core i7 10700K	RX 6800	4	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
116	Core i7 10700	RX 6800	3	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
117	Core i5 11400	RX 6800	2	3	2	0	3	4	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
118	Core i5 10400	RX 6800	2	3	2	0	2	2	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
119	Ryzen 9 5900X	RX 6800	3	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
120	Ryzen 9 5950X	RX 6800	4	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
121	Ryzen 7 5800X	RX 6800	4	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
122	Ryzen 7 3700X	RX 6800	3	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
123	Ryzen 5 5600X	RX 6800	3	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
124	Ryzen 5 3600	RX 6800	2	3	2	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
125	Ryzen 5 3500X	RX 6800	2	3	2	0	3	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
126	Ryzen 5 3500	RX 6800	2	3	2	0	2	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
127	Core i9 11900K	RTX 3060	3	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
128	Core i9 11900	RTX 3060	3	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
129	Core i9 10900K	RTX 3060	3	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
130	Core i9 10900	RTX 3060	3	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
131	Core i7 11700K	RTX 3060	4	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
132	Core i7 11700	RTX 3060	4	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
133	Core i7 10700K	RTX 3060	4	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
134	Core i7 10700	RTX 3060	4	4	2	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
135	Core i5 11400	RTX 3060	3	3	2	0	3	4	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
136	Core i5 10400	RTX 3060	3	3	1	0	2	2	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
137	Ryzen 9 5900X	RTX 3060	3	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
138	Ryzen 9 5950X	RTX 3060	3	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
139	Ryzen 7 5800X	RTX 3060	4	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
140	Ryzen 7 3700X	RTX 3060	4	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
141	Ryzen 5 5600X	RTX 3060	4	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
142	Ryzen 5 3600	RTX 3060	3	3	2	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
143	Ryzen 5 3500X	RTX 3060	3	3	1	0	3	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
144	Ryzen 5 3500	RTX 3060	3	3	1	0	2	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
145	Core i9 11900K	RX 5700 XT	3	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
146	Core i9 11900	RX 5700 XT	3	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
147	Core i9 10900K	RX 5700 XT	3	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
148	Core i9 10900	RX 5700 XT	3	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
149	Core i7 11700K	RX 5700 XT	4	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
150	Core i7 11700	RX 5700 XT	4	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
151	Core i7 10700K	RX 5700 XT	4	4	3	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
152	Core i7 10700	RX 5700 XT	4	4	2	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
153	Core i5 11400	RX 5700 XT	3	3	2	0	3	4	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
154	Core i5 10400	RX 5700 XT	3	3	1	0	2	2	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
155	Ryzen 9 5900X	RX 5700 XT	3	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
156	Ryzen 9 5950X	RX 5700 XT	3	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
157	Ryzen 7 5800X	RX 5700 XT	4	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
158	Ryzen 7 3700X	RX 5700 XT	4	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
159	Ryzen 5 5600X	RX 5700 XT	4	4	3	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
160	Ryzen 5 3600	RX 5700 XT	3	3	2	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
161	Ryzen 5 3500X	RX 5700 XT	3	3	1	0	3	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
162	Ryzen 5 3500	RX 5700 XT	3	3	1	0	2	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
163	Core i9 11900K	GTX 1660 Super	2	2	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
164	Core i9 11900	GTX 1660 Super	2	2	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
165	Core i9 10900K	GTX 1660 Super	2	2	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
166	Core i9 10900	GTX 1660 Super	2	2	1	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
167	Core i7 11700K	GTX 1660 Super	2	2	1	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
168	Core i7 11700	GTX 1660 Super	3	2	1	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
169	Core i7 10700K	GTX 1660 Super	3	2	1	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
170	Core i7 10700	GTX 1660 Super	4	2	1	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
171	Core i5 11400	GTX 1660 Super	4	2	1	0	3	4	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
172	Core i5 10400	GTX 1660 Super	4	1	1	0	2	2	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
173	Ryzen 9 5900X	GTX 1660 Super	2	2	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
174	Ryzen 9 5950X	GTX 1660 Super	2	2	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
175	Ryzen 7 5800X	GTX 1660 Super	3	2	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
176	Ryzen 7 3700X	GTX 1660 Super	3	2	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
177	Ryzen 5 5600X	GTX 1660 Super	3	2	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
178	Ryzen 5 3600	GTX 1660 Super	4	2	1	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
179	Ryzen 5 3500X	GTX 1660 Super	4	1	1	0	3	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
180	Ryzen 5 3500	GTX 1660 Super	3	1	1	0	2	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
181	Core i9 11900K	GTX 1650 Super	1	2	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
182	Core i9 11900	GTX 1650 Super	1	2	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
183	Core i9 10900K	GTX 1650 Super	1	2	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
184	Core i9 10900	GTX 1650 Super	1	2	1	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
185	Core i7 11700K	GTX 1650 Super	1	2	1	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
186	Core i7 11700	GTX 1650 Super	2	2	1	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
187	Core i7 10700K	GTX 1650 Super	2	2	1	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
188	Core i7 10700	GTX 1650 Super	3	2	1	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
189	Core i5 11400	GTX 1650 Super	4	1	1	0	3	4	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
190	Core i5 10400	GTX 1650 Super	4	1	1	0	2	2	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
191	Ryzen 9 5900X	GTX 1650 Super	1	2	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
192	Ryzen 9 5950X	GTX 1650 Super	1	2	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
193	Ryzen 7 5800X	GTX 1650 Super	2	2	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
194	Ryzen 7 3700X	GTX 1650 Super	3	2	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
195	Ryzen 5 5600X	GTX 1650 Super	3	2	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
196	Ryzen 5 3600	GTX 1650 Super	4	1	1	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
197	Ryzen 5 3500X	GTX 1650 Super	4	1	1	0	3	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
198	Ryzen 5 3500	GTX 1650 Super	4	1	1	0	2	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
199	Core i9 11900K	GTX 1650	1	1	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
200	Core i9 11900	GTX 1650	1	1	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
201	Core i9 10900K	GTX 1650	1	1	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
202	Core i9 10900	GTX 1650	1	1	1	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
203	Core i7 11700K	GTX 1650	1	1	1	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
204	Core i7 11700	GTX 1650	2	1	1	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
205	Core i7 10700K	GTX 1650	2	1	1	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
206	Core i7 10700	GTX 1650	3	1	1	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
207	Core i5 11400	GTX 1650	4	1	1	0	3	4	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
208	Core i5 10400	GTX 1650	4	1	1	0	2	2	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
209	Ryzen 9 5900X	GTX 1650	1	1	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
210	Ryzen 9 5950X	GTX 1650	1	1	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
211	Ryzen 7 5800X	GTX 1650	2	1	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
212	Ryzen 7 3700X	GTX 1650	3	1	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
213	Ryzen 5 5600X	GTX 1650	3	1	1	0	4	4	4	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
214	Ryzen 5 3600	GTX 1650	4	1	1	0	4	4	3	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
215	Ryzen 5 3500X	GTX 1650	4	1	1	0	3	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
216	Ryzen 5 3500	GTX 1650	4	1	1	0	2	3	2	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
217	Core i9 10900K	RTX 2080 Ti	4	0	4	1	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
218	Core i9 10900K	RTX 2080 Super	4	0	4	2	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
219	Core i9 10900K	RTX 2080	3	0	3	4	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
220	Core i9 10900K	RTX 2070 Super	3	0	3	4	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
221	Core i9 10900K	RTX 2070	2	0	2	5	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
222	Core i9 10900K	RTX 2060 Super	2	0	2	5	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
223	Core i9 10900K	RTX 2060	1	0	1	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
224	Core i9 10900K	GTX 1660 Ti	1	0	1	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
225	Core i9 10900K	GTX 1660 Super	1	0	1	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
226	Core i9 10900K	GTX 1660	1	0	1	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
227	Core i9 10900K	GTX 1650 Super	1	0	1	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
228	Core i9 10900K	GTX 1650	1	0	1	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
229	Core i7 10700K	RTX 2080 Ti	4	0	4	2	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
230	Core i7 10700K	RTX 2080 Super	4	0	4	3	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
231	Core i7 10700K	RTX 2080	4	0	3	4	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
232	Core i7 10700K	RTX 2070 Super	4	0	3	4	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
233	Core i7 10700K	RTX 2070	3	0	2	5	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
234	Core i7 10700K	RTX 2060 Super	3	0	2	5	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
235	Core i7 10700K	RTX 2060	2	0	1	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
236	Core i7 10700K	GTX 1660 Ti	2	0	1	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
237	Core i7 10700K	GTX 1660 Super	2	0	1	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
238	Core i7 10700K	GTX 1660	1	0	1	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
239	Core i7 10700K	GTX 1650 Super	1	0	1	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
240	Core i7 10700K	GTX 1650	1	0	1	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
241	Core i7 10700	RTX 2080 Ti	3	0	4	3	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
242	Core i7 10700	RTX 2080 Super	3	0	4	4	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
243	Core i7 10700	RTX 2080	4	0	3	5	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
244	Core i7 10700	RTX 2070 Super	4	0	3	5	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
245	Core i7 10700	RTX 2070	4	0	2	6	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
246	Core i7 10700	RTX 2060 Super	4	0	2	6	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
247	Core i7 10700	RTX 2060	3	0	1	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
248	Core i7 10700	GTX 1660 Ti	3	0	1	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
249	Core i7 10700	GTX 1660 Super	3	0	1	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
250	Core i7 10700	GTX 1660	2	0	1	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
251	Core i7 10700	GTX 1650 Super	2	0	1	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
252	Core i7 10700	GTX 1650	1	0	1	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
253	Core i5 10400	RTX 2080 Ti	1	0	2	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
254	Core i5 10400	RTX 2080 Super	1	0	2	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
255	Core i5 10400	RTX 2080	1	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
256	Core i5 10400	RTX 2070 Super	2	0	1	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
257	Core i5 10400	RTX 2070	2	0	1	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
258	Core i5 10400	RTX 2060 Super	3	0	1	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
259	Core i5 10400	RTX 2060	4	0	1	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
260	Core i5 10400	GTX 1660 Ti	4	0	1	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
261	Core i5 10400	GTX 1660 Super	4	0	1	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
262	Core i5 10400	GTX 1660	4	0	1	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
263	Core i5 10400	GTX 1650 Super	4	0	1	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
264	Core i5 10400	GTX 1650	4	0	1	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
265	Ryzen 9 3900X	RTX 2080 Ti	3	0	4	4	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
266	Ryzen 9 3900X	RTX 2080 Super	4	0	4	5	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
267	Ryzen 9 3900X	RTX 2080	4	0	3	6	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
268	Ryzen 9 3900X	RTX 2070 Super	4	0	3	6	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
269	Ryzen 9 3900X	RTX 2070	3	0	3	6	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
270	Ryzen 9 3900X	RTX 2060 Super	2	0	2	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
271	Ryzen 9 3900X	RTX 2060	2	0	2	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
272	Ryzen 9 3900X	GTX 1660 Ti	2	0	1	8	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
273	Ryzen 9 3900X	GTX 1660 Super	2	0	1	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
274	Ryzen 9 3900X	GTX 1660	1	0	1	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
275	Ryzen 9 3900X	GTX 1650 Super	1	0	1	10	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
276	Ryzen 9 3900X	GTX 1650	1	0	1	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
277	Ryzen 7 3700X	RTX 2080 Ti	2	0	4	4	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
278	Ryzen 7 3700X	RTX 2080 Super	3	0	4	5	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
279	Ryzen 7 3700X	RTX 2080	3	0	3	6	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
280	Ryzen 7 3700X	RTX 2070 Super	4	0	3	6	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
281	Ryzen 7 3700X	RTX 2070	4	0	2	6	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
282	Ryzen 7 3700X	RTX 2060 Super	4	0	2	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
283	Ryzen 7 3700X	RTX 2060	4	0	2	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
284	Ryzen 7 3700X	GTX 1660 Ti	3	0	1	8	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
285	Ryzen 7 3700X	GTX 1660 Super	3	0	1	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
286	Ryzen 7 3700X	GTX 1660	3	0	1	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
287	Ryzen 7 3700X	GTX 1650 Super	2	0	1	10	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
288	Ryzen 7 3700X	GTX 1650	1	0	1	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
289	Ryzen 5 3600	RTX 2080 Ti	1	0	2	6	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
290	Ryzen 5 3600	RTX 2080 Super	1	0	2	6	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
291	Ryzen 5 3600	RTX 2080	1	0	2	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
292	Ryzen 5 3600	RTX 2070 Super	2	0	2	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
293	Ryzen 5 3600	RTX 2070	2	0	1	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
294	Ryzen 5 3600	RTX 2060 Super	2	0	1	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
295	Ryzen 5 3600	RTX 2060	3	0	1	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
296	Ryzen 5 3600	GTX 1660 Ti	4	0	1	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
297	Ryzen 5 3600	GTX 1660 Super	4	0	1	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
298	Ryzen 5 3600	GTX 1660	4	0	1	10	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
299	Ryzen 5 3600	GTX 1650 Super	4	0	1	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
300	Ryzen 5 3600	GTX 1650	3	0	1	12	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
301	Ryzen 5 3500	RTX 2080 Ti	1	0	2	6	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
302	Ryzen 5 3500	RTX 2080 Super	1	0	2	6	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
303	Ryzen 5 3500	RTX 2080	1	0	2	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
304	Ryzen 5 3500	RTX 2070 Super	1	0	1	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
305	Ryzen 5 3500	RTX 2070	2	0	1	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
306	Ryzen 5 3500	RTX 2060 Super	2	0	1	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
307	Ryzen 5 3500	RTX 2060	3	0	1	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
308	Ryzen 5 3500	GTX 1660 Ti	3	0	1	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
309	Ryzen 5 3500	GTX 1660 Super	3	0	1	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
310	Ryzen 5 3500	GTX 1660	4	0	1	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
311	Ryzen 5 3500	GTX 1650 Super	4	0	1	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
312	Ryzen 5 3500	GTX 1650	1	0	1	12	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
313	Core i9 9900K	RTX 2080 Ti	4	0	4	2	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
314	Core i9 9900K	RTX 2080 Super	4	0	4	4	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
315	Core i9 9900K	RTX 2080	4	0	3	5	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
316	Core i9 9900K	RTX 2070 Super	3	0	3	5	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
317	Core i9 9900K	RTX 2070	3	0	2	6	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
318	Core i9 9900K	RTX 2060 Super	2	0	2	6	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
319	Core i9 9900K	RTX 2060	2	0	2	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
320	Core i9 9900K	GTX 1660 Ti	1	0	1	8	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
321	Core i9 9900K	GTX 1660 Super	1	0	1	8	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
322	Core i9 9900K	GTX 1660	1	0	1	9	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
323	Core i9 9900K	GTX 1650 Super	1	0	1	10	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
324	Core i9 9900K	GTX 1650	1	0	1	10	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
325	Core i7 9700K	RTX 2080 Ti	3	0	4	4	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
326	Core i7 9700K	RTX 2080 Super	3	0	4	4	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
327	Core i7 9700K	RTX 2080	3	0	3	5	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
328	Core i7 9700K	RTX 2070 Super	3	0	3	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
329	Core i7 9700K	RTX 2070	4	0	2	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
330	Core i7 9700K	RTX 2060 Super	4	0	2	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
331	Core i7 9700K	RTX 2060	4	0	1	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
332	Core i7 9700K	GTX 1660 Ti	3	0	1	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
333	Core i7 9700K	GTX 1660 Super	3	0	1	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
334	Core i7 9700K	GTX 1660	2	0	1	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
335	Core i7 9700K	GTX 1650 Super	2	0	1	10	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
336	Core i7 9700K	GTX 1650	1	0	1	10	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
337	Core i7 9700	RTX 2080 Ti	2	0	3	4	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
338	Core i7 9700	RTX 2080 Super	2	0	3	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
339	Core i7 9700	RTX 2080	3	0	2	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
340	Core i7 9700	RTX 2070 Super	3	0	2	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
341	Core i7 9700	RTX 2070	4	0	2	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
342	Core i7 9700	RTX 2060 Super	4	0	1	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
343	Core i7 9700	RTX 2060	4	0	1	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
344	Core i7 9700	GTX 1660 Ti	4	0	1	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
345	Core i7 9700	GTX 1660 Super	4	0	1	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
346	Core i7 9700	GTX 1660	3	0	1	9	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
347	Core i7 9700	GTX 1650 Super	3	0	1	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
348	Core i7 9700	GTX 1650	3	0	1	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
349	Core i5 9400	RTX 2080 Ti	1	0	2	6	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
350	Core i5 9400	RTX 2080 Super	1	0	2	7	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
351	Core i5 9400	RTX 2080	1	0	1	7	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
352	Core i5 9400	RTX 2070 Super	1	0	1	7	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
353	Core i5 9400	RTX 2070	1	0	1	8	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
354	Core i5 9400	RTX 2060 Super	1	0	1	8	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
355	Core i5 9400	RTX 2060	2	0	1	9	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
356	Core i5 9400	GTX 1660 Ti	2	0	1	9	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
357	Core i5 9400	GTX 1660 Super	3	0	1	9	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
358	Core i5 9400	GTX 1660	3	0	1	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
359	Core i5 9400	GTX 1650 Super	4	0	1	10	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
360	Core i5 9400	GTX 1650	4	0	1	11	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
361	Core i9 9900K	GTX 1080 Ti	3	0	3	4	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
362	Core i9 9900K	GTX 1080 	3	0	3	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
363	Core i9 9900K	GTX 1070 Ti	2	0	2	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
364	Core i9 9900K	GTX 1070	2	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
365	Core i9 9900K	GTX 1060 6GB	1	0	1	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
366	Core i9 9900K	GTX 1060 3GB	1	0	1	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
367	Core i9 9900K	GTX 1050 Ti	1	0	1	8	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
368	Core i9 9900K	GTX 1050	1	0	1	8	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
369	Core i7 9700K	GTX 1080 Ti	3	0	3	4	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
370	Core i7 9700K	GTX 1080 	3	0	3	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
371	Core i7 9700K	GTX 1070 Ti	2	0	2	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
372	Core i7 9700K	GTX 1070	2	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
373	Core i7 9700K	GTX 1060 6GB	1	0	1	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
374	Core i7 9700K	GTX 1060 3GB	1	0	1	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
375	Core i7 9700K	GTX 1050 Ti	1	0	1	8	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
376	Core i7 9700K	GTX 1050	1	0	1	8	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
377	Core i5 9600K	GTX 1080 Ti	2	0	2	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
378	Core i5 9600K	GTX 1080 	2	0	2	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
379	Core i5 9600K	GTX 1070 Ti	2	0	2	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
380	Core i5 9600K	GTX 1070	2	0	1	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
381	Core i5 9600K	GTX 1060 6GB	3	0	1	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
382	Core i5 9600K	GTX 1060 3GB	3	0	1	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
383	Core i5 9600K	GTX 1050 Ti	3	0	1	7	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
384	Core i5 9600K	GTX 1050	3	0	1	7	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
385	Core i7 8700K	RTX 2080 Ti	2	0	3	4	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
386	Core i7 8700K	RTX 2080	2	0	3	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
387	Core i7 8700K	RTX 2070	3	0	3	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
388	Core i7 8700K	RTX 2060	3	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
389	Core i7 8700K	GTX 1080 Ti	2	0	3	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
390	Core i7 8700K	GTX 1080 	3	0	3	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
391	Core i7 8700K	GTX 1070 Ti	3	0	2	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
392	Core i7 8700K	GTX 1070	3	0	1	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
393	Core i7 8700K	GTX 1060 6GB	2	0	1	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
394	Core i7 8700K	GTX 1060 3GB	2	0	1	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
395	Core i7 8700K	GTX 1050 Ti	2	0	1	7	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
396	Core i7 8700K	GTX 1050	2	0	1	7	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
397	Core i7 8700K	GTX 980 Ti	4	0	0	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
398	Core i7 8700K	GTX 980	3	0	0	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
399	Core i7 8700K	GTX 970	2	0	0	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
400	Core i7 8700K	GTX 960	2	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
401	Core i7 8700K	GTX 950	1	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
402	Core i7 8700K	GTX 750 Ti	1	0	0	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
403	Core i7 8700K	GTX 750	1	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
404	Core i7 8700	RTX 2080 Ti	2	0	3	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
405	Core i7 8700	RTX 2080	2	0	3	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
406	Core i7 8700	RTX 2070	2	0	3	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
407	Core i7 8700	RTX 2060	3	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
408	Core i7 8700	GTX 1080 Ti	2	0	3	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
409	Core i7 8700	GTX 1080 	2	0	2	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
410	Core i7 8700	GTX 1070 Ti	3	0	2	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
411	Core i7 8700	GTX 1070	3	0	1	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
412	Core i7 8700	GTX 1060 6GB	3	0	1	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
413	Core i7 8700	GTX 1060 3GB	3	0	1	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
414	Core i7 8700	GTX 1050 Ti	3	0	1	7	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
415	Core i7 8700	GTX 1050	2	0	1	7	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
416	Core i7 8700	GTX 980 Ti	3	0	0	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
417	Core i7 8700	GTX 980	3	0	0	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
418	Core i7 8700	GTX 970	2	0	0	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
419	Core i7 8700	GTX 960	2	0	0	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
420	Core i7 8700	GTX 950	1	0	0	10	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
421	Core i7 8700	GTX 750 Ti	1	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
422	Core i7 8700	GTX 750	1	0	0	12	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
423	Core i5 8600K	RTX 2080 Ti	1	0	3	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
424	Core i5 8600K	RTX 2080	1	0	3	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
425	Core i5 8600K	RTX 2070	2	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
426	Core i5 8600K	RTX 2060	3	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
427	Core i5 8600K	GTX 1080 Ti	1	0	3	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
428	Core i5 8600K	GTX 1080 	1	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
429	Core i5 8600K	GTX 1070 Ti	2	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
430	Core i5 8600K	GTX 1070	3	0	1	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
431	Core i5 8600K	GTX 1060 6GB	3	0	1	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
432	Core i5 8600K	GTX 1060 3GB	3	0	1	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
433	Core i5 8600K	GTX 1050 Ti	3	0	1	8	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
434	Core i5 8600K	GTX 1050	2	0	1	8	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
435	Core i5 8600	RTX 2080 Ti	1	0	3	5	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
436	Core i5 8600	RTX 2080	1	0	3	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
437	Core i5 8600	RTX 2070	1	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
438	Core i5 8600	RTX 2060	3	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
439	Core i5 8600	GTX 1080 Ti	1	0	3	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
440	Core i5 8600	GTX 1080 	1	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
441	Core i5 8600	GTX 1070 Ti	2	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
442	Core i5 8600	GTX 1070	3	0	1	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
443	Core i5 8600	GTX 1060 6GB	3	0	1	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
444	Core i5 8600	GTX 1060 3GB	3	0	1	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
445	Core i5 8600	GTX 1050 Ti	3	0	1	8	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
446	Core i5 8600	GTX 1050	2	0	1	8	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
447	Core i5 8500	RTX 2080 Ti	1	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
448	Core i5 8500	RTX 2080	1	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
449	Core i5 8500	RTX 2070	1	0	2	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
450	Core i5 8500	RTX 2060	3	0	2	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
451	Core i5 8500	GTX 1080 Ti	1	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
452	Core i5 8500	GTX 1080 	1	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
453	Core i5 8500	GTX 1070 Ti	2	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
454	Core i5 8500	GTX 1070	3	0	1	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
455	Core i5 8500	GTX 1060 6GB	3	0	1	7	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
456	Core i5 8500	GTX 1060 3GB	3	0	1	7	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
457	Core i5 8500	GTX 1050 Ti	3	0	1	8	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
458	Core i5 8500	GTX 1050	3	0	1	8	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
459	Core i5 8400	RTX 2080 Ti	1	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
460	Core i5 8400	RTX 2080	1	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
461	Core i5 8400	RTX 2070	1	0	2	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
462	Core i5 8400	RTX 2060	3	0	2	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
463	Core i5 8400	GTX 1080 Ti	1	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
464	Core i5 8400	GTX 1080 	1	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
465	Core i5 8400	GTX 1070 Ti	2	0	2	6	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
466	Core i5 8400	GTX 1070	3	0	1	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
467	Core i5 8400	GTX 1060 6GB	3	0	1	7	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
468	Core i5 8400	GTX 1060 3GB	3	0	1	7	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
469	Core i5 8400	GTX 1050 Ti	3	0	1	8	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
470	Core i5 8400	GTX 1050	3	0	1	8	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
471	Core i5 8400	GTX 980 Ti	3	0	0	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
472	Core i5 8400	GTX 980	4	0	0	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
473	Core i5 8400	GTX 970	3	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
474	Core i5 8400	GTX 960	3	0	0	9	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
475	Core i5 8400	GTX 950	1	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
476	Core i5 8400	GTX 750 Ti	1	0	0	12	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
477	Core i5 8400	GTX 750	1	0	0	12	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
478	Core i5 7400	GTX 750	3	0	0	15	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
479	Core i5 7400	GTX 750 Ti	3	0	0	13	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
480	Core i5 7400	GTX 950	3	0	0	12	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
481	Core i5 7400	GTX 1050	3	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
482	Core i5 7400	GTX 1050 Ti	3	0	0	12	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
483	Core i5 7400	GTX 960	3	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
484	Core i5 7400	GTX 970	2	0	0	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
485	Core i5 7400	GTX 1060 3GB	2	0	0	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
486	Core i5 7400	GTX 1060 6GB	2	0	0	9	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
487	Core i5 7400	GTX 980	1	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
488	Core i5 7400	GTX 980 Ti	1	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
489	Core i5 7400	GTX 1070	1	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
490	Core i5 7400	GTX 1080 	1	0	0	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
491	Core i5 7400	GTX 1080 Ti	1	0	0	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
492	Core i5 7500	GTX 750	3	0	0	14	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
493	Core i5 7500	GTX 750 Ti	3	0	0	14	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
494	Core i5 7500	GTX 950	3	0	0	12	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
495	Core i5 7500	GTX 1050	3	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
496	Core i5 7500	GTX 1050 Ti	3	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
497	Core i5 7500	GTX 960	3	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
498	Core i5 7500	GTX 970	2	0	0	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
499	Core i5 7500	GTX 1060 3GB	2	0	0	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
500	Core i5 7500	GTX 1060 6GB	2	0	0	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
501	Core i5 7500	GTX 980	1	0	0	9	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
502	Core i5 7500	GTX 980 Ti	1	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
503	Core i5 7500	GTX 1070	1	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
504	Core i5 7500	GTX 1080 	1	0	0	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
505	Core i5 7500	GTX 1080 Ti	1	0	0	7	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
506	Core i5 7600K	GTX 750	1	0	0	13	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
507	Core i5 7600K	GTX 750 Ti	2	0	0	12	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
508	Core i5 7600K	GTX 950	3	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
509	Core i5 7600K	GTX 1050	3	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
510	Core i5 7600K	GTX 1050 Ti	3	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
511	Core i5 7600K	GTX 960	3	0	0	11	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
512	Core i5 7600K	GTX 970	3	0	0	10	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
513	Core i5 7600K	GTX 1060 3GB	3	0	0	10	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
514	Core i5 7600K	GTX 1060 6GB	3	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
515	Core i5 7600K	GTX 980	3	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
516	Core i5 7600K	GTX 980 Ti	2	0	0	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
517	Core i5 7600K	GTX 1070	2	0	0	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
518	Core i5 7600K	GTX 1080 	2	0	0	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
519	Core i5 7600K	GTX 1080 Ti	2	0	0	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
520	Core i5 7600	GTX 750	3	0	0	13	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
521	Core i5 7600	GTX 750 Ti	3	0	0	13	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
522	Core i5 7600	GTX 950	3	0	0	12	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
523	Core i5 7600	GTX 1050	3	0	0	12	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
524	Core i5 7600	GTX 1050 Ti	3	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
525	Core i5 7600	GTX 960	3	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
526	Core i5 7600	GTX 970	3	0	0	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
527	Core i5 7600	GTX 1060 3GB	3	0	0	10	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
528	Core i5 7600	GTX 1060 6GB	3	0	0	10	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
529	Core i5 7600	GTX 980	3	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
530	Core i5 7600	GTX 980 Ti	2	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
531	Core i5 7600	GTX 1070	2	0	0	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
532	Core i5 7600	GTX 1080 	2	0	0	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
533	Core i5 7600	GTX 1080 Ti	2	0	0	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
534	Core i7 7700	GTX 750	2	0	0	13	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
535	Core i7 7700	GTX 750 Ti	2	0	0	12	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
536	Core i7 7700	GTX 950	2	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
537	Core i7 7700	GTX 1050	2	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
538	Core i7 7700	GTX 1050 Ti	3	0	0	11	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
539	Core i7 7700	GTX 960	3	0	0	11	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
540	Core i7 7700	GTX 970	4	0	0	10	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
541	Core i7 7700	GTX 1060 3GB	4	0	0	9	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
542	Core i7 7700	GTX 1060 6GB	4	0	0	9	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
543	Core i7 7700	GTX 980	3	0	0	9	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
544	Core i7 7700	GTX 980 Ti	3	0	0	8	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
545	Core i7 7700	GTX 1070	3	0	0	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
546	Core i7 7700	GTX 1080 	3	0	0	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
547	Core i7 7700	GTX 1080 Ti	3	0	0	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
548	Core i7 7700K	GTX 750	2	0	0	14	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
549	Core i7 7700K	GTX 750 Ti	2	0	0	11	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
550	Core i7 7700K	GTX 950	2	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
551	Core i7 7700K	GTX 1050	2	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
552	Core i7 7700K	GTX 1050 Ti	2	0	0	10	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
553	Core i7 7700K	GTX 960	2	0	0	10	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
554	Core i7 7700K	GTX 970	3	0	0	9	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
555	Core i7 7700K	GTX 1060 3GB	3	0	0	8	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
556	Core i7 7700K	GTX 1060 6GB	3	0	0	8	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
557	Core i7 7700K	GTX 980	3	0	0	9	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
558	Core i7 7700K	GTX 980 Ti	4	0	0	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
559	Core i7 7700K	GTX 1070	4	0	0	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
560	Core i7 7700K	GTX 1080 	4	0	0	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
561	Core i7 7700K	GTX 1080 Ti	3	0	0	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
562	Core i5 6400	GTX 750	3	0	0	15	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
563	Core i5 6400	GTX 750 Ti	3	0	0	13	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
564	Core i5 6400	GTX 950	3	0	0	12	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
565	Core i5 6400	GTX 1050	3	0	0	12	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
566	Core i5 6400	GTX 1050 Ti	3	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
567	Core i5 6400	GTX 960	3	0	0	12	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
568	Core i5 6400	GTX 970	2	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
569	Core i5 6400	GTX 1060 3GB	2	0	0	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
570	Core i5 6400	GTX 1060 6GB	2	0	0	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
571	Core i5 6400	GTX 980	1	0	0	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
572	Core i5 6400	GTX 980 Ti	1	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
573	Core i5 6400	GTX 1070	1	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
574	Core i5 6400	GTX 1080 	1	0	0	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
575	Core i5 6500	GTX 750	2	0	0	14	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
576	Core i5 6500	GTX 750 Ti	3	0	0	13	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
577	Core i5 6500	GTX 950	3	0	0	12	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
578	Core i5 6500	GTX 1050	3	0	0	12	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
579	Core i5 6500	GTX 1050 Ti	3	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
580	Core i5 6500	GTX 960	3	0	0	12	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
581	Core i5 6500	GTX 970	2	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
582	Core i5 6500	GTX 1060 3GB	2	0	0	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
583	Core i5 6500	GTX 1060 6GB	2	0	0	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
584	Core i5 6500	GTX 980	2	0	0	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
585	Core i5 6500	GTX 980 Ti	2	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
586	Core i5 6500	GTX 1070	2	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
587	Core i5 6500	GTX 1080 	1	0	0	8	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
588	Core i5 6600	GTX 750	3	0	0	14	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
589	Core i5 6600	GTX 750 Ti	3	0	0	13	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
590	Core i5 6600	GTX 950	3	0	0	12	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
591	Core i5 6600	GTX 1050	3	0	0	12	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
592	Core i5 6600	GTX 1050 Ti	3	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
593	Core i5 6600	GTX 960	3	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
594	Core i5 6600	GTX 970	3	0	0	10	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
595	Core i5 6600	GTX 1060 3GB	2	0	0	10	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
596	Core i5 6600	GTX 1060 6GB	2	0	0	10	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
597	Core i5 6600	GTX 980	2	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
598	Core i5 6600	GTX 980 Ti	2	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
599	Core i5 6600	GTX 1070	2	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
600	Core i5 6600	GTX 1080 	2	0	0	8	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
601	Core i5 6600K	GTX 750	1	0	0	13	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
602	Core i5 6600K	GTX 750 Ti	2	0	0	12	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
603	Core i5 6600K	GTX 950	2	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
604	Core i5 6600K	GTX 1050	2	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
605	Core i5 6600K	GTX 1050 Ti	3	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
606	Core i5 6600K	GTX 960	3	0	0	11	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
607	Core i5 6600K	GTX 970	3	0	0	10	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
608	Core i5 6600K	GTX 1060 3GB	3	0	0	10	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
609	Core i5 6600K	GTX 1060 6GB	2	0	0	10	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
610	Core i5 6600K	GTX 980	2	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
611	Core i5 6600K	GTX 980 Ti	2	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
612	Core i5 6600K	GTX 1070	2	0	0	9	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
613	Core i5 6600K	GTX 1080 	2	0	0	8	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
614	Core I7 6700	GTX 750	2	0	0	13	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
615	Core I7 6700	GTX 750 Ti	2	0	0	12	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
616	Core I7 6700	GTX 950	2	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
617	Core I7 6700	GTX 1050	2	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
618	Core I7 6700	GTX 1050 Ti	2	0	0	11	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
619	Core I7 6700	GTX 960	3	0	0	11	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
620	Core I7 6700	GTX 970	3	0	0	10	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
621	Core I7 6700	GTX 1060 3GB	3	0	0	9	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
622	Core I7 6700	GTX 1060 6GB	3	0	0	9	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
623	Core I7 6700	GTX 980	2	0	0	9	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
624	Core I7 6700	GTX 980 Ti	2	0	0	8	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
625	Core I7 6700	GTX 1070	2	0	0	8	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
626	Core I7 6700	GTX 1080 	2	0	0	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
627	Core I7 6700K	GTX 750	2	0	0	14	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
628	Core I7 6700K	GTX 750 Ti	2	0	0	13	1	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
629	Core I7 6700K	GTX 950	2	0	0	12	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
630	Core I7 6700K	GTX 1050	2	0	0	11	2	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
631	Core I7 6700K	GTX 1050 Ti	2	0	0	10	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
632	Core I7 6700K	GTX 960	2	0	0	10	3	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
633	Core I7 6700K	GTX 970	3	0	0	9	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
634	Core I7 6700K	GTX 1060 3GB	3	0	0	9	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
635	Core I7 6700K	GTX 1060 6GB	3	0	0	8	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
636	Core I7 6700K	GTX 980	3	0	0	8	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
637	Core I7 6700K	GTX 980 Ti	3	0	0	8	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
638	Core I7 6700K	GTX 1070	3	0	0	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
639	Core I7 6700K	GTX 1080 	3	0	0	7	4	0	0	2021-11-10 12:14:00+09	2021-11-10 12:14:00+09
1	Core i9 11900K	RTX 3090	4	4	4	0	4	4	4	2021-11-10 12:14:00+09	2022-02-14 13:54:20.779201+09
\.


--
-- Data for Name: custom_user; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.custom_user (id, password, last_login, is_superuser, first_name, last_name, email, is_staff, is_active, date_joined, username, employment_status, name, ruby_name, tel_num, gender, birthday, invalid_flg, store_id) FROM stdin;
80	pbkdf2_sha256$150000$6ghBsz6d6a3K$WOoCd3Q5TmM2DodVpZrreaSy0QEolcyipWywrj9h1Uc=	2022-02-17 16:38:38.992803+09	f				f	t	2022-02-14 11:39:32.175655+09	01001501	0	管理者1	カンリシャ1	000-0000-0001	0	2021-06-16	f	\N
108	pbkdf2_sha256$150000$CWJ5DKqsKvqh$2zYZCxMMNYbBTrZkws47lAxiAlKXkTKv1fzhOV6v2tY=	2022-02-16 13:51:01.391786+09	f				f	t	2022-02-14 13:14:15.932527+09	01052005	2	従業員21	ジュウギョウイン21	020-0000-0011	1	2003-08-21	f	105
150	pbkdf2_sha256$150000$dAEW0cq8O5Gs$kBJ9KgmmByGLy+gsM2l9lhyNm7cwWWaztwIhAnOZ+u4=	2022-02-17 11:26:52.176652+09	f				f	t	2022-02-16 10:03:17.618455+09	01062111	0	長谷_管理者	ハセ_カンリシャ	343-3434-3434	0	2001-12-15	f	\N
140	pbkdf2_sha256$150000$OZr80MIT095q$SZ7k7L15v9C9a+pspijlYX5x1w5wIZe8iEBF0GZOpwU=	2022-02-16 13:47:03.295838+09	f				f	t	2022-02-15 13:11:15.195652+09	01001507	1	店長3	テンチョウ3	010-0000-0003	1	1980-04-09	f	100
100	pbkdf2_sha256$150000$Fv9qSHyJ97i1$ikR9XR5HLS3jjrm2vC8b3Zc35wrP2vhZ6SIYGWDU9r0=	\N	f				f	t	2022-02-14 11:56:19.05666+09	01041905	3	従業員39	ジュウギョウイン39	030-0000-0017	0	2000-09-06	f	104
92	pbkdf2_sha256$150000$rP1Wsef6prWP$ucyc0EquV3ntEtA+3Lf9SQFSlRmiuAehtubmk0stAFI=	2022-02-15 11:27:15.719185+09	f				f	t	2022-02-14 11:52:04.327275+09	01041901	0	管理者8	カンリシャ8	000-0000-0005	0	1991-04-09	f	\N
96	pbkdf2_sha256$150000$vdArmIgqmXjK$kBpscrG0ii2zSQPPA+fXqDQ17TQBW2do9xXhtvR2zS8=	2022-02-17 11:48:52.242699+09	f				f	t	2022-02-14 11:54:01.510859+09	01041903	2	従業員37	ジュウギョウイン37	020-0000-0009	0	1984-08-01	f	104
130	pbkdf2_sha256$150000$tBnvcsb66uyO$p6FGwi2SzZNXJPfvu5O2CpRBZHAQYP2na3cBa+bkBpc=	2022-02-17 12:01:45.238155+09	f				f	t	2022-02-14 13:30:29.457496+09	01031803	2	従業員31	ジュウギョウイン31	020-0000-0007	1	1975-08-24	f	103
142	pbkdf2_sha256$150000$uUgnhIO8eDXj$ZC1QCBn93NI0O9f0EdfHEeliIbWcdxSgxm4OM0LLeqA=	2022-02-17 14:04:59.100959+09	f				f	t	2022-02-15 13:12:57.232539+09	01001509	2	従業員1	ジュウギョウイン1	020-0000-0001	0	2004-07-07	f	100
138	pbkdf2_sha256$150000$I6Fa8BiUZcoz$HdEAiqnmD9IT4WjRz9bFwl8oRzpu3uq71Djt+80x5k8=	2022-02-16 13:46:19.899599+09	f				f	t	2022-02-15 13:09:33.079794+09	01001505	1	店長1	テンチョウ1	010-0000-0001	1	1992-07-09	f	100
104	pbkdf2_sha256$150000$ls1PLMKdrDEn$u5TjrjnsBtezQJ6O4wYOsYwH4NYwtLVycnf0q4LOfpU=	2022-02-16 14:03:14.890263+09	f				f	t	2022-02-14 11:59:35.081123+09	01052001	0	管理者9	カンリシャ9	000-0000-0006	0	1987-11-11	f	\N
110	pbkdf2_sha256$150000$3KCallY7lGqi$TZFNFD6kqwZuVAeoD2cev2bDKKlOGv+4SjkmsYeUlcg=	\N	f				f	t	2022-02-14 13:16:32.604036+09	01052007	3	従業員23	ジュウギョウイン23	030-0000-0023	0	1962-08-10	f	105
132	pbkdf2_sha256$150000$sWRno3MaJrD9$1BKZSaeApnYkkAKlZ/0jj0HVORP4iXLtkZI5K9yvpQ4=	\N	f				f	t	2022-02-14 13:32:13.650872+09	01031805	3	従業員33	ジュウギョウイン33	030-0000-0013	0	1989-12-01	f	103
124	pbkdf2_sha256$150000$ESM9U8xNPGS6$aXkbVoGFcezPFiLeiSU7YAuRz1WakpFyw4oIRkWM+5Y=	\N	f				f	t	2022-02-14 13:25:33.701578+09	01021705	3	従業員15	ジュウギョウイン15	030-0000-0009	0	1994-09-29	f	102
144	pbkdf2_sha256$150000$5Vwp2bkWRiBQ$egMatEoTC1TR1aqxlITkfxlKb1TsOxGj05yUpM9c6mU=	2022-02-16 13:47:32.265029+09	f				f	t	2022-02-15 13:16:00.956115+09	01001511	3	従業員3	ジュウギョウイン3	030-0000-0001	1	2002-12-02	f	100
126	pbkdf2_sha256$150000$vHjP4CT9qJYc$fdYIv1onxs9LefFT/OJBMZHDMHEIIq8NXAMudiPdp2w=	\N	f				f	t	2022-02-14 13:27:17.511017+09	01021707	3	従業員17	ジュウギョウイン17	030-0000-0011	1	1999-01-09	f	102
102	pbkdf2_sha256$150000$dELGZYM9ZU9j$BiBB4ytL/6aQwuYCgWdzB7PO/x/k51dK4tZxWbcIinA=	\N	f				f	t	2022-02-14 11:57:56.409639+09	01041907	3	従業員41	ジュウギョウイン41	030-0000-0019	0	2004-04-09	f	104
134	pbkdf2_sha256$150000$3q86EtU7zgXY$98jB0bexdbUCza0M10LX6C0PKX0v4soDFuJ/MjRVv+Q=	\N	f				f	t	2022-02-14 13:33:38.996543+09	01031807	3	従業員35	ジュウギョウイン35	030-0000-0015	1	1998-11-22	f	103
148	pbkdf2_sha256$150000$8WlohoX61ri0$TNc4dXwks8CzPVGGJ2pQ6gIUyspKBBrW/oBoAH9GFRs=	2022-02-16 13:49:43.743925+09	f				f	t	2022-02-16 10:01:12.251843+09	01062109	0	新満_管理者	シンミツ_カンリシャ	121-1212-1212	0	2002-02-07	f	\N
90	pbkdf2_sha256$150000$nYslRXi5dGel$783rbzao8Po00JREGNSgdCkEP/xZ95V+KEWOqA9q6aM=	2022-02-16 10:49:09.931878+09	f				f	t	2022-02-14 11:50:41.371782+09	01011603	2	従業員7	ジュウギョウイン7	020-0000-0003	1	1994-07-14	f	101
98	pbkdf2_sha256$150000$iZDhsPMEfig9$2/oUrQCOK/eP9tjaUAk/cPiP0GM4TqyFRomW37YLW5M=	\N	f				f	t	2022-02-14 11:55:26.59199+09	01041904	2	従業員38	ジュウギョウイン38	020-0000-0010	1	1994-02-23	f	104
106	pbkdf2_sha256$150000$Yq3i6WdZgjFL$Un0EXVf9Ffeosjg+7ViFwML//Vd/dkmApO26IhEIDns=	2022-02-16 13:50:11.836839+09	f				f	t	2022-02-14 13:09:31.601123+09	01052003	3	従業員19	ジュウギョウイン19	020-0000-0011	1	2022-06-16	f	105
120	pbkdf2_sha256$150000$4pI34k5SpLOU$sWjClJLOV7wnuDhqNK3lOmXcq+fovnQ71/rEl9lJh4c=	\N	f				f	t	2022-02-14 13:23:14.821941+09	01062107	3	小林_従業員	コバヤシ_ジュウギョウイン	030-0000-0027	0	1996-05-15	f	106
152	pbkdf2_sha256$150000$u7eCHIqhJDKp$DODElNcse5Mqp5KKSNK3sEKERnL3YYE7bGXvIPDkbJc=	2022-02-17 11:47:09.412776+09	f				f	t	2022-02-16 10:05:39.769252+09	01062113	0	小林_管理者	コバヤシ_カンリシャ	565-5656-5656	0	1999-04-28	f	\N
114	pbkdf2_sha256$150000$0vXDFtd6Ib8h$FetKCVeBhZwdxdi4PQzcif+OQ2hXdH3ZnCwsC1j/PcU=	2022-02-17 14:04:59.366325+09	f				f	t	2022-02-14 13:19:58.658072+09	01062103	2	新満_従業員	シンミツ_ジュウギョウイン	020-0000-0013	0	1980-10-09	f	106
116	pbkdf2_sha256$150000$oiIKk7cAk67t$x2BfrR09W/aLMcxkUSQ0evJigIXFv1LM5eaPkJ13MdQ=	2022-02-17 11:45:52.325309+09	f				f	t	2022-02-14 13:20:45.948509+09	01062104	2	西村_従業員	ニシムラ_ジュウギョウイン	020-0000-0014	0	1985-06-01	f	106
146	pbkdf2_sha256$150000$6MxNW0BXYBvv$yFArf/WsmfJ0zxApU5VoRqZeDB/t3xEyw7hSVy0AAj0=	2022-02-16 13:47:45.87938+09	f				f	t	2022-02-15 13:18:32.314631+09	01001513	3	従業員5	ジュウギョウイン	030-0000-0005	1	1994-08-18	f	100
88	pbkdf2_sha256$150000$Wu9S9D3wPs5C$3iWiBwWAiibIOcfMtViqkQwXFNxv7qCvRp6JTY3C0uE=	2022-02-16 13:47:48.738308+09	f				f	t	2022-02-14 11:47:54.242645+09	01011601	0	管理者5	カンリシャ5	000-0000-0002	0	1991-01-11	f	\N
149	pbkdf2_sha256$150000$YPL6ygqodQU2$47pqr7VS+QnFFxbnnIXp6jGOSffNhX/5MZEqb+lH9Cg=	\N	f				f	t	2022-02-16 10:02:11.135341+09	01062110	0	西村_管理者	ニシムラ_カンリシャ	232-2323-2323	1	2001-01-30	f	\N
94	pbkdf2_sha256$150000$MkBu2qShS4KJ$/k3NFvYeqPZRw1wqK3H9k3bBXfyaZooXvl3mDw1FJ3I=	\N	f				f	t	2022-02-14 11:52:52.004458+09	01041902	1	店長8	テンチョウ8	010-0000-0005	1	1987-06-10	f	104
122	pbkdf2_sha256$150000$3e3s87BlZ126$UwQ9rwGy2KrUv6F4ZbKGqwkhentGfupFRMw00zzy0ko=	2022-02-17 11:11:28.390153+09	f				f	t	2022-02-14 13:24:00.220452+09	01062108	3	呉_従業員	ゴ_ジュウギョウイン	030-0000-0028	0	1999-06-02	f	106
118	pbkdf2_sha256$150000$LakB4XP3HyS9$451czf5fIeG+fPD35/4KRffEw1TbOJtJ8s2ZSFa4XY8=	2022-02-17 14:35:12.312587+09	f				f	t	2022-02-14 13:21:36.260297+09	01062105	3	長谷_従業員	ハセ_ジュウギョウイン	030-0000-0025	0	1992-07-18	f	106
151	pbkdf2_sha256$150000$tW1kMrulMHte$sRlGyRArG9/tLFqg1b2Z8bKfGiRquiP+e+GgiJvFMkw=	\N	f				f	t	2022-02-16 10:04:21.112459+09	01062112	0	内藤_管理者	ナイトウ_カンリシャ	454-4545-4545	0	1999-09-26	f	\N
128	pbkdf2_sha256$150000$pBU67vL8PP9I$XemBMcHxCR+iGk6IJwPwIlQaoTaSbeahaxPXlj9OMoI=	2022-02-17 12:02:29.214202+09	f				f	t	2022-02-14 13:28:41.703449+09	01031801	0	管理者7	カンリシャ7	000-0000-0004	0	1986-11-28	f	\N
91	pbkdf2_sha256$150000$I6byJzXpsth2$NfiRNLSoNuIES8pdQatRaORsA6HooB8p00TzUbyi8aM=	\N	f				f	t	2022-02-14 11:51:48.558554+09	01011604	2	従業員8	ジュウギョウイン8	020-0000-0004	1	1985-09-29	f	101
111	pbkdf2_sha256$150000$0OOC1C4AmUnw$P2R9UEUDKCM1Ui7QEif0Q0nFT+bC6QDdEgZe2F2OXo0=	\N	f				f	t	2022-02-14 13:17:23.276817+09	01052008	3	従業員24	ジュウギョウイン24	030-0000-0024	1	2001-05-19	f	105
117	pbkdf2_sha256$150000$HwMWl09634Ed$f5aHc/FrzW7dB1uk/dI7AnXURX9pJzM0FENPuIpg28E=	2022-02-14 14:27:09.70299+09	f				f	t	2022-02-14 13:20:56.04159+09	01021702	1	店長6	テンチョウ6	010－0000－0003	1	2003-03-21	f	102
1	pbkdf2_sha256$150000$hoxVmpN2jyan$MoxZlxhE1j5aNSqM4iDmQe55Om8RpsBBFsDZAOWT7c8=	2022-02-17 15:03:03.588684+09	t			sim@admin.com	t	t	2022-02-06 22:26:28.278978+09	99999999	0	Admin管理者	カンリシャ	09012123434	0	2022-02-06	f	\N
115	pbkdf2_sha256$150000$SSVJ9F0FpPzy$efHE5Sl/3/4LXqpIeoq7Y5NuZD/XA9Uv2BkGTjvjxIo=	2022-02-17 11:50:00.968934+09	f				f	t	2022-02-14 13:20:15.810774+09	01021701	0	管理者6	カンリシャ6	000-0000-0003	0	1994-03-08	f	\N
135	pbkdf2_sha256$150000$y50QzrzfgIbI$E95pLS2ayeJN+B6m4VVdXGeSPzRSal/FZLQp05Pcgr4=	\N	f				f	t	2022-02-14 13:34:07.882043+09	01031808	3	従業員36	ジュウギョウイン36	030-0000-0016	1	\N	f	103
137	pbkdf2_sha256$150000$fKeMf22vLqGr$0PB2sI3QviXHq0E+ZTFt7T/iQG4H7ii8QkDhaLkwAVI=	2022-02-16 13:48:23.045527+09	f				f	t	2022-02-15 13:08:36.999553+09	01001504	0	管理者4	カンリシャ4	000-0000-0012	0	2021-03-09	f	\N
107	pbkdf2_sha256$150000$m1lCMuyvGNXq$r3+t0YiCuB1Mctc1IGcEM1tF9ONkCXAM6HYJx+eSjA4=	2022-02-16 14:59:44.258347+09	f				f	t	2022-02-14 13:11:44.153852+09	01052004	2	従業員20	ジュウギョウイン20	020-0000-0012	0	1982-02-18	f	105
127	pbkdf2_sha256$150000$zbHi8kMRIUzo$5V/DAtg8Nb9jRp1iMFBCGS+hf/S11ZeC3N01BMFKFBg=	2022-02-17 11:46:27.352115+09	f				f	t	2022-02-14 13:27:52.653164+09	01021708	3	従業員18	ジュウギョウイン18	030-0000-0012	0	2005-10-18	f	102
139	pbkdf2_sha256$150000$f1g3ZIxObOkP$QaZbb/8nUB4tkII2GLqxDFLnQrt8WIWd91RkES1KPe8=	2022-02-16 13:46:48.288227+09	f				f	t	2022-02-15 13:10:22.969274+09	01001506	1	店長2	テンチョウ2	010-0000-0002	0	1964-01-26	f	100
123	pbkdf2_sha256$150000$6ouTL26cAVyP$UXGy8+DpkU7hgAF4dAv0C+k+b2rViQ6Tbec0bGb7A9o=	\N	f				f	t	2022-02-14 13:24:41.384932+09	01021704	2	従業員14	ジュウギョウイン14	020-0000-0006	0	1994-03-23	f	102
125	pbkdf2_sha256$150000$wbZXi7TGMvM2$y1Oy6hHfvktfOLW0l+Y1Z9DFYZMCR3ii/zmY3LxP+uw=	\N	f				f	t	2022-02-14 13:26:20.305407+09	01021706	3	従業員16	ジュウギョウイン16	030-0000-0010	0	2004-08-13	f	102
143	pbkdf2_sha256$150000$RDZSwO6QSAUa$f76Nz4LTboFGmeLtYLJDoelaUziBdK0w4sbaKNCliy4=	2022-02-16 13:47:24.549663+09	f				f	t	2022-02-15 13:15:13.108636+09	01001510	2	従業員2	ジュウギョウイン2	020-0000-0002	1	1992-10-26	f	100
145	pbkdf2_sha256$150000$U993JgR3p5kt$EmBB4wz8xtyT+hHq5Cdt+c1sGoUbsYsE3/x8IgrWvbg=	2022-02-16 13:47:39.941998+09	f				f	t	2022-02-15 13:16:59.163371+09	01001512	3	従業員4	ジュウギョウイン4	030-0000-0003	0	1993-05-06	f	100
99	pbkdf2_sha256$150000$fCuqWpcWJiMR$9XQua3kQa1mNqg9W0OmEi+vs6nS0BHZplVxCBxn6SXw=	2022-02-17 11:39:43.683319+09	f				f	t	2022-02-14 11:55:30.198226+09	01011608	3	従業員12	ジュウギョウイン12	030-0000-0008	0	1995-08-17	f	101
105	pbkdf2_sha256$150000$NyjnGnSZi5px$f7cWVRG6LvuhAITv2sJaFA+wGdFvcZNyB9Bz8ITjfD0=	2022-02-16 13:49:51.38635+09	f				f	t	2022-02-14 12:00:33.605549+09	01052002	1	店長9	テンチョウ9	010-0000-0006	0	1964-08-13	f	105
121	pbkdf2_sha256$150000$lyBK8v8K3bUl$kjTTcnxrwPBnBBWB+4BK4woq4P3CFR1Cjko1ZzTjWXQ=	2022-02-17 11:34:53.240636+09	f				f	t	2022-02-14 13:23:24.902628+09	01021703	2	従業員13	ジュウギョウイン13	020-0000-0005	0	1990-02-07	f	102
131	pbkdf2_sha256$150000$fXctZ43nkEPK$1Tilk7bkjLG6VPdgFqL4zOJ/LIgB4DfT7/Fq1p15FCs=	\N	f				f	t	2022-02-14 13:31:23.332697+09	01031804	2	従業員32	ジュウギョウイン32	020-0000-0008	0	2002-12-18	f	103
101	pbkdf2_sha256$150000$Ni8v5vwDcsec$ZEclbobSwvJhfRL0hcITF39YUCHQJIhQtJrgoTP4QKw=	\N	f				f	t	2022-02-14 11:57:04.999343+09	01041906	3	従業員40	ジュウギョウイン40	030-0000-0018	0	2014-12-23	f	104
129	pbkdf2_sha256$150000$NsOzxsIl6bgC$Uadr+Oh3ZS9EbSDamwbDeoJjRGUOlGUbOghFESfyfIk=	\N	f				f	t	2022-02-14 13:29:28.867691+09	01031802	1	店長7	テンチョウ7	010-0000-0004	1	1998-08-13	f	103
133	pbkdf2_sha256$150000$cODf1OdTFLpv$58aZNNM2MFczdbC2I9wXVqUJme6jIFwrjRtn3SM0A5c=	\N	f				f	t	2022-02-14 13:32:58.302194+09	01031806	3	従業員34	ジュウギョウイン34	030-0000-0014	0	2004-02-12	f	103
103	pbkdf2_sha256$150000$q7sH8mn0jjlj$zFU9DXGvc6iGZoiJPz3/gW3hyrNYEq4L9eCyHSkmHEY=	\N	f				f	t	2022-02-14 11:58:43.139526+09	01041908	3	従業員42	ジュウギョウイン42	030-0000-0020	1	2010-03-04	f	104
109	pbkdf2_sha256$150000$guCmW3Hdys5t$NmFkI2QFVV6uTe6tz7/mZYj6sQzMTi8HqI8BmKn+tjo=	\N	f				f	t	2022-02-14 13:15:38.040607+09	01052006	3	従業員22	ジュウギョウイン22	030-0000-0022	0	2013-09-12	f	105
95	pbkdf2_sha256$150000$NWnbJfmZffLu$m/2Hxbhb2AHEi0uW6MwIXSCacCfwCpGK928N7vYpmoI=	2022-02-17 11:48:27.726872+09	f				f	t	2022-02-14 11:53:58.974376+09	01011606	3	従業員10	ジュウギョウイン10	030-0000-0006	1	1996-02-08	f	101
97	pbkdf2_sha256$150000$G7ufJgY7VhC6$A/dIKsfM51F3B+n2JPf75AeNk9WBf4UC4QdPkY+2tVc=	2022-02-14 13:12:46.514313+09	f				f	t	2022-02-14 11:54:42.705313+09	01011607	3	従業員11	ジュウギョウイン11	030-0000-0007	1	2003-03-24	f	101
89	pbkdf2_sha256$150000$TdVsc71MP6c6$uAoSQfH0H3bkQOw+KBZnHinjGIFMR+CvqgoOcloQUJI=	2022-02-15 14:30:08.282828+09	f				f	t	2022-02-14 11:48:46.993054+09	01011602	1	店長5	テンチョウ5	010－0000－0002	0	2006-02-10	f	101
93	pbkdf2_sha256$150000$WT9qkpXfU2nO$U/Xkf6EGPrKXMIrOz3txcuERJfgJKWscBV8JJClNdN0=	2022-02-17 11:47:52.846483+09	f				f	t	2022-02-14 11:52:46.598089+09	01011605	3	従業員9	ジュウギョウイン9	030-0000-0005	0	1993-06-24	f	101
81	pbkdf2_sha256$150000$IjWSbR71hViI$0MrrEaJMkTyOuPyq0Arl+OMMtnavZzX7LA9QcPILtwI=	2022-02-16 13:47:48.39405+09	f				f	t	2022-02-14 11:40:19.2109+09	01001502	1	管理者2	カンリシャ2	010－0000－0001	1	2005-02-05	f	\N
136	pbkdf2_sha256$150000$zUGs9GP0UWLt$2h1YXf9PUzkRNxCVAiQGVk9m/d9nFo39uvsWesS816k=	2022-02-16 13:48:05.834277+09	f				f	t	2022-02-15 11:52:40.393609+09	01001503	0	管理者3	カンリシャ3	000-0000-0011	0	1992-09-22	f	\N
147	pbkdf2_sha256$150000$ZISfjtckRsQh$danmJCfXT4pdqyVK+/cs1jIHaskQ2Psfz71zMI+spZI=	2022-02-17 14:05:18.694824+09	f				f	t	2022-02-15 13:20:23.360169+09	01001514	3	従業員6	ジュウギョウイン6	030-0000-0006	1	1982-10-08	f	100
113	pbkdf2_sha256$150000$isBnsfbXRPHD$ekpZ5idR+KDoIhFjPAC2+WEVQa53o1P29JQhqpNVBXI=	\N	f				f	t	2022-02-14 13:19:05.980637+09	01062102	1	店長10	カンリシャ10	010-0000-0007	0	1975-08-18	f	106
141	pbkdf2_sha256$150000$Vbi5QWcFwStK$z3v9lqUfMu5asoeTxXBCSTqPDGR5U1jzM3lc3dB0mnA=	2022-02-16 16:16:19.905606+09	f				f	t	2022-02-15 13:12:12.282358+09	01001508	1	店長4	テンチョウ4	010-0000-0004	0	1992-08-11	f	100
119	pbkdf2_sha256$150000$3iEanAhmPN89$O0WruLlXY3UQzA175ULQsgisqtKY2Z3B9t8DKCdGTOg=	2022-02-16 17:48:56.569277+09	f				f	t	2022-02-14 13:22:32.686361+09	01062106	3	内藤_従業員	ナイトウ_ジュウギョウイン	030-0000-0026	0	1998-08-08	f	106
154	pbkdf2_sha256$150000$ZyAnzPqSHbD9$0jm0f/U0k2hlaTr6PozarqbBPY4yAedDAII8eqMKmI8=	2022-02-16 10:29:31.69656+09	f				f	t	2022-02-16 10:25:19.76385+09	12121212	0	長谷川	ハセガワ	000-0000-0000	0	2022-02-15	f	106
112	pbkdf2_sha256$150000$zAbjEF0CAPW9$/EGK6Y0NQUPd1wX3Iq/6FuKUCEmnTyma3CyWe35Yz8g=	2022-02-16 17:42:36.322694+09	f				f	t	2022-02-14 13:18:20.366572+09	01062101	0	管理者10	カンリシャ10	000-0000-0007	0	1986-03-10	f	\N
153	pbkdf2_sha256$150000$MFTPooOLq8s9$LLSSHyqeSRTPJzaUiLnE6UEvzy2OX9AhygX2Lc0jsoA=	2022-02-17 10:04:41.408909+09	f				f	t	2022-02-16 10:07:35.146867+09	01062114	0	呉_管理者	ゴ_カンリシャ	676-6767-6767	0	1998-08-17	f	\N
\.


--
-- Data for Name: custom_user_groups; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.custom_user_groups (id, customuser_id, group_id) FROM stdin;
1	1	1
80	80	1
88	88	1
89	89	2
90	90	3
91	91	3
92	92	1
93	93	3
94	94	2
95	95	3
96	96	3
97	97	3
98	98	3
99	99	3
100	100	3
101	101	3
102	102	3
103	103	3
104	104	1
105	105	2
106	106	3
107	107	3
108	108	3
109	109	3
110	110	3
111	111	3
112	112	1
113	113	2
114	114	3
115	115	1
116	116	3
117	117	2
118	118	3
119	119	3
120	120	3
121	121	3
122	122	3
123	123	3
124	124	3
125	125	3
126	126	3
127	127	3
128	128	1
129	129	2
130	130	3
131	131	3
132	132	3
133	133	3
134	134	3
135	135	3
136	81	1
137	136	1
138	137	1
139	138	2
140	139	2
141	140	2
142	141	2
143	142	3
144	143	3
145	144	3
146	145	3
147	146	3
148	147	3
149	148	1
150	149	1
151	150	1
152	151	1
153	152	1
154	153	1
155	154	1
\.


--
-- Data for Name: custom_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.custom_user_user_permissions (id, customuser_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-02-06 22:29:21.748856+09	1	管理者	1	[{"added": {}}]	3	1
2	2022-02-06 22:29:39.522142+09	2	店長	1	[{"added": {}}]	3	1
3	2022-02-06 22:30:01.863031+09	3	従業員	1	[{"added": {}}]	3	1
4	2022-02-06 22:31:41.046783+09	1	Admin管理者	2	[{"changed": {"fields": ["employment_status", "name", "ruby_name", "tel_num", "gender", "birthday", "groups"]}}]	6	1
5	2022-02-06 23:39:09.873435+09	102	サンヨウジム	2	[{"changed": {"fields": ["invalid_flg"]}}]	8	1
6	2022-02-07 00:00:51.597492+09	10	グリーン	2	[{"changed": {"fields": ["employment_status"]}}]	6	1
7	2022-02-07 01:15:36.837263+09	1	タケシ ニビジム	1	[{"added": {}}]	17	1
8	2022-02-07 01:15:49.059868+09	2	カスミ ハナダジム	1	[{"added": {}}]	17	1
9	2022-02-07 01:15:58.137337+09	3	マチス クチバジム	1	[{"added": {}}]	17	1
10	2022-02-07 01:16:17.052558+09	4	エリカ タマムシジム	1	[{"added": {}}]	17	1
11	2022-02-07 01:16:33.427011+09	5	キョウ セキチクジム	1	[{"added": {}}]	17	1
12	2022-02-07 01:16:39.956158+09	6	アンズ セキチクジム	1	[{"added": {}}]	17	1
13	2022-02-07 01:16:55.765831+09	7	ナツメ ヤマブキジム	1	[{"added": {}}]	17	1
14	2022-02-07 01:17:09.382224+09	8	カツラ グレンジム	1	[{"added": {}}]	17	1
15	2022-02-07 01:17:22.827615+09	9	サカキ トキワジム	1	[{"added": {}}]	17	1
16	2022-02-07 01:17:29.275758+09	10	グリーン トキワジム	1	[{"added": {}}]	17	1
17	2022-02-07 01:18:00.968076+09	11	ハヤト キキョウジム	1	[{"added": {}}]	17	1
18	2022-02-14 10:11:19.365468+09	157	ヒスイ地方	2	[]	8	1
19	2022-02-14 10:30:43.251106+09	157	ヒスイ地方	3		8	1
20	2022-02-14 10:30:43.256604+09	156	シンオウ地方	3		8	1
21	2022-02-14 10:30:43.257912+09	155	マサラタウン	3		8	1
22	2022-02-14 10:30:43.259228+09	154	エイセツジム	3		8	1
23	2022-02-14 10:30:43.260757+09	153	クノエジム	3		8	1
24	2022-02-14 10:30:43.262279+09	152	ヒヨクジム	3		8	1
25	2022-02-14 10:30:43.264207+09	151	シャラジム	3		8	1
26	2022-02-14 10:30:43.265516+09	150	ショウヨウジム	3		8	1
27	2022-02-14 10:30:43.266917+09	149	ハクダンジム	3		8	1
28	2022-02-14 10:30:43.268272+09	148	セイガイハジム	3		8	1
29	2022-02-14 10:30:43.269523+09	147	タチワキジム	3		8	1
30	2022-02-14 10:30:43.270772+09	146	ヒオウギジム	3		8	1
31	2022-02-14 10:30:43.271978+09	145	ソウリュウジム	3		8	1
32	2022-02-14 10:30:43.273191+09	144	セッカジム	3		8	1
33	2022-02-14 10:30:43.274425+09	143	フキヨセジム	3		8	1
34	2022-02-14 10:30:43.276107+09	142	ホドモエジム	3		8	1
35	2022-02-14 10:30:43.277462+09	141	ライモンジム	3		8	1
36	2022-02-14 10:30:43.278643+09	140	ヒウンジム	3		8	1
37	2022-02-14 10:30:43.280082+09	139	シッポウジム	3		8	1
38	2022-02-14 10:30:43.281239+09	138	ルネジム	3		8	1
39	2022-02-14 10:30:43.282412+09	137	トクサネジム	3		8	1
40	2022-02-14 10:30:43.283707+09	136	ヒワマキジム	3		8	1
41	2022-02-14 10:30:43.284992+09	135	トウカジム	3		8	1
42	2022-02-14 10:30:43.286342+09	134	フエンジム	3		8	1
43	2022-02-14 10:30:43.288066+09	133	キンセツジム	3		8	1
44	2022-02-14 10:30:43.289348+09	132	ムロジム	3		8	1
45	2022-02-14 10:30:43.290657+09	131	カナズミジム	3		8	1
46	2022-02-14 10:30:43.291867+09	130	フスベジム	3		8	1
47	2022-02-14 10:30:43.293103+09	129	チョウジジム	3		8	1
48	2022-02-14 10:30:43.294349+09	128	アサギジム	3		8	1
49	2022-02-14 10:30:43.295862+09	127	タンバジム	3		8	1
50	2022-02-14 10:30:43.297178+09	126	エンジュジム	3		8	1
51	2022-02-14 10:30:43.298359+09	125	コガネジム	3		8	1
52	2022-02-14 10:30:43.30002+09	124	ヒワダジム	3		8	1
53	2022-02-14 10:30:43.301241+09	123	キキョウジム	3		8	1
54	2022-02-14 10:30:43.302643+09	122	トキワジム	3		8	1
55	2022-02-14 10:30:43.304034+09	121	グレンジム	3		8	1
56	2022-02-14 10:30:43.305604+09	120	ヤマブキジム	3		8	1
57	2022-02-14 10:30:43.306857+09	119	セキチクジム	3		8	1
58	2022-02-14 10:30:43.308122+09	118	タマムシジム	3		8	1
59	2022-02-14 10:30:43.309485+09	117	クチバジム	3		8	1
60	2022-02-14 10:30:43.310719+09	116	ニビジム	3		8	1
61	2022-02-14 10:30:43.312088+09	115	ハナダジム	3		8	1
62	2022-02-14 10:30:43.313296+09	114	ヒャッコクジム	3		8	1
63	2022-02-14 10:30:43.314613+09	113	ミアレジム	3		8	1
64	2022-02-14 10:30:43.315932+09	112	ヨスガジム	3		8	1
65	2022-02-14 10:30:43.317147+09	111	ミオジム	3		8	1
66	2022-02-14 10:30:43.318344+09	110	マサゴタウン	3		8	1
67	2022-02-14 10:30:43.319753+09	109	フタバタウン	3		8	1
68	2022-02-14 10:30:43.321284+09	108	ハクタイジム	3		8	1
69	2022-02-14 10:30:43.322722+09	107	ノモセジム	3		8	1
70	2022-02-14 10:52:06.482409+09	70	社員1	1	[{"added": {}}]	6	1
71	2022-02-14 10:55:36.043961+09	71	店長1	1	[{"added": {}}]	6	1
72	2022-02-14 10:56:43.033189+09	72	正規社員1	1	[{"added": {}}]	6	1
73	2022-02-14 10:57:45.803099+09	73	正規社員2	1	[{"added": {}}]	6	1
74	2022-02-14 10:59:38.655984+09	74	非正規社員1	1	[{"added": {}}]	6	1
75	2022-02-14 11:00:42.651178+09	75	非正規社員2	1	[{"added": {}}]	6	1
76	2022-02-14 11:03:45.070628+09	76	非正規社員3	1	[{"added": {}}]	6	1
77	2022-02-14 11:07:34.930588+09	77	非正規社員4	1	[{"added": {}}]	6	1
78	2022-02-14 11:21:43.846275+09	78	社員2	1	[{"added": {}}]	6	1
79	2022-02-14 11:26:53.523853+09	78	社員2	3		6	1
80	2022-02-14 11:26:53.526167+09	77	非正規社員4	3		6	1
81	2022-02-14 11:26:53.527491+09	76	非正規社員3	3		6	1
82	2022-02-14 11:26:53.528859+09	75	非正規社員2	3		6	1
83	2022-02-14 11:26:53.530603+09	74	非正規社員1	3		6	1
84	2022-02-14 11:26:53.532064+09	73	正規社員2	3		6	1
85	2022-02-14 11:26:53.533563+09	72	正規社員1	3		6	1
86	2022-02-14 11:26:53.534803+09	71	店長1	3		6	1
87	2022-02-14 11:26:53.536435+09	70	社員1	3		6	1
88	2022-02-14 11:26:53.537744+09	63	エリートトレーナー	3		6	1
89	2022-02-14 11:26:53.539109+09	39	コーン	3		6	1
90	2022-02-14 11:26:53.540396+09	38	ポッド	3		6	1
91	2022-02-14 11:26:53.541721+09	37	デント	3		6	1
92	2022-02-14 11:26:53.54295+09	36	デンジ	3		6	1
93	2022-02-14 11:26:53.544174+09	35	スズナ	3		6	1
94	2022-02-14 11:26:53.545469+09	31	スモモ	3		6	1
95	2022-02-14 11:26:53.546846+09	29	ヒョウタ	3		6	1
96	2022-02-14 14:20:24.398788+09	159	田端店	3		8	1
97	2022-02-14 14:20:28.786996+09	158	田端店	3		8	1
98	2022-02-14 14:20:40.705647+09	106	秋葉原店	2	[]	8	1
99	2022-02-15 09:30:49.970369+09	19	EarningInfo object (19)	3		11	1
100	2022-02-15 09:30:59.75906+09	18	EarningInfo object (18)	3		11	1
101	2022-02-15 09:30:59.767937+09	17	EarningInfo object (17)	3		11	1
102	2022-02-15 09:30:59.77116+09	16	EarningInfo object (16)	3		11	1
103	2022-02-15 09:30:59.773206+09	15	EarningInfo object (15)	3		11	1
104	2022-02-15 09:30:59.774964+09	14	EarningInfo object (14)	3		11	1
105	2022-02-15 09:30:59.776472+09	13	EarningInfo object (13)	3		11	1
106	2022-02-15 09:30:59.777753+09	12	EarningInfo object (12)	3		11	1
107	2022-02-15 09:30:59.778964+09	11	EarningInfo object (11)	3		11	1
108	2022-02-15 09:30:59.780422+09	10	EarningInfo object (10)	3		11	1
109	2022-02-15 09:30:59.781705+09	9	EarningInfo object (9)	3		11	1
110	2022-02-15 09:30:59.7828+09	8	EarningInfo object (8)	3		11	1
111	2022-02-15 09:30:59.78396+09	7	EarningInfo object (7)	3		11	1
112	2022-02-15 09:30:59.785222+09	6	EarningInfo object (6)	3		11	1
113	2022-02-15 09:30:59.786471+09	5	EarningInfo object (5)	3		11	1
114	2022-02-15 09:30:59.787704+09	4	EarningInfo object (4)	3		11	1
115	2022-02-15 09:38:16.105709+09	21	EarningInfo object (21)	3		11	1
116	2022-02-15 09:38:22.486262+09	20	EarningInfo object (20)	3		11	1
117	2022-02-15 09:39:02.973892+09	22	EarningInfo object (22)	1	[{"added": {}}]	11	1
118	2022-02-15 09:39:17.523441+09	23	EarningInfo object (23)	1	[{"added": {}}]	11	1
119	2022-02-15 09:39:31.938388+09	24	EarningInfo object (24)	1	[{"added": {}}]	11	1
120	2022-02-15 09:39:47.411287+09	25	EarningInfo object (25)	1	[{"added": {}}]	11	1
121	2022-02-15 09:40:37.352856+09	22	EarningInfo object (22)	2	[{"changed": {"fields": ["employee_id"]}}]	11	1
122	2022-02-15 09:40:51.525229+09	26	EarningInfo object (26)	1	[{"added": {}}]	11	1
123	2022-02-15 09:41:04.476664+09	27	EarningInfo object (27)	1	[{"added": {}}]	11	1
124	2022-02-15 09:41:17.008291+09	28	EarningInfo object (28)	1	[{"added": {}}]	11	1
125	2022-02-15 11:18:19.38067+09	29	EarningInfo object (29)	3		11	1
126	2022-02-15 11:49:00.801385+09	87	従業員6	3		6	1
127	2022-02-15 11:49:00.803509+09	86	従業員5	3		6	1
128	2022-02-15 11:49:00.804754+09	85	従業員4	3		6	1
129	2022-02-15 11:49:00.805989+09	84	従業員3	3		6	1
130	2022-02-15 11:49:00.807204+09	83	従業員2	3		6	1
131	2022-02-15 11:49:00.8086+09	82	従業員1	3		6	1
132	2022-02-15 11:50:49.879318+09	81	管理者2	2	[{"changed": {"fields": ["name", "ruby_name", "groups"]}}]	6	1
133	2022-02-16 16:06:00.673136+09	156	None	3		6	1
134	2022-02-16 16:06:00.67649+09	155	None	3		6	1
135	2022-02-17 09:51:16.123981+09	43	EarningInfo object (43)	3		11	1
136	2022-02-17 09:51:23.680272+09	48	EarningInfo object (48)	3		11	1
137	2022-02-17 09:51:37.790759+09	38	EarningInfo object (38)	3		11	1
138	2022-02-17 09:51:50.851534+09	28	EarningInfo object (28)	3		11	1
139	2022-02-17 09:51:58.397146+09	23	EarningInfo object (23)	3		11	1
140	2022-02-17 09:53:40.885788+09	35	EarningInfo object (35)	3		11	1
141	2022-02-17 09:53:58.816925+09	33	EarningInfo object (33)	3		11	1
142	2022-02-17 09:54:36.704594+09	41	EarningInfo object (41)	3		11	1
143	2022-02-17 09:54:42.803849+09	42	EarningInfo object (42)	3		11	1
144	2022-02-17 09:54:49.509889+09	46	EarningInfo object (46)	3		11	1
145	2022-02-17 09:58:20.555012+09	79	中村	3		6	1
146	2022-02-17 09:58:20.55719+09	65	石川　太郎	3		6	1
147	2022-02-17 10:48:51.90227+09	52	EarningInfo object (52)	3		11	1
148	2022-02-17 15:03:21.343646+09	64	EarningInfo object (64)	3		11	1
149	2022-02-17 15:05:08.00717+09	65	EarningInfo object (65)	3		11	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	accounts	customuser
7	employeemas	employeeinfo
8	storemas	storeinfo
9	itemmas	itemspecification
10	itemmas	iteminfo
11	earningmas	earninginfo
12	benchmas	cpubench
13	benchmas	gpubench
14	bottleneckmas	bottleneck
15	setitem	setitems
16	reserve	reserve
17	workstatus	workstatus
18	sites	site
19	account	emailaddress
20	account	emailconfirmation
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-02-06 22:24:39.340705+09
2	contenttypes	0002_remove_content_type_name	2022-02-06 22:24:39.349946+09
3	auth	0001_initial	2022-02-06 22:24:39.371798+09
4	auth	0002_alter_permission_name_max_length	2022-02-06 22:24:39.395867+09
5	auth	0003_alter_user_email_max_length	2022-02-06 22:24:39.402124+09
6	auth	0004_alter_user_username_opts	2022-02-06 22:24:39.408598+09
7	auth	0005_alter_user_last_login_null	2022-02-06 22:24:39.414876+09
8	auth	0006_require_contenttypes_0002	2022-02-06 22:24:39.416748+09
9	auth	0007_alter_validators_add_error_messages	2022-02-06 22:24:39.422902+09
10	auth	0008_alter_user_username_max_length	2022-02-06 22:24:39.428944+09
11	auth	0009_alter_user_last_name_max_length	2022-02-06 22:24:39.435115+09
12	auth	0010_alter_group_name_max_length	2022-02-06 22:24:39.44135+09
13	auth	0011_update_proxy_permissions	2022-02-06 22:24:39.450462+09
14	accounts	0001_initial	2022-02-06 22:24:39.471652+09
15	account	0001_initial	2022-02-06 22:24:39.515942+09
16	account	0002_email_max_length	2022-02-06 22:24:39.537849+09
17	storemas	0001_initial	2022-02-06 22:24:39.546899+09
18	accounts	0002_auto_20220119_0224	2022-02-06 22:24:39.565781+09
19	accounts	0003_auto_20220119_0913	2022-02-06 22:24:39.586409+09
20	accounts	0004_auto_20220203_0237	2022-02-06 22:24:39.61279+09
21	accounts	0005_auto_20220204_0015	2022-02-06 22:24:39.633673+09
22	accounts	0006_auto_20220204_1714	2022-02-06 22:24:39.644261+09
23	admin	0001_initial	2022-02-06 22:24:39.662631+09
24	admin	0002_logentry_remove_auto_add	2022-02-06 22:24:39.679692+09
25	admin	0003_logentry_add_action_flag_choices	2022-02-06 22:24:39.690181+09
26	benchmas	0001_initial	2022-02-06 22:24:39.702357+09
27	bottleneckmas	0001_initial	2022-02-06 22:24:39.70972+09
28	itemmas	0001_initial	2022-02-06 22:24:39.731671+09
29	employeemas	0001_initial	2022-02-06 22:24:39.757218+09
30	earningmas	0001_initial	2022-02-06 22:24:39.782807+09
31	earningmas	0002_auto_20220115_2148	2022-02-06 22:24:39.812672+09
32	earningmas	0003_remove_earninginfo_gross_profit_margin	2022-02-06 22:24:39.823175+09
33	earningmas	0004_auto_20220119_0913	2022-02-06 22:24:39.841218+09
34	earningmas	0005_auto_20220119_1434	2022-02-06 22:24:39.859477+09
35	employeemas	0002_auto_20220203_0237	2022-02-06 22:24:39.879568+09
36	itemmas	0002_auto_20220118_1216	2022-02-06 22:24:39.889918+09
37	itemmas	0003_auto_20220119_0154	2022-02-06 22:24:39.899875+09
38	itemmas	0004_auto_20220119_1434	2022-02-06 22:24:39.914898+09
39	itemmas	0005_itemspecification_memory	2022-02-06 22:24:39.922773+09
40	itemmas	0006_auto_20220119_1620	2022-02-06 22:24:39.961395+09
41	itemmas	0007_auto_20220203_0237	2022-02-06 22:24:39.973064+09
42	reserve	0001_initial	2022-02-06 22:24:39.991373+09
43	reserve	0002_auto_20220118_1216	2022-02-06 22:24:40.081557+09
44	reserve	0003_auto_20220119_1434	2022-02-06 22:24:40.102761+09
45	reserve	0004_auto_20220204_0015	2022-02-06 22:24:40.114549+09
46	reserve	0005_auto_20220204_0516	2022-02-06 22:24:40.150646+09
47	sessions	0001_initial	2022-02-06 22:24:40.160298+09
48	storemas	0002_auto_20220119_0913	2022-02-06 22:24:40.176007+09
49	storemas	0003_auto_20220119_1614	2022-02-06 22:24:40.240773+09
50	setitem	0001_initial	2022-02-06 22:24:40.262022+09
51	setitem	0002_setitems_counter	2022-02-06 22:24:40.34897+09
52	setitem	0003_auto_20220204_0516	2022-02-06 22:24:40.525982+09
53	setitem	0004_auto_20220204_1714	2022-02-06 22:24:40.677783+09
54	sites	0001_initial	2022-02-06 22:24:40.685938+09
55	sites	0002_alter_domain_unique	2022-02-06 22:24:40.694416+09
56	storemas	0004_auto_20220206_2037	2022-02-06 22:24:40.706644+09
57	workstatus	0001_initial	2022-02-06 22:24:40.726509+09
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
m11csscjmkez5jdupp99jfdhyhfrhj2p	NjcyMzQ2ZTIyYzYxYjkwMzY2ZTI5MzdlYTUyZDdiNTY2MTE4ODBjZjp7Il9hdXRoX3VzZXJfaWQiOiI2NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjk1ZDc4NTU5ZGU0MTEwODk1OTU3N2E2MzQ4ZTY3MWE3NzEzZjk1YiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2022-02-22 14:29:44.822907+09
gadjnsj0wal34inpb1vucxsqnq6dl1pq	NjcyMzQ2ZTIyYzYxYjkwMzY2ZTI5MzdlYTUyZDdiNTY2MTE4ODBjZjp7Il9hdXRoX3VzZXJfaWQiOiI2NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjk1ZDc4NTU5ZGU0MTEwODk1OTU3N2E2MzQ4ZTY3MWE3NzEzZjk1YiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2022-02-22 15:13:40.05635+09
eke3l2slrmen5yroyw47ld03kyuh6it5	MTljNzE0Yjc5ZDRlMTNjMGNhYTdhNTc1Y2MyZDBkMTk0OGQ3Yjc0Zjp7Il9hdXRoX3VzZXJfaWQiOiI2NiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjUxNzAyODhjOGY5MmU3NTYyYzg2Yzk0YjNmMTc4N2M2ZjU3ZTMzYyIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2022-02-24 10:13:36.681098+09
oe73a0fr488d3tscsmdps85s3e3knge9	OWRkM2E3ZmI3ZTU3ODQ1Nzg4NTgwZGU0ZGI5YTQ5Y2UxN2I2ODVmOTp7Il9hdXRoX3VzZXJfaWQiOiIxNTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImEyYTkxMTA0YzQxZGUxOTkxYjc3MTAwMTdiNzczYTJkZWU2Y2NmOGUiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-02 10:29:31.699684+09
urhoz811pzv02j2d74u3il0eybcymy8b	NjhmMjQ0MWUyMjM3YWI1ODA1NjE1YjQ0YTA3MDZkZmE1N2NkMTU1ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NTdhODhlODg3MzU0YTcyMGU2OTdjNmYzNWVkNTgxMjViNTUzYzIyIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==	2022-02-28 09:59:18.811623+09
h8vxwkh89yuount7w7w1rus13nb4y1w0	NjhmMjQ0MWUyMjM3YWI1ODA1NjE1YjQ0YTA3MDZkZmE1N2NkMTU1ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NTdhODhlODg3MzU0YTcyMGU2OTdjNmYzNWVkNTgxMjViNTUzYzIyIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==	2022-02-21 01:13:00.188476+09
hcjkdtn6lsadhhc112nmp466ejbkn5qm	NjhmMjQ0MWUyMjM3YWI1ODA1NjE1YjQ0YTA3MDZkZmE1N2NkMTU1ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NTdhODhlODg3MzU0YTcyMGU2OTdjNmYzNWVkNTgxMjViNTUzYzIyIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==	2022-02-21 01:17:27.634585+09
wux6wl1ehlcijbok8z3p996rv7bi9b68	NjBkZjA5MTM0MDg1M2EwZmM4MGNiYWI4Yjk1MzA5YTk2MTgyNmUxNzp7Il9hdXRoX3VzZXJfaWQiOiIxMjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjljODcwZjcyZDEwNjEzMTkyMDAzMDYxODUyNThjZjI0MDNlMDFmODIiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-03 11:11:28.393836+09
vy297ayt7yi324p8cxmhfq6odx0qyamq	ZjFlMjY3ZGRhMzc2NDIwYjQxZDZlY2Y3NjgzNWNiY2NiMmY1NmM1Yzp7Il9hdXRoX3VzZXJfaWQiOiI3OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTlhNjg5Mzk5ZTViOWJkMGYwNjY1ZGViMTEyY2JhMTk2MzBkNTdiYyIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2022-02-28 11:28:02.530787+09
xn14ln5dbdbucsb68fkvanhkl71whoq5	NjhmMjQ0MWUyMjM3YWI1ODA1NjE1YjQ0YTA3MDZkZmE1N2NkMTU1ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NTdhODhlODg3MzU0YTcyMGU2OTdjNmYzNWVkNTgxMjViNTUzYzIyIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==	2022-02-21 09:59:11.169775+09
7wz9t0uq7jv0zvlpa7r7lhz6pgbv93e6	M2QxNmQ3MjYxNjU1ZDc2OTgxMDdkNjFlZDk3ODE0MmFjYWE3N2MzNjp7Il9hdXRoX3VzZXJfaWQiOiI4MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2RhYzUyYjMwZWMwMjBmNzA5YzI0NTJiNTdmY2EzZTQ3MmYyMDI5NSIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwOTYwMH0=	2022-02-28 11:49:40.867929+09
lp0dbnps0lx9rajg3nwpgt7u25t5lheq	MjYyNTMzNTgzYzlkOTRhMWFiOGYwNTMzYzQzYjBhMzY2YmMwOTgzNzp7Il9hdXRoX3VzZXJfaWQiOiI2OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjkwMTQ0MDQ3NmJkMzRhYzNhODA0NTExZjVkZWMyNzk2ZjMzNjczYyIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2022-02-21 11:30:59.273571+09
c1tx49xydua1djd37upigg3tjllf9m5e	ZWU0ZWQxZDFhYjBlMTVlMDFjNGFlZjgzNjRhZDI2MmMxYzI5MGY3Nzp7Il9hdXRoX3VzZXJfaWQiOiI2OCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2U0MmYyMWNiNmIwNjlmOWRkNjRiMTc2OTFkMjE1NmEyMDMxOTI1MiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2022-02-21 11:57:56.145399+09
hlxtyyat2vrepwhr7y3xplwcyz47v5sj	ZWU0ZWQxZDFhYjBlMTVlMDFjNGFlZjgzNjRhZDI2MmMxYzI5MGY3Nzp7Il9hdXRoX3VzZXJfaWQiOiI2OCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2U0MmYyMWNiNmIwNjlmOWRkNjRiMTc2OTFkMjE1NmEyMDMxOTI1MiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2022-02-21 12:52:23.454481+09
ok24ok7275bpfksyisl1fh4fdwbeghuj	ZWU0ZWQxZDFhYjBlMTVlMDFjNGFlZjgzNjRhZDI2MmMxYzI5MGY3Nzp7Il9hdXRoX3VzZXJfaWQiOiI2OCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2U0MmYyMWNiNmIwNjlmOWRkNjRiMTc2OTFkMjE1NmEyMDMxOTI1MiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2022-02-21 13:05:42.160981+09
7ndmt5rv6q1rxfta9dtfsn3fj5echyw0	ODJiNWM5MDRhYjIzMzZhNjllNWM1ZTk1MGQ0YzNhYTliNjBkYzkxNzp7Il9hdXRoX3VzZXJfaWQiOiI2NyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzllZjAxMDYxMWE3YTFmZWYyMjYzYWU5NDNmOWQ2ZTdjOTFjOWYzMyIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2022-02-21 13:06:47.323311+09
28pzoykv5ebotbxduyolzvuknyd8lswm	NjhmMjQ0MWUyMjM3YWI1ODA1NjE1YjQ0YTA3MDZkZmE1N2NkMTU1ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NTdhODhlODg3MzU0YTcyMGU2OTdjNmYzNWVkNTgxMjViNTUzYzIyIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==	2022-02-22 09:03:37.627876+09
iob434tbjq6o3nkfh0kykinmevd9vfuv	NjcyMzQ2ZTIyYzYxYjkwMzY2ZTI5MzdlYTUyZDdiNTY2MTE4ODBjZjp7Il9hdXRoX3VzZXJfaWQiOiI2NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjk1ZDc4NTU5ZGU0MTEwODk1OTU3N2E2MzQ4ZTY3MWE3NzEzZjk1YiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2022-02-22 11:42:13.074976+09
0msx56demesoq78wsuu48l3unpgqyytt	MTljNzE0Yjc5ZDRlMTNjMGNhYTdhNTc1Y2MyZDBkMTk0OGQ3Yjc0Zjp7Il9hdXRoX3VzZXJfaWQiOiI2NiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjUxNzAyODhjOGY5MmU3NTYyYzg2Yzk0YjNmMTc4N2M2ZjU3ZTMzYyIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2022-02-22 14:08:53.250295+09
oyhnp9ke5h5ug03bc9et2j3if10fe8e8	ODY4ZGU1MDM5ZWFhMmY5Yzc5ZjNmY2Y2N2RmNDVkM2Y0M2UwZjhmMzp7Il9hdXRoX3VzZXJfaWQiOiI4MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2RhYzUyYjMwZWMwMjBmNzA5YzI0NTJiNTdmY2EzZTQ3MmYyMDI5NSIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2022-02-28 13:48:11.116215+09
bhb41zvb89zsjeqfjlc2zdpxmouec7vc	Zjk4NGNkN2Y0NzgzZjg5YThhM2EwMGNmODI3ZDBmNjU3NmExYzQwZjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjgwIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZGFjNTJiMzBlYzAyMGY3MDljMjQ1MmI1N2ZjYTNlNDcyZjIwMjk1In0=	2022-02-28 14:26:02.090753+09
xf8wn9edvhj0b8vx60ehpwfdvdden1g5	ZmI2NTM5MmY4ZmZkMWY0ZmNmZTVkOWRhOTY1YWRkN2I4ZGVjNTU0Nzp7Il9hdXRoX3VzZXJfaWQiOiI5MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjI2YTE0NmZjYjZmMWM0Yjk5MWVmNmM2M2EwZTE0YjhkZTRkMzA2MCIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2022-03-02 10:21:19.5557+09
ycqf4ga7qlq789kylzd387vjcdckuk40	YWU4OWY3MzA4NDY2YmNmZDEyMmFiYzE4YTU0OGIxZDU3ZjU5ZjFiZjp7Il9hdXRoX3VzZXJfaWQiOiI5MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODRhOTZiYzE3NGEwZDJkY2FlODczNjliNWM5ZGViYmI0YjIyZTE4YiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2022-03-03 11:47:52.849143+09
quvvrtmmwzpup7e4rq4s4b7qrufuh6qb	NjcyMzQ2ZTIyYzYxYjkwMzY2ZTI5MzdlYTUyZDdiNTY2MTE4ODBjZjp7Il9hdXRoX3VzZXJfaWQiOiI2NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjk1ZDc4NTU5ZGU0MTEwODk1OTU3N2E2MzQ4ZTY3MWE3NzEzZjk1YiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2022-03-02 10:25:29.666632+09
875z613zfudgn7pf4grl6uwxvohvx2hh	YTc4OThjYmZiODY2MzBmNGVhNWFlZjAwZTI4NWQ4MGE4MDc2N2UyMjp7Il9hdXRoX3VzZXJfaWQiOiIxMzAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImY2ZjY1NDcyODQwYWRmOWQ5ZDMwMjAwNTM3OTU5YzIxMGZjMGRkYWYiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-03 12:01:45.240952+09
dc3yft6sa02tl2wyo11t84762ovhtg90	NjcyMzQ2ZTIyYzYxYjkwMzY2ZTI5MzdlYTUyZDdiNTY2MTE4ODBjZjp7Il9hdXRoX3VzZXJfaWQiOiI2NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjk1ZDc4NTU5ZGU0MTEwODk1OTU3N2E2MzQ4ZTY3MWE3NzEzZjk1YiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2022-03-01 10:11:26.626641+09
ul0jhgmjuvth83ky4dnpa9hui4khhk1j	NWUyYTdlNjRlNTEzMzkzODZjZjNjZjE3NjZkOTM2OWRmNWFmZmViYjp7Il9hdXRoX3VzZXJfaWQiOiIxMzYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjNhODQ0MDYwMWI3MGMwNjM2N2E4YmEzYWFlM2Q4NzRlNzliM2I2NTkiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-02 11:29:01.099077+09
8lktq2pt3gkbrq9ww3valvwfaqkzxx9j	YThjN2U4ZjQxYjkyNmY3OTVkOTc1NTMzMDU4NWY5Y2FiYTgzNTQ3Yjp7Il9hdXRoX3VzZXJfaWQiOiIxMTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImFkMzViM2JjNjUyYmE5NGI4ZTNiNDFjZGE0ZjcyYzY5MWJkMjZhMDkiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-02 17:42:36.32529+09
lr7xnqcwyxbcbd0g2srpm0bg8uv0eug0	OWI0NmE2MWQ3MjU2MzlhZDM0YzkzOGI2ZGRhYzIwYzMxYWJmMzI1Mzp7Il9hdXRoX3VzZXJfaWQiOiIxMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjE2YzlhOTEwNDFhYzNmMjUzODA5MjUxYmUzZTNjN2EyMTI3ZTUyNmEiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIl9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJcXHUzMGU2XFx1MzBmY1xcdTMwYjZcXHUzMGZjIDAxMDYyMTA2IFxcdTMwNjhcXHUzMDU3XFx1MzA2NlxcdTMwZWRcXHUzMGIwXFx1MzBhNFxcdTMwZjNcXHUzMDU3XFx1MzA3ZVxcdTMwNTdcXHUzMDVmXFx1MzAwMlwiXV0ifQ==	2022-03-02 17:48:56.573+09
ctp5j2yg06omiovqk0plzd657d3w94wb	ZjZmMGU5YzM3NTVjNGRjYjcxMTE0YjE5ODI4ZWZmYTllMDEyMGJlZjp7Il9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJcXHUzMGVkXFx1MzBiMFxcdTMwYTJcXHUzMGE2XFx1MzBjOFxcdTMwNTdcXHUzMDdlXFx1MzA1N1xcdTMwNWZcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTMwZTZcXHUzMGZjXFx1MzBiNlxcdTMwZmMgMDEwMDE1MDEgXFx1MzA2OFxcdTMwNTdcXHUzMDY2XFx1MzBlZFxcdTMwYjBcXHUzMGE0XFx1MzBmM1xcdTMwNTdcXHUzMDdlXFx1MzA1N1xcdTMwNWZcXHUzMDAyXCJdXSIsIl9hdXRoX3VzZXJfaWQiOiI4MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2RhYzUyYjMwZWMwMjBmNzA5YzI0NTJiNTdmY2EzZTQ3MmYyMDI5NSIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2022-03-02 17:52:26.690726+09
triwtievw0lk9d1zqsrfk6dqzxj0gmc1	MWQ3MWMwNjY3NjhkNjRiYzdjZDkyOTYzYjNiYTdjMWYzNzVhOTgyODp7Il9hdXRoX3VzZXJfaWQiOiIxMjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjE2N2Y0OWJlOGExZTA1ZjFmOTY5ZTAyYzRiMjViMjgyNDliZjc2YTEiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-01 11:20:13.5057+09
naqan2g7w39p14l1eb6al5byoq0ezl00	ODY4ZGU1MDM5ZWFhMmY5Yzc5ZjNmY2Y2N2RmNDVkM2Y0M2UwZjhmMzp7Il9hdXRoX3VzZXJfaWQiOiI4MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2RhYzUyYjMwZWMwMjBmNzA5YzI0NTJiNTdmY2EzZTQ3MmYyMDI5NSIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2022-03-01 14:29:35.711159+09
k5a0e1qknrpp2hzbsjff6n0do9hcabgj	ZDFkZTA0MGEwNWJiNDFmZDQ5OGFhNzZlYWNjZWZmZDQ1ODA1MmIxNjp7Il9hdXRoX3VzZXJfaWQiOiIxMzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjVjNGZmYjBmYmU1OTQxODBmMzhkZWEzMGRhZWQ0NzRlNDFmMzMxNjAiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-01 14:29:51.167119+09
nr9qfyf7hkjqd1pym5k8ljw9c38127ik	ZmZkNTVjNzllMGNiNjhlMmVhYzNkYTJjYTg2OGZmYzQyNTFmMTg3Zjp7Il9hdXRoX3VzZXJfaWQiOiIxNDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjI5MjljZDI0N2NlOGRjZGI1NzFmODQwNjBmODJkYTk3NTBlMDQ1YTAiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-02 16:00:33.946648+09
aa8rivm77i3z81xbwo71u414z4o5wohd	ODQ5ZWY3YzMyMjg4NzM0ZGUxYTVjZGUyYmI5MDIyMWMxNTQwNDAwMTp7Il9hdXRoX3VzZXJfaWQiOiIxMTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA3ZjMzZGVjZTcyOWM5M2JjMGRmYTY4YzRkNjU1MDcyMjFkYmE0ZmUiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-01 14:30:48.271396+09
kj3pw1cwch5nkatr3h9g1cjdxboq3qmv	Y2EwODFiNTVhNDMyNWQ3YjE3YjFmNmRlZDQ5ODQ3ZWFlNmIwN2M5Nzp7Il9hdXRoX3VzZXJfaWQiOiIxMDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjI1NWM4YWY5MDkwNGNhZjkyODI3YTM3NGJmZTBmYzU3ZDU2YjFlMzkiLCJfc2Vzc2lvbl9leHBpcnkiOjEyMDk2MDB9	2022-03-01 15:21:28.372669+09
qwy431hkl7zyo36lblawwvleee7csfqb	MDgxY2UwN2U2MTAwYTVkM2YyOThmYWFkMWMzYjI1NTg0NTU1NzUyMTp7Il9hdXRoX3VzZXJfaWQiOiIxMDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImQ0MDMwODQxMmZhODBiNzNjOTMwNjg4MGJkZjU3ODA4ZDRiNThhN2QiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-01 15:21:33.297557+09
j2ndb2dtvqazl0yx7grc09rgp7p43e6e	MDgxY2UwN2U2MTAwYTVkM2YyOThmYWFkMWMzYjI1NTg0NTU1NzUyMTp7Il9hdXRoX3VzZXJfaWQiOiIxMDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImQ0MDMwODQxMmZhODBiNzNjOTMwNjg4MGJkZjU3ODA4ZDRiNThhN2QiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-01 15:21:36.699694+09
5yjo17ja42jbrr3hl0xz6n9dj9dwkyef	MDgxY2UwN2U2MTAwYTVkM2YyOThmYWFkMWMzYjI1NTg0NTU1NzUyMTp7Il9hdXRoX3VzZXJfaWQiOiIxMDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImQ0MDMwODQxMmZhODBiNzNjOTMwNjg4MGJkZjU3ODA4ZDRiNThhN2QiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-01 15:22:37.618947+09
193t8zo0rubmmqz5hoeoaga4h52uw81g	ODY4ZGU1MDM5ZWFhMmY5Yzc5ZjNmY2Y2N2RmNDVkM2Y0M2UwZjhmMzp7Il9hdXRoX3VzZXJfaWQiOiI4MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2RhYzUyYjMwZWMwMjBmNzA5YzI0NTJiNTdmY2EzZTQ3MmYyMDI5NSIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2022-03-02 09:46:24.523902+09
g8107aqtokomjpkehpfrpo43v52umxyq	YWQ2NTY3NTM3YTQ3NDUwNDMyNDBmMTYxZmUzZGZmMzRkNzk2ZWZhNDp7Il9hdXRoX3VzZXJfaWQiOiIxNTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImUxNzNkZmQwNWNjZTFmMjIyNzA3N2JmMzI4ZWRjYjcwZDM0ZTlmNGEiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-03 11:47:09.415679+09
bqiksp5xn9xcobn5l9hw2d433fos7jo4	M2JmZjI0ZjRjM2JjNTRhODg3NWNiMDIxMTg5YzE3ZmMzMTQxM2Q2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjJiN2VlMzIwYWRiNGUyZDc1YTc0YTU0ODAxYjQzYzZkZjIyMjE4NDkiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-03 11:48:17.474608+09
di9jtf1m0066jva82oyg4yo9w43cqpmf	NDJmOTkyYTc5N2ExNWJkNWEyZjc2ZjU1ZGE2Y2ZlZTA3ZWMxNWY5YTp7Il9hdXRoX3VzZXJfaWQiOiI5NiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDA3NWIzNTQxMjBjZjUxNmQ2ZjE1MTM1MGQ0NjExNTFiMjQxN2M1ZiIsIl9zZXNzaW9uX2V4cGlyeSI6MTIwOTYwMH0=	2022-03-03 11:48:52.245291+09
i8sr9q1vj06e98wps0dhlis9kj9lkif5	M2JmZjI0ZjRjM2JjNTRhODg3NWNiMDIxMTg5YzE3ZmMzMTQxM2Q2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjJiN2VlMzIwYWRiNGUyZDc1YTc0YTU0ODAxYjQzYzZkZjIyMjE4NDkiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-03 11:50:00.97327+09
km2lbaed0jugifc2q6h6r82c0am9kaoq	MWQ3MWMwNjY3NjhkNjRiYzdjZDkyOTYzYjNiYTdjMWYzNzVhOTgyODp7Il9hdXRoX3VzZXJfaWQiOiIxMjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjE2N2Y0OWJlOGExZTA1ZjFmOTY5ZTAyYzRiMjViMjgyNDliZjc2YTEiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-03 12:02:29.217029+09
mddjzj0pf386imbgbxelxal4xse17w7x	YWQ2NTY3NTM3YTQ3NDUwNDMyNDBmMTYxZmUzZGZmMzRkNzk2ZWZhNDp7Il9hdXRoX3VzZXJfaWQiOiIxNTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImUxNzNkZmQwNWNjZTFmMjIyNzA3N2JmMzI4ZWRjYjcwZDM0ZTlmNGEiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-03 10:39:35.143178+09
sqbf5tukm4vkz14s0do6fsevuvfqavu3	NzM1MDE5NzgwMzZhYmU0NDgyN2I5ZjBkZjExNmE5ZTMyNGI2OGU3Nzp7Il9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJcXHUzMGVkXFx1MzBiMFxcdTMwYTJcXHUzMGE2XFx1MzBjOFxcdTMwNTdcXHUzMDdlXFx1MzA1N1xcdTMwNWZcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTMwZTZcXHUzMGZjXFx1MzBiNlxcdTMwZmMgMDEwNjIxMDggXFx1MzA2OFxcdTMwNTdcXHUzMDY2XFx1MzBlZFxcdTMwYjBcXHUzMGE0XFx1MzBmM1xcdTMwNTdcXHUzMDdlXFx1MzA1N1xcdTMwNWZcXHUzMDAyXCJdXSIsIl9hdXRoX3VzZXJfaWQiOiIxMjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjljODcwZjcyZDEwNjEzMTkyMDAzMDYxODUyNThjZjI0MDNlMDFmODIiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-02 17:44:35.676466+09
xm39veqxqeemmmhie14knqwjjnm05f6z	MmYyNzJlMDgwOGYwMTgxYWQ1MDYwYmI2MWJhMTljN2UyYTRlN2IxZjp7Il9hdXRoX3VzZXJfaWQiOiIxMjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjBlNTA4NmRiNWZhZjk5MzQzODRhNjU3MDkyMjlhMjEzMjBkM2JhOGIiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-03 11:19:19.248377+09
ju80437fk0e18vj5mr8moll59e43plwu	NDU0ZWM5NTIxODFiMGQ1MDdlZWRhNmFkZGMxNDUxM2E1MzY1Mzc3Mjp7Il9hdXRoX3VzZXJfaWQiOiIxMTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjMzOTIyYTQxMTBkNmIzMGU0MDBmOTExMzAxYjhkZmQ0MzY0MzdlMmUiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-02 17:45:06.866531+09
e3x53furje4kd8fyouoqac57qqn3lzws	ODY4ZGU1MDM5ZWFhMmY5Yzc5ZjNmY2Y2N2RmNDVkM2Y0M2UwZjhmMzp7Il9hdXRoX3VzZXJfaWQiOiI4MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2RhYzUyYjMwZWMwMjBmNzA5YzI0NTJiNTdmY2EzZTQ3MmYyMDI5NSIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2022-03-03 14:17:55.384098+09
hpgxd591c745eqs0uhnrkgv3163rekz7	MTVlZWU4M2NiYWNhMjllYWE3MjI3NTczM2I1ZGExNWQzZWU3ZGVmNDp7Il9hdXRoX3VzZXJfaWQiOiIxMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImVlZTFmNmUzOTRhNTVkZjRkNTJiMDAxMjg4YzM2YzQ3Yzk4NDJiMDMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-03 14:35:12.315682+09
g02wwvgtjljgmc3yx48xs8ex4003jdfz	YTc4OThjYmZiODY2MzBmNGVhNWFlZjAwZTI4NWQ4MGE4MDc2N2UyMjp7Il9hdXRoX3VzZXJfaWQiOiIxMzAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImY2ZjY1NDcyODQwYWRmOWQ5ZDMwMjAwNTM3OTU5YzIxMGZjMGRkYWYiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-03 11:33:07.113427+09
l87ur7wde81kec8hcsjb736771beiuv0	MWQ3MWMwNjY3NjhkNjRiYzdjZDkyOTYzYjNiYTdjMWYzNzVhOTgyODp7Il9hdXRoX3VzZXJfaWQiOiIxMjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjE2N2Y0OWJlOGExZTA1ZjFmOTY5ZTAyYzRiMjViMjgyNDliZjc2YTEiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-03 11:33:50.399663+09
qt650gso71gs7gv6kcajcw5mhi15svyt	NDU0ZWM5NTIxODFiMGQ1MDdlZWRhNmFkZGMxNDUxM2E1MzY1Mzc3Mjp7Il9hdXRoX3VzZXJfaWQiOiIxMTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjMzOTIyYTQxMTBkNmIzMGU0MDBmOTExMzAxYjhkZmQ0MzY0MzdlMmUiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-03 11:45:52.328332+09
h1fs6hcfnrl73vb7hok21mb7brf12mdu	N2Y3OTRlMmJlZmIzMjY5ZWZiMWFhMTc5ZjUyZWE5ODRmMTNkZjEzZDp7Il9hdXRoX3VzZXJfaWQiOiIxMzAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImY2ZjY1NDcyODQwYWRmOWQ5ZDMwMjAwNTM3OTU5YzIxMGZjMGRkYWYiLCJfc2Vzc2lvbl9leHBpcnkiOjEyMDk2MDB9	2022-03-03 11:46:16.350461+09
pvd87y1z83ci9l97m6w3t26qoc4wd6xm	MDFmNmE2OTIwMWVlOTg3NzFjMWVjNTI3ZDBmMGE3NzI4YjFhMjMzNDp7Il9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJcXHUzMGVkXFx1MzBiMFxcdTMwYTJcXHUzMGE2XFx1MzBjOFxcdTMwNTdcXHUzMDdlXFx1MzA1N1xcdTMwNWZcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTMwZTZcXHUzMGZjXFx1MzBiNlxcdTMwZmMgMDEwNjIxMDUgXFx1MzA2OFxcdTMwNTdcXHUzMDY2XFx1MzBlZFxcdTMwYjBcXHUzMGE0XFx1MzBmM1xcdTMwNTdcXHUzMDdlXFx1MzA1N1xcdTMwNWZcXHUzMDAyXCJdXSIsIl9hdXRoX3VzZXJfaWQiOiIxMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImVlZTFmNmUzOTRhNTVkZjRkNTJiMDAxMjg4YzM2YzQ3Yzk4NDJiMDMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-03 11:46:30.436662+09
ikkibg7iza1vdfa4blp6ovmkf8mjfjym	M2JmZjI0ZjRjM2JjNTRhODg3NWNiMDIxMTg5YzE3ZmMzMTQxM2Q2ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjJiN2VlMzIwYWRiNGUyZDc1YTc0YTU0ODAxYjQzYzZkZjIyMjE4NDkiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-03 11:46:37.598221+09
toae5ieb6rdahqe85skki2kzdd47zy42	YTc4OThjYmZiODY2MzBmNGVhNWFlZjAwZTI4NWQ4MGE4MDc2N2UyMjp7Il9hdXRoX3VzZXJfaWQiOiIxMzAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImY2ZjY1NDcyODQwYWRmOWQ5ZDMwMjAwNTM3OTU5YzIxMGZjMGRkYWYiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-03 11:46:43.550866+09
lbp5dzjiderbz0mj60mubyxd8qjiktxd	MWQ3MWMwNjY3NjhkNjRiYzdjZDkyOTYzYjNiYTdjMWYzNzVhOTgyODp7Il9hdXRoX3VzZXJfaWQiOiIxMjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjE2N2Y0OWJlOGExZTA1ZjFmOTY5ZTAyYzRiMjViMjgyNDliZjc2YTEiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-03 11:51:03.861027+09
qen86e3inizegd8nzu7dkua6jef2jwn0	MWQ3MWMwNjY3NjhkNjRiYzdjZDkyOTYzYjNiYTdjMWYzNzVhOTgyODp7Il9hdXRoX3VzZXJfaWQiOiIxMjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjE2N2Y0OWJlOGExZTA1ZjFmOTY5ZTAyYzRiMjViMjgyNDliZjc2YTEiLCJfc2Vzc2lvbl9leHBpcnkiOjB9	2022-03-03 11:51:04.068086+09
x7fitam86oi51t953ijfev9vketgcnsz	ZDlkODA4MTA4ZTk0MmJjMDE3ZDQzMDA1MDdjNzg2ZWQwZDE1NjIyYzp7Il9hdXRoX3VzZXJfaWQiOiIxNDciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjFlOWE4Zjg5MzExNjgyMmUyYWFiMDNlZDU2ODI1NTIwYzkyZTIxZmUiLCJfc2Vzc2lvbl9leHBpcnkiOjEyMDk2MDB9	2022-03-03 14:05:18.697744+09
1d4v86kykk8c2ecqrkn3xj8gsabs3ccf	ZWRiNDI2MjY0YWViMmFkNjcyMGE1YzhhY2RhOTFkYzMyOTcyMjRmYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NTdhODhlODg3MzU0YTcyMGU2OTdjNmYzNWVkNTgxMjViNTUzYzIyIn0=	2022-03-03 15:03:03.59203+09
dpy2iejopa6h982gxy34r1a360qk9sc7	ODY4ZGU1MDM5ZWFhMmY5Yzc5ZjNmY2Y2N2RmNDVkM2Y0M2UwZjhmMzp7Il9hdXRoX3VzZXJfaWQiOiI4MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2RhYzUyYjMwZWMwMjBmNzA5YzI0NTJiNTdmY2EzZTQ3MmYyMDI5NSIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=	2022-03-03 16:38:38.996952+09
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: earningmas_earninginfo; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.earningmas_earninginfo (earning_id, selling_price, sale_date, updated_at, employee_id, item_code, store_id) FROM stdin;
24	15000	2022-02-15	2022-02-15 09:39:31.937648+09	96	104240007	104
25	20000	2022-02-15	2022-02-15 09:39:47.410579+09	90	100240093	101
26	18000	2022-02-15	2022-02-15 09:40:51.52448+09	100	100240023	102
27	24000	2022-02-15	2022-02-15 09:41:04.47594+09	114	100240032	105
31	40000	2022-02-16	2022-02-16 10:24:06.924713+09	90	100240173	101
32	50000	2022-02-16	2022-02-16 10:26:09.702462+09	90	101240007	104
34	5000	2022-02-16	2022-02-16 11:30:34.307556+09	136	102240010	104
36	3000	2022-02-16	2022-02-16 17:16:05.477232+09	114	106240007	106
37	30000	2022-02-16	2022-02-16 17:17:02.97411+09	142	100240009	106
39	3000	2022-02-16	2022-02-16 17:27:11.614512+09	116	100240043	100
40	12908	2022-02-16	2022-02-16 17:27:13.402905+09	119	100240038	102
44	30000	2022-02-16	2022-02-16 17:44:54.091633+09	142	100240097	103
45	300	2022-02-16	2022-02-16 17:45:30.245515+09	122	100240089	104
47	4000	2022-02-16	2022-02-16 17:47:03.503445+09	116	100240090	104
49	57800	2022-02-17	2022-02-17 10:38:08.626344+09	142	100240831	103
50	20000	2022-02-17	2022-02-17 10:38:20.664377+09	153	100240174	103
51	4000	2022-02-17	2022-02-17 10:42:14.286642+09	114	100240109	104
53	39800	2022-02-17	2022-02-17 11:41:25.447532+09	152	100240250	106
54	3000	2022-02-17	2022-02-17 11:47:30.709378+09	116	100240181	103
55	9000	2022-02-17	2022-02-17 11:47:34.397636+09	130	100241048	103
56	10000	2022-02-17	2022-02-17 11:47:36.775644+09	130	100240103	102
57	3000	2022-02-17	2022-02-17 11:47:59.760599+09	128	100240263	103
58	10000	2022-02-17	2022-02-17 11:48:00.408786+09	80	100240093	106
59	35000	2022-02-17	2022-02-17 11:48:17.489138+09	130	100240105	103
60	12450	2022-02-17	2022-02-17 11:48:44.136915+09	115	100240273	102
61	39800	2022-02-17	2022-02-17 11:49:23.952117+09	152	100240338	101
62	5500	2022-02-17	2022-02-17 11:49:36.746429+09	118	100240118	104
63	500	2022-02-17	2022-02-17 11:49:48.323387+09	93	100240175	103
66	1	2022-02-17	2022-02-17 15:09:51.310277+09	118	100240421	103
67	14567	2022-02-17	2022-02-17 15:10:43.220123+09	1	100240405	104
\.


--
-- Data for Name: employeemas_employeeinfo; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.employeemas_employeeinfo (id, employee_id, employment_status, name, ruby_name, tel_num, gender, birthday, invalid_flg, created_at, lastlogin_at, updated_at, store_id) FROM stdin;
\.


--
-- Data for Name: itemmas_iteminfo; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.itemmas_iteminfo (item_code, model_number, category, manufacturer_name, item_status, purchase_price, item_image, remarks, created_at, updated_at, store_id) FROM stdin;
100240003	Let'sNote NX3	0	Panasonic	1	8534	LetsNote_NX3.jpg	\N	2022-01-19	2022-01-20	100
101240003	Let'sNote NX3	0	Panasonic	3	8534	LetsNote_NX3_jxzaOOU.jpg	\N	2022-01-19	2022-01-20	101
100240004	VJS111D12N	0	VAIO	3	13604	VJS111D12N.jpg	\N	2022-01-19	2022-02-14	100
101240005	Latitude 5580	0	DELL	1	16326	Latitude_5580_73YzjuW.png	\N	2022-01-19	2022-01-20	101
102240002	Let'sNote SZ6	0	Panasonic	1	17837	LetsNote_SZ6_lkOPyhg.jpg	\N	2022-01-19	2022-01-20	102
102240004	ideapad 310S-11IAP	0	Lenovo	1	0	ideapad_310S-11IAP.jpg	\N	2022-01-19	2022-01-20	102
102240003	Let'sNote MX4	0	Panasonic	1	9200	LetsNote_MX4.png	\N	2022-01-19	2022-01-20	102
102240005	Latitude 5580	0	DELL	1	16327	Latitude_5580_236MFzC.png	\N	2022-01-19	2022-01-20	102
103240002	Let'sNote SZ6	0	Panasonic	1	15600	LetsNote_SZ6_IsuAy43.jpg	\N	2022-01-19	2022-01-20	103
103240001	ThinkPad X270	0	Lenovo	3	12000	ThinkPad_X270.png	\N	2022-01-19	2022-01-20	103
103240003	LIFEBOOK U939	0	FUJITSU	2	56900	LIFEBOOK_U939.png	\N	2022-01-19	2022-01-20	103
104240004	ProBook 470 G5	0	hp	2	49000	ProBook_470_G5_ObmngCC.jpg	\N	2022-01-19	2022-01-20	104
103240005	Endeavor NJ5900E	0	EPSON	2	13450	Endeavor_NJ5900E.png	\N	2022-01-19	2022-01-20	103
103240007	Z24n	2	hp	2	3240	Z24n_hPOcNd8.png	\N	2022-01-19	2022-01-20	103
105240002	Let'sNote SZ5	0	Panasonic	4	14500	LetsNote_SZ5.jpg	\N	2022-01-19	2022-01-20	105
104240001	ThinkPad X270	0	Lenovo	2	12000	ThinkPad_X270_XQrkdZ5.png	\N	2022-01-19	2022-01-20	104
104240003	LIFEBOOK U938	0	FUJITSU	3	35800	LIFEBOOK_U938.png	\N	2022-01-19	2022-01-20	104
106240004	ProBook 470 G5	0	hp	1	49000	ProBook_470_G5_39R4Lvs.jpg	\N	2022-01-19	2022-01-20	106
104240005	Surface Pro4	0	Microsoft	1	27890	Surface_Pro4.png	\N	2022-01-19	2022-01-20	104
105240001	ThinkPad X270	0	Lenovo	1	12000	ThinkPad_X270_P7CngDj.png	\N	2022-01-19	2022-01-20	105
105240006	自作1	1	不明	2	20000	zisakupc1.jpg	\N	2022-01-19	2022-01-20	105
105240005	Surface Pro4	0	Microsoft	3	27890	Surface_Pro4_5oj19k3.png	\N	2022-01-19	2022-01-20	105
105240007	Z24n	2	hp	4	3240	Z24n_2kXGbgR.png	\N	2022-01-19	2022-01-20	105
106240006	自作2	1	不明	1	160000	zisakups2.jpg	\N	2022-01-19	2022-01-20	106
106240001	ThinkPad X270	0	Lenovo	2	12000	ThinkPad_X270_2AiZBMG.png	\N	2022-01-19	2022-01-20	106
106240005	MacBook Air Early 2015	0	Apple	4	37800	MacBook_Air_Early_2015.png	\N	2022-01-19	2022-01-20	106
102240007	Z24n	2	hp	1	3240	Z24n.png	\N	2022-01-19	2022-02-14	102
101240002	Let'sNote SZ6	0	Panasonic	1	17836	LetsNote_SZ6.jpg	\N	2022-01-19	2022-02-14	101
104240002	Let'sNote SZ6	0	Panasonic	1	13240	LetsNote_SZ6_ebCv4mm.jpg	\N	2022-01-19	2022-02-14	104
100240002	ThinkPad X61	0	IBM	1	0		フレームに傷あり	2022-01-19	2022-02-15	100
101240007	FlexScan EV2451	2	EIZO	1	10250	FlexScan_EV2451_KSGLqkO.png	\N	2022-01-19	2022-02-16	101
104240007	Z24n	2	hp	3	3240	Z24n_rFCrAOn.png	\N	2022-01-19	2022-02-16	104
105240004	ProBook 470 G5	0	hp	3	49000	ProBook_470_G5_9PWYYg8.jpg	\N	2022-01-19	2022-02-16	105
106240007	Z24n	2	hp	1	2890	Z24n_2GsDGom.png	\N	2022-01-19	2022-02-16	106
100240009	X1 Carbon 5thGen	0	Lenovo	1	23000		特になし	2022-02-16	2022-02-16	106
102240001	ThinkPad X1 Carbon 6gn	0	Lenovo	3	25000	ThinkPadX1Carbon6gn_8wloRId.png	\N	2022-01-19	2022-02-07	102
101240004	VJS111D12N	0	VAIO	1	13605	VJS111D12N_pf0hCS6.jpg	\N	2022-01-19	2022-02-07	101
101240001	ThinkPad X1 Carbon 6gn	0	Lenovo	3	25000	ThinkPadX1Carbon6gn_kpIi8mz.png	\N	2022-01-19	2022-02-07	101
103240004	ProBook 470 G5	0	hp	3	49000	ProBook_470_G5.jpg	\N	2022-01-19	2022-02-08	103
101240006	Optiplex 3040 Micro	1	DELL	4	12579	Optiplex_3040_Micro_tYKB3Ya.jpg	\N	2022-01-19	2022-01-20	101
101240008	323E7Q	2	PHILIPS	1	4000	323E7Q.jpg	\N	2022-01-19	2022-01-20	101
100240012	2019 Home & Business	6	Microsoft	1	25000	2019_Home__Business.jpg	\N	2022-01-19	2022-01-20	100
100240013	WPS Office 2	6	KINGSOFT	1	216	WPS_Office_2.png	\N	2022-01-19	2022-01-20	100
101240009	8GB	3	-	1	3000	8G_メモリ_lp0qjcc.png	\N	2022-01-19	2022-01-20	101
101240011	2010 Personal	6	Microsoft	1	8000	2010_Personal.png	\N	2022-01-19	2022-01-20	101
101240013	WPS Office 2	6	KINGSOFT	1	216	WPS_Office_2_Uc7AXYj.png	\N	2022-01-19	2022-01-20	101
102240006	Optiplex 3040 Micro	1	DELL	1	12579	Optiplex_3040_Micro_wv1JPep.jpg	\N	2022-01-19	2022-01-20	102
102240012	2021 Personal	6	Microsoft	4	26000	2021_Personal_zB5DhBI.jpg	\N	2022-01-19	2022-01-20	102
102240011	2010 Personal	6	Microsoft	2	8000	2010_Personal_UTwoIha.png	\N	2022-01-19	2022-01-20	102
103240006	Optiplex 3040 Micro	1	DELL	3	12579	Optiplex_3040_Micro_wDs5VM0.jpg	\N	2022-01-19	2022-01-20	103
104240008	323E7Q	2	PHILIPS	1	4003	323E7Q_nnZfbEz.jpg	\N	2022-01-19	2022-01-20	104
104240012	2021 Personal	6	Microsoft	3	26000	2021_Personal_xn9YC2c.jpg	\N	2022-01-19	2022-01-20	104
104240006	Optiplex 3040 Micro	1	DELL	2	12579	Optiplex_3040_Micro_AMn8irk.jpg	\N	2022-01-19	2022-01-20	104
103240009	8GB	3	-	3	3000	8G_メモリ_J2ZK7TS.png	\N	2022-01-19	2022-01-20	103
103240011	2010 Personal	6	Microsoft	2	8000	2010_Personal_zfGLefw.png	\N	2022-01-19	2022-01-20	103
105240008	323E7Q	2	PHILIPS	1	4004	323E7Q_LqGEsis.jpg	\N	2022-01-19	2022-01-20	105
106240002	Let'sNote SZ5	0	Panasonic	4	14500	LetsNote_SZ5_Ylq82Od.jpg	\N	2022-01-19	2022-01-20	106
104240009	8GB	3	-	2	3000	8G_メモリ_fpjk0W3.png	\N	2022-01-19	2022-01-20	104
104240011	2010 Personal	6	Microsoft	2	8000	2010_Personal_1iWo5W4.png	\N	2022-01-19	2022-01-20	104
105240003	LIFEBOOK U938	0	FUJITSU	1	35801	LIFEBOOK_U938_Oou5Dqx.png	\N	2022-01-19	2022-01-20	105
105240009	8GB	3	-	2	3000	8G_メモリ_zhIJa9h.png	\N	2022-01-19	2022-01-20	105
105240012	2021 Home & Business	6	Microsoft	3	28000	2021_Home__Business.jpg	\N	2022-01-19	2022-01-20	105
105240011	2010 Personal	6	Microsoft	4	8000	2010_Personal_HEGeU0P.png	\N	2022-01-19	2022-01-20	105
106240003	LIFEBOOK U938	0	FUJITSU	1	35802	LIFEBOOK_U938_9RNNRIA.png	\N	2022-01-19	2022-01-20	106
106240008	323E7Q	2	PHILIPS	2	4005	323E7Q_s1TNSsU.jpg	\N	2022-01-19	2022-01-20	106
106240012	2021 Home & Business	6	Microsoft	1	28000	2021_Home__Business_cKOzEbR.jpg	\N	2022-01-19	2022-01-20	106
106240009	8GB	3	-	2	3000	8G_メモリ_WHfBRNl.png	\N	2022-01-19	2022-01-20	106
106240011	2010 Home & Business	6	Microsoft	1	10000	2010_Personal_bQna7DP.png	\N	2022-01-19	2022-01-20	106
103240010	256GB	5	-	1	3000	ssd_kari256gb_KlRug3w.jpg	\N	2022-01-19	2022-02-16	103
10024010	X1 Carbon 4thGen	0	Lenovo	3	300			2022-02-16	2022-02-16	106
101240012	2021 Personal	6	Microsoft	1	26000	2021_Personal.jpg	\N	2022-01-19	2022-02-14	101
100240011	1TB	5	-	1	12000	1TB_SSD.png	\N	2022-01-19	2022-02-14	100
102240008	323E7Q	2	PHILIPS	1	4001	323E7Q_BHwHIyD.jpg	\N	2022-01-19	2022-02-14	102
100240010	129GB	5	-	1	0	ssd_kari129gb.png	\N	2022-01-19	2022-02-14	100
104240010	256GB	5	-	3	3000	ssd_kari256gb_otFNwVm.jpg	\N	2022-01-19	2022-02-16	104
106240010	256GB	5	-	1	3000	ssd_kari256gb_97uB3Nx.jpg	\N	2022-01-19	2022-02-14	106
101240010	130GB	5	-	1	0	ssd_kari130gb.jpg	\N	2022-01-19	2022-02-14	101
102240009	8GB	3	-	1	3000	8G_メモリ_vw9ahWN.png	\N	2022-01-19	2022-02-14	102
103240012	2021 Personal	6	Microsoft	1	26000	2021_Personal_r22PGaf.jpg	\N	2022-01-19	2022-02-15	103
103240008	323E7Q	2	PHILIPS	1	4002	323E7Q_r0aRTex.jpg	\N	2022-01-19	2022-02-15	103
100240006	Optiplex 3040 Micro	1	DELL	1	12579	Optiplex_3040_Micro.jpg	傷あり	2022-01-19	2022-02-15	100
102240010	256GB	5	-	1	3000	ssd_kari256gb.jpg	\N	2022-01-19	2022-02-16	102
105240010	256GB	5	-	3	3000	ssd_kari256gb_PGZq90s.jpg	\N	2022-01-19	2022-02-16	105
100240008	P2317H	5	hp	3	100	P2317H.jpg		2022-01-19	2022-02-16	100
100240021	Latitude 5580	0	DELL	1	16325	Latitude_5580.png	\N	2022-01-19	2022-02-14	100
100240023	Latitude 5580	0	DELL	1	16326	Latitude_5580_73YzjuW.png	\N	2022-01-19	2022-02-15	101
100240029	Let'sNote SZ6	0	Panasonic	1	15600	LetsNote_SZ6_IsuAy43.jpg	\N	2022-01-19	2022-02-15	103
100240014	ThinkPad X1 Carbon 6gn	0	Lenovo	1	25000	ThinkPadX1Carbon6gn_kpIi8mz.png	\N	2022-01-19	2022-02-16	101
100240019	Let'sNote NX3	0	Panasonic	3	8534	LetsNote_NX3_jxzaOOU.jpg	\N	2022-01-19	2022-02-16	101
100240030	Z24n	2	hp	1	3240	Z24n.png	\N	2022-01-19	2022-02-16	102
100240043	Surface Pro4	0	Microsoft	1	27890	Surface_Pro4.png	\N	2022-01-19	2022-02-16	104
100240016	Let'sNote SZ6	0	Panasonic	1	17836	LetsNote_SZ6.jpg	\N	2022-01-19	2022-01-20	101
100240017	ThinkPad X61	0	IBM	1	0	ThinkPad_X61.jpg	\N	2022-01-19	2022-01-20	100
100240018	Let'sNote NX3	0	Panasonic	3	8534	LetsNote_NX3.jpg	\N	2022-01-19	2022-01-20	100
100240020	VJS111D12N	0	VAIO	3	13604	VJS111D12N.jpg	\N	2022-01-19	2022-01-20	100
100240022	VJS111D12N	0	VAIO	1	13605	VJS111D12N_pf0hCS6.jpg	\N	2022-01-19	2022-01-20	101
100240024	FlexScan EV2451	2	EIZO	1	10250	FlexScan_EV2451_KSGLqkO.png	\N	2022-01-19	2022-01-20	101
100240025	Let'sNote SZ6	0	Panasonic	1	17837	LetsNote_SZ6_lkOPyhg.jpg	\N	2022-01-19	2022-01-20	102
100240026	ideapad 310S-11IAP	0	Lenovo	1	0	ideapad_310S-11IAP.jpg	\N	2022-01-19	2022-01-20	102
100240027	Let'sNote MX4	0	Panasonic	1	9200	LetsNote_MX4.png	\N	2022-01-19	2022-01-20	102
100240028	Latitude 5580	0	DELL	1	16327	Latitude_5580_236MFzC.png	\N	2022-01-19	2022-01-20	102
100240031	ProBook 470 G5	0	hp	3	49000	ProBook_470_G5.jpg	\N	2022-01-19	2022-01-20	103
100240034	LIFEBOOK U939	0	FUJITSU	2	56900	LIFEBOOK_U939.png	\N	2022-01-19	2022-01-20	103
100240035	ProBook 470 G5	0	hp	2	49000	ProBook_470_G5_ObmngCC.jpg	\N	2022-01-19	2022-01-20	104
100240036	Endeavor NJ5900E	0	EPSON	2	13450	Endeavor_NJ5900E.png	\N	2022-01-19	2022-01-20	103
100240037	Z24n	2	hp	4	3240	Z24n_hPOcNd8.png	\N	2022-01-19	2022-01-20	103
100240039	ProBook 470 G5	0	hp	2	49000	ProBook_470_G5_9PWYYg8.jpg	\N	2022-01-19	2022-01-20	105
100240041	LIFEBOOK U938	0	FUJITSU	1	35800	LIFEBOOK_U938.png	\N	2022-01-19	2022-01-20	104
100240042	ProBook 470 G5	0	hp	1	49000	ProBook_470_G5_39R4Lvs.jpg	\N	2022-01-19	2022-01-20	106
100240044	Z24n	2	hp	1	3240	Z24n_rFCrAOn.png	\N	2022-01-19	2022-01-20	104
100240045	ThinkPad X270	0	Lenovo	2	12000	ThinkPad_X270_P7CngDj.png	\N	2022-01-19	2022-01-20	105
100240046	自作1	1	不明	3	20000	zisakupc1.jpg	\N	2022-01-19	2022-01-20	105
100240047	Surface Pro4	0	Microsoft	4	27890	Surface_Pro4_5oj19k3.png	\N	2022-01-19	2022-01-20	105
100240048	Z24n	2	hp	1	3240	Z24n_2kXGbgR.png	\N	2022-01-19	2022-01-20	105
100240049	自作2	1	不明	2	160000	zisakups2.jpg	\N	2022-01-19	2022-01-20	106
100240050	ThinkPad X270	0	Lenovo	3	12000	ThinkPad_X270_2AiZBMG.png	\N	2022-01-19	2022-01-20	106
100240038	Let'sNote SZ5	0	Panasonic	1	14500	LetsNote_SZ5.jpg	\N	2022-01-19	2022-02-16	105
100240033	Let'sNote SZ6	0	Panasonic	2	13240	LetsNote_SZ6_ebCv4mm.jpg	LCD傷アリ	2022-01-19	2022-02-16	104
100240054	Z24n	2	hp	1	2890	Z24n_2GsDGom.png	\N	2022-01-19	2022-01-20	106
10024011	X1 Carbon 4thGen	0	Lenovo	3	300			2022-02-16	2022-02-16	106
100240032	ThinkPad X270	0	Lenovo	1	12000	ThinkPad_X270.png	\N	2022-01-19	2022-02-16	103
100240015	ThinkPad X1 Carbon 6gn	0	Lenovo	3	25000	ThinkPadX1Carbon6gn_IjPRjb0.png	未入力	2022-01-19	2022-02-16	100
100240052	MacBook Air Early 2015	0	Apple	3	37800	MacBook_Air_Early_2015.png	\N	2022-01-19	2022-02-17	106
100240040	ThinkPad X270	0	Lvo	3	12000	ThinkPad_X270_XQrkdZ5.png		2022-01-19	2022-02-17	104
100240118	323E7Q	2	PHILIPS	1	4004	323E7Q_LqGEsis.jpg	\N	2022-01-19	2022-02-17	105
222222222	DKG54656	1	クェーカー	1	22222			2022-02-16	2022-02-16	103
100240087	Optiplex 3040 Micro	1	DELL	3	12579	Optiplex_3040_Micro.jpg	\N	2022-01-19	2022-02-16	100
100240128	323E7Q	2	PHILIPS	3	4005	323E7Q_s1TNSsU.jpg	\N	2022-01-19	2022-02-16	106
100240097	130GB	5	-	1	0	ssd_kari130gb.jpg	\N	2022-01-19	2022-02-16	101
100240089	P2317H	2	hp	1	100	P2317H.jpg	\N	2022-01-19	2022-02-16	100
100240090	8GB	3	-	1	3000	8G_メモリ.png	\N	2022-01-19	2022-02-16	100
100240110	323E7Q	2	PHILIPS	3	4002	323E7Q_r0aRTex.jpg	\N	2022-01-19	2022-02-16	103
100240108	Optiplex 3040 Micro	1	DELL	3	12579	Optiplex_3040_Micro_wDs5VM0.jpg	\N	2022-01-19	2022-02-16	103
100240086	ThinkPad X1 Carbon 6gn	0	Lenovo	1	25000	ThinkPadX1Carbon6gn_8wloRId.png	\N	2022-01-19	2022-01-20	102
100240091	129GB	5	-	4	0	ssd_kari129gb.png	\N	2022-01-19	2022-01-20	100
100240092	Optiplex 3040 Micro	1	DELL	1	12579	Optiplex_3040_Micro_tYKB3Ya.jpg	\N	2022-01-19	2022-01-20	101
100240094	1TB	5	-	1	12000	1TB_SSD.png	\N	2022-01-19	2022-01-20	100
100240095	2019 Home & Business	6	Microsoft	1	25000	2019_Home__Business.jpg	\N	2022-01-19	2022-01-20	100
100240098	2021 Personal	6	Microsoft	1	26000	2021_Personal.jpg	\N	2022-01-19	2022-01-20	101
100240099	8GB	3	-	1	3000	8G_メモリ_lp0qjcc.png	\N	2022-01-19	2022-01-20	101
100240100	2010 Personal	6	Microsoft	1	8000	2010_Personal.png	\N	2022-01-19	2022-01-20	101
100240101	WPS Office 2	6	KINGSOFT	1	216	WPS_Office_2_Uc7AXYj.png	\N	2022-01-19	2022-01-20	101
100240104	256GB	5	-	4	3000	ssd_kari256gb.jpg	\N	2022-01-19	2022-01-20	102
100240106	8GB	3	-	2	3000	8G_メモリ_vw9ahWN.png	\N	2022-01-19	2022-01-20	102
100240107	2010 Personal	6	Microsoft	3	8000	2010_Personal_UTwoIha.png	\N	2022-01-19	2022-01-20	102
100240111	2021 Personal	6	Microsoft	1	26000	2021_Personal_r22PGaf.jpg	\N	2022-01-19	2022-01-20	103
100240113	256GB	5	-	3	3000	ssd_kari256gb_otFNwVm.jpg	\N	2022-01-19	2022-01-20	104
100240114	2021 Personal	6	Microsoft	2	26000	2021_Personal_xn9YC2c.jpg	\N	2022-01-19	2022-01-20	104
100240115	Optiplex 3040 Micro	1	DELL	3	12579	Optiplex_3040_Micro_AMn8irk.jpg	\N	2022-01-19	2022-01-20	104
100240116	8GB	3	-	2	3000	8G_メモリ_J2ZK7TS.png	\N	2022-01-19	2022-01-20	103
100240117	2010 Personal	6	Microsoft	1	8000	2010_Personal_zfGLefw.png	\N	2022-01-19	2022-01-20	103
100240119	256GB	5	-	4	3000	ssd_kari256gb_PGZq90s.jpg	\N	2022-01-19	2022-01-20	105
100240120	Let'sNote SZ5	0	Panasonic	2	14500	LetsNote_SZ5_Ylq82Od.jpg	\N	2022-01-19	2022-01-20	106
100240121	8GB	3	-	2	3000	8G_メモリ_fpjk0W3.png	\N	2022-01-19	2022-01-20	104
100240122	2010 Personal	6	Microsoft	1	8000	2010_Personal_1iWo5W4.png	\N	2022-01-19	2022-01-20	104
100240123	LIFEBOOK U938	0	FUJITSU	2	35801	LIFEBOOK_U938_Oou5Dqx.png	\N	2022-01-19	2022-01-20	105
100240124	8GB	3	-	3	3000	8G_メモリ_zhIJa9h.png	\N	2022-01-19	2022-01-20	105
100240125	2021 Home & Business	6	Microsoft	4	28000	2021_Home__Business.jpg	\N	2022-01-19	2022-01-20	105
100240126	2010 Personal	6	Microsoft	1	8000	2010_Personal_HEGeU0P.png	\N	2022-01-19	2022-01-20	105
100240127	LIFEBOOK U938	0	FUJITSU	2	35802	LIFEBOOK_U938_9RNNRIA.png	\N	2022-01-19	2022-01-20	106
100240129	256GB	5	-	1	3000	ssd_kari256gb_97uB3Nx.jpg	\N	2022-01-19	2022-01-20	106
100240130	2021 Home & Business	6	Microsoft	2	28000	2021_Home__Business_cKOzEbR.jpg	\N	2022-01-19	2022-01-20	106
100240131	8GB	3	-	1	3000	8G_メモリ_WHfBRNl.png	\N	2022-01-19	2022-01-20	106
100240132	2010 Home & Business	6	Microsoft	1	10000	2010_Personal_bQna7DP.png	\N	2022-01-19	2022-01-20	106
100240096	WPS Office 2	6	KINGSOFT	3	216	WPS_Office_2.png	\N	2022-01-19	2022-02-17	100
100240102	Optiplex 3040 Micro	1	DELL	3	12579	Optiplex_3040_Micro_wv1JPep.jpg	\N	2022-01-19	2022-02-17	102
100240112	323E7Q	2	PHILIPS	3	4003	323E7Q_nnZfbEz.jpg	\N	2022-01-19	2022-02-17	104
100240109	256GB	5	-	1	3000	ssd_kari256gb_KlRug3w.jpg	\N	2022-01-19	2022-02-17	103
100240088	FlexScan EV2451	2	EIZO	3	10500	FlexScan_EV2451.png	\N	2022-01-19	2022-02-17	100
100240103	323E7Q	2	PHILIPS	1	4001	323E7Q_BHwHIyD.jpg	\N	2022-01-19	2022-02-17	102
100240093	323E7Q	2	PHILIPS	1	4000	323E7Q.jpg	\N	2022-01-19	2022-02-17	101
100240105	2021 Personal	6	Microsoft	1	26000	2021_Personal_zB5DhBI.jpg	\N	2022-01-19	2022-02-17	102
100240173	ThinkPad X1 Carbon 6gn	0	Lenovo	1	25000	ThinkPadX1Carbon6gn_IjPRjb0.png	未入力	2022-01-19	2022-02-16	100
100240172	ThinkPad X1 Carbon 6gn	0	Lenovo	1	25000	ThinkPadX1Carbon6gn_kpIi8mz.png	\N	2022-01-19	2022-02-16	101
123456789	X270	0	Lenovo	3	5000			2022-02-16	2022-02-17	106
100240174	Let'sNote SZ6	0	Panasonic	1	17836	LetsNote_SZ6.jpg	\N	2022-01-19	2022-02-17	101
100240202	Z24n	2	hp	1	3240	Z24n_rFCrAOn.png	\N	2022-01-19	2022-02-17	104
100240181	Latitude 5580	0	DELL	1	16326	Latitude_5580_73YzjuW.png	\N	2022-01-19	2022-02-17	101
100240175	ThinkPad X61	0	IBM	1	0	ThinkPad_X61.jpg	\N	2022-01-19	2022-02-17	100
100240191	Let'sNote SZ6	0	Panasonic	3	13240	LetsNote_SZ6_ebCv4mm.jpg	\N	2022-01-19	2022-02-17	104
100240176	Let'sNote NX3	0	Panasonic	3	8534	LetsNote_NX3.jpg	\N	2022-01-19	2022-01-20	100
100240177	Let'sNote NX3	0	Panasonic	2	8534	LetsNote_NX3_jxzaOOU.jpg	\N	2022-01-19	2022-01-20	101
100240178	VJS111D12N	0	VAIO	3	13604	VJS111D12N.jpg	\N	2022-01-19	2022-01-20	100
100240179	Latitude 5580	0	DELL	2	16325	Latitude_5580.png	\N	2022-01-19	2022-01-20	100
100240180	VJS111D12N	0	VAIO	1	13605	VJS111D12N_pf0hCS6.jpg	\N	2022-01-19	2022-01-20	101
100240182	FlexScan EV2451	2	EIZO	4	10250	FlexScan_EV2451_KSGLqkO.png	\N	2022-01-19	2022-01-20	101
100240183	Let'sNote SZ6	0	Panasonic	2	17837	LetsNote_SZ6_lkOPyhg.jpg	\N	2022-01-19	2022-01-20	102
100240184	ideapad 310S-11IAP	0	Lenovo	2	0	ideapad_310S-11IAP.jpg	\N	2022-01-19	2022-01-20	102
100240185	Let'sNote MX4	0	Panasonic	1	9200	LetsNote_MX4.png	\N	2022-01-19	2022-01-20	102
100240186	Latitude 5580	0	DELL	2	16327	Latitude_5580_236MFzC.png	\N	2022-01-19	2022-01-20	102
100240187	Let'sNote SZ6	0	Panasonic	3	15600	LetsNote_SZ6_IsuAy43.jpg	\N	2022-01-19	2022-01-20	103
100240188	Z24n	2	hp	4	3240	Z24n.png	\N	2022-01-19	2022-01-20	102
100240189	ProBook 470 G5	0	hp	1	49000	ProBook_470_G5.jpg	\N	2022-01-19	2022-01-20	103
100240190	ThinkPad X270	0	Lenovo	2	12000	ThinkPad_X270.png	\N	2022-01-19	2022-01-20	103
100240192	LIFEBOOK U939	0	FUJITSU	1	56900	LIFEBOOK_U939.png	\N	2022-01-19	2022-01-20	103
100240193	ProBook 470 G5	0	hp	2	49000	ProBook_470_G5_ObmngCC.jpg	\N	2022-01-19	2022-01-20	104
100240194	Endeavor NJ5900E	0	EPSON	1	13450	Endeavor_NJ5900E.png	\N	2022-01-19	2022-01-20	103
100240195	Z24n	2	hp	1	3240	Z24n_hPOcNd8.png	\N	2022-01-19	2022-01-20	103
100240196	Let'sNote SZ5	0	Panasonic	2	14500	LetsNote_SZ5.jpg	\N	2022-01-19	2022-01-20	105
100240197	ProBook 470 G5	0	hp	2	49000	ProBook_470_G5_9PWYYg8.jpg	\N	2022-01-19	2022-01-20	105
100240198	ThinkPad X270	0	Lenovo	1	12000	ThinkPad_X270_XQrkdZ5.png	\N	2022-01-19	2022-01-20	104
100240199	LIFEBOOK U938	0	FUJITSU	2	35800	LIFEBOOK_U938.png	\N	2022-01-19	2022-01-20	104
100240200	ProBook 470 G5	0	hp	1	49000	ProBook_470_G5_39R4Lvs.jpg	\N	2022-01-19	2022-01-20	106
100240201	Surface Pro4	0	Microsoft	2	27890	Surface_Pro4.png	\N	2022-01-19	2022-01-20	104
100240203	ThinkPad X270	0	Lenovo	3	12000	ThinkPad_X270_P7CngDj.png	\N	2022-01-19	2022-01-20	105
100240204	自作1	1	不明	4	20000	zisakupc1.jpg	\N	2022-01-19	2022-01-20	105
100240205	Surface Pro4	0	Microsoft	1	27890	Surface_Pro4_5oj19k3.png	\N	2022-01-19	2022-01-20	105
100240206	Z24n	2	hp	2	3240	Z24n_2kXGbgR.png	\N	2022-01-19	2022-01-20	105
100240207	自作2	1	不明	3	160000	zisakups2.jpg	\N	2022-01-19	2022-01-20	106
100240208	ThinkPad X270	0	Lenovo	4	12000	ThinkPad_X270_2AiZBMG.png	\N	2022-01-19	2022-01-20	106
100240210	MacBook Air Early 2015	0	Apple	2	37800	MacBook_Air_Early_2015.png	\N	2022-01-19	2022-01-20	106
100240212	Z24n	2	hp	4	2890	Z24n_2GsDGom.png	\N	2022-01-19	2022-01-20	106
100240000	LIFEBOOK	1	FUJITSU	1	10000			2022-02-14	2022-02-14	100
100240250	Optiplex 3040 Micro	1	DELL	1	12579	Optiplex_3040_Micro_tYKB3Ya.jpg	\N	2022-01-19	2022-02-17	101
100240263	2021 Personal	6	Microsoft	1	26000	2021_Personal_zB5DhBI.jpg	\N	2022-01-19	2022-02-17	102
100240273	Optiplex 3040 Micro	1	DELL	1	12579	Optiplex_3040_Micro_AMn8irk.jpg	\N	2022-01-19	2022-02-17	104
100240277	256GB	5	-	3	3000	ssd_kari256gb_PGZq90s.jpg	\N	2022-01-19	2022-02-17	105
100240272	2021 Personal	6	Microsoft	3	26000	2021_Personal_xn9YC2c.jpg	\N	2022-01-19	2022-02-17	104
100240281	LIFEBOOK U938	0	FUJITSU	3	35801	LIFEBOOK_U938_Oou5Dqx.png	\N	2022-01-19	2022-02-17	105
100240282	8GB	3	-	3	3000	8G_メモリ_zhIJa9h.png	\N	2022-01-19	2022-02-17	105
100240244	ThinkPad X1 Carbon 6gn	0	Lenovo	1	25000	ThinkPadX1Carbon6gn_8wloRId.png	\N	2022-01-19	2022-01-20	102
100240245	Optiplex 3040 Micro	1	DELL	1	12579	Optiplex_3040_Micro.jpg	\N	2022-01-19	2022-01-20	100
100240246	FlexScan EV2451	2	EIZO	1	10500	FlexScan_EV2451.png	\N	2022-01-19	2022-01-20	100
100240247	P2317H	2	hp	1	100	P2317H.jpg	\N	2022-01-19	2022-01-20	100
100240248	8GB	3	-	1	3000	8G_メモリ.png	\N	2022-01-19	2022-01-20	100
100240249	129GB	5	-	0	0	ssd_kari129gb.png	\N	2022-01-19	2022-01-20	100
100240251	323E7Q	2	PHILIPS	3	4000	323E7Q.jpg	\N	2022-01-19	2022-01-20	101
100240252	1TB	5	-	0	12000	1TB_SSD.png	\N	2022-01-19	2022-01-20	100
100240253	2019 Home & Business	6	Microsoft	2	25000	2019_Home__Business.jpg	\N	2022-01-19	2022-01-20	100
100240254	WPS Office 2	6	KINGSOFT	2	216	WPS_Office_2.png	\N	2022-01-19	2022-01-20	100
100240255	130GB	5	-	2	0	ssd_kari130gb.jpg	\N	2022-01-19	2022-01-20	101
100240256	2021 Personal	6	Microsoft	2	26000	2021_Personal.jpg	\N	2022-01-19	2022-01-20	101
100240257	8GB	3	-	4	3000	8G_メモリ_lp0qjcc.png	\N	2022-01-19	2022-01-20	101
100240258	2010 Personal	6	Microsoft	0	8000	2010_Personal.png	\N	2022-01-19	2022-01-20	101
100240259	WPS Office 2	6	KINGSOFT	2	216	WPS_Office_2_Uc7AXYj.png	\N	2022-01-19	2022-01-20	101
100240260	Optiplex 3040 Micro	1	DELL	3	12579	Optiplex_3040_Micro_wv1JPep.jpg	\N	2022-01-19	2022-01-20	102
100240261	323E7Q	2	PHILIPS	1	4001	323E7Q_BHwHIyD.jpg	\N	2022-01-19	2022-01-20	102
100240262	256GB	5	-	1	3000	ssd_kari256gb.jpg	\N	2022-01-19	2022-01-20	102
100240264	8GB	3	-	1	3000	8G_メモリ_vw9ahWN.png	\N	2022-01-19	2022-01-20	102
100240265	2010 Personal	6	Microsoft	2	8000	2010_Personal_UTwoIha.png	\N	2022-01-19	2022-01-20	102
100240266	Optiplex 3040 Micro	1	DELL	3	12579	Optiplex_3040_Micro_wDs5VM0.jpg	\N	2022-01-19	2022-01-20	103
100240267	256GB	5	-	4	3000	ssd_kari256gb_KlRug3w.jpg	\N	2022-01-19	2022-01-20	103
100240268	323E7Q	2	PHILIPS	1	4002	323E7Q_r0aRTex.jpg	\N	2022-01-19	2022-01-20	103
100240269	2021 Personal	6	Microsoft	2	26000	2021_Personal_r22PGaf.jpg	\N	2022-01-19	2022-01-20	103
100240270	323E7Q	2	PHILIPS	3	4003	323E7Q_nnZfbEz.jpg	\N	2022-01-19	2022-01-20	104
100240271	256GB	5	-	4	3000	ssd_kari256gb_otFNwVm.jpg	\N	2022-01-19	2022-01-20	104
100240274	8GB	3	-	1	3000	8G_メモリ_J2ZK7TS.png	\N	2022-01-19	2022-01-20	103
100240275	2010 Personal	6	Microsoft	2	8000	2010_Personal_zfGLefw.png	\N	2022-01-19	2022-01-20	103
100240276	323E7Q	2	PHILIPS	4	4004	323E7Q_LqGEsis.jpg	\N	2022-01-19	2022-01-20	105
100240278	Let'sNote SZ5	0	Panasonic	2	14500	LetsNote_SZ5_Ylq82Od.jpg	\N	2022-01-19	2022-01-20	106
100240279	8GB	3	-	3	3000	8G_メモリ_fpjk0W3.png	\N	2022-01-19	2022-01-20	104
100240280	2010 Personal	6	Microsoft	1	8000	2010_Personal_1iWo5W4.png	\N	2022-01-19	2022-01-20	104
100240283	2021 Home & Business	6	Microsoft	2	28000	2021_Home__Business.jpg	\N	2022-01-19	2022-01-20	105
100240284	2010 Personal	6	Microsoft	3	8000	2010_Personal_HEGeU0P.png	\N	2022-01-19	2022-01-20	105
100240285	LIFEBOOK U938	0	FUJITSU	1	35802	LIFEBOOK_U938_9RNNRIA.png	\N	2022-01-19	2022-01-20	106
100240286	323E7Q	2	PHILIPS	2	4005	323E7Q_s1TNSsU.jpg	\N	2022-01-19	2022-01-20	106
100240287	256GB	5	-	3	3000	ssd_kari256gb_97uB3Nx.jpg	\N	2022-01-19	2022-01-20	106
100240288	2021 Home & Business	6	Microsoft	0	28000	2021_Home__Business_cKOzEbR.jpg	\N	2022-01-19	2022-01-20	106
100240289	8GB	3	-	1	3000	8G_メモリ_WHfBRNl.png	\N	2022-01-19	2022-01-20	106
100240290	2010 Home & Business	6	Microsoft	2	10000	2010_Personal_bQna7DP.png	\N	2022-01-19	2022-01-20	106
100240001	LIFEBOOK	0	FUJITSU	1	10000		あり	2022-02-14	2022-02-16	100
100240338	VJS111D12N	0	VAIO	1	13605	VJS111D12N_pf0hCS6.jpg	\N	2022-01-19	2022-02-17	101
100240332	Let'sNote SZ6	0	Panasonic	1	17836	LetsNote_SZ6.jpg	\N	2022-01-19	2022-02-17	101
100240330	ThinkPad X1 Carbon 6gn	0	Lenovo	0	25000	ThinkPadX1Carbon6gn_kpIi8mz.png	\N	2022-01-19	2022-01-20	101
100240331	ThinkPad X1 Carbon 6gn	0	Lenovo	1	25000	ThinkPadX1Carbon6gn_IjPRjb0.png	未入力	2022-01-19	2022-01-20	100
100240333	ThinkPad X61	0	IBM	3	0	ThinkPad_X61.jpg	\N	2022-01-19	2022-01-20	100
100240334	Let'sNote NX3	0	Panasonic	2	8534	LetsNote_NX3.jpg	\N	2022-01-19	2022-01-20	100
100240335	Let'sNote NX3	0	Panasonic	3	8534	LetsNote_NX3_jxzaOOU.jpg	\N	2022-01-19	2022-01-20	101
100240336	VJS111D12N	0	VAIO	2	13604	VJS111D12N.jpg	\N	2022-01-19	2022-01-20	100
100240337	Latitude 5580	0	DELL	1	16325	Latitude_5580.png	\N	2022-01-19	2022-01-20	100
100240339	Latitude 5580	0	DELL	4	16326	Latitude_5580_73YzjuW.png	\N	2022-01-19	2022-01-20	101
100240340	FlexScan EV2451	2	EIZO	2	10250	FlexScan_EV2451_KSGLqkO.png	\N	2022-01-19	2022-01-20	101
100240341	Let'sNote SZ6	0	Panasonic	2	17837	LetsNote_SZ6_lkOPyhg.jpg	\N	2022-01-19	2022-01-20	102
100240342	ideapad 310S-11IAP	0	Lenovo	1	0	ideapad_310S-11IAP.jpg	\N	2022-01-19	2022-01-20	102
100240343	Let'sNote MX4	0	Panasonic	2	9200	LetsNote_MX4.png	\N	2022-01-19	2022-01-20	102
100240344	Latitude 5580	0	DELL	3	16327	Latitude_5580_236MFzC.png	\N	2022-01-19	2022-01-20	102
100240345	Let'sNote SZ6	0	Panasonic	4	15600	LetsNote_SZ6_IsuAy43.jpg	\N	2022-01-19	2022-01-20	103
100240346	Z24n	2	hp	1	3240	Z24n.png	\N	2022-01-19	2022-01-20	102
100240347	ProBook 470 G5	0	hp	2	49000	ProBook_470_G5.jpg	\N	2022-01-19	2022-01-20	103
100240348	ThinkPad X270	0	Lenovo	0	12000	ThinkPad_X270.png	\N	2022-01-19	2022-01-20	103
100240349	Let'sNote SZ6	0	Panasonic	1	13240	LetsNote_SZ6_ebCv4mm.jpg	\N	2022-01-19	2022-01-20	104
100240350	LIFEBOOK U939	0	FUJITSU	2	56900	LIFEBOOK_U939.png	\N	2022-01-19	2022-01-20	103
100240351	ProBook 470 G5	0	hp	1	49000	ProBook_470_G5_ObmngCC.jpg	\N	2022-01-19	2022-01-20	104
100240352	Endeavor NJ5900E	0	EPSON	1	13450	Endeavor_NJ5900E.png	\N	2022-01-19	2022-01-20	103
100240353	Z24n	2	hp	2	3240	Z24n_hPOcNd8.png	\N	2022-01-19	2022-01-20	103
100240354	Let'sNote SZ5	0	Panasonic	2	14500	LetsNote_SZ5.jpg	\N	2022-01-19	2022-01-20	105
100240355	ProBook 470 G5	0	hp	1	49000	ProBook_470_G5_9PWYYg8.jpg	\N	2022-01-19	2022-01-20	105
100240356	ThinkPad X270	0	Lenovo	2	12000	ThinkPad_X270_XQrkdZ5.png	\N	2022-01-19	2022-01-20	104
100240357	LIFEBOOK U938	0	FUJITSU	1	35800	LIFEBOOK_U938.png	\N	2022-01-19	2022-01-20	104
100240358	ProBook 470 G5	0	hp	2	49000	ProBook_470_G5_39R4Lvs.jpg	\N	2022-01-19	2022-01-20	106
100240359	Surface Pro4	0	Microsoft	0	27890	Surface_Pro4.png	\N	2022-01-19	2022-01-20	104
100240360	Z24n	2	hp	3	3240	Z24n_rFCrAOn.png	\N	2022-01-19	2022-01-20	104
100240361	ThinkPad X270	0	Lenovo	4	12000	ThinkPad_X270_P7CngDj.png	\N	2022-01-19	2022-01-20	105
100240362	自作1	1	不明	1	20000	zisakupc1.jpg	\N	2022-01-19	2022-01-20	105
100240580	8GB	3	-	3	3000	8G_メモリ_vw9ahWN.png	\N	2022-01-19	2022-01-20	102
100240363	Surface Pro4	0	Microsoft	2	27890	Surface_Pro4_5oj19k3.png	\N	2022-01-19	2022-01-20	105
100240364	Z24n	2	hp	3	3240	Z24n_2kXGbgR.png	\N	2022-01-19	2022-01-20	105
100240365	自作2	1	不明	4	160000	zisakups2.jpg	\N	2022-01-19	2022-01-20	106
100240366	ThinkPad X270	0	Lenovo	1	12000	ThinkPad_X270_2AiZBMG.png	\N	2022-01-19	2022-01-20	106
100240432	8GB	3	-	3	3000	8G_メモリ_J2ZK7TS.png	\N	2022-01-19	2022-02-17	103
100240368	MacBook Air Early 2015	0	Apple	3	37800	MacBook_Air_Early_2015.png	\N	2022-01-19	2022-01-20	106
100240402	ThinkPad X1 Carbon 6gn	0	Lenovo	3	25000	ThinkPadX1Carbon6gn_8wloRId.png	\N	2022-01-19	2022-02-17	102
100240370	Z24n	2	hp	2	2890	Z24n_2GsDGom.png	\N	2022-01-19	2022-01-20	106
100240421	2021 Personal	6	Microsoft	1	26000	2021_Personal_zB5DhBI.jpg	\N	2022-01-19	2022-02-17	102
100240405	P2317H	2	hp	1	100	P2317H.jpg	\N	2022-01-19	2022-02-17	100
100240403	Optiplex 3040 Micro	1	DELL	0	12579	Optiplex_3040_Micro.jpg	\N	2022-01-19	2022-01-20	100
100240404	FlexScan EV2451	2	EIZO	1	10500	FlexScan_EV2451.png	\N	2022-01-19	2022-01-20	100
100240406	8GB	3	-	3	3000	8G_メモリ.png	\N	2022-01-19	2022-01-20	100
100240407	129GB	5	-	2	0	ssd_kari129gb.png	\N	2022-01-19	2022-01-20	100
100240408	Optiplex 3040 Micro	1	DELL	3	12579	Optiplex_3040_Micro_tYKB3Ya.jpg	\N	2022-01-19	2022-01-20	101
100240409	323E7Q	2	PHILIPS	2	4000	323E7Q.jpg	\N	2022-01-19	2022-01-20	101
100240410	1TB	5	-	1	12000	1TB_SSD.png	\N	2022-01-19	2022-01-20	100
100240411	2019 Home & Business	6	Microsoft	0	25000	2019_Home__Business.jpg	\N	2022-01-19	2022-01-20	100
100240412	WPS Office 2	6	KINGSOFT	4	216	WPS_Office_2.png	\N	2022-01-19	2022-01-20	100
100240413	130GB	5	-	2	0	ssd_kari130gb.jpg	\N	2022-01-19	2022-01-20	101
100240414	2021 Personal	6	Microsoft	2	26000	2021_Personal.jpg	\N	2022-01-19	2022-01-20	101
100240415	8GB	3	-	1	3000	8G_メモリ_lp0qjcc.png	\N	2022-01-19	2022-01-20	101
100240416	2010 Personal	6	Microsoft	2	8000	2010_Personal.png	\N	2022-01-19	2022-01-20	101
100240417	WPS Office 2	6	KINGSOFT	3	216	WPS_Office_2_Uc7AXYj.png	\N	2022-01-19	2022-01-20	101
100240418	Optiplex 3040 Micro	1	DELL	4	12579	Optiplex_3040_Micro_wv1JPep.jpg	\N	2022-01-19	2022-01-20	102
100240419	323E7Q	2	PHILIPS	1	4001	323E7Q_BHwHIyD.jpg	\N	2022-01-19	2022-01-20	102
100240420	256GB	5	-	2	3000	ssd_kari256gb.jpg	\N	2022-01-19	2022-01-20	102
100240422	8GB	3	-	1	3000	8G_メモリ_vw9ahWN.png	\N	2022-01-19	2022-01-20	102
100240423	2010 Personal	6	Microsoft	2	8000	2010_Personal_UTwoIha.png	\N	2022-01-19	2022-01-20	102
100240424	Optiplex 3040 Micro	1	DELL	1	12579	Optiplex_3040_Micro_wDs5VM0.jpg	\N	2022-01-19	2022-01-20	103
100240425	256GB	5	-	1	3000	ssd_kari256gb_KlRug3w.jpg	\N	2022-01-19	2022-01-20	103
100240426	323E7Q	2	PHILIPS	2	4002	323E7Q_r0aRTex.jpg	\N	2022-01-19	2022-01-20	103
100240427	2021 Personal	6	Microsoft	2	26000	2021_Personal_r22PGaf.jpg	\N	2022-01-19	2022-01-20	103
100240428	323E7Q	2	PHILIPS	1	4003	323E7Q_nnZfbEz.jpg	\N	2022-01-19	2022-01-20	104
100240429	256GB	5	-	2	3000	ssd_kari256gb_otFNwVm.jpg	\N	2022-01-19	2022-01-20	104
100240430	2021 Personal	6	Microsoft	1	26000	2021_Personal_xn9YC2c.jpg	\N	2022-01-19	2022-01-20	104
100240431	Optiplex 3040 Micro	1	DELL	2	12579	Optiplex_3040_Micro_AMn8irk.jpg	\N	2022-01-19	2022-01-20	104
100240433	2010 Personal	6	Microsoft	3	8000	2010_Personal_zfGLefw.png	\N	2022-01-19	2022-01-20	103
100240434	323E7Q	2	PHILIPS	4	4004	323E7Q_LqGEsis.jpg	\N	2022-01-19	2022-01-20	105
100240435	256GB	5	-	1	3000	ssd_kari256gb_PGZq90s.jpg	\N	2022-01-19	2022-01-20	105
100240436	Let'sNote SZ5	0	Panasonic	2	14500	LetsNote_SZ5_Ylq82Od.jpg	\N	2022-01-19	2022-01-20	106
100240437	8GB	3	-	3	3000	8G_メモリ_fpjk0W3.png	\N	2022-01-19	2022-01-20	104
100240438	2010 Personal	6	Microsoft	4	8000	2010_Personal_1iWo5W4.png	\N	2022-01-19	2022-01-20	104
100240439	LIFEBOOK U938	0	FUJITSU	1	35801	LIFEBOOK_U938_Oou5Dqx.png	\N	2022-01-19	2022-01-20	105
100240440	8GB	3	-	2	3000	8G_メモリ_zhIJa9h.png	\N	2022-01-19	2022-01-20	105
100240441	2021 Home & Business	6	Microsoft	3	28000	2021_Home__Business.jpg	\N	2022-01-19	2022-01-20	105
100240442	2010 Personal	6	Microsoft	4	8000	2010_Personal_HEGeU0P.png	\N	2022-01-19	2022-01-20	105
100240443	LIFEBOOK U938	0	FUJITSU	2	35802	LIFEBOOK_U938_9RNNRIA.png	\N	2022-01-19	2022-01-20	106
100240444	323E7Q	2	PHILIPS	3	4005	323E7Q_s1TNSsU.jpg	\N	2022-01-19	2022-01-20	106
100240445	256GB	5	-	1	3000	ssd_kari256gb_97uB3Nx.jpg	\N	2022-01-19	2022-01-20	106
100240446	2021 Home & Business	6	Microsoft	2	28000	2021_Home__Business_cKOzEbR.jpg	\N	2022-01-19	2022-01-20	106
100240447	8GB	3	-	3	3000	8G_メモリ_WHfBRNl.png	\N	2022-01-19	2022-01-20	106
100240448	2010 Home & Business	6	Microsoft	1	10000	2010_Personal_bQna7DP.png	\N	2022-01-19	2022-01-20	106
100240488	ThinkPad X1 Carbon 6gn	0	Lenovo	1	25000	ThinkPadX1Carbon6gn_kpIi8mz.png	\N	2022-01-19	2022-01-20	101
100240489	ThinkPad X1 Carbon 6gn	0	Lenovo	2	25000	ThinkPadX1Carbon6gn_IjPRjb0.png	未入力	2022-01-19	2022-01-20	100
100240490	Let'sNote SZ6	0	Panasonic	2	17836	LetsNote_SZ6.jpg	\N	2022-01-19	2022-01-20	101
100240491	ThinkPad X61	0	IBM	1	0	ThinkPad_X61.jpg	\N	2022-01-19	2022-01-20	100
100240492	Let'sNote NX3	0	Panasonic	2	8534	LetsNote_NX3.jpg	\N	2022-01-19	2022-01-20	100
100240493	Let'sNote NX3	0	Panasonic	1	8534	LetsNote_NX3_jxzaOOU.jpg	\N	2022-01-19	2022-01-20	101
100240494	VJS111D12N	0	VAIO	2	13604	VJS111D12N.jpg	\N	2022-01-19	2022-01-20	100
100240495	Latitude 5580	0	DELL	0	16325	Latitude_5580.png	\N	2022-01-19	2022-01-20	100
100240496	VJS111D12N	0	VAIO	3	13605	VJS111D12N_pf0hCS6.jpg	\N	2022-01-19	2022-01-20	101
100240497	Latitude 5580	0	DELL	4	16326	Latitude_5580_73YzjuW.png	\N	2022-01-19	2022-01-20	101
100240498	FlexScan EV2451	2	EIZO	1	10250	FlexScan_EV2451_KSGLqkO.png	\N	2022-01-19	2022-01-20	101
100240499	Let'sNote SZ6	0	Panasonic	2	17837	LetsNote_SZ6_lkOPyhg.jpg	\N	2022-01-19	2022-01-20	102
100240500	ideapad 310S-11IAP	0	Lenovo	3	0	ideapad_310S-11IAP.jpg	\N	2022-01-19	2022-01-20	102
100240501	Let'sNote MX4	0	Panasonic	4	9200	LetsNote_MX4.png	\N	2022-01-19	2022-01-20	102
100240502	Latitude 5580	0	DELL	1	16327	Latitude_5580_236MFzC.png	\N	2022-01-19	2022-01-20	102
100240503	Let'sNote SZ6	0	Panasonic	2	15600	LetsNote_SZ6_IsuAy43.jpg	\N	2022-01-19	2022-01-20	103
100240504	Z24n	2	hp	3	3240	Z24n.png	\N	2022-01-19	2022-01-20	102
100240505	ProBook 470 G5	0	hp	4	49000	ProBook_470_G5.jpg	\N	2022-01-19	2022-01-20	103
100240506	ThinkPad X270	0	Lenovo	2	12000	ThinkPad_X270.png	\N	2022-01-19	2022-01-20	103
100240507	Let'sNote SZ6	0	Panasonic	3	13240	LetsNote_SZ6_ebCv4mm.jpg	\N	2022-01-19	2022-01-20	104
100240508	LIFEBOOK U939	0	FUJITSU	1	56900	LIFEBOOK_U939.png	\N	2022-01-19	2022-01-20	103
100240509	ProBook 470 G5	0	hp	2	49000	ProBook_470_G5_ObmngCC.jpg	\N	2022-01-19	2022-01-20	104
100240510	Endeavor NJ5900E	0	EPSON	3	13450	Endeavor_NJ5900E.png	\N	2022-01-19	2022-01-20	103
100240511	Z24n	2	hp	1	3240	Z24n_hPOcNd8.png	\N	2022-01-19	2022-01-20	103
100240512	Let'sNote SZ5	0	Panasonic	2	14500	LetsNote_SZ5.jpg	\N	2022-01-19	2022-01-20	105
100240513	ProBook 470 G5	0	hp	3	49000	ProBook_470_G5_9PWYYg8.jpg	\N	2022-01-19	2022-01-20	105
100240514	ThinkPad X270	0	Lenovo	1	12000	ThinkPad_X270_XQrkdZ5.png	\N	2022-01-19	2022-01-20	104
100240515	LIFEBOOK U938	0	FUJITSU	2	35800	LIFEBOOK_U938.png	\N	2022-01-19	2022-01-20	104
100240516	ProBook 470 G5	0	hp	3	49000	ProBook_470_G5_39R4Lvs.jpg	\N	2022-01-19	2022-01-20	106
100240517	Surface Pro4	0	Microsoft	1	27890	Surface_Pro4.png	\N	2022-01-19	2022-01-20	104
100240518	Z24n	2	hp	4	3240	Z24n_rFCrAOn.png	\N	2022-01-19	2022-01-20	104
100240519	ThinkPad X270	0	Lenovo	1	12000	ThinkPad_X270_P7CngDj.png	\N	2022-01-19	2022-01-20	105
100240520	自作1	1	不明	2	20000	zisakupc1.jpg	\N	2022-01-19	2022-01-20	105
100240521	Surface Pro4	0	Microsoft	3	27890	Surface_Pro4_5oj19k3.png	\N	2022-01-19	2022-01-20	105
100240522	Z24n	2	hp	0	3240	Z24n_2kXGbgR.png	\N	2022-01-19	2022-01-20	105
100240523	自作2	1	不明	0	160000	zisakups2.jpg	\N	2022-01-19	2022-01-20	106
100240524	ThinkPad X270	0	Lenovo	1	12000	ThinkPad_X270_2AiZBMG.png	\N	2022-01-19	2022-01-20	106
100240574	2010 Personal	6	Microsoft	1	8000	2010_Personal.png	\N	2022-01-19	2022-02-14	101
100240526	MacBook Air Early 2015	0	Apple	0	37800	MacBook_Air_Early_2015.png	\N	2022-01-19	2022-01-20	106
100240570	WPS Office 2	6	KINGSOFT	0	216	WPS_Office_2.png		2022-01-19	2022-02-14	106
100240528	Z24n	2	hp	0	2890	Z24n_2GsDGom.png	\N	2022-01-19	2022-01-20	106
100240560	ThinkPad X1 Carbon 6gn	0	Lenovo	4	25000	ThinkPadX1Carbon6gn_8wloRId.png	\N	2022-01-19	2022-01-20	102
100240561	Optiplex 3040 Micro	1	DELL	1	12579	Optiplex_3040_Micro.jpg	\N	2022-01-19	2022-01-20	100
100240562	FlexScan EV2451	2	EIZO	2	10500	FlexScan_EV2451.png	\N	2022-01-19	2022-01-20	100
100240563	P2317H	2	hp	3	100	P2317H.jpg	\N	2022-01-19	2022-01-20	100
100240564	8GB	3	-	4	3000	8G_メモリ.png	\N	2022-01-19	2022-01-20	100
100240565	129GB	5	-	0	0	ssd_kari129gb.png	\N	2022-01-19	2022-01-20	100
100240566	Optiplex 3040 Micro	1	DELL	0	12579	Optiplex_3040_Micro_tYKB3Ya.jpg	\N	2022-01-19	2022-01-20	101
100240567	323E7Q	2	PHILIPS	1	4000	323E7Q.jpg	\N	2022-01-19	2022-01-20	101
100240568	1TB	5	-	2	12000	1TB_SSD.png	\N	2022-01-19	2022-01-20	100
100240569	2019 Home & Business	6	Microsoft	4	25000	2019_Home__Business.jpg	\N	2022-01-19	2022-01-20	100
100240571	130GB	5	-	2	0	ssd_kari130gb.jpg	\N	2022-01-19	2022-01-20	101
100240572	2021 Personal	6	Microsoft	3	26000	2021_Personal.jpg	\N	2022-01-19	2022-01-20	101
100240573	8GB	3	-	1	3000	8G_メモリ_lp0qjcc.png	\N	2022-01-19	2022-01-20	101
100240575	WPS Office 2	6	KINGSOFT	0	216	WPS_Office_2_Uc7AXYj.png	\N	2022-01-19	2022-01-20	101
100240576	Optiplex 3040 Micro	1	DELL	2	12579	Optiplex_3040_Micro_wv1JPep.jpg	\N	2022-01-19	2022-01-20	102
100240577	323E7Q	2	PHILIPS	3	4001	323E7Q_BHwHIyD.jpg	\N	2022-01-19	2022-01-20	102
100240578	256GB	5	-	1	3000	ssd_kari256gb.jpg	\N	2022-01-19	2022-01-20	102
100240579	2021 Personal	6	Microsoft	2	26000	2021_Personal_zB5DhBI.jpg	\N	2022-01-19	2022-01-20	102
100240582	Optiplex 3040 Micro	1	DELL	1	12579	Optiplex_3040_Micro_wDs5VM0.jpg	\N	2022-01-19	2022-01-20	103
100240583	256GB	5	-	2	3000	ssd_kari256gb_KlRug3w.jpg	\N	2022-01-19	2022-01-20	103
100240584	323E7Q	2	PHILIPS	3	4002	323E7Q_r0aRTex.jpg	\N	2022-01-19	2022-01-20	103
100240585	2021 Personal	6	Microsoft	1	26000	2021_Personal_r22PGaf.jpg	\N	2022-01-19	2022-01-20	103
100240586	323E7Q	2	PHILIPS	2	4003	323E7Q_nnZfbEz.jpg	\N	2022-01-19	2022-01-20	104
100240587	256GB	5	-	1	3000	ssd_kari256gb_otFNwVm.jpg	\N	2022-01-19	2022-01-20	104
100240588	2021 Personal	6	Microsoft	2	26000	2021_Personal_xn9YC2c.jpg	\N	2022-01-19	2022-01-20	104
100240589	Optiplex 3040 Micro	1	DELL	3	12579	Optiplex_3040_Micro_AMn8irk.jpg	\N	2022-01-19	2022-01-20	104
100240590	8GB	3	-	2	3000	8G_メモリ_J2ZK7TS.png	\N	2022-01-19	2022-01-20	103
100240591	2010 Personal	6	Microsoft	3	8000	2010_Personal_zfGLefw.png	\N	2022-01-19	2022-01-20	103
100240592	323E7Q	2	PHILIPS	2	4004	323E7Q_LqGEsis.jpg	\N	2022-01-19	2022-01-20	105
100240593	256GB	5	-	3	3000	ssd_kari256gb_PGZq90s.jpg	\N	2022-01-19	2022-01-20	105
100240594	Let'sNote SZ5	0	Panasonic	1	14500	LetsNote_SZ5_Ylq82Od.jpg	\N	2022-01-19	2022-01-20	106
100240595	8GB	3	-	1	3000	8G_メモリ_fpjk0W3.png	\N	2022-01-19	2022-01-20	104
100240596	2010 Personal	6	Microsoft	1	8000	2010_Personal_1iWo5W4.png	\N	2022-01-19	2022-01-20	104
100240598	8GB	3	-	0	3000	8G_メモリ_zhIJa9h.png	\N	2022-01-19	2022-01-20	105
100240599	2021 Home & Business	6	Microsoft	1	28000	2021_Home__Business.jpg	\N	2022-01-19	2022-01-20	105
100240601	LIFEBOOK U938	0	FUJITSU	0	35802	LIFEBOOK_U938_9RNNRIA.png	\N	2022-01-19	2022-01-20	106
100240600	2010 Personal	6	Microsoft	1	8000	2010_Personal_HEGeU0P.png	\N	2022-01-19	2022-02-16	105
100240604	2021 Home & Business	6	Microsoft	4	28000	2021_Home__Business_cKOzEbR.jpg	\N	2022-01-19	2022-01-20	106
100240605	8GB	3	-	1	3000	8G_メモリ_WHfBRNl.png	\N	2022-01-19	2022-01-20	106
100240606	2010 Home & Business	6	Microsoft	0	10000	2010_Personal_bQna7DP.png	\N	2022-01-19	2022-01-20	106
100240602	323E7Q	2	PHILIPS	3	4005	323E7Q_s1TNSsU.jpg	\N	2022-01-19	2022-02-17	106
100240581	2010 Personal	6	Microsoft	3	8000	2010_Personal_UTwoIha.png	\N	2022-01-19	2022-02-17	102
100240597	LIFEBOOK U938	0	FUJITSU	3	35801	LIFEBOOK_U938_Oou5Dqx.png	\N	2022-01-19	2022-02-17	105
100240646	ThinkPad X1 Carbon 6gn	0	Lenovo	2	25000	ThinkPadX1Carbon6gn_kpIi8mz.png	\N	2022-01-19	2022-01-20	101
100240647	ThinkPad X1 Carbon 6gn	0	Lenovo	2	25000	ThinkPadX1Carbon6gn_IjPRjb0.png	未入力	2022-01-19	2022-01-20	100
100240648	Let'sNote SZ6	0	Panasonic	1	17836	LetsNote_SZ6.jpg	\N	2022-01-19	2022-01-20	101
100240649	ThinkPad X61	0	IBM	2	0	ThinkPad_X61.jpg	\N	2022-01-19	2022-01-20	100
100240650	Let'sNote NX3	0	Panasonic	1	8534	LetsNote_NX3.jpg	\N	2022-01-19	2022-01-20	100
100240651	Let'sNote NX3	0	Panasonic	2	8534	LetsNote_NX3_jxzaOOU.jpg	\N	2022-01-19	2022-01-20	101
100240652	VJS111D12N	0	VAIO	0	13604	VJS111D12N.jpg	\N	2022-01-19	2022-01-20	100
100240653	Latitude 5580	0	DELL	3	16325	Latitude_5580.png	\N	2022-01-19	2022-01-20	100
100240654	VJS111D12N	0	VAIO	4	13605	VJS111D12N_pf0hCS6.jpg	\N	2022-01-19	2022-01-20	101
100240655	Latitude 5580	0	DELL	1	16326	Latitude_5580_73YzjuW.png	\N	2022-01-19	2022-01-20	101
100240656	FlexScan EV2451	2	EIZO	2	10250	FlexScan_EV2451_KSGLqkO.png	\N	2022-01-19	2022-01-20	101
100240657	Let'sNote SZ6	0	Panasonic	3	17837	LetsNote_SZ6_lkOPyhg.jpg	\N	2022-01-19	2022-01-20	102
100240658	ideapad 310S-11IAP	0	Lenovo	4	0	ideapad_310S-11IAP.jpg	\N	2022-01-19	2022-01-20	102
100240659	Let'sNote MX4	0	Panasonic	1	9200	LetsNote_MX4.png	\N	2022-01-19	2022-01-20	102
100240660	Latitude 5580	0	DELL	2	16327	Latitude_5580_236MFzC.png	\N	2022-01-19	2022-01-20	102
100240661	Let'sNote SZ6	0	Panasonic	3	15600	LetsNote_SZ6_IsuAy43.jpg	\N	2022-01-19	2022-01-20	103
100240662	Z24n	2	hp	4	3240	Z24n.png	\N	2022-01-19	2022-01-20	102
100240663	ProBook 470 G5	0	hp	2	49000	ProBook_470_G5.jpg	\N	2022-01-19	2022-01-20	103
100240664	ThinkPad X270	0	Lenovo	3	12000	ThinkPad_X270.png	\N	2022-01-19	2022-01-20	103
100240665	Let'sNote SZ6	0	Panasonic	1	13240	LetsNote_SZ6_ebCv4mm.jpg	\N	2022-01-19	2022-01-20	104
100240666	LIFEBOOK U939	0	FUJITSU	2	56900	LIFEBOOK_U939.png	\N	2022-01-19	2022-01-20	103
100240667	ProBook 470 G5	0	hp	3	49000	ProBook_470_G5_ObmngCC.jpg	\N	2022-01-19	2022-01-20	104
100240668	Endeavor NJ5900E	0	EPSON	1	13450	Endeavor_NJ5900E.png	\N	2022-01-19	2022-01-20	103
100240669	Z24n	2	hp	2	3240	Z24n_hPOcNd8.png	\N	2022-01-19	2022-01-20	103
100240670	Let'sNote SZ5	0	Panasonic	3	14500	LetsNote_SZ5.jpg	\N	2022-01-19	2022-01-20	105
100240671	ProBook 470 G5	0	hp	1	49000	ProBook_470_G5_9PWYYg8.jpg	\N	2022-01-19	2022-01-20	105
100240672	ThinkPad X270	0	Lenovo	2	12000	ThinkPad_X270_XQrkdZ5.png	\N	2022-01-19	2022-01-20	104
100240673	LIFEBOOK U938	0	FUJITSU	3	35800	LIFEBOOK_U938.png	\N	2022-01-19	2022-01-20	104
100240674	ProBook 470 G5	0	hp	1	49000	ProBook_470_G5_39R4Lvs.jpg	\N	2022-01-19	2022-01-20	106
100240675	Surface Pro4	0	Microsoft	4	27890	Surface_Pro4.png	\N	2022-01-19	2022-01-20	104
100240676	Z24n	2	hp	1	3240	Z24n_rFCrAOn.png	\N	2022-01-19	2022-01-20	104
100240677	ThinkPad X270	0	Lenovo	2	12000	ThinkPad_X270_P7CngDj.png	\N	2022-01-19	2022-01-20	105
100240678	自作1	1	不明	3	20000	zisakupc1.jpg	\N	2022-01-19	2022-01-20	105
100240679	Surface Pro4	0	Microsoft	0	27890	Surface_Pro4_5oj19k3.png	\N	2022-01-19	2022-01-20	105
100240680	Z24n	2	hp	0	3240	Z24n_2kXGbgR.png	\N	2022-01-19	2022-01-20	105
100240681	自作2	1	不明	1	160000	zisakups2.jpg	\N	2022-01-19	2022-01-20	106
100240682	ThinkPad X270	0	Lenovo	2	12000	ThinkPad_X270_2AiZBMG.png	\N	2022-01-19	2022-01-20	106
100240723	129GB	5	-	3	0	ssd_kari129gb.png	\N	2022-01-19	2022-02-17	100
100240684	MacBook Air Early 2015	0	Apple	0	37800	MacBook_Air_Early_2015.png	\N	2022-01-19	2022-01-20	106
100240719	Optiplex 3040 Micro	1	DELL	3	12579	Optiplex_3040_Micro.jpg	\N	2022-01-19	2022-02-17	100
100240686	Z24n	2	hp	0	2890	Z24n_2GsDGom.png	\N	2022-01-19	2022-01-20	106
100240718	ThinkPad X1 Carbon 6gn	0	Lenovo	0	25000	ThinkPadX1Carbon6gn_8wloRId.png	\N	2022-01-19	2022-01-20	102
100240720	FlexScan EV2451	2	EIZO	1	10500	FlexScan_EV2451.png	\N	2022-01-19	2022-01-20	100
100240721	P2317H	2	hp	1	100	P2317H.jpg	\N	2022-01-19	2022-01-20	100
100240722	8GB	3	-	1	3000	8G_メモリ.png	\N	2022-01-19	2022-01-20	100
100240724	Optiplex 3040 Micro	1	DELL	1	12579	Optiplex_3040_Micro_tYKB3Ya.jpg	\N	2022-01-19	2022-01-20	101
100240725	323E7Q	2	PHILIPS	1	4000	323E7Q.jpg	\N	2022-01-19	2022-01-20	101
100240726	1TB	5	-	1	12000	1TB_SSD.png	\N	2022-01-19	2022-01-20	100
100240727	2019 Home & Business	6	Microsoft	2	25000	2019_Home__Business.jpg	\N	2022-01-19	2022-01-20	100
100240728	WPS Office 2	6	KINGSOFT	3	216	WPS_Office_2.png	\N	2022-01-19	2022-01-20	100
100240729	130GB	5	-	0	0	ssd_kari130gb.jpg	\N	2022-01-19	2022-01-20	101
100240730	2021 Personal	6	Microsoft	2	26000	2021_Personal.jpg	\N	2022-01-19	2022-01-20	101
100240731	8GB	3	-	0	3000	8G_メモリ_lp0qjcc.png	\N	2022-01-19	2022-01-20	101
100240732	2010 Personal	6	Microsoft	0	8000	2010_Personal.png	\N	2022-01-19	2022-01-20	101
100240733	WPS Office 2	6	KINGSOFT	2	216	WPS_Office_2_Uc7AXYj.png	\N	2022-01-19	2022-01-20	101
100240734	Optiplex 3040 Micro	1	DELL	3	12579	Optiplex_3040_Micro_wv1JPep.jpg	\N	2022-01-19	2022-01-20	102
100240735	323E7Q	2	PHILIPS	2	4001	323E7Q_BHwHIyD.jpg	\N	2022-01-19	2022-01-20	102
100240736	256GB	5	-	3	3000	ssd_kari256gb.jpg	\N	2022-01-19	2022-01-20	102
100240737	2021 Personal	6	Microsoft	2	26000	2021_Personal_zB5DhBI.jpg	\N	2022-01-19	2022-01-20	102
100240738	8GB	3	-	1	3000	8G_メモリ_vw9ahWN.png	\N	2022-01-19	2022-01-20	102
100240740	Optiplex 3040 Micro	1	DELL	4	12579	Optiplex_3040_Micro_wDs5VM0.jpg	\N	2022-01-19	2022-01-20	103
100240741	256GB	5	-	2	3000	ssd_kari256gb_KlRug3w.jpg	\N	2022-01-19	2022-01-20	103
100240742	323E7Q	2	PHILIPS	2	4002	323E7Q_r0aRTex.jpg	\N	2022-01-19	2022-01-20	103
100240743	2021 Personal	6	Microsoft	1	26000	2021_Personal_r22PGaf.jpg	\N	2022-01-19	2022-01-20	103
100240744	323E7Q	2	PHILIPS	2	4003	323E7Q_nnZfbEz.jpg	\N	2022-01-19	2022-01-20	104
100240745	256GB	5	-	3	3000	ssd_kari256gb_otFNwVm.jpg	\N	2022-01-19	2022-01-20	104
100240746	2021 Personal	6	Microsoft	4	26000	2021_Personal_xn9YC2c.jpg	\N	2022-01-19	2022-01-20	104
100240747	Optiplex 3040 Micro	1	DELL	1	12579	Optiplex_3040_Micro_AMn8irk.jpg	\N	2022-01-19	2022-01-20	104
100240748	8GB	3	-	2	3000	8G_メモリ_J2ZK7TS.png	\N	2022-01-19	2022-01-20	103
100240749	2010 Personal	6	Microsoft	0	8000	2010_Personal_zfGLefw.png	\N	2022-01-19	2022-01-20	103
100240750	323E7Q	2	PHILIPS	1	4004	323E7Q_LqGEsis.jpg	\N	2022-01-19	2022-01-20	105
100240751	256GB	5	-	2	3000	ssd_kari256gb_PGZq90s.jpg	\N	2022-01-19	2022-01-20	105
100240752	Let'sNote SZ5	0	Panasonic	1	14500	LetsNote_SZ5_Ylq82Od.jpg	\N	2022-01-19	2022-01-20	106
100240753	8GB	3	-	1	3000	8G_メモリ_fpjk0W3.png	\N	2022-01-19	2022-01-20	104
100240754	2010 Personal	6	Microsoft	2	8000	2010_Personal_1iWo5W4.png	\N	2022-01-19	2022-01-20	104
100240755	LIFEBOOK U938	0	FUJITSU	2	35801	LIFEBOOK_U938_Oou5Dqx.png	\N	2022-01-19	2022-01-20	105
100240756	8GB	3	-	1	3000	8G_メモリ_zhIJa9h.png	\N	2022-01-19	2022-01-20	105
100240757	2021 Home & Business	6	Microsoft	2	28000	2021_Home__Business.jpg	\N	2022-01-19	2022-01-20	105
100240758	2010 Personal	6	Microsoft	1	8000	2010_Personal_HEGeU0P.png	\N	2022-01-19	2022-01-20	105
100240759	LIFEBOOK U938	0	FUJITSU	2	35802	LIFEBOOK_U938_9RNNRIA.png	\N	2022-01-19	2022-01-20	106
100240760	323E7Q	2	PHILIPS	0	4005	323E7Q_s1TNSsU.jpg	\N	2022-01-19	2022-01-20	106
100240761	256GB	5	-	3	3000	ssd_kari256gb_97uB3Nx.jpg	\N	2022-01-19	2022-01-20	106
100240762	2021 Home & Business	6	Microsoft	4	28000	2021_Home__Business_cKOzEbR.jpg	\N	2022-01-19	2022-01-20	106
100240763	8GB	3	-	1	3000	8G_メモリ_WHfBRNl.png	\N	2022-01-19	2022-01-20	106
100240764	2010 Home & Business	6	Microsoft	2	10000	2010_Personal_bQna7DP.png	\N	2022-01-19	2022-01-20	106
100240739	2010 Personal	6	Microsoft	1	8000	2010_Personal_UTwoIha.png	\N	2022-01-19	2022-02-17	102
100240831	LIFEBOOK U938	0	FUJITSU	1	35800	LIFEBOOK_U938.png	\N	2022-01-19	2022-02-17	104
100240804	ThinkPad X1 Carbon 6gn	0	Lenovo	1	25000	ThinkPadX1Carbon6gn_kpIi8mz.png	\N	2022-01-19	2022-01-20	101
100240805	ThinkPad X1 Carbon 6gn	0	Lenovo	1	25000	ThinkPadX1Carbon6gn_IjPRjb0.png	未入力	2022-01-19	2022-01-20	100
100240806	Let'sNote SZ6	0	Panasonic	1	17836	LetsNote_SZ6.jpg	\N	2022-01-19	2022-01-20	101
100240807	ThinkPad X61	0	IBM	0	0	ThinkPad_X61.jpg	\N	2022-01-19	2022-01-20	100
100240808	Let'sNote NX3	0	Panasonic	0	8534	LetsNote_NX3.jpg	\N	2022-01-19	2022-01-20	100
100240809	Let'sNote NX3	0	Panasonic	3	8534	LetsNote_NX3_jxzaOOU.jpg	\N	2022-01-19	2022-01-20	101
100240810	VJS111D12N	0	VAIO	0	13604	VJS111D12N.jpg	\N	2022-01-19	2022-01-20	100
100240811	Latitude 5580	0	DELL	2	16325	Latitude_5580.png	\N	2022-01-19	2022-01-20	100
100240812	VJS111D12N	0	VAIO	2	13605	VJS111D12N_pf0hCS6.jpg	\N	2022-01-19	2022-01-20	101
100240813	Latitude 5580	0	DELL	2	16326	Latitude_5580_73YzjuW.png	\N	2022-01-19	2022-01-20	101
100240814	FlexScan EV2451	2	EIZO	2	10250	FlexScan_EV2451_KSGLqkO.png	\N	2022-01-19	2022-01-20	101
100240815	Let'sNote SZ6	0	Panasonic	4	17837	LetsNote_SZ6_lkOPyhg.jpg	\N	2022-01-19	2022-01-20	102
100240816	ideapad 310S-11IAP	0	Lenovo	0	0	ideapad_310S-11IAP.jpg	\N	2022-01-19	2022-01-20	102
100240817	Let'sNote MX4	0	Panasonic	2	9200	LetsNote_MX4.png	\N	2022-01-19	2022-01-20	102
100240818	Latitude 5580	0	DELL	3	16327	Latitude_5580_236MFzC.png	\N	2022-01-19	2022-01-20	102
100240819	Let'sNote SZ6	0	Panasonic	1	15600	LetsNote_SZ6_IsuAy43.jpg	\N	2022-01-19	2022-01-20	103
100240820	Z24n	2	hp	1	3240	Z24n.png	\N	2022-01-19	2022-01-20	102
100240821	ProBook 470 G5	0	hp	0	49000	ProBook_470_G5.jpg	\N	2022-01-19	2022-01-20	103
100240822	ThinkPad X270	0	Lenovo	1	12000	ThinkPad_X270.png	\N	2022-01-19	2022-01-20	103
100240823	Let'sNote SZ6	0	Panasonic	2	13240	LetsNote_SZ6_ebCv4mm.jpg	\N	2022-01-19	2022-01-20	104
100240824	LIFEBOOK U939	0	FUJITSU	3	56900	LIFEBOOK_U939.png	\N	2022-01-19	2022-01-20	103
100240825	ProBook 470 G5	0	hp	4	49000	ProBook_470_G5_ObmngCC.jpg	\N	2022-01-19	2022-01-20	104
100240826	Endeavor NJ5900E	0	EPSON	1	13450	Endeavor_NJ5900E.png	\N	2022-01-19	2022-01-20	103
100240827	Z24n	2	hp	2	3240	Z24n_hPOcNd8.png	\N	2022-01-19	2022-01-20	103
100240828	Let'sNote SZ5	0	Panasonic	3	14500	LetsNote_SZ5.jpg	\N	2022-01-19	2022-01-20	105
100240829	ProBook 470 G5	0	hp	4	49000	ProBook_470_G5_9PWYYg8.jpg	\N	2022-01-19	2022-01-20	105
100240830	ThinkPad X270	0	Lenovo	0	12000	ThinkPad_X270_XQrkdZ5.png	\N	2022-01-19	2022-01-20	104
100240832	ProBook 470 G5	0	hp	1	49000	ProBook_470_G5_39R4Lvs.jpg	\N	2022-01-19	2022-01-20	106
100240833	Surface Pro4	0	Microsoft	2	27890	Surface_Pro4.png	\N	2022-01-19	2022-01-20	104
100240834	Z24n	2	hp	4	3240	Z24n_rFCrAOn.png	\N	2022-01-19	2022-01-20	104
100240835	ThinkPad X270	0	Lenovo	0	12000	ThinkPad_X270_P7CngDj.png	\N	2022-01-19	2022-01-20	105
100240836	自作1	1	不明	2	20000	zisakupc1.jpg	\N	2022-01-19	2022-01-20	105
100240837	Surface Pro4	0	Microsoft	3	27890	Surface_Pro4_5oj19k3.png	\N	2022-01-19	2022-01-20	105
100240838	Z24n	2	hp	1	3240	Z24n_2kXGbgR.png	\N	2022-01-19	2022-01-20	105
100240839	自作2	1	不明	0	160000	zisakups2.jpg	\N	2022-01-19	2022-01-20	106
100240840	ThinkPad X270	0	Lenovo	0	12000	ThinkPad_X270_2AiZBMG.png	\N	2022-01-19	2022-01-20	106
100240842	MacBook Air Early 2015	0	Apple	3	37800	MacBook_Air_Early_2015.png	\N	2022-01-19	2022-01-20	106
100240844	Z24n	2	hp	2	2890	Z24n_2GsDGom.png	\N	2022-01-19	2022-01-20	106
100240888	2021 Personal	6	Microsoft	1	26000	2021_Personal.jpg	\N	2022-01-19	2022-02-14	101
100240883	323E7Q	2	PHILIPS	1	4000	323E7Q.jpg	\N	2022-01-19	2022-02-14	101
100240878	FlexScan EV2451	2	EIZO	1	10500	FlexScan_EV2451.png		2022-01-19	2022-02-14	103
100240890	2010 Personal	6	Microsoft	1	8000	2010_Personal.png	\N	2022-01-19	2022-02-16	101
100240876	ThinkPad X1 Carbon 6gn	0	Lenovo	1	25000	ThinkPadX1Carbon6gn_8wloRId.png	\N	2022-01-19	2022-01-20	102
100240877	Optiplex 3040 Micro	1	DELL	1	12579	Optiplex_3040_Micro.jpg	\N	2022-01-19	2022-01-20	100
100240879	P2317H	2	hp	1	100	P2317H.jpg	\N	2022-01-19	2022-01-20	100
100240880	8GB	3	-	0	3000	8G_メモリ.png	\N	2022-01-19	2022-01-20	100
100240881	129GB	5	-	0	0	ssd_kari129gb.png	\N	2022-01-19	2022-01-20	100
100240882	Optiplex 3040 Micro	1	DELL	4	12579	Optiplex_3040_Micro_tYKB3Ya.jpg	\N	2022-01-19	2022-01-20	101
100240884	1TB	5	-	2	12000	1TB_SSD.png	\N	2022-01-19	2022-01-20	100
100240885	2019 Home & Business	6	Microsoft	3	25000	2019_Home__Business.jpg	\N	2022-01-19	2022-01-20	100
100240886	WPS Office 2	6	KINGSOFT	0	216	WPS_Office_2.png	\N	2022-01-19	2022-01-20	100
100240887	130GB	5	-	0	0	ssd_kari130gb.jpg	\N	2022-01-19	2022-01-20	101
100240889	8GB	3	-	1	3000	8G_メモリ_lp0qjcc.png	\N	2022-01-19	2022-01-20	101
100240891	WPS Office 2	6	KINGSOFT	3	216	WPS_Office_2_Uc7AXYj.png	\N	2022-01-19	2022-01-20	101
100240892	Optiplex 3040 Micro	1	DELL	2	12579	Optiplex_3040_Micro_wv1JPep.jpg	\N	2022-01-19	2022-01-20	102
100240893	323E7Q	2	PHILIPS	3	4001	323E7Q_BHwHIyD.jpg	\N	2022-01-19	2022-01-20	102
100240894	256GB	5	-	2	3000	ssd_kari256gb.jpg	\N	2022-01-19	2022-01-20	102
100240895	2021 Personal	6	Microsoft	1	26000	2021_Personal_zB5DhBI.jpg	\N	2022-01-19	2022-01-20	102
100240896	8GB	3	-	0	3000	8G_メモリ_vw9ahWN.png	\N	2022-01-19	2022-01-20	102
100240897	2010 Personal	6	Microsoft	4	8000	2010_Personal_UTwoIha.png	\N	2022-01-19	2022-01-20	102
100240898	Optiplex 3040 Micro	1	DELL	2	12579	Optiplex_3040_Micro_wDs5VM0.jpg	\N	2022-01-19	2022-01-20	103
100240899	256GB	5	-	2	3000	ssd_kari256gb_KlRug3w.jpg	\N	2022-01-19	2022-01-20	103
100240900	323E7Q	2	PHILIPS	1	4002	323E7Q_r0aRTex.jpg	\N	2022-01-19	2022-01-20	103
100240901	2021 Personal	6	Microsoft	2	26000	2021_Personal_r22PGaf.jpg	\N	2022-01-19	2022-01-20	103
100240902	323E7Q	2	PHILIPS	3	4003	323E7Q_nnZfbEz.jpg	\N	2022-01-19	2022-01-20	104
100240903	256GB	5	-	4	3000	ssd_kari256gb_otFNwVm.jpg	\N	2022-01-19	2022-01-20	104
100240904	2021 Personal	6	Microsoft	1	26000	2021_Personal_xn9YC2c.jpg	\N	2022-01-19	2022-01-20	104
100240905	Optiplex 3040 Micro	1	DELL	2	12579	Optiplex_3040_Micro_AMn8irk.jpg	\N	2022-01-19	2022-01-20	104
100240906	8GB	3	-	0	3000	8G_メモリ_J2ZK7TS.png	\N	2022-01-19	2022-01-20	103
100240907	2010 Personal	6	Microsoft	1	8000	2010_Personal_zfGLefw.png	\N	2022-01-19	2022-01-20	103
100240908	323E7Q	2	PHILIPS	2	4004	323E7Q_LqGEsis.jpg	\N	2022-01-19	2022-01-20	105
100240909	256GB	5	-	1	3000	ssd_kari256gb_PGZq90s.jpg	\N	2022-01-19	2022-01-20	105
100240910	Let'sNote SZ5	0	Panasonic	1	14500	LetsNote_SZ5_Ylq82Od.jpg	\N	2022-01-19	2022-01-20	106
100240911	8GB	3	-	2	3000	8G_メモリ_fpjk0W3.png	\N	2022-01-19	2022-01-20	104
100240912	2010 Personal	6	Microsoft	2	8000	2010_Personal_1iWo5W4.png	\N	2022-01-19	2022-01-20	104
100240913	LIFEBOOK U938	0	FUJITSU	1	35801	LIFEBOOK_U938_Oou5Dqx.png	\N	2022-01-19	2022-01-20	105
100240914	8GB	3	-	2	3000	8G_メモリ_zhIJa9h.png	\N	2022-01-19	2022-01-20	105
100240915	2021 Home & Business	6	Microsoft	1	28000	2021_Home__Business.jpg	\N	2022-01-19	2022-01-20	105
100240916	2010 Personal	6	Microsoft	2	8000	2010_Personal_HEGeU0P.png	\N	2022-01-19	2022-01-20	105
100240917	LIFEBOOK U938	0	FUJITSU	0	35802	LIFEBOOK_U938_9RNNRIA.png	\N	2022-01-19	2022-01-20	106
100240918	323E7Q	2	PHILIPS	3	4005	323E7Q_s1TNSsU.jpg	\N	2022-01-19	2022-01-20	106
100240919	256GB	5	-	4	3000	ssd_kari256gb_97uB3Nx.jpg	\N	2022-01-19	2022-01-20	106
100240920	2021 Home & Business	6	Microsoft	1	28000	2021_Home__Business_cKOzEbR.jpg	\N	2022-01-19	2022-01-20	106
100240921	8GB	3	-	2	3000	8G_メモリ_WHfBRNl.png	\N	2022-01-19	2022-01-20	106
100240922	2010 Home & Business	6	Microsoft	3	10000	2010_Personal_bQna7DP.png	\N	2022-01-19	2022-01-20	106
100240962	ThinkPad X1 Carbon 6gn	0	Lenovo	2	25000	ThinkPadX1Carbon6gn_kpIi8mz.png	\N	2022-01-19	2022-01-20	101
100240963	ThinkPad X1 Carbon 6gn	0	Lenovo	3	25000	ThinkPadX1Carbon6gn_IjPRjb0.png	未入力	2022-01-19	2022-01-20	100
100240964	Let'sNote SZ6	0	Panasonic	4	17836	LetsNote_SZ6.jpg	\N	2022-01-19	2022-01-20	101
100240965	ThinkPad X61	0	IBM	1	0	ThinkPad_X61.jpg	\N	2022-01-19	2022-01-20	100
100240966	Let'sNote NX3	0	Panasonic	2	8534	LetsNote_NX3.jpg	\N	2022-01-19	2022-01-20	100
100240967	Let'sNote NX3	0	Panasonic	0	8534	LetsNote_NX3_jxzaOOU.jpg	\N	2022-01-19	2022-01-20	101
100240968	VJS111D12N	0	VAIO	1	13604	VJS111D12N.jpg	\N	2022-01-19	2022-01-20	100
100240969	Latitude 5580	0	DELL	2	16325	Latitude_5580.png	\N	2022-01-19	2022-01-20	100
100240970	VJS111D12N	0	VAIO	1	13605	VJS111D12N_pf0hCS6.jpg	\N	2022-01-19	2022-01-20	101
100240971	Latitude 5580	0	DELL	1	16326	Latitude_5580_73YzjuW.png	\N	2022-01-19	2022-01-20	101
100240972	FlexScan EV2451	2	EIZO	2	10250	FlexScan_EV2451_KSGLqkO.png	\N	2022-01-19	2022-01-20	101
100240973	Let'sNote SZ6	0	Panasonic	2	17837	LetsNote_SZ6_lkOPyhg.jpg	\N	2022-01-19	2022-01-20	102
100240974	ideapad 310S-11IAP	0	Lenovo	1	0	ideapad_310S-11IAP.jpg	\N	2022-01-19	2022-01-20	102
100240975	Let'sNote MX4	0	Panasonic	2	9200	LetsNote_MX4.png	\N	2022-01-19	2022-01-20	102
100240976	Latitude 5580	0	DELL	1	16327	Latitude_5580_236MFzC.png	\N	2022-01-19	2022-01-20	102
100240977	Let'sNote SZ6	0	Panasonic	2	15600	LetsNote_SZ6_IsuAy43.jpg	\N	2022-01-19	2022-01-20	103
100240978	Z24n	2	hp	0	3240	Z24n.png	\N	2022-01-19	2022-01-20	102
100240979	ProBook 470 G5	0	hp	3	49000	ProBook_470_G5.jpg	\N	2022-01-19	2022-01-20	103
100240980	ThinkPad X270	0	Lenovo	4	12000	ThinkPad_X270.png	\N	2022-01-19	2022-01-20	103
100240981	Let'sNote SZ6	0	Panasonic	1	13240	LetsNote_SZ6_ebCv4mm.jpg	\N	2022-01-19	2022-01-20	104
100240982	LIFEBOOK U939	0	FUJITSU	2	56900	LIFEBOOK_U939.png	\N	2022-01-19	2022-01-20	103
100240983	ProBook 470 G5	0	hp	3	49000	ProBook_470_G5_ObmngCC.jpg	\N	2022-01-19	2022-01-20	104
100240984	Endeavor NJ5900E	0	EPSON	4	13450	Endeavor_NJ5900E.png	\N	2022-01-19	2022-01-20	103
100240985	Z24n	2	hp	1	3240	Z24n_hPOcNd8.png	\N	2022-01-19	2022-01-20	103
100240986	Let'sNote SZ5	0	Panasonic	2	14500	LetsNote_SZ5.jpg	\N	2022-01-19	2022-01-20	105
100240987	ProBook 470 G5	0	hp	3	49000	ProBook_470_G5_9PWYYg8.jpg	\N	2022-01-19	2022-01-20	105
100240988	ThinkPad X270	0	Lenovo	4	12000	ThinkPad_X270_XQrkdZ5.png	\N	2022-01-19	2022-01-20	104
100240989	LIFEBOOK U938	0	FUJITSU	2	35800	LIFEBOOK_U938.png	\N	2022-01-19	2022-01-20	104
100240990	ProBook 470 G5	0	hp	3	49000	ProBook_470_G5_39R4Lvs.jpg	\N	2022-01-19	2022-01-20	106
100240991	Surface Pro4	0	Microsoft	1	27890	Surface_Pro4.png	\N	2022-01-19	2022-01-20	104
100240992	Z24n	2	hp	2	3240	Z24n_rFCrAOn.png	\N	2022-01-19	2022-01-20	104
100240993	ThinkPad X270	0	Lenovo	3	12000	ThinkPad_X270_P7CngDj.png	\N	2022-01-19	2022-01-20	105
100240994	自作1	1	不明	1	20000	zisakupc1.jpg	\N	2022-01-19	2022-01-20	105
100240995	Surface Pro4	0	Microsoft	2	27890	Surface_Pro4_5oj19k3.png	\N	2022-01-19	2022-01-20	105
100240996	Z24n	2	hp	3	3240	Z24n_2kXGbgR.png	\N	2022-01-19	2022-01-20	105
100240997	自作2	1	不明	1	160000	zisakups2.jpg	\N	2022-01-19	2022-01-20	106
100240998	ThinkPad X270	0	Lenovo	2	12000	ThinkPad_X270_2AiZBMG.png	\N	2022-01-19	2022-01-20	106
100241000	MacBook Air Early 2015	0	Apple	1	37800	MacBook_Air_Early_2015.png	\N	2022-01-19	2022-01-20	106
100241002	Z24n	2	hp	1	2890	Z24n_2GsDGom.png	\N	2022-01-19	2022-01-20	106
100241049	WPS Office 2	6	KINGSOFT	3	216	WPS_Office_2_Uc7AXYj.png	\N	2022-01-19	2022-02-14	101
100241039	129GB	5	-	3	0	ssd_kari129gb.png	\N	2022-01-19	2022-02-14	100
100241034	ThinkPad X1 Carbon 6gn	0	Lenovo	3	25000	ThinkPadX1Carbon6gn_8wloRId.png	\N	2022-01-19	2022-02-16	102
100241048	2010 Personal	6	Microsoft	1	8000	2010_Personal.png	\N	2022-01-19	2022-02-17	101
100241035	Optiplex 3040 Micro	1	DELL	2	12579	Optiplex_3040_Micro.jpg	\N	2022-01-19	2022-01-20	100
100241036	FlexScan EV2451	2	EIZO	3	10500	FlexScan_EV2451.png	\N	2022-01-19	2022-01-20	100
100241037	P2317H	2	hp	1	100	P2317H.jpg	\N	2022-01-19	2022-01-20	100
100241038	8GB	3	-	1	3000	8G_メモリ.png	\N	2022-01-19	2022-01-20	100
100241040	Optiplex 3040 Micro	1	DELL	1	12579	Optiplex_3040_Micro_tYKB3Ya.jpg	\N	2022-01-19	2022-01-20	101
100241041	323E7Q	2	PHILIPS	2	4000	323E7Q.jpg	\N	2022-01-19	2022-01-20	101
100241042	1TB	5	-	3	12000	1TB_SSD.png	\N	2022-01-19	2022-01-20	100
100241043	2019 Home & Business	6	Microsoft	4	25000	2019_Home__Business.jpg	\N	2022-01-19	2022-01-20	100
100241044	WPS Office 2	6	KINGSOFT	1	216	WPS_Office_2.png	\N	2022-01-19	2022-01-20	100
100241045	130GB	5	-	2	0	ssd_kari130gb.jpg	\N	2022-01-19	2022-01-20	101
100241046	2021 Personal	6	Microsoft	3	26000	2021_Personal.jpg	\N	2022-01-19	2022-01-20	101
100241047	8GB	3	-	4	3000	8G_メモリ_lp0qjcc.png	\N	2022-01-19	2022-01-20	101
100241050	Optiplex 3040 Micro	1	DELL	1	12579	Optiplex_3040_Micro_wv1JPep.jpg	\N	2022-01-19	2022-01-20	102
100241051	323E7Q	2	PHILIPS	2	4001	323E7Q_BHwHIyD.jpg	\N	2022-01-19	2022-01-20	102
100241052	256GB	5	-	4	3000	ssd_kari256gb.jpg	\N	2022-01-19	2022-01-20	102
100241053	2021 Personal	6	Microsoft	0	26000	2021_Personal_zB5DhBI.jpg	\N	2022-01-19	2022-01-20	102
100241054	8GB	3	-	2	3000	8G_メモリ_vw9ahWN.png	\N	2022-01-19	2022-01-20	102
100241055	2010 Personal	6	Microsoft	3	8000	2010_Personal_UTwoIha.png	\N	2022-01-19	2022-01-20	102
100241056	Optiplex 3040 Micro	1	DELL	1	12579	Optiplex_3040_Micro_wDs5VM0.jpg	\N	2022-01-19	2022-01-20	103
100241057	256GB	5	-	0	3000	ssd_kari256gb_KlRug3w.jpg	\N	2022-01-19	2022-01-20	103
100241058	323E7Q	2	PHILIPS	0	4002	323E7Q_r0aRTex.jpg	\N	2022-01-19	2022-01-20	103
100241059	2021 Personal	6	Microsoft	2	26000	2021_Personal_r22PGaf.jpg	\N	2022-01-19	2022-01-20	103
100241060	323E7Q	2	PHILIPS	3	4003	323E7Q_nnZfbEz.jpg	\N	2022-01-19	2022-01-20	104
100241061	256GB	5	-	1	3000	ssd_kari256gb_otFNwVm.jpg	\N	2022-01-19	2022-01-20	104
100241062	2021 Personal	6	Microsoft	2	26000	2021_Personal_xn9YC2c.jpg	\N	2022-01-19	2022-01-20	104
100241063	Optiplex 3040 Micro	1	DELL	3	12579	Optiplex_3040_Micro_AMn8irk.jpg	\N	2022-01-19	2022-01-20	104
100241064	8GB	3	-	0	3000	8G_メモリ_J2ZK7TS.png	\N	2022-01-19	2022-01-20	103
100241065	2010 Personal	6	Microsoft	1	8000	2010_Personal_zfGLefw.png	\N	2022-01-19	2022-01-20	103
100241066	323E7Q	2	PHILIPS	2	4004	323E7Q_LqGEsis.jpg	\N	2022-01-19	2022-01-20	105
100241067	256GB	5	-	3	3000	ssd_kari256gb_PGZq90s.jpg	\N	2022-01-19	2022-01-20	105
100241068	Let'sNote SZ5	0	Panasonic	1	14500	LetsNote_SZ5_Ylq82Od.jpg	\N	2022-01-19	2022-01-20	106
100241069	8GB	3	-	2	3000	8G_メモリ_fpjk0W3.png	\N	2022-01-19	2022-01-20	104
100241070	2010 Personal	6	Microsoft	1	8000	2010_Personal_1iWo5W4.png	\N	2022-01-19	2022-01-20	104
100241071	LIFEBOOK U938	0	FUJITSU	2	35801	LIFEBOOK_U938_Oou5Dqx.png	\N	2022-01-19	2022-01-20	105
100241072	8GB	3	-	3	3000	8G_メモリ_zhIJa9h.png	\N	2022-01-19	2022-01-20	105
100241073	2021 Home & Business	6	Microsoft	2	28000	2021_Home__Business.jpg	\N	2022-01-19	2022-01-20	105
100241074	2010 Personal	6	Microsoft	3	8000	2010_Personal_HEGeU0P.png	\N	2022-01-19	2022-01-20	105
100241075	LIFEBOOK U938	0	FUJITSU	2	35802	LIFEBOOK_U938_9RNNRIA.png	\N	2022-01-19	2022-01-20	106
100241076	323E7Q	2	PHILIPS	3	4005	323E7Q_s1TNSsU.jpg	\N	2022-01-19	2022-01-20	106
100241077	256GB	5	-	1	3000	ssd_kari256gb_97uB3Nx.jpg	\N	2022-01-19	2022-01-20	106
100241078	2021 Home & Business	6	Microsoft	1	28000	2021_Home__Business_cKOzEbR.jpg	\N	2022-01-19	2022-01-20	106
100241079	8GB	3	-	1	3000	8G_メモリ_WHfBRNl.png	\N	2022-01-19	2022-01-20	106
100241080	2010 Home & Business	6	Microsoft	0	10000	2010_Personal_bQna7DP.png	\N	2022-01-19	2022-01-20	106
100240007	FlexScan EV2451	2	EIZO	4	10500	FlexScan_EV2451.png	\N	2022-01-19	2022-02-16	100
100240603	256GB	5	-	3	3000	ssd_kari256gb_97uB3Nx.jpg	\N	2022-01-19	2022-02-07	106
\.


--
-- Data for Name: itemmas_itemspecification; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.itemmas_itemspecification (spec_id, model_number, cpu, hdd, ssd, monitor_size, monitor_vertical, monitor_horizon, camera, wifi, optical_drive, graphic, os, category, memory) FROM stdin;
0	未入力	-	0	0	0	0	0	f	f	f	-	-	7	0
1	ThinkPad X1 Carbon 6gn	Corei5 8365U	0	0	14	1920	1080	t	t	f	intel UHD Graphics 620	Windows10 Pro	0	8
2	ThinkPad X270	Corei5 7300U	0	512	12.5	1920	1080	t	t	f	intel HD Graphics 620	Windows10 Pro	0	8
3	ThinkPad X260	Corei5 6300U	0	256	12.5	1366	768	t	t	f	intel HD Graphics 520	Windows10 Pro	0	8
4	ThinkPad X250	Corei5 5300U	0	256	12.5	1366	768	t	t	f	intel HD Graphics 5500	Windows10 Pro	0	8
5	ThinkPad T460	Corei5 6300U	0	256	14	1920	1080	t	t	f	intel HD Graphics 520	Windows10 Pro	0	16
6	ThinkPad X61	Core2Duo T7300	0	128	12.0999999999999996	1024	768	f	t	f	-	Windows7 Home 32bit	0	8
7	Let'sNote SV7	Corei5 8350U	0	256	12.0999999999999996	1920	1200	t	t	t	intel UHD Graphics 620	Windows10 Pro	0	8
8	Let'sNote  SZ6	Corei5 7300U	0	256	12.0999999999999996	1920	1200	t	t	f	intel HD Graphics 620	Windows10 Pro	0	8
9	Let'sNote  SZ5	Corei5 6300U	0	128	12.0999999999999996	1920	1200	t	t	f	intel HD Graphics 520	Windows10 Pro	0	4
10	Let'sNote  NX3	Corei5 4300U	0	512	12.0999999999999996	1600	900	t	t	f	intel HD Graphics 4400	Windows10 Pro	0	8
11	L et'sNote MX4	Corei5 5300U	0	128	12.5	1920	1080	t	t	t	intel HD Graphics 5500	Windows10 Pro	0	4
12	LIFEBOOK U939	Corei7 8565U	0	256	13.3000000000000007	1920	1080	t	t	f	intel UHD Graphics 620	Windows10 Home	0	16
13	LIFEBOOK  U938	Corei5 8350U	0	256	13.3000000000000007	1920	1080	t	t	f	intel UHD Graphics 620	Windows10 Pro	0	8
14	A746/N	Corei5 6300U	0	128	15.5999999999999996	1366	768	t	t	t	intel HD Graphics 520	Windows10 Pro	0	8
15	A748/TX	Corei5 8250U	0	256	15.5999999999999996	1366	768	f	t	t	intel UHD Graphics 620	Windows10 Pro	0	32
16	VJS111D12N	Corei5 6200U	0	256	11.5999999999999996	1920	1080	t	t	f	intel HD Graphics 520	Windows10 Pro	0	8
17	ideapad 310S-11IAP	Celeron N3350	500	0	11.5999999999999996	1366	768	t	t	f	intel HD Graphics 500	Windows10 Home	0	4
18	ProBook 470 G5	Corei5 8250U	0	512	17.3000000000000007	1600	900	t	t	f	GEForce 930MX	Windows10 Pro	0	16
19	dynabook T65/CG	Corei7 7500U	0	256	15.5999999999999996	1920	1080	t	t	t	intel HD Graphics 620	Windows10 Home	0	16
20	dynabook B65/H	Corei5 7200U	0	128	15.5999999999999996	1366	768	t	t	f	intel HD Graphics 620	Windows10 Pro	0	8
21	dynabook R63/Y	Corei5 5200U	0	128	13.3000000000000007	1366	768	t	t	f	intel HD Graphics 5500	Windows10 Pro	0	8
22	dynabook R63/F	Corei5 6200U	0	256	13.3000000000000007	1366	768	t	t	f	intel HD Graphics 520	Windows10 Pro	0	16
23	dynabook R73/B	Corei5 6200U	0	256	13.3000000000000007	1366	768	t	t	f	intel HD Graphics 520	Windows10 Pro	0	8
24	Latitude 5580	Corei3 7100U	0	256	15.5999999999999996	1366	768	t	t	f	intel HD Graphics 620	Windows10 Pro	0	8
25	Latitude 5480	Corei5 6300U	0	256	14	1366	768	f	t	f	intel HD Graphics 520	Windows10 Pro	0	16
26	Inspiron17 5759	Corei7 6500U	2000	0	17.3000000000000007	1920	1080	t	t	t	intel HD Graphics 520	Windows10 Pro	0	16
27	Latitude 7290	Corei5 8350U	0	256	12.5	1366	768	t	t	f	intel UHD Graphics 620	Windows10 Pro	0	8
28	Endeavor NJ5900E	Corei7 4700MQ	0	256	15.5999999999999996	1920	1080	t	t	t	intel Iris Pro Graphics 5200	Windows10 Pro	0	8
29	Surface Pro4	Corei7 6650U	0	256	12.3000000000000007	2736	1824	t	t	f	intel HD Graphics 520	Windows10 Pro	0	8
30	ARROWS Tab Q737/P	Corei5 7300U	0	128	13.3000000000000007	1920	1080	t	t	f	intel HD Graphics 620	Windows10 Pro	0	4
31	MacBook Air Early 2015	Corei5 5250U	0	128	13.3000000000000007	1440	900	t	t	f	intel Iris Graphics 540	MacOS monterey 12.0.1	0	8
32	MacBook Pro Mid 2015	Corei7 4770HQ	0	1000	15.4000000000000004	2880	1800	t	t	f	intel HD Graphics 4600	MacOS Big Sur 11.6.1	0	16
33	MacBook Pro  M1	M1	0	512	13.3000000000000007	2560	1600	t	t	f	M1	MacOS Big Sur 11.6.1	0	16
34	MacBook Eary 2016	Core m3 6Y30	0	256	12	2304	1440	t	t	f	intel HD Graphics 515	MacOs sierra 10.12.6	0	8
35	OMEN 15-cd016TX	Corei7 7700HQ	1000	256	15.5999999999999996	1920	1080	t	t	f	GTX 1060 mobile	Windows10 Pro	0	16
36	ProDesk 600 G3 SFF	Corei5 6500	500	128	0	0	0	f	f	t	intel HD Graphics 530	Windows10 Pro	0	8
37	OptiPlex 5040 SFF	Corei5 6500	0	128	0	0	0	f	f	t	intel HD Graphics 530	Windows10 Pro	1	8
38	PC-MKL36BZG3	Corei3 8100	0	256	0	0	0	f	f	f	intel UHD Graphics 630	Windows10 Pro	1	8
39	ESPRIMO K556/M	Corei5 6500T	0	256	20	1600	900	f	f	t	intel HD Graphics 530	Windows10 Pro	1	8
40	ThinkStation P310SFF	Corei7 6700	0	512	0	0	0	f	f	f	QUADRO K620	Windows10 Pro	1	32
41	G-tune	Corei9 7900X	3000	512	0	0	0	f	f	t	GTX 1080Ti	Windows10 Pro	1	64
42	Optiplex 3040 Micro	Corei3 6100T	0	128	0	0	0	f	f	f	intel HD Graphics 530	Windows10 Pro	1	8
43	MK37VBZGT	Corei3 6100	0	10000	0	0	0	f	f	f	intel HD Graphics 530	Windows10 Pro	1	8
44	ESPRIMO Q558/B	Corei5 9500T	0	256	0	0	0	t	t	t	intel UHD Graphics 630	Windows10 Pro	1	16
45	OptiPlex 790 SFF	Corei5 2400	500	0	0	0	0	f	f	t	intel HD Graphics 2000	Windows xp Pro 32bit	1	4
46	ProOne 600 G4 Aio	Corei5 8500T	500	250	21.5	1920	1080	t	f	t	intel UHD Graphics 630	Windows10 Pro	1	16
47	自作1	Pentium G2020	500	0	0	0	0	f	f	t	intel HD Graphics 	Windows7 Pro 32bit	1	4
48	自作2	Ryzen7 2700	6000	500	0	0	0	f	t	t	GTX 1060 6GB	Windows10 Pro	1	32
49	TIC PC-I	Corei9 12900K	8000	2000	0	0	0	t	t	t	RTX 3090	Windows11 Pro	1	128
50	TIC PC-A	Ryzen9 5950X	8000	2000	0	0	0	t	t	t	RADEON 6900XT	Windows11 Pro	1	128
51	ColorEdge CG277	-	0	0	27	2560	1440	f	f	f	-	-	2	0
52	323E7Q	-	0	0	31.5	1920	1080	f	f	f	-	-	2	0
53	E2213Hb	-	0	0	21.5	1920	1080	f	f	f	-	-	2	0
54	Z24n	-	0	0	24	1920	1200	f	f	f	-	-	2	0
55	ThinkVision T24i	-	0	0	23.8000000000000007	1920	1080	f	f	f	-	-	2	0
56	E231	-	0	0	23	1920	1080	f	f	f	-	-	2	0
57	FlexScan EV2451	-	0	0	23	1920	1080	f	f	f	-	-	2	0
58	P2317H	-	0	0	23	1920	1080	f	f	f	-	-	2	0
59	34WL500-B	-	0	0	34	2560	1080	f	f	f	-	-	2	0
60	U4919DW	-	0	0	49	5120	1440	f	f	f	-	-	2	0
61	1GB	-	0	0	0	0	0	f	f	f	-	-	3	1
62	2GB	-	0	0	0	0	0	f	f	f	-	-	3	2
63	4GB	-	0	0	0	0	0	f	f	f	-	-	3	4
64	8GB	-	0	0	0	0	0	f	f	f	-	-	3	8
65	16GB	-	0	0	0	0	0	f	f	f	-	-	3	16
66	32GB	-	0	0	0	0	0	f	f	f	-	-	3	32
67	64GB	-	0	0	0	0	0	f	f	f	-	-	3	64
69	320GB	-	320	0	0	0	0	f	f	f	-	-	4	0
70	500GB	-	500	0	0	0	0	f	f	f	-	-	4	0
71	1TB	-	1000	0	0	0	0	f	f	f	-	-	4	0
72	2TB	-	2000	0	0	0	0	f	f	f	-	-	4	0
73	3TB	-	3000	0	0	0	0	f	f	f	-	-	4	0
74	4TB	-	4000	0	0	0	0	f	f	f	-	-	4	0
75	6TB	-	6000	0	0	0	0	f	f	f	-	-	4	0
76	8TB	-	8000	0	0	0	0	f	f	f	-	-	4	0
77	10TB	-	10000	0	0	0	0	f	f	f	-	-	4	0
78	128GB	-	0	128	0	0	0	f	f	f	-	-	5	0
79	256GB	-	0	256	0	0	0	f	f	f	-	-	5	0
80	512GB	-	0	512	0	0	0	f	f	f	-	-	5	0
81	1TB	-	0	1000	0	0	0	f	f	f	-	-	5	0
82	2010 Personal	-	0	0	0	0	0	f	f	f	-	-	6	0
83	2010 Home & Business	-	0	0	0	0	0	f	f	f	-	-	6	0
84	2019 Personal	-	0	0	0	0	0	f	f	f	-	-	6	0
85	2019 Home & Business	-	0	0	0	0	0	f	f	f	-	-	6	0
86	2021 Personal	-	0	0	0	0	0	f	f	f	-	-	6	0
87	2021 Home & Business	-	0	0	0	0	0	f	f	f	-	-	6	0
88	WPS Office 2	-	0	0	0	0	0	f	f	f	-	-	6	0
\.


--
-- Data for Name: reserve_reserve; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.reserve_reserve (reserve_id, reserver_name, reserver_tel, reserve_at, updated_at, item_code, store_id, invalid_flg) FROM stdin;
48	qqqq	080-1234-5678	2022-02-17	2022-02-17 14:10:20.032731+09	100240597	104	f
21	モリクボ	090-1234-5678	2022-02-16	2022-02-17 09:56:20.775303+09	105240004	102	f
32	カンザキ	070-3333-3333	2022-02-17	2022-02-17 09:56:50.073203+09	123456789	105	f
33	サトウ	090-1295-0722	2022-02-17	2022-02-17 09:58:38.810895+09	100240096	104	f
25	ヤマダ	090-9828-4567	2022-02-16	2022-02-17 10:00:11.433997+09	10024011	103	f
49	オオムラサキ　コウジ	090-111-1111	2022-02-17	2022-02-17 14:10:30.50456+09	100240402	100	f
24	ナイトウ	080-123-4567	2022-02-16	2022-02-17 10:01:26.942219+09	104240010	103	f
30	シマムラ	080-123-4567	2022-02-16	2022-02-17 10:11:21.361288+09	100240008	104	f
28	ホンダ	090-9828-4569	2022-02-16	2022-02-17 10:11:37.618006+09	100240110	104	f
31	シブヤ	000-0000-0000	2022-02-16	2022-02-17 10:11:55.030336+09	100240108	106	f
34	ハラダ	090-9828-4569	2022-02-23	2022-02-17 10:29:04.416019+09	100240102	103	f
29	コバヤシ	090-1110-011	2022-02-16	2022-02-17 10:32:14.005075+09	100240015	106	f
27	タカガキ	000-1111-2222	2022-02-16	2022-02-17 10:32:59.831564+09	100241034	106	f
36	オガタ	080-0611-7777	2022-02-17	2022-02-17 10:35:38.553496+09	100240112	102	f
19	カトウ	123-4567-8900	2022-02-16	2022-02-16 11:33:09.626953+09	104240007	103	f
20	ニッタ	080-5050-5050	2022-02-16	2022-02-17 10:42:10.793424+09	105240010	106	f
38	ヒサカワ	070-8383-8383	2022-02-17	2022-02-17 10:44:43.165336+09	100240602	100	f
23	ニシムラ	000-0000-0000	2022-02-16	2022-02-16 17:32:22.92381+09	10024010	102	f
39	呉_従業員	090-9828-4569	2022-02-17	2022-02-17 11:12:33.546885+09	100240088	106	f
40	ニシムラ	000-0000-0000	2022-02-17	2022-02-17 11:50:09.386736+09	100240432	103	f
41	dfa	000-0000-0000	2022-02-17	2022-02-17 11:50:34.981397+09	100240719	103	f
42	田中　淳	020-7777-5585	2022-02-17	2022-02-17 11:50:53.369282+09	100240277	103	f
43	ハセガワ	696-6969-6969	2022-02-17	2022-02-17 11:50:54.260803+09	100240191	104	f
44	コバヤシ	080-1234-5678	2022-02-17	2022-02-17 11:51:03.592205+09	100240272	101	f
45	ナイトウイッセイ	080-123-4567	2022-02-17	2022-02-17 11:51:04.940233+09	100240281	104	f
16	イマウラ	585-5686-2556	2022-02-28	2022-02-17 11:51:39.215217+09	100241049	105	f
18	ハセガワ	000-0000-0000	2022-02-16	2022-02-17 11:51:59.589366+09	100240019	105	f
46	ヨヤク　タロウ	080-0000-1111	2022-02-17	2022-02-17 14:09:45.602413+09	100240581	104	f
47	オオハラ	000-000-0000	2022-02-17	2022-02-17 14:09:51.87913+09	100240282	104	f
\.


--
-- Data for Name: setitem_setitems; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.setitem_setitems (set_item_id, set_name, created_at, updated_at, desktop, hdd, memory, monitor, notepc, office, others, ssd, store_id, counter) FROM stdin;
3	セットA	2022-02-14	2022-02-14	100240250	\N	\N	100240088	\N	\N	\N	\N	102	0
4	セットB	2022-02-14	2022-02-14	\N	\N	\N	\N	100240023	103240012	\N	\N	105	0
5	du	2022-02-17	2022-02-17									103	0
\.


--
-- Data for Name: storemas_storeinfo; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.storemas_storeinfo (store_id, place_category, store_name, address, tel, invalid_flg, created_at, updated_at) FROM stdin;
106	1	秋葉原店	東京都千代田区西神田2-4-11	03-3237-8711	t	2021-01-19	2022-02-14
103	1	池袋店	東京都豊島区東池袋1-20-17	03-5952-0080	t	2021-01-19	2022-02-15
104	1	立川店	東京都立川市緑町4-8	042-528-5381	t	2021-01-19	2022-02-15
160	0	宇都宮店	東京都千代田区西神田2-2-10	03-6261-7717	t	2022-02-15	2022-02-15
161	0	大宮店	埼玉県さいたま市大宮区宮町4-13-2	048-647-3399	t	2022-02-15	2022-02-15
100	1	新宿店	東京都新宿区西新宿6-22-1	03-5322-6220	t	2021-01-19	2022-02-14
101	1	町田店	東京都町田市森野1-9-21	042-728-7621	t	2021-01-19	2022-02-14
102	1	横浜店	神奈川県横浜市神奈川区反町1-8-14	045-324-3811	t	2021-01-19	2022-02-14
105	1	名古屋店	愛知県名古屋市中村区名駅3-20-8	052-582-7733	t	2021-01-19	2022-02-14
\.


--
-- Data for Name: workstatus_workstatus; Type: TABLE DATA; Schema: public; Owner: sim_admin
--

COPY public.workstatus_workstatus (id, employee_id, store_id) FROM stdin;
15	97	102
16	121	105
17	80	105
23	153	103
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 3, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 240, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 80, true);


--
-- Name: benchmas_cpubench_cpu_bench_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.benchmas_cpubench_cpu_bench_id_seq', 377, true);


--
-- Name: benchmas_gpubench_gpu_bench_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.benchmas_gpubench_gpu_bench_id_seq', 137, true);


--
-- Name: bottleneckmas_bottleneck_bottleneck_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.bottleneckmas_bottleneck_bottleneck_id_seq', 639, true);


--
-- Name: custom_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.custom_user_groups_id_seq', 157, true);


--
-- Name: custom_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.custom_user_id_seq', 156, true);


--
-- Name: custom_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.custom_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 149, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 57, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: earningmas_earninginfo_earning_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.earningmas_earninginfo_earning_id_seq', 67, true);


--
-- Name: employeemas_employeeinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.employeemas_employeeinfo_id_seq', 1, false);


--
-- Name: itemmas_itemspecification_spec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.itemmas_itemspecification_spec_id_seq', 88, true);


--
-- Name: reserve_reserve_reserve_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.reserve_reserve_reserve_id_seq', 49, true);


--
-- Name: setitem_setitems_set_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.setitem_setitems_set_item_id_seq', 5, true);


--
-- Name: storemas_storeinfo_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.storemas_storeinfo_store_id_seq', 161, true);


--
-- Name: workstatus_workstatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sim_admin
--

SELECT pg_catalog.setval('public.workstatus_workstatus_id_seq', 23, true);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: benchmas_cpubench benchmas_cpubench_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.benchmas_cpubench
    ADD CONSTRAINT benchmas_cpubench_pkey PRIMARY KEY (cpu_bench_id);


--
-- Name: benchmas_gpubench benchmas_gpubench_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.benchmas_gpubench
    ADD CONSTRAINT benchmas_gpubench_pkey PRIMARY KEY (gpu_bench_id);


--
-- Name: bottleneckmas_bottleneck bottleneckmas_bottleneck_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.bottleneckmas_bottleneck
    ADD CONSTRAINT bottleneckmas_bottleneck_pkey PRIMARY KEY (bottleneck_id);


--
-- Name: custom_user_groups custom_user_groups_customuser_id_group_id_ea14f886_uniq; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.custom_user_groups
    ADD CONSTRAINT custom_user_groups_customuser_id_group_id_ea14f886_uniq UNIQUE (customuser_id, group_id);


--
-- Name: custom_user_groups custom_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.custom_user_groups
    ADD CONSTRAINT custom_user_groups_pkey PRIMARY KEY (id);


--
-- Name: custom_user custom_user_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.custom_user
    ADD CONSTRAINT custom_user_pkey PRIMARY KEY (id);


--
-- Name: custom_user_user_permissions custom_user_user_permiss_customuser_id_permission_f9232336_uniq; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.custom_user_user_permissions
    ADD CONSTRAINT custom_user_user_permiss_customuser_id_permission_f9232336_uniq UNIQUE (customuser_id, permission_id);


--
-- Name: custom_user_user_permissions custom_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.custom_user_user_permissions
    ADD CONSTRAINT custom_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: custom_user custom_user_username_key; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.custom_user
    ADD CONSTRAINT custom_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: earningmas_earninginfo earningmas_earninginfo_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.earningmas_earninginfo
    ADD CONSTRAINT earningmas_earninginfo_pkey PRIMARY KEY (earning_id);


--
-- Name: employeemas_employeeinfo employeemas_employeeinfo_employee_id_key; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.employeemas_employeeinfo
    ADD CONSTRAINT employeemas_employeeinfo_employee_id_key UNIQUE (employee_id);


--
-- Name: employeemas_employeeinfo employeemas_employeeinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.employeemas_employeeinfo
    ADD CONSTRAINT employeemas_employeeinfo_pkey PRIMARY KEY (id);


--
-- Name: itemmas_iteminfo itemmas_iteminfo_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.itemmas_iteminfo
    ADD CONSTRAINT itemmas_iteminfo_pkey PRIMARY KEY (item_code);


--
-- Name: itemmas_itemspecification itemmas_itemspecification_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.itemmas_itemspecification
    ADD CONSTRAINT itemmas_itemspecification_pkey PRIMARY KEY (spec_id);


--
-- Name: reserve_reserve reserve_reserve_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.reserve_reserve
    ADD CONSTRAINT reserve_reserve_pkey PRIMARY KEY (reserve_id);


--
-- Name: setitem_setitems setitem_setitems_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.setitem_setitems
    ADD CONSTRAINT setitem_setitems_pkey PRIMARY KEY (set_item_id);


--
-- Name: storemas_storeinfo storemas_storeinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.storemas_storeinfo
    ADD CONSTRAINT storemas_storeinfo_pkey PRIMARY KEY (store_id);


--
-- Name: workstatus_workstatus workstatus_workstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.workstatus_workstatus
    ADD CONSTRAINT workstatus_workstatus_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: custom_user_groups_customuser_id_8e3d0338; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX custom_user_groups_customuser_id_8e3d0338 ON public.custom_user_groups USING btree (customuser_id);


--
-- Name: custom_user_groups_group_id_02874f21; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX custom_user_groups_group_id_02874f21 ON public.custom_user_groups USING btree (group_id);


--
-- Name: custom_user_store_id_551ed9f4; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX custom_user_store_id_551ed9f4 ON public.custom_user USING btree (store_id);


--
-- Name: custom_user_user_permissions_customuser_id_ec2da4cb; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX custom_user_user_permissions_customuser_id_ec2da4cb ON public.custom_user_user_permissions USING btree (customuser_id);


--
-- Name: custom_user_user_permissions_permission_id_f82b5e3f; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX custom_user_user_permissions_permission_id_f82b5e3f ON public.custom_user_user_permissions USING btree (permission_id);


--
-- Name: custom_user_username_5f1e8aad_like; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX custom_user_username_5f1e8aad_like ON public.custom_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: earningmas_earninginfo_employee_id_8d04b4ff; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX earningmas_earninginfo_employee_id_8d04b4ff ON public.earningmas_earninginfo USING btree (employee_id);


--
-- Name: earningmas_earninginfo_item_code_8fe146ee; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX earningmas_earninginfo_item_code_8fe146ee ON public.earningmas_earninginfo USING btree (item_code);


--
-- Name: earningmas_earninginfo_item_code_8fe146ee_like; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX earningmas_earninginfo_item_code_8fe146ee_like ON public.earningmas_earninginfo USING btree (item_code varchar_pattern_ops);


--
-- Name: earningmas_earninginfo_store_id_14acecc6; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX earningmas_earninginfo_store_id_14acecc6 ON public.earningmas_earninginfo USING btree (store_id);


--
-- Name: employeemas_employeeinfo_employee_id_2c925580_like; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX employeemas_employeeinfo_employee_id_2c925580_like ON public.employeemas_employeeinfo USING btree (employee_id varchar_pattern_ops);


--
-- Name: employeemas_employeeinfo_store_id_155f0bed; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX employeemas_employeeinfo_store_id_155f0bed ON public.employeemas_employeeinfo USING btree (store_id);


--
-- Name: itemmas_iteminfo_item_code_68ac351a_like; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX itemmas_iteminfo_item_code_68ac351a_like ON public.itemmas_iteminfo USING btree (item_code varchar_pattern_ops);


--
-- Name: itemmas_iteminfo_store_id_fa0e88fc; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX itemmas_iteminfo_store_id_fa0e88fc ON public.itemmas_iteminfo USING btree (store_id);


--
-- Name: reserve_reserve_item_code_df905f80; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX reserve_reserve_item_code_df905f80 ON public.reserve_reserve USING btree (item_code);


--
-- Name: reserve_reserve_item_code_df905f80_like; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX reserve_reserve_item_code_df905f80_like ON public.reserve_reserve USING btree (item_code varchar_pattern_ops);


--
-- Name: reserve_reserve_store_id_56addc75; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX reserve_reserve_store_id_56addc75 ON public.reserve_reserve USING btree (store_id);


--
-- Name: setitem_setitems_store_id_1c9b2e5c; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX setitem_setitems_store_id_1c9b2e5c ON public.setitem_setitems USING btree (store_id);


--
-- Name: workstatus_workstatus_employee_id_bcc6ad5b; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX workstatus_workstatus_employee_id_bcc6ad5b ON public.workstatus_workstatus USING btree (employee_id);


--
-- Name: workstatus_workstatus_store_id_d6e65116; Type: INDEX; Schema: public; Owner: sim_admin
--

CREATE INDEX workstatus_workstatus_store_id_d6e65116 ON public.workstatus_workstatus USING btree (store_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_custom_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_custom_user_id FOREIGN KEY (user_id) REFERENCES public.custom_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: custom_user_groups custom_user_groups_customuser_id_8e3d0338_fk_custom_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.custom_user_groups
    ADD CONSTRAINT custom_user_groups_customuser_id_8e3d0338_fk_custom_user_id FOREIGN KEY (customuser_id) REFERENCES public.custom_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: custom_user_groups custom_user_groups_group_id_02874f21_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.custom_user_groups
    ADD CONSTRAINT custom_user_groups_group_id_02874f21_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: custom_user custom_user_store_id_551ed9f4_fk_storemas_storeinfo_store_id; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.custom_user
    ADD CONSTRAINT custom_user_store_id_551ed9f4_fk_storemas_storeinfo_store_id FOREIGN KEY (store_id) REFERENCES public.storemas_storeinfo(store_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: custom_user_user_permissions custom_user_user_per_customuser_id_ec2da4cb_fk_custom_us; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.custom_user_user_permissions
    ADD CONSTRAINT custom_user_user_per_customuser_id_ec2da4cb_fk_custom_us FOREIGN KEY (customuser_id) REFERENCES public.custom_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: custom_user_user_permissions custom_user_user_per_permission_id_f82b5e3f_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.custom_user_user_permissions
    ADD CONSTRAINT custom_user_user_per_permission_id_f82b5e3f_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_custom_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_custom_user_id FOREIGN KEY (user_id) REFERENCES public.custom_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: earningmas_earninginfo earningmas_earningin_item_code_8fe146ee_fk_itemmas_i; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.earningmas_earninginfo
    ADD CONSTRAINT earningmas_earningin_item_code_8fe146ee_fk_itemmas_i FOREIGN KEY (item_code) REFERENCES public.itemmas_iteminfo(item_code) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: earningmas_earninginfo earningmas_earningin_store_id_14acecc6_fk_storemas_; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.earningmas_earninginfo
    ADD CONSTRAINT earningmas_earningin_store_id_14acecc6_fk_storemas_ FOREIGN KEY (store_id) REFERENCES public.storemas_storeinfo(store_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: earningmas_earninginfo earningmas_earninginfo_employee_id_8d04b4ff_fk_custom_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.earningmas_earninginfo
    ADD CONSTRAINT earningmas_earninginfo_employee_id_8d04b4ff_fk_custom_user_id FOREIGN KEY (employee_id) REFERENCES public.custom_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: employeemas_employeeinfo employeemas_employee_store_id_155f0bed_fk_storemas_; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.employeemas_employeeinfo
    ADD CONSTRAINT employeemas_employee_store_id_155f0bed_fk_storemas_ FOREIGN KEY (store_id) REFERENCES public.storemas_storeinfo(store_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: itemmas_iteminfo itemmas_iteminfo_store_id_fa0e88fc_fk_storemas_; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.itemmas_iteminfo
    ADD CONSTRAINT itemmas_iteminfo_store_id_fa0e88fc_fk_storemas_ FOREIGN KEY (store_id) REFERENCES public.storemas_storeinfo(store_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reserve_reserve reserve_reserve_item_code_df905f80_fk_itemmas_i; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.reserve_reserve
    ADD CONSTRAINT reserve_reserve_item_code_df905f80_fk_itemmas_i FOREIGN KEY (item_code) REFERENCES public.itemmas_iteminfo(item_code) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reserve_reserve reserve_reserve_store_id_56addc75_fk_storemas_; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.reserve_reserve
    ADD CONSTRAINT reserve_reserve_store_id_56addc75_fk_storemas_ FOREIGN KEY (store_id) REFERENCES public.storemas_storeinfo(store_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: setitem_setitems setitem_setitems_store_id_1c9b2e5c_fk_storemas_; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.setitem_setitems
    ADD CONSTRAINT setitem_setitems_store_id_1c9b2e5c_fk_storemas_ FOREIGN KEY (store_id) REFERENCES public.storemas_storeinfo(store_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: workstatus_workstatus workstatus_workstatu_store_id_d6e65116_fk_storemas_; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.workstatus_workstatus
    ADD CONSTRAINT workstatus_workstatu_store_id_d6e65116_fk_storemas_ FOREIGN KEY (store_id) REFERENCES public.storemas_storeinfo(store_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: workstatus_workstatus workstatus_workstatus_employee_id_bcc6ad5b_fk_custom_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sim_admin
--

ALTER TABLE ONLY public.workstatus_workstatus
    ADD CONSTRAINT workstatus_workstatus_employee_id_bcc6ad5b_fk_custom_user_id FOREIGN KEY (employee_id) REFERENCES public.custom_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

