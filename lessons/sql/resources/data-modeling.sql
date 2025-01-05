CREATE TABLE client_discounts (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    discount numeric(4,2) NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 16395)
-- Name: client_discounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE client_discounts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME client_discounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 16406)
-- Name: clients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE clients (
    id integer NOT NULL,
    client_discount_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 16405)
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE clients ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16423)
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE orders (
    id integer NOT NULL,
    seller_id integer NOT NULL,
    client_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 16422)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE orders ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16415)
-- Name: orders_to_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE orders_to_products (
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    discount numeric(4,2) NOT NULL,
    quantity integer NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 16431)
-- Name: product_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE product_categories (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(255) NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 16430)
-- Name: product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE product_categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME product_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 16441)
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE products (
    id integer NOT NULL,
    product_category_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(255) NOT NULL,
    unit_price numeric(10,2) NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 16440)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE products ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 16451)
-- Name: sellers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sellers (
    id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 16450)
-- Name: sellers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE sellers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME sellers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 16461)
-- Name: user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_roles (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(255) NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 16460)
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE user_roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 235 (class 1259 OID 16478)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 16477)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 233 (class 1259 OID 16470)
-- Name: users_to_user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users_to_user_roles (
    user_id integer NOT NULL,
    user_role_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 3502 (class 0 OID 16396)
-- Dependencies: 219
-- Data for Name: client_discounts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO client_discounts OVERRIDING SYSTEM VALUE VALUES (1, '2025-01-05 22:28:19.781768', '2025-01-05 22:28:19.781768', 0.10);
INSERT INTO client_discounts OVERRIDING SYSTEM VALUE VALUES (2, '2025-01-05 22:28:19.781768', '2025-01-05 22:28:19.781768', 0.15);
INSERT INTO client_discounts OVERRIDING SYSTEM VALUE VALUES (3, '2025-01-05 22:28:19.781768', '2025-01-05 22:28:19.781768', 0.20);
INSERT INTO client_discounts OVERRIDING SYSTEM VALUE VALUES (4, '2025-01-05 22:28:19.781768', '2025-01-05 22:28:19.781768', 0.25);
INSERT INTO client_discounts OVERRIDING SYSTEM VALUE VALUES (5, '2025-01-05 22:28:19.781768', '2025-01-05 22:28:19.781768', 0.30);


--
-- TOC entry 3504 (class 0 OID 16406)
-- Dependencies: 221
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO clients OVERRIDING SYSTEM VALUE VALUES (1, 1, 1, '2025-01-05 22:28:20.30099', '2025-01-05 22:28:20.30099');
INSERT INTO clients OVERRIDING SYSTEM VALUE VALUES (2, 1, 2, '2025-01-05 22:28:20.30099', '2025-01-05 22:28:20.30099');
INSERT INTO clients OVERRIDING SYSTEM VALUE VALUES (3, 2, 3, '2025-01-05 22:28:20.30099', '2025-01-05 22:28:20.30099');
INSERT INTO clients OVERRIDING SYSTEM VALUE VALUES (4, 2, 4, '2025-01-05 22:28:20.30099', '2025-01-05 22:28:20.30099');
INSERT INTO clients OVERRIDING SYSTEM VALUE VALUES (5, 1, 5, '2025-01-05 22:28:20.30099', '2025-01-05 22:28:20.30099');
INSERT INTO clients OVERRIDING SYSTEM VALUE VALUES (6, 2, 6, '2025-01-05 22:28:20.30099', '2025-01-05 22:28:20.30099');
INSERT INTO clients OVERRIDING SYSTEM VALUE VALUES (7, 1, 7, '2025-01-05 22:28:20.30099', '2025-01-05 22:28:20.30099');
INSERT INTO clients OVERRIDING SYSTEM VALUE VALUES (8, 3, 8, '2025-01-05 22:28:20.30099', '2025-01-05 22:28:20.30099');
INSERT INTO clients OVERRIDING SYSTEM VALUE VALUES (9, 1, 9, '2025-01-05 22:28:20.30099', '2025-01-05 22:28:20.30099');
INSERT INTO clients OVERRIDING SYSTEM VALUE VALUES (10, 1, 10, '2025-01-05 22:28:20.30099', '2025-01-05 22:28:20.30099');
INSERT INTO clients OVERRIDING SYSTEM VALUE VALUES (11, 2, 11, '2025-01-05 22:28:20.30099', '2025-01-05 22:28:20.30099');
INSERT INTO clients OVERRIDING SYSTEM VALUE VALUES (12, 1, 12, '2025-01-05 22:28:20.30099', '2025-01-05 22:28:20.30099');
INSERT INTO clients OVERRIDING SYSTEM VALUE VALUES (13, 4, 13, '2025-01-05 22:28:20.30099', '2025-01-05 22:28:20.30099');
INSERT INTO clients OVERRIDING SYSTEM VALUE VALUES (14, 1, 14, '2025-01-05 22:28:20.30099', '2025-01-05 22:28:20.30099');
INSERT INTO clients OVERRIDING SYSTEM VALUE VALUES (15, 3, 15, '2025-01-05 22:28:20.30099', '2025-01-05 22:28:20.30099');
INSERT INTO clients OVERRIDING SYSTEM VALUE VALUES (16, 2, 16, '2025-01-05 22:28:20.30099', '2025-01-05 22:28:20.30099');
INSERT INTO clients OVERRIDING SYSTEM VALUE VALUES (17, 2, 17, '2025-01-05 22:28:20.30099', '2025-01-05 22:28:20.30099');
INSERT INTO clients OVERRIDING SYSTEM VALUE VALUES (18, 2, 18, '2025-01-05 22:28:20.30099', '2025-01-05 22:28:20.30099');
INSERT INTO clients OVERRIDING SYSTEM VALUE VALUES (19, 4, 19, '2025-01-05 22:28:20.30099', '2025-01-05 22:28:20.30099');
INSERT INTO clients OVERRIDING SYSTEM VALUE VALUES (20, 3, 20, '2025-01-05 22:28:20.30099', '2025-01-05 22:28:20.30099');


--
-- TOC entry 3507 (class 0 OID 16423)
-- Dependencies: 224
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO orders OVERRIDING SYSTEM VALUE VALUES (1, 1, 10, '2025-01-05 22:28:20.361358', '2025-01-05 22:28:20.361358');
INSERT INTO orders OVERRIDING SYSTEM VALUE VALUES (2, 7, 10, '2025-01-05 22:28:20.361358', '2025-01-05 22:28:20.361358');
INSERT INTO orders OVERRIDING SYSTEM VALUE VALUES (3, 19, 10, '2025-01-05 22:28:20.361358', '2025-01-05 22:28:20.361358');
INSERT INTO orders OVERRIDING SYSTEM VALUE VALUES (4, 4, 6, '2025-01-05 22:28:20.361358', '2025-01-05 22:28:20.361358');
INSERT INTO orders OVERRIDING SYSTEM VALUE VALUES (5, 1, 11, '2025-01-05 22:28:20.361358', '2025-01-05 22:28:20.361358');
INSERT INTO orders OVERRIDING SYSTEM VALUE VALUES (6, 7, 4, '2025-01-05 22:28:20.361358', '2025-01-05 22:28:20.361358');
INSERT INTO orders OVERRIDING SYSTEM VALUE VALUES (7, 9, 12, '2025-01-05 22:28:20.361358', '2025-01-05 22:28:20.361358');
INSERT INTO orders OVERRIDING SYSTEM VALUE VALUES (8, 20, 14, '2025-01-05 22:28:20.361358', '2025-01-05 22:28:20.361358');
INSERT INTO orders OVERRIDING SYSTEM VALUE VALUES (9, 19, 12, '2025-01-05 22:28:20.361358', '2025-01-05 22:28:20.361358');
INSERT INTO orders OVERRIDING SYSTEM VALUE VALUES (10, 16, 18, '2025-01-05 22:28:20.361358', '2025-01-05 22:28:20.361358');
INSERT INTO orders OVERRIDING SYSTEM VALUE VALUES (11, 10, 4, '2025-01-05 22:28:20.361358', '2025-01-05 22:28:20.361358');
INSERT INTO orders OVERRIDING SYSTEM VALUE VALUES (12, 9, 15, '2025-01-05 22:28:20.361358', '2025-01-05 22:28:20.361358');
INSERT INTO orders OVERRIDING SYSTEM VALUE VALUES (13, 19, 13, '2025-01-05 22:28:20.361358', '2025-01-05 22:28:20.361358');
INSERT INTO orders OVERRIDING SYSTEM VALUE VALUES (14, 1, 20, '2025-01-05 22:28:20.361358', '2025-01-05 22:28:20.361358');
INSERT INTO orders OVERRIDING SYSTEM VALUE VALUES (15, 15, 13, '2025-01-05 22:28:20.361358', '2025-01-05 22:28:20.361358');
INSERT INTO orders OVERRIDING SYSTEM VALUE VALUES (16, 13, 9, '2025-01-05 22:28:20.361358', '2025-01-05 22:28:20.361358');
INSERT INTO orders OVERRIDING SYSTEM VALUE VALUES (17, 14, 14, '2025-01-05 22:28:20.361358', '2025-01-05 22:28:20.361358');
INSERT INTO orders OVERRIDING SYSTEM VALUE VALUES (18, 6, 11, '2025-01-05 22:28:20.361358', '2025-01-05 22:28:20.361358');
INSERT INTO orders OVERRIDING SYSTEM VALUE VALUES (19, 11, 13, '2025-01-05 22:28:20.361358', '2025-01-05 22:28:20.361358');
INSERT INTO orders OVERRIDING SYSTEM VALUE VALUES (20, 13, 17, '2025-01-05 22:28:20.361358', '2025-01-05 22:28:20.361358');


--
-- TOC entry 3505 (class 0 OID 16415)
-- Dependencies: 222
-- Data for Name: orders_to_products; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO orders_to_products VALUES (1, 10, '2025-01-05 22:28:20.466709', '2025-01-05 22:28:20.466709', 739.85, 0.10, 8);
INSERT INTO orders_to_products VALUES (2, 8, '2025-01-05 22:28:20.466709', '2025-01-05 22:28:20.466709', 394.75, 0.10, 8);
INSERT INTO orders_to_products VALUES (3, 13, '2025-01-05 22:28:20.466709', '2025-01-05 22:28:20.466709', 101.60, 0.10, 10);
INSERT INTO orders_to_products VALUES (4, 10, '2025-01-05 22:28:20.466709', '2025-01-05 22:28:20.466709', 739.85, 0.15, 4);
INSERT INTO orders_to_products VALUES (5, 16, '2025-01-05 22:28:20.466709', '2025-01-05 22:28:20.466709', 756.29, 0.15, 6);
INSERT INTO orders_to_products VALUES (6, 3, '2025-01-05 22:28:20.466709', '2025-01-05 22:28:20.466709', 279.89, 0.15, 9);
INSERT INTO orders_to_products VALUES (7, 8, '2025-01-05 22:28:20.466709', '2025-01-05 22:28:20.466709', 394.75, 0.10, 6);
INSERT INTO orders_to_products VALUES (8, 19, '2025-01-05 22:28:20.466709', '2025-01-05 22:28:20.466709', 967.19, 0.10, 10);
INSERT INTO orders_to_products VALUES (9, 10, '2025-01-05 22:28:20.466709', '2025-01-05 22:28:20.466709', 739.85, 0.10, 1);
INSERT INTO orders_to_products VALUES (10, 13, '2025-01-05 22:28:20.466709', '2025-01-05 22:28:20.466709', 101.60, 0.15, 1);
INSERT INTO orders_to_products VALUES (11, 1, '2025-01-05 22:28:20.466709', '2025-01-05 22:28:20.466709', 307.25, 0.15, 8);
INSERT INTO orders_to_products VALUES (12, 8, '2025-01-05 22:28:20.466709', '2025-01-05 22:28:20.466709', 394.75, 0.20, 4);
INSERT INTO orders_to_products VALUES (13, 11, '2025-01-05 22:28:20.466709', '2025-01-05 22:28:20.466709', 453.25, 0.25, 1);
INSERT INTO orders_to_products VALUES (14, 10, '2025-01-05 22:28:20.466709', '2025-01-05 22:28:20.466709', 739.85, 0.20, 3);
INSERT INTO orders_to_products VALUES (15, 7, '2025-01-05 22:28:20.466709', '2025-01-05 22:28:20.466709', 992.89, 0.25, 7);
INSERT INTO orders_to_products VALUES (16, 7, '2025-01-05 22:28:20.466709', '2025-01-05 22:28:20.466709', 992.89, 0.10, 1);
INSERT INTO orders_to_products VALUES (17, 10, '2025-01-05 22:28:20.466709', '2025-01-05 22:28:20.466709', 739.85, 0.10, 8);
INSERT INTO orders_to_products VALUES (18, 13, '2025-01-05 22:28:20.466709', '2025-01-05 22:28:20.466709', 101.60, 0.15, 5);
INSERT INTO orders_to_products VALUES (19, 18, '2025-01-05 22:28:20.466709', '2025-01-05 22:28:20.466709', 901.89, 0.25, 4);
INSERT INTO orders_to_products VALUES (20, 12, '2025-01-05 22:28:20.466709', '2025-01-05 22:28:20.466709', 867.29, 0.15, 8);


--
-- TOC entry 3509 (class 0 OID 16431)
-- Dependencies: 226
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO product_categories OVERRIDING SYSTEM VALUE VALUES (1, '2025-01-05 22:28:19.783074', '2025-01-05 22:28:19.783074', 'basic');
INSERT INTO product_categories OVERRIDING SYSTEM VALUE VALUES (2, '2025-01-05 22:28:19.783074', '2025-01-05 22:28:19.783074', 'medium');
INSERT INTO product_categories OVERRIDING SYSTEM VALUE VALUES (3, '2025-01-05 22:28:19.783074', '2025-01-05 22:28:19.783074', 'premium');


--
-- TOC entry 3511 (class 0 OID 16441)
-- Dependencies: 228
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO products OVERRIDING SYSTEM VALUE VALUES (1, 1, '2025-01-05 22:28:19.89376', '2025-01-05 22:28:19.89376', 'Incredible Wooden Chicken', 307.25);
INSERT INTO products OVERRIDING SYSTEM VALUE VALUES (2, 1, '2025-01-05 22:28:19.89376', '2025-01-05 22:28:19.89376', 'Gorgeous Soft Soap', 626.99);
INSERT INTO products OVERRIDING SYSTEM VALUE VALUES (3, 2, '2025-01-05 22:28:19.89376', '2025-01-05 22:28:19.89376', 'Oriental Fresh Gloves', 279.89);
INSERT INTO products OVERRIDING SYSTEM VALUE VALUES (4, 1, '2025-01-05 22:28:19.89376', '2025-01-05 22:28:19.89376', 'Intelligent Bronze Chair', 446.05);
INSERT INTO products OVERRIDING SYSTEM VALUE VALUES (5, 2, '2025-01-05 22:28:19.89376', '2025-01-05 22:28:19.89376', 'Refined Plastic Sausages', 645.89);
INSERT INTO products OVERRIDING SYSTEM VALUE VALUES (6, 1, '2025-01-05 22:28:19.89376', '2025-01-05 22:28:19.89376', 'Luxurious Plastic Table', 686.29);
INSERT INTO products OVERRIDING SYSTEM VALUE VALUES (7, 2, '2025-01-05 22:28:19.89376', '2025-01-05 22:28:19.89376', 'Modern Plastic Computer', 992.89);
INSERT INTO products OVERRIDING SYSTEM VALUE VALUES (8, 1, '2025-01-05 22:28:19.89376', '2025-01-05 22:28:19.89376', 'Incredible Cotton Fish', 394.75);
INSERT INTO products OVERRIDING SYSTEM VALUE VALUES (9, 2, '2025-01-05 22:28:19.89376', '2025-01-05 22:28:19.89376', 'Fantastic Rubber Mouse', 213.63);
INSERT INTO products OVERRIDING SYSTEM VALUE VALUES (10, 1, '2025-01-05 22:28:19.89376', '2025-01-05 22:28:19.89376', 'Handmade Fresh Mouse', 739.85);
INSERT INTO products OVERRIDING SYSTEM VALUE VALUES (11, 2, '2025-01-05 22:28:19.89376', '2025-01-05 22:28:19.89376', 'Gorgeous Frozen Hat', 453.25);
INSERT INTO products OVERRIDING SYSTEM VALUE VALUES (12, 2, '2025-01-05 22:28:19.89376', '2025-01-05 22:28:19.89376', 'Rustic Frozen Bike', 867.29);
INSERT INTO products OVERRIDING SYSTEM VALUE VALUES (13, 1, '2025-01-05 22:28:19.89376', '2025-01-05 22:28:19.89376', 'Intelligent Fresh Chicken', 101.60);
INSERT INTO products OVERRIDING SYSTEM VALUE VALUES (14, 2, '2025-01-05 22:28:19.89376', '2025-01-05 22:28:19.89376', 'Gorgeous Soft Car', 190.15);
INSERT INTO products OVERRIDING SYSTEM VALUE VALUES (15, 1, '2025-01-05 22:28:19.89376', '2025-01-05 22:28:19.89376', 'Rustic Rubber Chicken', 422.19);
INSERT INTO products OVERRIDING SYSTEM VALUE VALUES (16, 1, '2025-01-05 22:28:19.89376', '2025-01-05 22:28:19.89376', 'Small Steel Gloves', 756.29);
INSERT INTO products OVERRIDING SYSTEM VALUE VALUES (17, 2, '2025-01-05 22:28:19.89376', '2025-01-05 22:28:19.89376', 'Bespoke Bronze Chicken', 472.69);
INSERT INTO products OVERRIDING SYSTEM VALUE VALUES (18, 1, '2025-01-05 22:28:19.89376', '2025-01-05 22:28:19.89376', 'Incredible Frozen Bacon', 901.89);
INSERT INTO products OVERRIDING SYSTEM VALUE VALUES (19, 1, '2025-01-05 22:28:19.89376', '2025-01-05 22:28:19.89376', 'Elegant Metal Chips', 967.19);
INSERT INTO products OVERRIDING SYSTEM VALUE VALUES (20, 1, '2025-01-05 22:28:19.89376', '2025-01-05 22:28:19.89376', 'Rustic Wooden Chicken', 428.60);


--
-- TOC entry 3513 (class 0 OID 16451)
-- Dependencies: 230
-- Data for Name: sellers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sellers OVERRIDING SYSTEM VALUE VALUES (1, 1, '2025-01-05 22:28:20.101105', '2025-01-05 22:28:20.101105');
INSERT INTO sellers OVERRIDING SYSTEM VALUE VALUES (2, 2, '2025-01-05 22:28:20.101105', '2025-01-05 22:28:20.101105');
INSERT INTO sellers OVERRIDING SYSTEM VALUE VALUES (3, 3, '2025-01-05 22:28:20.101105', '2025-01-05 22:28:20.101105');
INSERT INTO sellers OVERRIDING SYSTEM VALUE VALUES (4, 4, '2025-01-05 22:28:20.101105', '2025-01-05 22:28:20.101105');
INSERT INTO sellers OVERRIDING SYSTEM VALUE VALUES (5, 5, '2025-01-05 22:28:20.101105', '2025-01-05 22:28:20.101105');
INSERT INTO sellers OVERRIDING SYSTEM VALUE VALUES (6, 6, '2025-01-05 22:28:20.101105', '2025-01-05 22:28:20.101105');
INSERT INTO sellers OVERRIDING SYSTEM VALUE VALUES (7, 7, '2025-01-05 22:28:20.101105', '2025-01-05 22:28:20.101105');
INSERT INTO sellers OVERRIDING SYSTEM VALUE VALUES (8, 8, '2025-01-05 22:28:20.101105', '2025-01-05 22:28:20.101105');
INSERT INTO sellers OVERRIDING SYSTEM VALUE VALUES (9, 9, '2025-01-05 22:28:20.101105', '2025-01-05 22:28:20.101105');
INSERT INTO sellers OVERRIDING SYSTEM VALUE VALUES (10, 10, '2025-01-05 22:28:20.101105', '2025-01-05 22:28:20.101105');
INSERT INTO sellers OVERRIDING SYSTEM VALUE VALUES (11, 11, '2025-01-05 22:28:20.101105', '2025-01-05 22:28:20.101105');
INSERT INTO sellers OVERRIDING SYSTEM VALUE VALUES (12, 12, '2025-01-05 22:28:20.101105', '2025-01-05 22:28:20.101105');
INSERT INTO sellers OVERRIDING SYSTEM VALUE VALUES (13, 13, '2025-01-05 22:28:20.101105', '2025-01-05 22:28:20.101105');
INSERT INTO sellers OVERRIDING SYSTEM VALUE VALUES (14, 14, '2025-01-05 22:28:20.101105', '2025-01-05 22:28:20.101105');
INSERT INTO sellers OVERRIDING SYSTEM VALUE VALUES (15, 15, '2025-01-05 22:28:20.101105', '2025-01-05 22:28:20.101105');
INSERT INTO sellers OVERRIDING SYSTEM VALUE VALUES (16, 16, '2025-01-05 22:28:20.101105', '2025-01-05 22:28:20.101105');
INSERT INTO sellers OVERRIDING SYSTEM VALUE VALUES (17, 17, '2025-01-05 22:28:20.101105', '2025-01-05 22:28:20.101105');
INSERT INTO sellers OVERRIDING SYSTEM VALUE VALUES (18, 18, '2025-01-05 22:28:20.101105', '2025-01-05 22:28:20.101105');
INSERT INTO sellers OVERRIDING SYSTEM VALUE VALUES (19, 19, '2025-01-05 22:28:20.101105', '2025-01-05 22:28:20.101105');
INSERT INTO sellers OVERRIDING SYSTEM VALUE VALUES (20, 20, '2025-01-05 22:28:20.101105', '2025-01-05 22:28:20.101105');


--
-- TOC entry 3515 (class 0 OID 16461)
-- Dependencies: 232
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO user_roles OVERRIDING SYSTEM VALUE VALUES (1, '2025-01-05 22:28:19.756334', '2025-01-05 22:28:19.756334', 'client');
INSERT INTO user_roles OVERRIDING SYSTEM VALUE VALUES (2, '2025-01-05 22:28:19.756334', '2025-01-05 22:28:19.756334', 'seller');


--
-- TOC entry 3518 (class 0 OID 16478)
-- Dependencies: 235
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO users OVERRIDING SYSTEM VALUE VALUES (1, '2025-01-05 22:28:19.779285', '2025-01-05 22:28:19.779285', 'Doug Hilll', 'Jarvis_Streich@hotmail.com', 'P_DF8YvbEkoa7Zr');
INSERT INTO users OVERRIDING SYSTEM VALUE VALUES (2, '2025-01-05 22:28:19.779285', '2025-01-05 22:28:19.779285', 'Camille Muller III', 'Marcelo60@yahoo.com', 'CxgWC6dU64rteRD');
INSERT INTO users OVERRIDING SYSTEM VALUE VALUES (3, '2025-01-05 22:28:19.779285', '2025-01-05 22:28:19.779285', 'Nadine Dickinson', 'Jacey0@yahoo.com', '3kaV4OvmQZnAEBn');
INSERT INTO users OVERRIDING SYSTEM VALUE VALUES (4, '2025-01-05 22:28:19.779285', '2025-01-05 22:28:19.779285', 'Eduardo Farrell', 'Buck10@yahoo.com', '1BLqR2dpjBWeDp8');
INSERT INTO users OVERRIDING SYSTEM VALUE VALUES (5, '2025-01-05 22:28:19.779285', '2025-01-05 22:28:19.779285', 'Cassandra Frami', 'Isac.Hansen@hotmail.com', 'UGcJHLMDeuSSLzJ');
INSERT INTO users OVERRIDING SYSTEM VALUE VALUES (6, '2025-01-05 22:28:19.779285', '2025-01-05 22:28:19.779285', 'Beth Cruickshank', 'Reina.Buckridge@gmail.com', 'R9DKpnuUsgAV14K');
INSERT INTO users OVERRIDING SYSTEM VALUE VALUES (7, '2025-01-05 22:28:19.779285', '2025-01-05 22:28:19.779285', 'Eduardo Kreiger', 'Marion.Franecki97@gmail.com', 'p58oevwR_ygMRhl');
INSERT INTO users OVERRIDING SYSTEM VALUE VALUES (8, '2025-01-05 22:28:19.779285', '2025-01-05 22:28:19.779285', 'Gwendolyn Nolan', 'Rylan.Kreiger91@hotmail.com', 'q3RUeSJvk1b2_j4');
INSERT INTO users OVERRIDING SYSTEM VALUE VALUES (9, '2025-01-05 22:28:19.779285', '2025-01-05 22:28:19.779285', 'Brooke Williamson', 'Harold_Upton@yahoo.com', 'OwgYx5Z4ODgYB7g');
INSERT INTO users OVERRIDING SYSTEM VALUE VALUES (10, '2025-01-05 22:28:19.779285', '2025-01-05 22:28:19.779285', 'Paulette Reichel', 'Laurel_Gleason25@gmail.com', 'ytYFfyacSqNHp6e');
INSERT INTO users OVERRIDING SYSTEM VALUE VALUES (11, '2025-01-05 22:28:19.779285', '2025-01-05 22:28:19.779285', 'Wilbert Dietrich', 'Devan_Ledner45@hotmail.com', 'S5nuizaTYB3ZRzq');
INSERT INTO users OVERRIDING SYSTEM VALUE VALUES (12, '2025-01-05 22:28:19.779285', '2025-01-05 22:28:19.779285', 'Allison Bartell', 'Hermina.Kub@hotmail.com', 'GNuHnQYFVGH0i4C');
INSERT INTO users OVERRIDING SYSTEM VALUE VALUES (13, '2025-01-05 22:28:19.779285', '2025-01-05 22:28:19.779285', 'Carolyn Nitzsche-Schulist Sr.', 'Raphael62@yahoo.com', 'wUVCQ2RgTyVm9B6');
INSERT INTO users OVERRIDING SYSTEM VALUE VALUES (14, '2025-01-05 22:28:19.779285', '2025-01-05 22:28:19.779285', 'Dr. Johnny Wisoky', 'Nasir10@gmail.com', 'bYuYehW4u67hm1H');
INSERT INTO users OVERRIDING SYSTEM VALUE VALUES (15, '2025-01-05 22:28:19.779285', '2025-01-05 22:28:19.779285', 'Pablo Mills', 'Marie_Bednar@yahoo.com', 'NnNkeold3zyXRJG');
INSERT INTO users OVERRIDING SYSTEM VALUE VALUES (16, '2025-01-05 22:28:19.779285', '2025-01-05 22:28:19.779285', 'Kara Zboncak DVM', 'Kristin39@gmail.com', '9ZQ2MujEwRPp2bc');
INSERT INTO users OVERRIDING SYSTEM VALUE VALUES (17, '2025-01-05 22:28:19.779285', '2025-01-05 22:28:19.779285', 'Nichole Zulauf-Crona', 'Caesar44@gmail.com', '2KsiTaJvW8QvTCq');
INSERT INTO users OVERRIDING SYSTEM VALUE VALUES (18, '2025-01-05 22:28:19.779285', '2025-01-05 22:28:19.779285', 'Jaime Dicki', 'Tianna2@yahoo.com', 'KFHE8J2bw272zOO');
INSERT INTO users OVERRIDING SYSTEM VALUE VALUES (19, '2025-01-05 22:28:19.779285', '2025-01-05 22:28:19.779285', 'Marcus Jaskolski', 'Alexis_Cremin97@gmail.com', 'EcejS6qeBGaeDqN');
INSERT INTO users OVERRIDING SYSTEM VALUE VALUES (20, '2025-01-05 22:28:19.779285', '2025-01-05 22:28:19.779285', 'Leslie Brekke', 'Imelda_Grant@gmail.com', 'rcqNampHejXbTFm');


--
-- TOC entry 3516 (class 0 OID 16470)
-- Dependencies: 233
-- Data for Name: users_to_user_roles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO users_to_user_roles VALUES (1, 2, '2025-01-05 22:28:19.954991', '2025-01-05 22:28:19.954991');
INSERT INTO users_to_user_roles VALUES (2, 1, '2025-01-05 22:28:19.954991', '2025-01-05 22:28:19.954991');
INSERT INTO users_to_user_roles VALUES (3, 2, '2025-01-05 22:28:19.954991', '2025-01-05 22:28:19.954991');
INSERT INTO users_to_user_roles VALUES (4, 2, '2025-01-05 22:28:19.954991', '2025-01-05 22:28:19.954991');
INSERT INTO users_to_user_roles VALUES (5, 1, '2025-01-05 22:28:19.954991', '2025-01-05 22:28:19.954991');
INSERT INTO users_to_user_roles VALUES (6, 1, '2025-01-05 22:28:19.954991', '2025-01-05 22:28:19.954991');
INSERT INTO users_to_user_roles VALUES (7, 2, '2025-01-05 22:28:19.954991', '2025-01-05 22:28:19.954991');
INSERT INTO users_to_user_roles VALUES (8, 2, '2025-01-05 22:28:19.954991', '2025-01-05 22:28:19.954991');
INSERT INTO users_to_user_roles VALUES (9, 2, '2025-01-05 22:28:19.954991', '2025-01-05 22:28:19.954991');
INSERT INTO users_to_user_roles VALUES (10, 2, '2025-01-05 22:28:19.954991', '2025-01-05 22:28:19.954991');
INSERT INTO users_to_user_roles VALUES (11, 2, '2025-01-05 22:28:19.954991', '2025-01-05 22:28:19.954991');
INSERT INTO users_to_user_roles VALUES (12, 1, '2025-01-05 22:28:19.954991', '2025-01-05 22:28:19.954991');
INSERT INTO users_to_user_roles VALUES (13, 1, '2025-01-05 22:28:19.954991', '2025-01-05 22:28:19.954991');
INSERT INTO users_to_user_roles VALUES (14, 1, '2025-01-05 22:28:19.954991', '2025-01-05 22:28:19.954991');
INSERT INTO users_to_user_roles VALUES (15, 2, '2025-01-05 22:28:19.954991', '2025-01-05 22:28:19.954991');
INSERT INTO users_to_user_roles VALUES (16, 1, '2025-01-05 22:28:19.954991', '2025-01-05 22:28:19.954991');
INSERT INTO users_to_user_roles VALUES (17, 1, '2025-01-05 22:28:19.954991', '2025-01-05 22:28:19.954991');
INSERT INTO users_to_user_roles VALUES (18, 1, '2025-01-05 22:28:19.954991', '2025-01-05 22:28:19.954991');
INSERT INTO users_to_user_roles VALUES (19, 1, '2025-01-05 22:28:19.954991', '2025-01-05 22:28:19.954991');
INSERT INTO users_to_user_roles VALUES (20, 1, '2025-01-05 22:28:19.954991', '2025-01-05 22:28:19.954991');


--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 218
-- Name: client_discounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('client_discounts_id_seq', 5, true);


--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 220
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('clients_id_seq', 20, true);


--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 223
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('orders_id_seq', 20, true);


--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 225
-- Name: product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('product_categories_id_seq', 3, true);


--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 227
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('products_id_seq', 20, true);


--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 229
-- Name: sellers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sellers_id_seq', 20, true);


--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 231
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_roles_id_seq', 2, true);


--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 234
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 20, true);


