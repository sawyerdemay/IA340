CREATE TABLE IF NOT EXISTS "name" (
	"flips" varchar(4) NOT NULL,
	"name" varchar(100) NOT NULL UNIQUE,
	PRIMARY KEY ("flips")
);

CREATE TABLE IF NOT EXISTS "income" (
	"flips" varchar(4) NOT NULL,
	"income" bigint NOT NULL,
	"year" bigint NOT NULL,
	PRIMARY KEY ("flips", "year")
);

CREATE TABLE IF NOT EXISTS "population" (
	"flips" varchar(4) NOT NULL,
	"pop" bigint NOT NULL,
	"year" bigint NOT NULL,
	PRIMARY KEY ("flips", "year")
);


ALTER TABLE "income" ADD CONSTRAINT "income_fk0" FOREIGN KEY ("flips") REFERENCES "name"("flips");
ALTER TABLE "population" ADD CONSTRAINT "population_fk0" FOREIGN KEY ("flips") REFERENCES "name"("flips");
