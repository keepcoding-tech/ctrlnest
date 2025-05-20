--
-- Created by SQL::Translator::Producer::PostgreSQL
-- Created on Tue May 20 12:42:56 2025
--
;
--
-- Table: migrations
--
CREATE TABLE "migrations" (
  "id" serial NOT NULL,
  "version" character varying(50) NOT NULL,
  "applied_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  "description" text NOT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "migrations_version" UNIQUE ("version")
);

;