--
-- TOC entry 3315 (class 2606 OID 16404)
-- Name: client_discounts client_discounts_discount_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY client_discounts
    ADD CONSTRAINT client_discounts_discount_unique UNIQUE (discount);


--
-- TOC entry 3317 (class 2606 OID 16402)
-- Name: client_discounts client_discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY client_discounts
    ADD CONSTRAINT client_discounts_pkey PRIMARY KEY (id);


--
-- TOC entry 3319 (class 2606 OID 16412)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- TOC entry 3321 (class 2606 OID 16414)
-- Name: clients clients_user_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_user_id_unique UNIQUE (user_id);


--
-- TOC entry 3325 (class 2606 OID 16429)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3323 (class 2606 OID 16421)
-- Name: orders_to_products orders_to_products_order_id_product_id_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders_to_products
    ADD CONSTRAINT orders_to_products_order_id_product_id_pk PRIMARY KEY (order_id, product_id);


--
-- TOC entry 3327 (class 2606 OID 16439)
-- Name: product_categories product_categories_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_categories
    ADD CONSTRAINT product_categories_name_unique UNIQUE (name);


--
-- TOC entry 3329 (class 2606 OID 16437)
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3331 (class 2606 OID 16449)
-- Name: products products_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_name_unique UNIQUE (name);


