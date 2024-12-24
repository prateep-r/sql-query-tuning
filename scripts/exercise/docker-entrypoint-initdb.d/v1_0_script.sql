CREATE TABLE product (
    product_id SERIAL NOT NULL,
    product_code VARCHAR(10) NOT NULL,
    product_name VARCHAR(200) NOT NULL,
    is_active BOOL NOT NULL DEFAULT TRUE,
    created_by VARCHAR(50) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now() NOT NULL,
    updated_by VARCHAR(50) NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT now() NOT NULL,
    CONSTRAINT product_pk PRIMARY KEY (product_id)
);

CREATE UNIQUE INDEX product_uk ON product USING btree (product_code) WHERE (is_active = true);

CREATE TABLE stock_card (
    stock_card_id SERIAL NOT NULL,
    transaction_date DATE NOT NULL,
    product_id INTEGER NOT NULL,
    balance_qty NUMERIC(10,0) NOT NULL,
    last_purchase_price NUMERIC(20,4) NOT NULL,
    created_by VARCHAR(50) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now() NOT NULL,
    updated_by VARCHAR(50) NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT now() NOT NULL,
    CONSTRAINT stock_card_pk PRIMARY KEY (stock_card_id),
    CONSTRAINT stock_card_product_fk FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE UNIQUE INDEX stock_card_uk ON stock_card USING btree (transaction_date, product_id);

CREATE TABLE normal_selling_price (
    nsp_id SERIAL NOT NULL,
    product_id INTEGER NOT NULL,
    start_date DATE NOT NULL,
    selling_price NUMERIC(20,4) NOT NULL,
    created_by VARCHAR(50) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now() NOT NULL,
    updated_by VARCHAR(50) NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT now() NOT NULL,
    CONSTRAINT normal_selling_price_pk PRIMARY KEY (nsp_id),
    CONSTRAINT normal_selling_price_fk FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE UNIQUE INDEX normal_selling_price_uk ON normal_selling_price USING btree (product_id, start_date);

CREATE TABLE promotion_selling_price (
    psp_id SERIAL NOT NULL,
    product_id INTEGER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    selling_price NUMERIC(20,4) NOT NULL,
    created_by VARCHAR(50) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now() NOT NULL,
    updated_by VARCHAR(50) NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT now() NOT NULL,
    CONSTRAINT promotion_selling_price_pk PRIMARY KEY (psp_id),
    CONSTRAINT promotion_selling_price_fk FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE UNIQUE INDEX promotion_selling_price_uk ON promotion_selling_price USING btree (product_id, start_date);
