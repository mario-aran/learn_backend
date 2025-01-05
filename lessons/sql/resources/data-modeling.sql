CREATE TABLE client_discounts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    discount numeric(4,2) NOT NULL
);

CREATE TABLE clients (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    client_discount_id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);

CREATE TABLE orders (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    seller_id uuid NOT NULL,
    client_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);

CREATE TABLE orders_to_products (
    order_id uuid NOT NULL,
    product_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    discount numeric(4,2) NOT NULL,
    quantity integer NOT NULL
);

CREATE TABLE product_categories (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(255) NOT NULL
);

CREATE TABLE products (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    product_category_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(255) NOT NULL,
    unit_price numeric(10,2) NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 16450)
-- Name: sellers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sellers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 16460)
-- Name: user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_roles (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(255) NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 16477)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 16470)
-- Name: users_to_user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users_to_user_roles (
    user_id uuid NOT NULL,
    user_role_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 3510 (class 0 OID 16395)
-- Dependencies: 220
-- Data for Name: client_discounts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO client_discounts VALUES ('d9deaae2-d051-4414-be45-1f10505652f8', '2025-01-05 02:02:22.928564', '2025-01-05 02:02:22.928564', 0.10);
INSERT INTO client_discounts VALUES ('d424b76e-2d8d-4396-af7f-bea03e9ee763', '2025-01-05 02:02:22.928564', '2025-01-05 02:02:22.928564', 0.15);
INSERT INTO client_discounts VALUES ('399023fd-02f5-4195-9c51-af8762376c9d', '2025-01-05 02:02:22.928564', '2025-01-05 02:02:22.928564', 0.20);
INSERT INTO client_discounts VALUES ('f6a09ce1-3b8f-4b7c-84bc-29cd1c0b3eca', '2025-01-05 02:02:22.928564', '2025-01-05 02:02:22.928564', 0.25);
INSERT INTO client_discounts VALUES ('d3d13fad-2443-4a7f-b4a1-f25ada486eab', '2025-01-05 02:02:22.928564', '2025-01-05 02:02:22.928564', 0.30);


--
-- TOC entry 3511 (class 0 OID 16405)
-- Dependencies: 221
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO clients VALUES ('5eb9804b-1787-4010-8a1d-c9f8a8eafede', 'd424b76e-2d8d-4396-af7f-bea03e9ee763', '01c43e54-a96b-4993-89ed-502d329dfabc', '2025-01-05 02:02:23.565464', '2025-01-05 02:02:23.565464');
INSERT INTO clients VALUES ('d16763d6-9aab-465f-bb6b-c1df886afa21', 'd9deaae2-d051-4414-be45-1f10505652f8', '26a05eab-fc57-4908-911a-1512eeef02d9', '2025-01-05 02:02:23.565464', '2025-01-05 02:02:23.565464');
INSERT INTO clients VALUES ('9c1eeac0-130e-4150-964f-456bfa83d45c', 'f6a09ce1-3b8f-4b7c-84bc-29cd1c0b3eca', '8bd4441f-9481-48fe-969a-6159758bdc80', '2025-01-05 02:02:23.565464', '2025-01-05 02:02:23.565464');
INSERT INTO clients VALUES ('d206356b-521c-4ca1-9c18-766d8432bf2e', 'd424b76e-2d8d-4396-af7f-bea03e9ee763', 'd13cc70a-4db7-4e98-a24a-0ed63ae30726', '2025-01-05 02:02:23.565464', '2025-01-05 02:02:23.565464');
INSERT INTO clients VALUES ('3d42ae4b-b7f4-4285-ab03-cd4578dd4511', '399023fd-02f5-4195-9c51-af8762376c9d', '451d835e-a3a1-49dd-8dfa-06d39e82d229', '2025-01-05 02:02:23.565464', '2025-01-05 02:02:23.565464');
INSERT INTO clients VALUES ('c859acba-35c3-4482-9ea3-794475cc1b20', 'd9deaae2-d051-4414-be45-1f10505652f8', '29a615fa-5475-470d-a8e1-acb0ddc3d24c', '2025-01-05 02:02:23.565464', '2025-01-05 02:02:23.565464');
INSERT INTO clients VALUES ('fc9325ee-6e0c-4d60-b91a-2ce6d03e5b11', 'd3d13fad-2443-4a7f-b4a1-f25ada486eab', 'df31b4f0-9d9b-412b-bcff-d0d18db3d7dc', '2025-01-05 02:02:23.565464', '2025-01-05 02:02:23.565464');
INSERT INTO clients VALUES ('137108a2-a348-4468-827f-c329d260d9e8', 'f6a09ce1-3b8f-4b7c-84bc-29cd1c0b3eca', '3329933b-5a8f-43c4-a925-99d1a29e009f', '2025-01-05 02:02:23.565464', '2025-01-05 02:02:23.565464');
INSERT INTO clients VALUES ('07b5f1b4-35a0-494d-8ecb-f9e545bdb579', 'f6a09ce1-3b8f-4b7c-84bc-29cd1c0b3eca', 'b9cc205a-a30b-49aa-bb67-7104edb1f551', '2025-01-05 02:02:23.565464', '2025-01-05 02:02:23.565464');
INSERT INTO clients VALUES ('d51deb10-ff3d-4c98-85a0-3bea6229e021', 'd424b76e-2d8d-4396-af7f-bea03e9ee763', '9196f64a-416b-4685-bb29-23768ef2cdd5', '2025-01-05 02:02:23.565464', '2025-01-05 02:02:23.565464');
INSERT INTO clients VALUES ('38fe7270-a842-4aba-a414-a534839deb0e', '399023fd-02f5-4195-9c51-af8762376c9d', 'dc4eb059-4b3a-43f4-8b03-58f0bd5c7801', '2025-01-05 02:02:23.565464', '2025-01-05 02:02:23.565464');
INSERT INTO clients VALUES ('41d52ca8-40d0-4661-9561-623d7b6f7952', 'f6a09ce1-3b8f-4b7c-84bc-29cd1c0b3eca', 'c0022cda-8be6-4863-8f14-fb74f26478d9', '2025-01-05 02:02:23.565464', '2025-01-05 02:02:23.565464');
INSERT INTO clients VALUES ('b9c693f1-fa20-41c6-b6c5-031a90f70f81', 'd3d13fad-2443-4a7f-b4a1-f25ada486eab', 'e9cde514-45f4-4be5-affd-fb4cd38556a4', '2025-01-05 02:02:23.565464', '2025-01-05 02:02:23.565464');
INSERT INTO clients VALUES ('96530bbe-c45a-4533-b6dc-b2f4ad68bb74', 'd424b76e-2d8d-4396-af7f-bea03e9ee763', '099ecaff-5100-4fd6-8269-1d4d342cff23', '2025-01-05 02:02:23.565464', '2025-01-05 02:02:23.565464');
INSERT INTO clients VALUES ('98eb2d39-ea4b-4a21-a843-faf205a47d30', 'f6a09ce1-3b8f-4b7c-84bc-29cd1c0b3eca', 'c4115803-7db7-4be2-b11e-d20aa659c393', '2025-01-05 02:02:23.565464', '2025-01-05 02:02:23.565464');
INSERT INTO clients VALUES ('cbe07727-bb73-42a4-bd91-5315b64490fc', 'f6a09ce1-3b8f-4b7c-84bc-29cd1c0b3eca', 'eac87c63-2c03-4190-bba0-b749973c09c2', '2025-01-05 02:02:23.565464', '2025-01-05 02:02:23.565464');
INSERT INTO clients VALUES ('09fa735a-0de8-4610-9ed4-daafe8e467e9', 'd3d13fad-2443-4a7f-b4a1-f25ada486eab', '52833358-2bfb-4750-89a0-3b74a78a0628', '2025-01-05 02:02:23.565464', '2025-01-05 02:02:23.565464');
INSERT INTO clients VALUES ('48bfadc7-5adc-49a4-bf49-3e6b98f8ac05', 'f6a09ce1-3b8f-4b7c-84bc-29cd1c0b3eca', '5dbf7df4-1c4c-4d91-86db-f0f3b26a0d96', '2025-01-05 02:02:23.565464', '2025-01-05 02:02:23.565464');
INSERT INTO clients VALUES ('caa8c0be-bcfe-476d-a54e-10df4414c464', 'd424b76e-2d8d-4396-af7f-bea03e9ee763', '762a2bb1-45cc-4f36-8f49-301bc917d56e', '2025-01-05 02:02:23.565464', '2025-01-05 02:02:23.565464');
INSERT INTO clients VALUES ('ead80b70-1397-4ca8-85a3-44177d39c3b9', 'd9deaae2-d051-4414-be45-1f10505652f8', '2f3cfd47-9d1c-4b49-a165-1b96fb6e6798', '2025-01-05 02:02:23.565464', '2025-01-05 02:02:23.565464');


--
-- TOC entry 3513 (class 0 OID 16422)
-- Dependencies: 223
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO orders VALUES ('a123052f-5bcd-4b45-b2bf-ec8cbc8a1e23', '3e86b9f3-2e59-4c0f-b2fe-533e2031eebd', 'cbe07727-bb73-42a4-bd91-5315b64490fc', '2025-01-05 02:02:23.677963', '2025-01-05 02:02:23.677963');
INSERT INTO orders VALUES ('49a5f4ff-4baf-4d2e-ba45-e0f22bc30b00', 'e5e4f65b-3419-40ec-b2e1-6f2e4d164e7b', '96530bbe-c45a-4533-b6dc-b2f4ad68bb74', '2025-01-05 02:02:23.677963', '2025-01-05 02:02:23.677963');
INSERT INTO orders VALUES ('e14cfe62-6d07-4cdc-82af-b1fbe8d4e786', 'e57c6fc7-5b10-4d05-803c-b24bb21baa0d', 'b9c693f1-fa20-41c6-b6c5-031a90f70f81', '2025-01-05 02:02:23.677963', '2025-01-05 02:02:23.677963');
INSERT INTO orders VALUES ('5a0fff00-190c-4bd6-ab2c-e68c74e66d55', '745dfd2f-8bcb-4915-97d3-cf961bf8cb5a', '137108a2-a348-4468-827f-c329d260d9e8', '2025-01-05 02:02:23.677963', '2025-01-05 02:02:23.677963');
INSERT INTO orders VALUES ('9ccdf484-ce66-411c-a28d-4ba8bc3957b1', '3ba642e1-e3c6-46b0-8afb-7b56c1e9aca7', 'd51deb10-ff3d-4c98-85a0-3bea6229e021', '2025-01-05 02:02:23.677963', '2025-01-05 02:02:23.677963');
INSERT INTO orders VALUES ('79fae8f8-7078-4dd7-8c68-05cf4274e168', 'da8799b0-8be0-4b67-bc92-bd072dc74050', 'd51deb10-ff3d-4c98-85a0-3bea6229e021', '2025-01-05 02:02:23.677963', '2025-01-05 02:02:23.677963');
INSERT INTO orders VALUES ('3151b610-7b83-44b1-971b-42ef15295832', 'e5a16119-5cd0-46f7-8dd0-a29f866cee1d', '48bfadc7-5adc-49a4-bf49-3e6b98f8ac05', '2025-01-05 02:02:23.677963', '2025-01-05 02:02:23.677963');
INSERT INTO orders VALUES ('7c6cd309-43d5-493c-92e0-6e8738af518e', '1e14fb33-d6f2-4f5d-9c31-001394050704', '137108a2-a348-4468-827f-c329d260d9e8', '2025-01-05 02:02:23.677963', '2025-01-05 02:02:23.677963');
INSERT INTO orders VALUES ('a27d8328-804d-4f2d-a191-5ee33e49bb0f', 'da8799b0-8be0-4b67-bc92-bd072dc74050', '41d52ca8-40d0-4661-9561-623d7b6f7952', '2025-01-05 02:02:23.677963', '2025-01-05 02:02:23.677963');
INSERT INTO orders VALUES ('0b97e6fc-6de5-4f69-881a-2a99e195b3c0', '10901d1c-0e04-4531-be63-7624e96aa587', '5eb9804b-1787-4010-8a1d-c9f8a8eafede', '2025-01-05 02:02:23.677963', '2025-01-05 02:02:23.677963');
INSERT INTO orders VALUES ('99ed8e6b-95d5-4cc5-800d-ecf5e294f59e', '6175b8be-2f16-4551-b70e-6058f4e3f806', '9c1eeac0-130e-4150-964f-456bfa83d45c', '2025-01-05 02:02:23.677963', '2025-01-05 02:02:23.677963');
INSERT INTO orders VALUES ('baa13490-85a2-4087-b0a0-a48b4bb5091f', '9e40dac3-51da-419d-bed6-a37307dfebcf', 'ead80b70-1397-4ca8-85a3-44177d39c3b9', '2025-01-05 02:02:23.677963', '2025-01-05 02:02:23.677963');
INSERT INTO orders VALUES ('3a12ad6a-4c44-4a9a-9cb0-bb51bd129915', 'e5e4f65b-3419-40ec-b2e1-6f2e4d164e7b', 'd16763d6-9aab-465f-bb6b-c1df886afa21', '2025-01-05 02:02:23.677963', '2025-01-05 02:02:23.677963');
INSERT INTO orders VALUES ('b4a6ca90-c040-41d6-957b-1032473551ab', '1e14fb33-d6f2-4f5d-9c31-001394050704', '96530bbe-c45a-4533-b6dc-b2f4ad68bb74', '2025-01-05 02:02:23.677963', '2025-01-05 02:02:23.677963');
INSERT INTO orders VALUES ('3c64b37a-130c-4347-961b-00dd8d3d08bb', '9e40dac3-51da-419d-bed6-a37307dfebcf', 'd16763d6-9aab-465f-bb6b-c1df886afa21', '2025-01-05 02:02:23.677963', '2025-01-05 02:02:23.677963');
INSERT INTO orders VALUES ('bbc05b78-e16e-4fd4-960d-e7e8eb75f1d7', '3ba642e1-e3c6-46b0-8afb-7b56c1e9aca7', '07b5f1b4-35a0-494d-8ecb-f9e545bdb579', '2025-01-05 02:02:23.677963', '2025-01-05 02:02:23.677963');
INSERT INTO orders VALUES ('1a8a2eaa-a118-4bc2-83e9-8746f96e1193', '4a23c17a-2010-4197-b431-df0b50853078', '38fe7270-a842-4aba-a414-a534839deb0e', '2025-01-05 02:02:23.677963', '2025-01-05 02:02:23.677963');
INSERT INTO orders VALUES ('001d8802-e13e-493d-aae9-0fd6f89bf1ea', 'c2af3895-9dda-4f45-b520-3559dff7f1c8', '137108a2-a348-4468-827f-c329d260d9e8', '2025-01-05 02:02:23.677963', '2025-01-05 02:02:23.677963');
INSERT INTO orders VALUES ('c9d7d7eb-fc56-46e3-9e81-50cb0380d030', '86ccb550-c3f8-4fb6-82c4-b088bc20b712', '5eb9804b-1787-4010-8a1d-c9f8a8eafede', '2025-01-05 02:02:23.677963', '2025-01-05 02:02:23.677963');
INSERT INTO orders VALUES ('9be80a75-9c1d-4be0-9cb4-58aebd2fa831', '4a23c17a-2010-4197-b431-df0b50853078', 'fc9325ee-6e0c-4d60-b91a-2ce6d03e5b11', '2025-01-05 02:02:23.677963', '2025-01-05 02:02:23.677963');


--
-- TOC entry 3512 (class 0 OID 16415)
-- Dependencies: 222
-- Data for Name: orders_to_products; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO orders_to_products VALUES ('a123052f-5bcd-4b45-b2bf-ec8cbc8a1e23', '364431ca-bba3-4ce7-81bd-88a924d1c684', '2025-01-05 02:02:23.843028', '2025-01-05 02:02:23.843028', 381.93, 0.25, 1);
INSERT INTO orders_to_products VALUES ('49a5f4ff-4baf-4d2e-ba45-e0f22bc30b00', '83984332-969c-4892-bcd3-52d8981aa9b1', '2025-01-05 02:02:23.843028', '2025-01-05 02:02:23.843028', 557.89, 0.15, 6);
INSERT INTO orders_to_products VALUES ('e14cfe62-6d07-4cdc-82af-b1fbe8d4e786', '48c15321-ef1b-4178-b1a2-06f8038ffbca', '2025-01-05 02:02:23.843028', '2025-01-05 02:02:23.843028', 897.10, 0.30, 9);
INSERT INTO orders_to_products VALUES ('5a0fff00-190c-4bd6-ab2c-e68c74e66d55', 'a0750600-8da7-407b-ade2-c00fc813ff55', '2025-01-05 02:02:23.843028', '2025-01-05 02:02:23.843028', 551.59, 0.25, 4);
INSERT INTO orders_to_products VALUES ('9ccdf484-ce66-411c-a28d-4ba8bc3957b1', 'fc2197a5-126b-4d96-a15b-505b2d2a3764', '2025-01-05 02:02:23.843028', '2025-01-05 02:02:23.843028', 777.95, 0.15, 9);
INSERT INTO orders_to_products VALUES ('79fae8f8-7078-4dd7-8c68-05cf4274e168', '83984332-969c-4892-bcd3-52d8981aa9b1', '2025-01-05 02:02:23.843028', '2025-01-05 02:02:23.843028', 557.89, 0.15, 3);
INSERT INTO orders_to_products VALUES ('3151b610-7b83-44b1-971b-42ef15295832', 'fb1fd4e0-4973-4811-8f73-09bc91bc737f', '2025-01-05 02:02:23.843028', '2025-01-05 02:02:23.843028', 401.74, 0.25, 5);
INSERT INTO orders_to_products VALUES ('7c6cd309-43d5-493c-92e0-6e8738af518e', 'a0750600-8da7-407b-ade2-c00fc813ff55', '2025-01-05 02:02:23.843028', '2025-01-05 02:02:23.843028', 551.59, 0.25, 10);
INSERT INTO orders_to_products VALUES ('a27d8328-804d-4f2d-a191-5ee33e49bb0f', '83984332-969c-4892-bcd3-52d8981aa9b1', '2025-01-05 02:02:23.843028', '2025-01-05 02:02:23.843028', 557.89, 0.25, 8);
INSERT INTO orders_to_products VALUES ('0b97e6fc-6de5-4f69-881a-2a99e195b3c0', '48c15321-ef1b-4178-b1a2-06f8038ffbca', '2025-01-05 02:02:23.843028', '2025-01-05 02:02:23.843028', 897.10, 0.15, 6);
INSERT INTO orders_to_products VALUES ('99ed8e6b-95d5-4cc5-800d-ecf5e294f59e', '29134394-a0d5-497b-b36a-4d03e251712a', '2025-01-05 02:02:23.843028', '2025-01-05 02:02:23.843028', 633.10, 0.25, 6);
INSERT INTO orders_to_products VALUES ('baa13490-85a2-4087-b0a0-a48b4bb5091f', '364431ca-bba3-4ce7-81bd-88a924d1c684', '2025-01-05 02:02:23.843028', '2025-01-05 02:02:23.843028', 381.93, 0.10, 5);
INSERT INTO orders_to_products VALUES ('3a12ad6a-4c44-4a9a-9cb0-bb51bd129915', '364431ca-bba3-4ce7-81bd-88a924d1c684', '2025-01-05 02:02:23.843028', '2025-01-05 02:02:23.843028', 381.93, 0.10, 1);
INSERT INTO orders_to_products VALUES ('b4a6ca90-c040-41d6-957b-1032473551ab', '983b7c03-a6bc-4a71-9da2-44975640c0ee', '2025-01-05 02:02:23.843028', '2025-01-05 02:02:23.843028', 874.05, 0.15, 8);
INSERT INTO orders_to_products VALUES ('3c64b37a-130c-4347-961b-00dd8d3d08bb', '801300f0-dffd-4d4c-8540-f52a17842c28', '2025-01-05 02:02:23.843028', '2025-01-05 02:02:23.843028', 487.89, 0.10, 5);
INSERT INTO orders_to_products VALUES ('bbc05b78-e16e-4fd4-960d-e7e8eb75f1d7', '29134394-a0d5-497b-b36a-4d03e251712a', '2025-01-05 02:02:23.843028', '2025-01-05 02:02:23.843028', 633.10, 0.25, 10);
INSERT INTO orders_to_products VALUES ('1a8a2eaa-a118-4bc2-83e9-8746f96e1193', '85b423e4-7a4d-410c-b43c-d5fa3da858aa', '2025-01-05 02:02:23.843028', '2025-01-05 02:02:23.843028', 256.95, 0.20, 9);
INSERT INTO orders_to_products VALUES ('001d8802-e13e-493d-aae9-0fd6f89bf1ea', '801300f0-dffd-4d4c-8540-f52a17842c28', '2025-01-05 02:02:23.843028', '2025-01-05 02:02:23.843028', 487.89, 0.25, 3);
INSERT INTO orders_to_products VALUES ('c9d7d7eb-fc56-46e3-9e81-50cb0380d030', '76c8c8ac-9c33-4ac9-a701-d7c3e0b0cf1f', '2025-01-05 02:02:23.843028', '2025-01-05 02:02:23.843028', 216.99, 0.15, 6);
INSERT INTO orders_to_products VALUES ('9be80a75-9c1d-4be0-9cb4-58aebd2fa831', '44927460-02b9-4cec-bbdb-c32c05f6e03b', '2025-01-05 02:02:23.843028', '2025-01-05 02:02:23.843028', 544.59, 0.30, 5);


--
-- TOC entry 3514 (class 0 OID 16430)
-- Dependencies: 224
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO product_categories VALUES ('04304c3f-35fc-4742-96a3-f37765b8ad20', '2025-01-05 02:02:22.934267', '2025-01-05 02:02:22.934267', 'basic');
INSERT INTO product_categories VALUES ('6dfa6aff-3781-49d3-927c-4159e37f05ba', '2025-01-05 02:02:22.934267', '2025-01-05 02:02:22.934267', 'medium');
INSERT INTO product_categories VALUES ('3df48514-19a6-45c9-ae84-89e59eb4fece', '2025-01-05 02:02:22.934267', '2025-01-05 02:02:22.934267', 'premium');


--
-- TOC entry 3515 (class 0 OID 16440)
-- Dependencies: 225
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO products VALUES ('85b423e4-7a4d-410c-b43c-d5fa3da858aa', '6dfa6aff-3781-49d3-927c-4159e37f05ba', '2025-01-05 02:02:23.049425', '2025-01-05 02:02:23.049425', 'Recycled Wooden Gloves', 256.95);
INSERT INTO products VALUES ('fdeabe01-5c6f-4be2-9640-6142354a4b06', '3df48514-19a6-45c9-ae84-89e59eb4fece', '2025-01-05 02:02:23.049425', '2025-01-05 02:02:23.049425', 'Generic Plastic Computer', 937.85);
INSERT INTO products VALUES ('fb1fd4e0-4973-4811-8f73-09bc91bc737f', '04304c3f-35fc-4742-96a3-f37765b8ad20', '2025-01-05 02:02:23.049425', '2025-01-05 02:02:23.049425', 'Incredible Cotton Keyboard', 401.74);
INSERT INTO products VALUES ('48c15321-ef1b-4178-b1a2-06f8038ffbca', '04304c3f-35fc-4742-96a3-f37765b8ad20', '2025-01-05 02:02:23.049425', '2025-01-05 02:02:23.049425', 'Incredible Steel Pizza', 897.10);
INSERT INTO products VALUES ('7699b901-0cd0-41ad-a332-86ef970321d2', '3df48514-19a6-45c9-ae84-89e59eb4fece', '2025-01-05 02:02:23.049425', '2025-01-05 02:02:23.049425', 'Fantastic Rubber Pants', 224.89);
INSERT INTO products VALUES ('09e00bd9-2779-4a84-aede-92d2b3e52ec6', '3df48514-19a6-45c9-ae84-89e59eb4fece', '2025-01-05 02:02:23.049425', '2025-01-05 02:02:23.049425', 'Practical Cotton Sausages', 371.29);
INSERT INTO products VALUES ('44927460-02b9-4cec-bbdb-c32c05f6e03b', '6dfa6aff-3781-49d3-927c-4159e37f05ba', '2025-01-05 02:02:23.049425', '2025-01-05 02:02:23.049425', 'Generic Bronze Salad', 544.59);
INSERT INTO products VALUES ('a0750600-8da7-407b-ade2-c00fc813ff55', '04304c3f-35fc-4742-96a3-f37765b8ad20', '2025-01-05 02:02:23.049425', '2025-01-05 02:02:23.049425', 'Electronic Concrete Fish', 551.59);
INSERT INTO products VALUES ('0f91706c-20e3-4db1-8aea-06572e4d9ec5', '6dfa6aff-3781-49d3-927c-4159e37f05ba', '2025-01-05 02:02:23.049425', '2025-01-05 02:02:23.049425', 'Luxurious Plastic Bike', 945.55);
INSERT INTO products VALUES ('04725a3f-faa3-4405-8194-b046c6213db6', '6dfa6aff-3781-49d3-927c-4159e37f05ba', '2025-01-05 02:02:23.049425', '2025-01-05 02:02:23.049425', 'Sleek Fresh Towels', 797.89);
INSERT INTO products VALUES ('983b7c03-a6bc-4a71-9da2-44975640c0ee', '6dfa6aff-3781-49d3-927c-4159e37f05ba', '2025-01-05 02:02:23.049425', '2025-01-05 02:02:23.049425', 'Ergonomic Plastic Keyboard', 874.05);
INSERT INTO products VALUES ('d7ce5a9d-6c97-4f12-b185-785014be8f8b', '04304c3f-35fc-4742-96a3-f37765b8ad20', '2025-01-05 02:02:23.049425', '2025-01-05 02:02:23.049425', 'Ergonomic Granite Ball', 120.85);
INSERT INTO products VALUES ('76c8c8ac-9c33-4ac9-a701-d7c3e0b0cf1f', '04304c3f-35fc-4742-96a3-f37765b8ad20', '2025-01-05 02:02:23.049425', '2025-01-05 02:02:23.049425', 'Luxurious Concrete Computer', 216.99);
INSERT INTO products VALUES ('fc2197a5-126b-4d96-a15b-505b2d2a3764', '6dfa6aff-3781-49d3-927c-4159e37f05ba', '2025-01-05 02:02:23.049425', '2025-01-05 02:02:23.049425', 'Rustic Steel Shoes', 777.95);
INSERT INTO products VALUES ('801300f0-dffd-4d4c-8540-f52a17842c28', '3df48514-19a6-45c9-ae84-89e59eb4fece', '2025-01-05 02:02:23.049425', '2025-01-05 02:02:23.049425', 'Recycled Cotton Cheese', 487.89);
INSERT INTO products VALUES ('862e40f2-4ddb-48d2-819c-a94ab1e83e21', '3df48514-19a6-45c9-ae84-89e59eb4fece', '2025-01-05 02:02:23.049425', '2025-01-05 02:02:23.049425', 'Modern Granite Table', 452.19);
INSERT INTO products VALUES ('29134394-a0d5-497b-b36a-4d03e251712a', '3df48514-19a6-45c9-ae84-89e59eb4fece', '2025-01-05 02:02:23.049425', '2025-01-05 02:02:23.049425', 'Oriental Cotton Shoes', 633.10);
INSERT INTO products VALUES ('364431ca-bba3-4ce7-81bd-88a924d1c684', '04304c3f-35fc-4742-96a3-f37765b8ad20', '2025-01-05 02:02:23.049425', '2025-01-05 02:02:23.049425', 'Gorgeous Bronze Bike', 381.93);
INSERT INTO products VALUES ('847a3820-558a-4cf3-bcb7-e6a58b5192b7', '3df48514-19a6-45c9-ae84-89e59eb4fece', '2025-01-05 02:02:23.049425', '2025-01-05 02:02:23.049425', 'Intelligent Cotton Soap', 963.29);
INSERT INTO products VALUES ('83984332-969c-4892-bcd3-52d8981aa9b1', '6dfa6aff-3781-49d3-927c-4159e37f05ba', '2025-01-05 02:02:23.049425', '2025-01-05 02:02:23.049425', 'Awesome Metal Pizza', 557.89);


--
-- TOC entry 3516 (class 0 OID 16450)
-- Dependencies: 226
-- Data for Name: sellers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO sellers VALUES ('4a23c17a-2010-4197-b431-df0b50853078', '01c43e54-a96b-4993-89ed-502d329dfabc', '2025-01-05 02:02:23.355969', '2025-01-05 02:02:23.355969');
INSERT INTO sellers VALUES ('8119e902-8baf-4029-95a2-74cd86ed3373', '26a05eab-fc57-4908-911a-1512eeef02d9', '2025-01-05 02:02:23.355969', '2025-01-05 02:02:23.355969');
INSERT INTO sellers VALUES ('c2af3895-9dda-4f45-b520-3559dff7f1c8', '8bd4441f-9481-48fe-969a-6159758bdc80', '2025-01-05 02:02:23.355969', '2025-01-05 02:02:23.355969');
INSERT INTO sellers VALUES ('10901d1c-0e04-4531-be63-7624e96aa587', 'd13cc70a-4db7-4e98-a24a-0ed63ae30726', '2025-01-05 02:02:23.355969', '2025-01-05 02:02:23.355969');
INSERT INTO sellers VALUES ('9e40dac3-51da-419d-bed6-a37307dfebcf', '451d835e-a3a1-49dd-8dfa-06d39e82d229', '2025-01-05 02:02:23.355969', '2025-01-05 02:02:23.355969');
INSERT INTO sellers VALUES ('3e86b9f3-2e59-4c0f-b2fe-533e2031eebd', '29a615fa-5475-470d-a8e1-acb0ddc3d24c', '2025-01-05 02:02:23.355969', '2025-01-05 02:02:23.355969');
INSERT INTO sellers VALUES ('b234d22c-7eab-48b4-97f5-1357b10b2dc0', 'df31b4f0-9d9b-412b-bcff-d0d18db3d7dc', '2025-01-05 02:02:23.355969', '2025-01-05 02:02:23.355969');
INSERT INTO sellers VALUES ('e5a16119-5cd0-46f7-8dd0-a29f866cee1d', '3329933b-5a8f-43c4-a925-99d1a29e009f', '2025-01-05 02:02:23.355969', '2025-01-05 02:02:23.355969');
INSERT INTO sellers VALUES ('745dfd2f-8bcb-4915-97d3-cf961bf8cb5a', 'b9cc205a-a30b-49aa-bb67-7104edb1f551', '2025-01-05 02:02:23.355969', '2025-01-05 02:02:23.355969');
INSERT INTO sellers VALUES ('1e14fb33-d6f2-4f5d-9c31-001394050704', '9196f64a-416b-4685-bb29-23768ef2cdd5', '2025-01-05 02:02:23.355969', '2025-01-05 02:02:23.355969');
INSERT INTO sellers VALUES ('3ba642e1-e3c6-46b0-8afb-7b56c1e9aca7', 'dc4eb059-4b3a-43f4-8b03-58f0bd5c7801', '2025-01-05 02:02:23.355969', '2025-01-05 02:02:23.355969');
INSERT INTO sellers VALUES ('da8799b0-8be0-4b67-bc92-bd072dc74050', 'c0022cda-8be6-4863-8f14-fb74f26478d9', '2025-01-05 02:02:23.355969', '2025-01-05 02:02:23.355969');
INSERT INTO sellers VALUES ('742af635-d2e4-4057-af89-fc89b7bc35fa', 'e9cde514-45f4-4be5-affd-fb4cd38556a4', '2025-01-05 02:02:23.355969', '2025-01-05 02:02:23.355969');
INSERT INTO sellers VALUES ('86ccb550-c3f8-4fb6-82c4-b088bc20b712', '099ecaff-5100-4fd6-8269-1d4d342cff23', '2025-01-05 02:02:23.355969', '2025-01-05 02:02:23.355969');
INSERT INTO sellers VALUES ('e5e4f65b-3419-40ec-b2e1-6f2e4d164e7b', 'c4115803-7db7-4be2-b11e-d20aa659c393', '2025-01-05 02:02:23.355969', '2025-01-05 02:02:23.355969');
INSERT INTO sellers VALUES ('d5d83f8c-614e-4fa5-9de1-fba3e14f862c', 'eac87c63-2c03-4190-bba0-b749973c09c2', '2025-01-05 02:02:23.355969', '2025-01-05 02:02:23.355969');
INSERT INTO sellers VALUES ('e57c6fc7-5b10-4d05-803c-b24bb21baa0d', '52833358-2bfb-4750-89a0-3b74a78a0628', '2025-01-05 02:02:23.355969', '2025-01-05 02:02:23.355969');
INSERT INTO sellers VALUES ('6175b8be-2f16-4551-b70e-6058f4e3f806', '5dbf7df4-1c4c-4d91-86db-f0f3b26a0d96', '2025-01-05 02:02:23.355969', '2025-01-05 02:02:23.355969');
INSERT INTO sellers VALUES ('ce6cb336-53d8-46f3-85b9-b087c51227fa', '762a2bb1-45cc-4f36-8f49-301bc917d56e', '2025-01-05 02:02:23.355969', '2025-01-05 02:02:23.355969');
INSERT INTO sellers VALUES ('98bd606a-d2e4-4832-b7ad-6bdda9ecd227', '2f3cfd47-9d1c-4b49-a165-1b96fb6e6798', '2025-01-05 02:02:23.355969', '2025-01-05 02:02:23.355969');


--
-- TOC entry 3517 (class 0 OID 16460)
-- Dependencies: 227
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO user_roles VALUES ('18076d58-f878-42ee-9cae-d0768f174a0c', '2025-01-05 02:02:22.875129', '2025-01-05 02:02:22.875129', 'seller');
INSERT INTO user_roles VALUES ('adcfce5c-f50b-4264-867c-c3e043105a47', '2025-01-05 02:02:22.875129', '2025-01-05 02:02:22.875129', 'client');


--
-- TOC entry 3519 (class 0 OID 16477)
-- Dependencies: 229
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO users VALUES ('01c43e54-a96b-4993-89ed-502d329dfabc', '2025-01-05 02:02:22.923531', '2025-01-05 02:02:22.923531', 'Roman Kuhn', 'Alexandre47@yahoo.com', 'TLt4w9ipMC661Zc');
INSERT INTO users VALUES ('26a05eab-fc57-4908-911a-1512eeef02d9', '2025-01-05 02:02:22.923531', '2025-01-05 02:02:22.923531', 'Joseph Medhurst', 'Baron.Hammes@gmail.com', 'MSD7TDCeCkclUnm');
INSERT INTO users VALUES ('8bd4441f-9481-48fe-969a-6159758bdc80', '2025-01-05 02:02:22.923531', '2025-01-05 02:02:22.923531', 'Gary Kunze', 'Junius83@hotmail.com', 'f1SCBRA6qZChU7L');
INSERT INTO users VALUES ('d13cc70a-4db7-4e98-a24a-0ed63ae30726', '2025-01-05 02:02:22.923531', '2025-01-05 02:02:22.923531', 'Ms. Tammy Leannon', 'Jammie.Stokes@gmail.com', 'OPq6GRLR2pM2C97');
INSERT INTO users VALUES ('451d835e-a3a1-49dd-8dfa-06d39e82d229', '2025-01-05 02:02:22.923531', '2025-01-05 02:02:22.923531', 'Dr. Salvador Mayert', 'Violette46@gmail.com', '4JYz5FdNmmtiPDM');
INSERT INTO users VALUES ('29a615fa-5475-470d-a8e1-acb0ddc3d24c', '2025-01-05 02:02:22.923531', '2025-01-05 02:02:22.923531', 'Jerome Torp', 'Fidel16@yahoo.com', 'U6o7WoBNXNVLD9d');
INSERT INTO users VALUES ('df31b4f0-9d9b-412b-bcff-d0d18db3d7dc', '2025-01-05 02:02:22.923531', '2025-01-05 02:02:22.923531', 'Mr. Neal Schowalter Jr.', 'Veda97@yahoo.com', 'EhR6_EHWhzH58tS');
INSERT INTO users VALUES ('3329933b-5a8f-43c4-a925-99d1a29e009f', '2025-01-05 02:02:22.923531', '2025-01-05 02:02:22.923531', 'Joey Beahan', 'Tommie24@hotmail.com', 'Jgm9mr1aNXNCj5h');
INSERT INTO users VALUES ('b9cc205a-a30b-49aa-bb67-7104edb1f551', '2025-01-05 02:02:22.923531', '2025-01-05 02:02:22.923531', 'Bill Russel', 'Vallie_Franey@hotmail.com', 'gCJHfd5bgp_nyGx');
INSERT INTO users VALUES ('9196f64a-416b-4685-bb29-23768ef2cdd5', '2025-01-05 02:02:22.923531', '2025-01-05 02:02:22.923531', 'Adrian Jaskolski', 'Victoria_Berge21@yahoo.com', 'dB9hP8gWV6nk0J8');
INSERT INTO users VALUES ('dc4eb059-4b3a-43f4-8b03-58f0bd5c7801', '2025-01-05 02:02:22.923531', '2025-01-05 02:02:22.923531', 'Mr. Willie Schulist', 'Hans.Ziemann57@hotmail.com', 's9UXo1_kcP6l7q0');
INSERT INTO users VALUES ('c0022cda-8be6-4863-8f14-fb74f26478d9', '2025-01-05 02:02:22.923531', '2025-01-05 02:02:22.923531', 'Beulah Terry', 'Yvonne89@hotmail.com', 'cpxqau0AInVU06x');
INSERT INTO users VALUES ('e9cde514-45f4-4be5-affd-fb4cd38556a4', '2025-01-05 02:02:22.923531', '2025-01-05 02:02:22.923531', 'Tasha Koelpin', 'Kole59@gmail.com', 'RTxY98m4lqsIrXO');
INSERT INTO users VALUES ('099ecaff-5100-4fd6-8269-1d4d342cff23', '2025-01-05 02:02:22.923531', '2025-01-05 02:02:22.923531', 'Dean Hermann Jr.', 'Dariana57@gmail.com', 'vdgv6uiuknkrdHi');
INSERT INTO users VALUES ('c4115803-7db7-4be2-b11e-d20aa659c393', '2025-01-05 02:02:22.923531', '2025-01-05 02:02:22.923531', 'Sherri Steuber', 'Jody_Rowe6@hotmail.com', 'Uk7BJuGZWPNhZWR');
INSERT INTO users VALUES ('eac87c63-2c03-4190-bba0-b749973c09c2', '2025-01-05 02:02:22.923531', '2025-01-05 02:02:22.923531', 'Rosie Satterfield', 'Hilbert2@hotmail.com', 'BiJWxFEaYloVmaP');
INSERT INTO users VALUES ('52833358-2bfb-4750-89a0-3b74a78a0628', '2025-01-05 02:02:22.923531', '2025-01-05 02:02:22.923531', 'Ricky Hessel', 'Serenity.Effertz53@gmail.com', 'VfjaTCVRz07U_5J');
INSERT INTO users VALUES ('5dbf7df4-1c4c-4d91-86db-f0f3b26a0d96', '2025-01-05 02:02:22.923531', '2025-01-05 02:02:22.923531', 'Pearl Denesik', 'Darien.Conroy@hotmail.com', 'zP3x3Crq2tfnuiY');
INSERT INTO users VALUES ('762a2bb1-45cc-4f36-8f49-301bc917d56e', '2025-01-05 02:02:22.923531', '2025-01-05 02:02:22.923531', 'Miss Pearl Walsh-Becker', 'Willis_Schaefer85@hotmail.com', 'hvQ8LWP3m1tzDMo');
INSERT INTO users VALUES ('2f3cfd47-9d1c-4b49-a165-1b96fb6e6798', '2025-01-05 02:02:22.923531', '2025-01-05 02:02:22.923531', 'Amos Okuneva', 'Darwin4@yahoo.com', 'aCVqn7XhyCLPIVe');


--
-- TOC entry 3518 (class 0 OID 16470)
-- Dependencies: 228
-- Data for Name: users_to_user_roles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO users_to_user_roles VALUES ('01c43e54-a96b-4993-89ed-502d329dfabc', 'adcfce5c-f50b-4264-867c-c3e043105a47', '2025-01-05 02:02:23.152996', '2025-01-05 02:02:23.152996');
INSERT INTO users_to_user_roles VALUES ('26a05eab-fc57-4908-911a-1512eeef02d9', '18076d58-f878-42ee-9cae-d0768f174a0c', '2025-01-05 02:02:23.152996', '2025-01-05 02:02:23.152996');
INSERT INTO users_to_user_roles VALUES ('8bd4441f-9481-48fe-969a-6159758bdc80', 'adcfce5c-f50b-4264-867c-c3e043105a47', '2025-01-05 02:02:23.152996', '2025-01-05 02:02:23.152996');
INSERT INTO users_to_user_roles VALUES ('d13cc70a-4db7-4e98-a24a-0ed63ae30726', '18076d58-f878-42ee-9cae-d0768f174a0c', '2025-01-05 02:02:23.152996', '2025-01-05 02:02:23.152996');
INSERT INTO users_to_user_roles VALUES ('451d835e-a3a1-49dd-8dfa-06d39e82d229', 'adcfce5c-f50b-4264-867c-c3e043105a47', '2025-01-05 02:02:23.152996', '2025-01-05 02:02:23.152996');
INSERT INTO users_to_user_roles VALUES ('29a615fa-5475-470d-a8e1-acb0ddc3d24c', '18076d58-f878-42ee-9cae-d0768f174a0c', '2025-01-05 02:02:23.152996', '2025-01-05 02:02:23.152996');
INSERT INTO users_to_user_roles VALUES ('df31b4f0-9d9b-412b-bcff-d0d18db3d7dc', '18076d58-f878-42ee-9cae-d0768f174a0c', '2025-01-05 02:02:23.152996', '2025-01-05 02:02:23.152996');
INSERT INTO users_to_user_roles VALUES ('3329933b-5a8f-43c4-a925-99d1a29e009f', '18076d58-f878-42ee-9cae-d0768f174a0c', '2025-01-05 02:02:23.152996', '2025-01-05 02:02:23.152996');
INSERT INTO users_to_user_roles VALUES ('b9cc205a-a30b-49aa-bb67-7104edb1f551', '18076d58-f878-42ee-9cae-d0768f174a0c', '2025-01-05 02:02:23.152996', '2025-01-05 02:02:23.152996');
INSERT INTO users_to_user_roles VALUES ('9196f64a-416b-4685-bb29-23768ef2cdd5', 'adcfce5c-f50b-4264-867c-c3e043105a47', '2025-01-05 02:02:23.152996', '2025-01-05 02:02:23.152996');
INSERT INTO users_to_user_roles VALUES ('dc4eb059-4b3a-43f4-8b03-58f0bd5c7801', 'adcfce5c-f50b-4264-867c-c3e043105a47', '2025-01-05 02:02:23.152996', '2025-01-05 02:02:23.152996');
INSERT INTO users_to_user_roles VALUES ('c0022cda-8be6-4863-8f14-fb74f26478d9', 'adcfce5c-f50b-4264-867c-c3e043105a47', '2025-01-05 02:02:23.152996', '2025-01-05 02:02:23.152996');
INSERT INTO users_to_user_roles VALUES ('e9cde514-45f4-4be5-affd-fb4cd38556a4', '18076d58-f878-42ee-9cae-d0768f174a0c', '2025-01-05 02:02:23.152996', '2025-01-05 02:02:23.152996');
INSERT INTO users_to_user_roles VALUES ('099ecaff-5100-4fd6-8269-1d4d342cff23', '18076d58-f878-42ee-9cae-d0768f174a0c', '2025-01-05 02:02:23.152996', '2025-01-05 02:02:23.152996');
INSERT INTO users_to_user_roles VALUES ('c4115803-7db7-4be2-b11e-d20aa659c393', '18076d58-f878-42ee-9cae-d0768f174a0c', '2025-01-05 02:02:23.152996', '2025-01-05 02:02:23.152996');
INSERT INTO users_to_user_roles VALUES ('eac87c63-2c03-4190-bba0-b749973c09c2', 'adcfce5c-f50b-4264-867c-c3e043105a47', '2025-01-05 02:02:23.152996', '2025-01-05 02:02:23.152996');
INSERT INTO users_to_user_roles VALUES ('52833358-2bfb-4750-89a0-3b74a78a0628', 'adcfce5c-f50b-4264-867c-c3e043105a47', '2025-01-05 02:02:23.152996', '2025-01-05 02:02:23.152996');
INSERT INTO users_to_user_roles VALUES ('5dbf7df4-1c4c-4d91-86db-f0f3b26a0d96', 'adcfce5c-f50b-4264-867c-c3e043105a47', '2025-01-05 02:02:23.152996', '2025-01-05 02:02:23.152996');
INSERT INTO users_to_user_roles VALUES ('762a2bb1-45cc-4f36-8f49-301bc917d56e', '18076d58-f878-42ee-9cae-d0768f174a0c', '2025-01-05 02:02:23.152996', '2025-01-05 02:02:23.152996');
INSERT INTO users_to_user_roles VALUES ('2f3cfd47-9d1c-4b49-a165-1b96fb6e6798', '18076d58-f878-42ee-9cae-d0768f174a0c', '2025-01-05 02:02:23.152996', '2025-01-05 02:02:23.152996');


--
-- TOC entry 3322 (class 2606 OID 16404)
-- Name: client_discounts client_discounts_discount_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY client_discounts
    ADD CONSTRAINT client_discounts_discount_unique UNIQUE (discount);


--
-- TOC entry 3324 (class 2606 OID 16402)
-- Name: client_discounts client_discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY client_discounts
    ADD CONSTRAINT client_discounts_pkey PRIMARY KEY (id);


--
-- TOC entry 3326 (class 2606 OID 16412)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- TOC entry 3328 (class 2606 OID 16414)
-- Name: clients clients_user_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_user_id_unique UNIQUE (user_id);


--
-- TOC entry 3332 (class 2606 OID 16429)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3330 (class 2606 OID 16421)
-- Name: orders_to_products orders_to_products_order_id_product_id_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders_to_products
    ADD CONSTRAINT orders_to_products_order_id_product_id_pk PRIMARY KEY (order_id, product_id);


--
-- TOC entry 3334 (class 2606 OID 16439)
-- Name: product_categories product_categories_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_categories
    ADD CONSTRAINT product_categories_name_unique UNIQUE (name);


--
-- TOC entry 3336 (class 2606 OID 16437)
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3338 (class 2606 OID 16449)
-- Name: products products_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_name_unique UNIQUE (name);


--
-- TOC entry 3340 (class 2606 OID 16447)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3342 (class 2606 OID 16457)
-- Name: sellers sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sellers
    ADD CONSTRAINT sellers_pkey PRIMARY KEY (id);


--
-- TOC entry 3344 (class 2606 OID 16459)
-- Name: sellers sellers_user_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sellers
    ADD CONSTRAINT sellers_user_id_unique UNIQUE (user_id);


--
-- TOC entry 3346 (class 2606 OID 16469)
-- Name: user_roles user_roles_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_name_unique UNIQUE (name);


--
-- TOC entry 3348 (class 2606 OID 16467)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3352 (class 2606 OID 16488)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 3354 (class 2606 OID 16486)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3350 (class 2606 OID 16476)
-- Name: users_to_user_roles users_to_user_roles_user_id_user_role_id_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users_to_user_roles
    ADD CONSTRAINT users_to_user_roles_user_id_user_role_id_pk PRIMARY KEY (user_id, user_role_id);


--
-- TOC entry 3355 (class 2606 OID 16489)
-- Name: clients clients_client_discount_id_client_discounts_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_client_discount_id_client_discounts_id_fk FOREIGN KEY (client_discount_id) REFERENCES client_discounts(id);


--
-- TOC entry 3356 (class 2606 OID 16494)
-- Name: clients clients_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 3359 (class 2606 OID 16514)
-- Name: orders orders_client_id_clients_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_client_id_clients_id_fk FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- TOC entry 3360 (class 2606 OID 16509)
-- Name: orders orders_seller_id_sellers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_seller_id_sellers_id_fk FOREIGN KEY (seller_id) REFERENCES sellers(id);


--
-- TOC entry 3357 (class 2606 OID 16499)
-- Name: orders_to_products orders_to_products_order_id_orders_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders_to_products
    ADD CONSTRAINT orders_to_products_order_id_orders_id_fk FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- TOC entry 3358 (class 2606 OID 16504)
-- Name: orders_to_products orders_to_products_product_id_products_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders_to_products
    ADD CONSTRAINT orders_to_products_product_id_products_id_fk FOREIGN KEY (product_id) REFERENCES products(id);


--
-- TOC entry 3361 (class 2606 OID 16519)
-- Name: products products_product_category_id_product_categories_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_product_category_id_product_categories_id_fk FOREIGN KEY (product_category_id) REFERENCES product_categories(id);


--
-- TOC entry 3362 (class 2606 OID 16524)
-- Name: sellers sellers_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sellers
    ADD CONSTRAINT sellers_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 3363 (class 2606 OID 16529)
-- Name: users_to_user_roles users_to_user_roles_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users_to_user_roles
    ADD CONSTRAINT users_to_user_roles_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 3364 (class 2606 OID 16534)
-- Name: users_to_user_roles users_to_user_roles_user_role_id_user_roles_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users_to_user_roles
    ADD CONSTRAINT users_to_user_roles_user_role_id_user_roles_id_fk FOREIGN KEY (user_role_id) REFERENCES user_roles(id);


-- Completed on 2025-01-05 10:55:10

--
-- PostgreSQL database dump complete
--