--
-- TOC entry 3333 (class 2606 OID 16447)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3335 (class 2606 OID 16457)
-- Name: sellers sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sellers
    ADD CONSTRAINT sellers_pkey PRIMARY KEY (id);


--
-- TOC entry 3337 (class 2606 OID 16459)
-- Name: sellers sellers_user_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sellers
    ADD CONSTRAINT sellers_user_id_unique UNIQUE (user_id);


--
-- TOC entry 3339 (class 2606 OID 16469)
-- Name: user_roles user_roles_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_name_unique UNIQUE (name);


--
-- TOC entry 3341 (class 2606 OID 16467)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3345 (class 2606 OID 16488)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 3347 (class 2606 OID 16486)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3343 (class 2606 OID 16476)
-- Name: users_to_user_roles users_to_user_roles_user_id_user_role_id_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users_to_user_roles
    ADD CONSTRAINT users_to_user_roles_user_id_user_role_id_pk PRIMARY KEY (user_id, user_role_id);


--
-- TOC entry 3348 (class 2606 OID 16489)
-- Name: clients clients_client_discount_id_client_discounts_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_client_discount_id_client_discounts_id_fk FOREIGN KEY (client_discount_id) REFERENCES client_discounts(id);


--
-- TOC entry 3349 (class 2606 OID 16494)
-- Name: clients clients_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 3352 (class 2606 OID 16514)
-- Name: orders orders_client_id_clients_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_client_id_clients_id_fk FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- TOC entry 3353 (class 2606 OID 16509)
-- Name: orders orders_seller_id_sellers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_seller_id_sellers_id_fk FOREIGN KEY (seller_id) REFERENCES sellers(id);


