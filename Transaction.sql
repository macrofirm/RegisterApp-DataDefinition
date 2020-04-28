CREATE EXTENSION pgcrypto; --Allows PostgreSQL to understand UUIDs. Only have to create the extension once for a database.

--DROP TABLE transaction;

CREATE TABLE transaction(
  id uuid NOT NULL DEFAULT gen_random_uuid(), 
  cashierid uuid NOt NULL DEFAULT('00000000-0000-0000-0000-000000000000'::uuid),
  total bigint NOT NULL DEFAULT(0),
  createdon timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT transaction_pkey PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);

CREATE TABLE transactionentry(
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  transactionid uuid NOT NULL DEFAULT('00000000-0000-0000-0000-000000000000'::uuid),
  productid uuid NOT NULL DEFAULT('00000000-0000-0000-0000-000000000000'::uuid),
  lookupcode character varying(32) NOT NULL DEFAULT(''),
  quantity int NOT NULL DEFAULT(0),
  stock int NOT NULL DEFAULT(0),
  price decimal NOT NULL DEFAULT(0.0),
  createdon timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT transactionentry_pkey PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);