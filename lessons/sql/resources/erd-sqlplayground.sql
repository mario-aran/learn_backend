CREATE TABLE client_discounts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    discount numeric(4,2) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE clients (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    client_discount_id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE orders (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    seller_id uuid NOT NULL,
    client_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE orders_to_products (
    order_id uuid NOT NULL,
    product_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    discount numeric(4,2) NOT NULL,
    quantity integer NOT NULL,
    PRIMARY KEY (order_id, product_id)
);

CREATE TABLE product_categories (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE products (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    product_category_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(255) NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE sellers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE user_roles (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_role_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO client_discounts VALUES ('988742fe-9185-4765-9f20-b697cf1b079b', '2025-01-06 21:42:51.665802', '2025-01-06 21:42:51.665802', 0.10);
INSERT INTO client_discounts VALUES ('b97c9399-dc6f-4464-84d2-39a09ef6c73f', '2025-01-06 21:42:51.665802', '2025-01-06 21:42:51.665802', 0.15);
INSERT INTO client_discounts VALUES ('f1cf5ec2-d9a2-43ee-b7fe-0599c19cfa23', '2025-01-06 21:42:51.665802', '2025-01-06 21:42:51.665802', 0.20);
INSERT INTO client_discounts VALUES ('af065442-72b1-4e6c-a5ef-32ccffd2b9e8', '2025-01-06 21:42:51.665802', '2025-01-06 21:42:51.665802', 0.25);
INSERT INTO client_discounts VALUES ('dc366093-4319-4431-b2b6-fe4b30a4dbd6', '2025-01-06 21:42:51.665802', '2025-01-06 21:42:51.665802', 0.30);

INSERT INTO clients VALUES ('125ac432-3d03-4d31-9d8c-4a6cd65253e4', 'b97c9399-dc6f-4464-84d2-39a09ef6c73f', '30caa1b1-674a-4c8a-afb4-b05a7e47b95e', '2025-01-06 21:42:52.377748', '2025-01-06 21:42:52.377748');
INSERT INTO clients VALUES ('f31dda52-70e6-4c3b-80d8-50cb23ddebf1', 'b97c9399-dc6f-4464-84d2-39a09ef6c73f', '60ea2a12-2bf6-4997-8c85-412536e63807', '2025-01-06 21:42:52.377748', '2025-01-06 21:42:52.377748');
INSERT INTO clients VALUES ('939adf0c-9b5a-4b27-a1bf-cac8a85506fc', '988742fe-9185-4765-9f20-b697cf1b079b', 'e0602972-ada1-498b-995f-01d765d03663', '2025-01-06 21:42:52.377748', '2025-01-06 21:42:52.377748');
INSERT INTO clients VALUES ('5bdee22c-f4a5-41b5-845c-81cb1aa98015', 'f1cf5ec2-d9a2-43ee-b7fe-0599c19cfa23', '208c3c57-d9da-4d1e-9bbc-fc8bfb8388a5', '2025-01-06 21:42:52.377748', '2025-01-06 21:42:52.377748');
INSERT INTO clients VALUES ('996eb780-582a-4601-b715-1f772b55f8d9', '988742fe-9185-4765-9f20-b697cf1b079b', '6402d5d9-f763-4ea1-b7f9-209e0a0ad9cd', '2025-01-06 21:42:52.377748', '2025-01-06 21:42:52.377748');
INSERT INTO clients VALUES ('91a8782f-f3dc-48ce-9b93-739dca4686d2', 'b97c9399-dc6f-4464-84d2-39a09ef6c73f', 'c8052ab0-1656-4244-92ea-1f06234e49b0', '2025-01-06 21:42:52.377748', '2025-01-06 21:42:52.377748');
INSERT INTO clients VALUES ('7f174036-221b-4095-a1c6-0cff0cdcb8ac', 'af065442-72b1-4e6c-a5ef-32ccffd2b9e8', '6b2ebbcb-701c-4664-b039-b2ccec11a237', '2025-01-06 21:42:52.377748', '2025-01-06 21:42:52.377748');

INSERT INTO orders VALUES ('d7cd88bf-e725-4320-807c-d48cc7452525', 'bd955ce4-0038-4ee6-b378-acd8454f2189', '939adf0c-9b5a-4b27-a1bf-cac8a85506fc', '2025-01-06 21:42:52.484218', '2025-01-06 21:42:52.484218');
INSERT INTO orders VALUES ('a47b4e0a-b943-41e4-83b6-4f0cb73955fc', 'f565a082-b2af-4291-b82d-eb0ffd637d00', '939adf0c-9b5a-4b27-a1bf-cac8a85506fc', '2025-01-06 21:42:52.484218', '2025-01-06 21:42:52.484218');
INSERT INTO orders VALUES ('2defdf52-ae63-457a-81f2-93a2f0408924', 'd74f22ad-a206-4ace-af66-57d4f5ff5afb', '996eb780-582a-4601-b715-1f772b55f8d9', '2025-01-06 21:42:52.484218', '2025-01-06 21:42:52.484218');
INSERT INTO orders VALUES ('8d8ff4f2-b19f-4b45-83ca-5c4a46ac60c5', '8139ae1b-a752-4ff8-9bfd-11c58f2ecd8a', '5bdee22c-f4a5-41b5-845c-81cb1aa98015', '2025-01-06 21:42:52.484218', '2025-01-06 21:42:52.484218');
INSERT INTO orders VALUES ('d177a4e5-e134-460f-a15d-a12fd26be855', 'bd955ce4-0038-4ee6-b378-acd8454f2189', '7f174036-221b-4095-a1c6-0cff0cdcb8ac', '2025-01-06 21:42:52.484218', '2025-01-06 21:42:52.484218');
INSERT INTO orders VALUES ('7df25c25-5634-4a38-b70f-d6d138499fad', 'f565a082-b2af-4291-b82d-eb0ffd637d00', '939adf0c-9b5a-4b27-a1bf-cac8a85506fc', '2025-01-06 21:42:52.484218', '2025-01-06 21:42:52.484218');
INSERT INTO orders VALUES ('4a00e896-b681-4540-84b0-f1528d41d78b', '6d5753a4-0728-4853-aabd-af094df19f46', '5bdee22c-f4a5-41b5-845c-81cb1aa98015', '2025-01-06 21:42:52.484218', '2025-01-06 21:42:52.484218');
INSERT INTO orders VALUES ('65ce5a53-06f4-4f70-aad9-685019c6c0c4', '8139ae1b-a752-4ff8-9bfd-11c58f2ecd8a', '125ac432-3d03-4d31-9d8c-4a6cd65253e4', '2025-01-06 21:42:52.484218', '2025-01-06 21:42:52.484218');
INSERT INTO orders VALUES ('763698c8-bd87-40c8-ba62-b83a396e3e0b', 'f565a082-b2af-4291-b82d-eb0ffd637d00', '996eb780-582a-4601-b715-1f772b55f8d9', '2025-01-06 21:42:52.484218', '2025-01-06 21:42:52.484218');
INSERT INTO orders VALUES ('d575d6b6-f066-4eb2-8185-f5b6b6d604b5', '32c48f32-8732-455b-a037-5db59209c2a7', '996eb780-582a-4601-b715-1f772b55f8d9', '2025-01-06 21:42:52.484218', '2025-01-06 21:42:52.484218');
INSERT INTO orders VALUES ('58f611bc-c65b-4ebb-93c1-31f4cf53296a', 'bd955ce4-0038-4ee6-b378-acd8454f2189', '939adf0c-9b5a-4b27-a1bf-cac8a85506fc', '2025-01-06 21:42:52.484218', '2025-01-06 21:42:52.484218');
INSERT INTO orders VALUES ('476b6267-8b9b-46cb-9e39-1907373b8033', 'f565a082-b2af-4291-b82d-eb0ffd637d00', '125ac432-3d03-4d31-9d8c-4a6cd65253e4', '2025-01-06 21:42:52.484218', '2025-01-06 21:42:52.484218');
INSERT INTO orders VALUES ('3ea3d812-7142-43b6-bf8c-3bfd5a397943', 'b2b8ed66-d6ff-4076-8bd9-d870e6d3cdbf', '939adf0c-9b5a-4b27-a1bf-cac8a85506fc', '2025-01-06 21:42:52.484218', '2025-01-06 21:42:52.484218');
INSERT INTO orders VALUES ('60d1e399-c9af-4e60-9d1e-5310ea19b1fc', 'f565a082-b2af-4291-b82d-eb0ffd637d00', '5bdee22c-f4a5-41b5-845c-81cb1aa98015', '2025-01-06 21:42:52.484218', '2025-01-06 21:42:52.484218');
INSERT INTO orders VALUES ('d9d52b04-9197-4be2-a534-c4116972dfa0', 'f565a082-b2af-4291-b82d-eb0ffd637d00', '996eb780-582a-4601-b715-1f772b55f8d9', '2025-01-06 21:42:52.484218', '2025-01-06 21:42:52.484218');
INSERT INTO orders VALUES ('24e1e511-1f27-4bf7-b3eb-e88bf4c44138', 'c3aebbda-589f-4d08-b02e-14aba8ba4960', '7f174036-221b-4095-a1c6-0cff0cdcb8ac', '2025-01-06 21:42:52.484218', '2025-01-06 21:42:52.484218');
INSERT INTO orders VALUES ('6acf14c8-60d7-46a8-a172-414c068d2359', 'b7f312a2-bc51-4487-bd33-bd66245f4976', '939adf0c-9b5a-4b27-a1bf-cac8a85506fc', '2025-01-06 21:42:52.484218', '2025-01-06 21:42:52.484218');
INSERT INTO orders VALUES ('db86c4e5-7c7c-4413-9b7d-866551addeae', 'b2b8ed66-d6ff-4076-8bd9-d870e6d3cdbf', '939adf0c-9b5a-4b27-a1bf-cac8a85506fc', '2025-01-06 21:42:52.484218', '2025-01-06 21:42:52.484218');
INSERT INTO orders VALUES ('de6233a8-12cf-4759-a3dc-16839c7f6240', 'b2b8ed66-d6ff-4076-8bd9-d870e6d3cdbf', '939adf0c-9b5a-4b27-a1bf-cac8a85506fc', '2025-01-06 21:42:52.484218', '2025-01-06 21:42:52.484218');
INSERT INTO orders VALUES ('d5b66ec6-2ae4-4344-978e-1faa50f1c8a9', 'a22ec3f1-3bda-4c32-a861-0bef6159c0de', '996eb780-582a-4601-b715-1f772b55f8d9', '2025-01-06 21:42:52.484218', '2025-01-06 21:42:52.484218');

INSERT INTO orders_to_products VALUES ('d7cd88bf-e725-4320-807c-d48cc7452525', 'ef8b9e55-3d0f-46e6-87b5-84ac3d59fa4b', '2025-01-06 21:42:52.65644', '2025-01-06 21:42:52.65644', 100.69, 0.10, 1);
INSERT INTO orders_to_products VALUES ('a47b4e0a-b943-41e4-83b6-4f0cb73955fc', 'ef8b9e55-3d0f-46e6-87b5-84ac3d59fa4b', '2025-01-06 21:42:52.65644', '2025-01-06 21:42:52.65644', 100.69, 0.10, 10);
INSERT INTO orders_to_products VALUES ('2defdf52-ae63-457a-81f2-93a2f0408924', '5a54c878-cec6-4507-a1b8-8cc2df648b92', '2025-01-06 21:42:52.65644', '2025-01-06 21:42:52.65644', 789.60, 0.10, 1);
INSERT INTO orders_to_products VALUES ('8d8ff4f2-b19f-4b45-83ca-5c4a46ac60c5', 'a2fd5a79-784d-4a1e-a30f-de90b873d5db', '2025-01-06 21:42:52.65644', '2025-01-06 21:42:52.65644', 949.29, 0.20, 8);
INSERT INTO orders_to_products VALUES ('d177a4e5-e134-460f-a15d-a12fd26be855', 'c011546c-a36b-4cd5-a798-52db2209edaa', '2025-01-06 21:42:52.65644', '2025-01-06 21:42:52.65644', 590.65, 0.25, 3);
INSERT INTO orders_to_products VALUES ('7df25c25-5634-4a38-b70f-d6d138499fad', '9f95dbd4-7baf-4d36-837c-b30971341020', '2025-01-06 21:42:52.65644', '2025-01-06 21:42:52.65644', 796.49, 0.10, 7);
INSERT INTO orders_to_products VALUES ('4a00e896-b681-4540-84b0-f1528d41d78b', 'fc0a6e1e-5536-4eef-b3ef-06998e2dee31', '2025-01-06 21:42:52.65644', '2025-01-06 21:42:52.65644', 901.95, 0.20, 1);
INSERT INTO orders_to_products VALUES ('65ce5a53-06f4-4f70-aad9-685019c6c0c4', '35a4aeee-0bdc-469c-a162-b1311981e271', '2025-01-06 21:42:52.65644', '2025-01-06 21:42:52.65644', 806.80, 0.15, 4);
INSERT INTO orders_to_products VALUES ('763698c8-bd87-40c8-ba62-b83a396e3e0b', 'a2fd5a79-784d-4a1e-a30f-de90b873d5db', '2025-01-06 21:42:52.65644', '2025-01-06 21:42:52.65644', 949.29, 0.10, 1);
INSERT INTO orders_to_products VALUES ('d575d6b6-f066-4eb2-8185-f5b6b6d604b5', '1539d849-63e6-466f-9c94-522fa9a1a7cf', '2025-01-06 21:42:52.65644', '2025-01-06 21:42:52.65644', 595.25, 0.10, 6);
INSERT INTO orders_to_products VALUES ('58f611bc-c65b-4ebb-93c1-31f4cf53296a', '8358714d-1686-4354-b5dd-64f925981063', '2025-01-06 21:42:52.65644', '2025-01-06 21:42:52.65644', 406.05, 0.10, 7);
INSERT INTO orders_to_products VALUES ('476b6267-8b9b-46cb-9e39-1907373b8033', '5c46bd7f-0c6e-42a7-8a78-7560648ce04e', '2025-01-06 21:42:52.65644', '2025-01-06 21:42:52.65644', 797.09, 0.15, 2);
INSERT INTO orders_to_products VALUES ('3ea3d812-7142-43b6-bf8c-3bfd5a397943', 'c011546c-a36b-4cd5-a798-52db2209edaa', '2025-01-06 21:42:52.65644', '2025-01-06 21:42:52.65644', 590.65, 0.10, 10);
INSERT INTO orders_to_products VALUES ('60d1e399-c9af-4e60-9d1e-5310ea19b1fc', '5a54c878-cec6-4507-a1b8-8cc2df648b92', '2025-01-06 21:42:52.65644', '2025-01-06 21:42:52.65644', 789.60, 0.20, 2);
INSERT INTO orders_to_products VALUES ('d9d52b04-9197-4be2-a534-c4116972dfa0', '35a4aeee-0bdc-469c-a162-b1311981e271', '2025-01-06 21:42:52.65644', '2025-01-06 21:42:52.65644', 806.80, 0.10, 7);
INSERT INTO orders_to_products VALUES ('24e1e511-1f27-4bf7-b3eb-e88bf4c44138', '6ad166f7-ea23-405e-8f42-72d55436fbaf', '2025-01-06 21:42:52.65644', '2025-01-06 21:42:52.65644', 521.05, 0.25, 4);
INSERT INTO orders_to_products VALUES ('6acf14c8-60d7-46a8-a172-414c068d2359', '98611d2a-7c03-417f-a16f-c62140cdf087', '2025-01-06 21:42:52.65644', '2025-01-06 21:42:52.65644', 122.39, 0.10, 2);
INSERT INTO orders_to_products VALUES ('db86c4e5-7c7c-4413-9b7d-866551addeae', 'c306a286-4c79-4764-9b38-61c5f4d87a39', '2025-01-06 21:42:52.65644', '2025-01-06 21:42:52.65644', 968.99, 0.10, 2);
INSERT INTO orders_to_products VALUES ('de6233a8-12cf-4759-a3dc-16839c7f6240', 'c306a286-4c79-4764-9b38-61c5f4d87a39', '2025-01-06 21:42:52.65644', '2025-01-06 21:42:52.65644', 968.99, 0.10, 10);
INSERT INTO orders_to_products VALUES ('d5b66ec6-2ae4-4344-978e-1faa50f1c8a9', '337eac6e-331e-4d9e-9670-6e2e005170ec', '2025-01-06 21:42:52.65644', '2025-01-06 21:42:52.65644', 791.59, 0.10, 4);

INSERT INTO product_categories VALUES ('686c1d4b-928d-49cf-8523-b890ef6ac10f', '2025-01-06 21:42:51.67036', '2025-01-06 21:42:51.67036', 'basic');
INSERT INTO product_categories VALUES ('f5a3a951-61a8-48ca-9891-a4870d9be315', '2025-01-06 21:42:51.67036', '2025-01-06 21:42:51.67036', 'medium');
INSERT INTO product_categories VALUES ('df777162-637e-4438-80f7-4017d67a13ce', '2025-01-06 21:42:51.67036', '2025-01-06 21:42:51.67036', 'premium');

INSERT INTO products VALUES ('ecd86f44-0dd5-4aca-af55-5a77cea4af16', '686c1d4b-928d-49cf-8523-b890ef6ac10f', '2025-01-06 21:42:51.813', '2025-01-06 21:42:51.813', 'Handmade Rubber Shoes', 367.41);
INSERT INTO products VALUES ('8358714d-1686-4354-b5dd-64f925981063', 'f5a3a951-61a8-48ca-9891-a4870d9be315', '2025-01-06 21:42:51.813', '2025-01-06 21:42:51.813', 'Tasty Rubber Bike', 406.05);
INSERT INTO products VALUES ('dc3cd86f-cc62-4861-b891-108809c2d59d', '686c1d4b-928d-49cf-8523-b890ef6ac10f', '2025-01-06 21:42:51.813', '2025-01-06 21:42:51.813', 'Ergonomic Steel Ball', 276.75);
INSERT INTO products VALUES ('9f95dbd4-7baf-4d36-837c-b30971341020', 'f5a3a951-61a8-48ca-9891-a4870d9be315', '2025-01-06 21:42:51.813', '2025-01-06 21:42:51.813', 'Recycled Wooden Pizza', 796.49);
INSERT INTO products VALUES ('5a54c878-cec6-4507-a1b8-8cc2df648b92', 'f5a3a951-61a8-48ca-9891-a4870d9be315', '2025-01-06 21:42:51.813', '2025-01-06 21:42:51.813', 'Modern Cotton Car', 789.60);
INSERT INTO products VALUES ('c011546c-a36b-4cd5-a798-52db2209edaa', 'f5a3a951-61a8-48ca-9891-a4870d9be315', '2025-01-06 21:42:51.813', '2025-01-06 21:42:51.813', 'Oriental Cotton Fish', 590.65);
INSERT INTO products VALUES ('6ad166f7-ea23-405e-8f42-72d55436fbaf', '686c1d4b-928d-49cf-8523-b890ef6ac10f', '2025-01-06 21:42:51.813', '2025-01-06 21:42:51.813', 'Ergonomic Rubber Pants', 521.05);
INSERT INTO products VALUES ('98611d2a-7c03-417f-a16f-c62140cdf087', '686c1d4b-928d-49cf-8523-b890ef6ac10f', '2025-01-06 21:42:51.813', '2025-01-06 21:42:51.813', 'Practical Soft Computer', 122.39);
INSERT INTO products VALUES ('337eac6e-331e-4d9e-9670-6e2e005170ec', '686c1d4b-928d-49cf-8523-b890ef6ac10f', '2025-01-06 21:42:51.813', '2025-01-06 21:42:51.813', 'Recycled Concrete Gloves', 791.59);
INSERT INTO products VALUES ('ef8b9e55-3d0f-46e6-87b5-84ac3d59fa4b', 'f5a3a951-61a8-48ca-9891-a4870d9be315', '2025-01-06 21:42:51.813', '2025-01-06 21:42:51.813', 'Handmade Frozen Pants', 100.69);
INSERT INTO products VALUES ('5c46bd7f-0c6e-42a7-8a78-7560648ce04e', 'f5a3a951-61a8-48ca-9891-a4870d9be315', '2025-01-06 21:42:51.813', '2025-01-06 21:42:51.813', 'Intelligent Fresh Sausages', 797.09);
INSERT INTO products VALUES ('1539d849-63e6-466f-9c94-522fa9a1a7cf', '686c1d4b-928d-49cf-8523-b890ef6ac10f', '2025-01-06 21:42:51.813', '2025-01-06 21:42:51.813', 'Gorgeous Granite Mouse', 595.25);
INSERT INTO products VALUES ('2b8f41f6-5393-44d6-ad63-0bd79bdef7da', '686c1d4b-928d-49cf-8523-b890ef6ac10f', '2025-01-06 21:42:51.813', '2025-01-06 21:42:51.813', 'Generic Metal Chicken', 555.45);
INSERT INTO products VALUES ('a2fd5a79-784d-4a1e-a30f-de90b873d5db', '686c1d4b-928d-49cf-8523-b890ef6ac10f', '2025-01-06 21:42:51.813', '2025-01-06 21:42:51.813', 'Gorgeous Steel Shoes', 949.29);
INSERT INTO products VALUES ('c306a286-4c79-4764-9b38-61c5f4d87a39', '686c1d4b-928d-49cf-8523-b890ef6ac10f', '2025-01-06 21:42:51.813', '2025-01-06 21:42:51.813', 'Gorgeous Concrete Chips', 968.99);
INSERT INTO products VALUES ('35a4aeee-0bdc-469c-a162-b1311981e271', 'f5a3a951-61a8-48ca-9891-a4870d9be315', '2025-01-06 21:42:51.813', '2025-01-06 21:42:51.813', 'Fantastic Rubber Chips', 806.80);
INSERT INTO products VALUES ('fc0a6e1e-5536-4eef-b3ef-06998e2dee31', 'f5a3a951-61a8-48ca-9891-a4870d9be315', '2025-01-06 21:42:51.813', '2025-01-06 21:42:51.813', 'Small Cotton Bike', 901.95);
INSERT INTO products VALUES ('f4239fa6-e74a-470d-acf2-9fa5d258c466', '686c1d4b-928d-49cf-8523-b890ef6ac10f', '2025-01-06 21:42:51.813', '2025-01-06 21:42:51.813', 'Gorgeous Wooden Fish', 123.99);
INSERT INTO products VALUES ('7bdf8faf-ed85-4aaa-b901-4f55f0b4f413', 'f5a3a951-61a8-48ca-9891-a4870d9be315', '2025-01-06 21:42:51.813', '2025-01-06 21:42:51.813', 'Ergonomic Metal Salad', 387.05);
INSERT INTO products VALUES ('2c5dbc91-c190-4cf1-93cd-1ff20c1524b9', '686c1d4b-928d-49cf-8523-b890ef6ac10f', '2025-01-06 21:42:51.813', '2025-01-06 21:42:51.813', 'Awesome Wooden Bike', 676.29);

INSERT INTO sellers VALUES ('c1655269-859b-4824-abbc-d4c99e800713', '6d637fa5-e9a4-4c10-a9c6-6bdb804f7afe', '2025-01-06 21:42:52.133132', '2025-01-06 21:42:52.133132');
INSERT INTO sellers VALUES ('a22ec3f1-3bda-4c32-a861-0bef6159c0de', 'ffe61621-7f4a-4209-8f77-6204a599ada9', '2025-01-06 21:42:52.133132', '2025-01-06 21:42:52.133132');
INSERT INTO sellers VALUES ('13fb4135-70d8-460e-a464-32ad1a22cefd', 'b89ba446-46eb-403e-a2e0-77a2db42205a', '2025-01-06 21:42:52.133132', '2025-01-06 21:42:52.133132');
INSERT INTO sellers VALUES ('b7f312a2-bc51-4487-bd33-bd66245f4976', 'e9613864-5a55-4e0f-be93-5718f99b5b97', '2025-01-06 21:42:52.133132', '2025-01-06 21:42:52.133132');
INSERT INTO sellers VALUES ('bd955ce4-0038-4ee6-b378-acd8454f2189', '307f8fdc-2e01-4e4a-afb3-39fba9c0934f', '2025-01-06 21:42:52.133132', '2025-01-06 21:42:52.133132');
INSERT INTO sellers VALUES ('8139ae1b-a752-4ff8-9bfd-11c58f2ecd8a', '9f6eb270-dc8e-44be-ac5d-3221bb76d0fd', '2025-01-06 21:42:52.133132', '2025-01-06 21:42:52.133132');
INSERT INTO sellers VALUES ('b2b8ed66-d6ff-4076-8bd9-d870e6d3cdbf', '2766101c-3b58-4563-961f-a7952214941e', '2025-01-06 21:42:52.133132', '2025-01-06 21:42:52.133132');
INSERT INTO sellers VALUES ('d74f22ad-a206-4ace-af66-57d4f5ff5afb', '893cee7a-290b-40aa-b410-69bd862ec1e6', '2025-01-06 21:42:52.133132', '2025-01-06 21:42:52.133132');
INSERT INTO sellers VALUES ('132ea6fd-9779-4d3b-bbb7-2688c50b0df0', 'c7f63636-16eb-4112-91c8-ee94d596b0ed', '2025-01-06 21:42:52.133132', '2025-01-06 21:42:52.133132');
INSERT INTO sellers VALUES ('f565a082-b2af-4291-b82d-eb0ffd637d00', '55f50aac-6aad-48ed-b80c-c7ae4ac0cbeb', '2025-01-06 21:42:52.133132', '2025-01-06 21:42:52.133132');
INSERT INTO sellers VALUES ('6d5753a4-0728-4853-aabd-af094df19f46', '3cb34323-29c6-4d32-a776-347ad6b6cc11', '2025-01-06 21:42:52.133132', '2025-01-06 21:42:52.133132');
INSERT INTO sellers VALUES ('c3aebbda-589f-4d08-b02e-14aba8ba4960', '392d8fef-f427-469e-ab6b-8fbdb9f6d347', '2025-01-06 21:42:52.133132', '2025-01-06 21:42:52.133132');
INSERT INTO sellers VALUES ('32c48f32-8732-455b-a037-5db59209c2a7', 'fbb77b7a-66ed-4390-bee3-0c6e7a29a14c', '2025-01-06 21:42:52.133132', '2025-01-06 21:42:52.133132');

INSERT INTO user_roles VALUES ('e8cf6901-64d5-4969-b315-664addaedd0f', '2025-01-06 21:42:51.575646', '2025-01-06 21:42:51.575646', 'client');
INSERT INTO user_roles VALUES ('e838ed44-da6e-40f4-8e73-827ff50324c6', '2025-01-06 21:42:51.575646', '2025-01-06 21:42:51.575646', 'seller');

INSERT INTO users VALUES ('6d637fa5-e9a4-4c10-a9c6-6bdb804f7afe', 'e838ed44-da6e-40f4-8e73-827ff50324c6', '2025-01-06 21:42:51.934712', '2025-01-06 21:42:51.934712', 'Mr. Jack Prosacco', 'Ila.Feest@gmail.com', 'Zsvi3r98O8sx9PV');
INSERT INTO users VALUES ('ffe61621-7f4a-4209-8f77-6204a599ada9', 'e838ed44-da6e-40f4-8e73-827ff50324c6', '2025-01-06 21:42:51.934712', '2025-01-06 21:42:51.934712', 'Timothy Hudson', 'Abagail78@yahoo.com', '_EcCw5Pya92p0F6');
INSERT INTO users VALUES ('b89ba446-46eb-403e-a2e0-77a2db42205a', 'e838ed44-da6e-40f4-8e73-827ff50324c6', '2025-01-06 21:42:51.934712', '2025-01-06 21:42:51.934712', 'Roderick Hirthe', 'Boris_Frami@hotmail.com', 'pgi7lvoZt5GWCO_');
INSERT INTO users VALUES ('e9613864-5a55-4e0f-be93-5718f99b5b97', 'e838ed44-da6e-40f4-8e73-827ff50324c6', '2025-01-06 21:42:51.934712', '2025-01-06 21:42:51.934712', 'Barry Bergstrom', 'Magnolia.Homenick37@yahoo.com', 'YseyG1TN7TBjZKI');
INSERT INTO users VALUES ('30caa1b1-674a-4c8a-afb4-b05a7e47b95e', 'e8cf6901-64d5-4969-b315-664addaedd0f', '2025-01-06 21:42:51.934712', '2025-01-06 21:42:51.934712', 'Bernadette Koss', 'Candida47@yahoo.com', 'n2vF6XzkhyohYnJ');
INSERT INTO users VALUES ('60ea2a12-2bf6-4997-8c85-412536e63807', 'e8cf6901-64d5-4969-b315-664addaedd0f', '2025-01-06 21:42:51.934712', '2025-01-06 21:42:51.934712', 'Carl Tillman', 'Jarret_Osinski-Ryan@gmail.com', 'qDIOVMxPUf3HT6j');
INSERT INTO users VALUES ('e0602972-ada1-498b-995f-01d765d03663', 'e8cf6901-64d5-4969-b315-664addaedd0f', '2025-01-06 21:42:51.934712', '2025-01-06 21:42:51.934712', 'Dr. Jaime Mertz-West', 'Darrell_Langworth@hotmail.com', 'HbpMId2_WAfaYtB');
INSERT INTO users VALUES ('307f8fdc-2e01-4e4a-afb3-39fba9c0934f', 'e838ed44-da6e-40f4-8e73-827ff50324c6', '2025-01-06 21:42:51.934712', '2025-01-06 21:42:51.934712', 'Dr. Abraham Medhurst-West', 'Lacy_Reynolds@gmail.com', 'jqSnmZNYkNSDieJ');
INSERT INTO users VALUES ('9f6eb270-dc8e-44be-ac5d-3221bb76d0fd', 'e838ed44-da6e-40f4-8e73-827ff50324c6', '2025-01-06 21:42:51.934712', '2025-01-06 21:42:51.934712', 'Ms. Marian Davis II', 'Callie.Stanton@hotmail.com', 'sFYT5xFuO4hhzRs');
INSERT INTO users VALUES ('208c3c57-d9da-4d1e-9bbc-fc8bfb8388a5', 'e8cf6901-64d5-4969-b315-664addaedd0f', '2025-01-06 21:42:51.934712', '2025-01-06 21:42:51.934712', 'Keith Muller', 'Reid_Prosacco@yahoo.com', 'AEBuHRnNHew3H2S');
INSERT INTO users VALUES ('6402d5d9-f763-4ea1-b7f9-209e0a0ad9cd', 'e8cf6901-64d5-4969-b315-664addaedd0f', '2025-01-06 21:42:51.934712', '2025-01-06 21:42:51.934712', 'Marta Connelly II', 'Fanny86@hotmail.com', 'ynbaKwwhRB2h_qP');
INSERT INTO users VALUES ('2766101c-3b58-4563-961f-a7952214941e', 'e838ed44-da6e-40f4-8e73-827ff50324c6', '2025-01-06 21:42:51.934712', '2025-01-06 21:42:51.934712', 'Juan Howe', 'Leora.Borer39@gmail.com', 'EmNZ00JPufjDMDQ');
INSERT INTO users VALUES ('893cee7a-290b-40aa-b410-69bd862ec1e6', 'e838ed44-da6e-40f4-8e73-827ff50324c6', '2025-01-06 21:42:51.934712', '2025-01-06 21:42:51.934712', 'Loren Williamson', 'Roman21@hotmail.com', 'fBwQHAsZr7cFhUB');
INSERT INTO users VALUES ('c7f63636-16eb-4112-91c8-ee94d596b0ed', 'e838ed44-da6e-40f4-8e73-827ff50324c6', '2025-01-06 21:42:51.934712', '2025-01-06 21:42:51.934712', 'Mrs. Michele Muller Sr.', 'Darrin48@hotmail.com', 'W1cUn7TQAzEPHfS');
INSERT INTO users VALUES ('55f50aac-6aad-48ed-b80c-c7ae4ac0cbeb', 'e838ed44-da6e-40f4-8e73-827ff50324c6', '2025-01-06 21:42:51.934712', '2025-01-06 21:42:51.934712', 'Debra Glover', 'Mertie75@gmail.com', 'f9Qij7XsVk5kXzO');
INSERT INTO users VALUES ('c8052ab0-1656-4244-92ea-1f06234e49b0', 'e8cf6901-64d5-4969-b315-664addaedd0f', '2025-01-06 21:42:51.934712', '2025-01-06 21:42:51.934712', 'Juanita Emard', 'Kenna.Abbott@hotmail.com', 'Zu6hTf0l5pSCu3u');
INSERT INTO users VALUES ('3cb34323-29c6-4d32-a776-347ad6b6cc11', 'e838ed44-da6e-40f4-8e73-827ff50324c6', '2025-01-06 21:42:51.934712', '2025-01-06 21:42:51.934712', 'Elmer Carroll', 'Bonita.Bauch9@yahoo.com', 'Q7NHRdnbpVj2kqk');
INSERT INTO users VALUES ('6b2ebbcb-701c-4664-b039-b2ccec11a237', 'e8cf6901-64d5-4969-b315-664addaedd0f', '2025-01-06 21:42:51.934712', '2025-01-06 21:42:51.934712', 'Jay Murray V', 'Blanca_Klocko@gmail.com', 'zM2XdCWXhFQ94iz');
INSERT INTO users VALUES ('392d8fef-f427-469e-ab6b-8fbdb9f6d347', 'e838ed44-da6e-40f4-8e73-827ff50324c6', '2025-01-06 21:42:51.934712', '2025-01-06 21:42:51.934712', 'Marcia Towne', 'Tremayne_Krajcik31@hotmail.com', 'AtOewE_ntdJny9O');
INSERT INTO users VALUES ('fbb77b7a-66ed-4390-bee3-0c6e7a29a14c', 'e838ed44-da6e-40f4-8e73-827ff50324c6', '2025-01-06 21:42:51.934712', '2025-01-06 21:42:51.934712', 'Casey Crona Jr.', 'Raul_Keeling92@gmail.com', 'UCC_eXGj47s1by_');