--
-- TOC entry 3350 (class 2606 OID 16499)
-- Name: orders_to_products orders_to_products_order_id_orders_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders_to_products
    ADD CONSTRAINT orders_to_products_order_id_orders_id_fk FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- TOC entry 3351 (class 2606 OID 16504)
-- Name: orders_to_products orders_to_products_product_id_products_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders_to_products
    ADD CONSTRAINT orders_to_products_product_id_products_id_fk FOREIGN KEY (product_id) REFERENCES products(id);


--
-- TOC entry 3354 (class 2606 OID 16519)
-- Name: products products_product_category_id_product_categories_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_product_category_id_product_categories_id_fk FOREIGN KEY (product_category_id) REFERENCES product_categories(id);


--
-- TOC entry 3355 (class 2606 OID 16524)
-- Name: sellers sellers_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sellers
    ADD CONSTRAINT sellers_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 3356 (class 2606 OID 16529)
-- Name: users_to_user_roles users_to_user_roles_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users_to_user_roles
    ADD CONSTRAINT users_to_user_roles_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 3357 (class 2606 OID 16534)
-- Name: users_to_user_roles users_to_user_roles_user_role_id_user_roles_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users_to_user_roles
    ADD CONSTRAINT users_to_user_roles_user_role_id_user_roles_id_fk FOREIGN KEY (user_role_id) REFERENCES user_roles(id);
