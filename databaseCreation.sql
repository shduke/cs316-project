--RUN THESE COMMANDS TO DELETE THE DB
--\c template0
--DROP DATABASE financedb;

--RUN THESE COMMANDS TO CREATE THE DB
--CREATEDB financedb;
--psql financedb
--\i databaseCreation.sql

CREATE TABLE CEO
(name VARCHAR(5) NOT NULL PRIMARY KEY,
  age INTEGER NOT NULL,
  salary INTEGER NOT NULL,
  gender CHAR(1) NOT NULL CHECK (gender IN ('m', 'f', 'o'))
);

CREATE TABLE Company
(ticker VARCHAR(5) NOT NULL PRIMARY KEY,
  name VARCHAR(256) NOT NULL,
  revenue INTEGER NOT NULL,
  stock_exchange VARCHAR(256) NOT NULL,
  ceo_name VARCHAR(256) REFERENCES CEO(name)
);

CREATE TABLE Industry
(name VARCHAR(256) NOT NULL PRIMARY KEY,
  volatility FLOAT NOT NULL,
  growth_rate FLOAT NOT NULL,
  PperE FLOAT NOT NULL
);

CREATE TABLE InIndustry
(ticker VARCHAR(5) NOT NULL REFERENCES Company(ticker),
  industry_name VARCHAR(256) NOT NULL REFERENCES Industry(name),
  PRIMARY KEY(ticker, industry_name)
);

CREATE TABLE AnnualReports
(ticker VARCHAR(5) NOT NULL REFERENCES Company(ticker),
  year INTEGER NOT NULL,
  risk INTEGER NOT NULL,
  expected_growth FLOAT NOT NULL,
  yearly_revenue INTEGER NOT NULL,
  PperE FLOAT NOT NULL,
  PRIMARY KEY(ticker, year)
);


CREATE TABLE QuarterlyReports
(ticker VARCHAR(5) NOT NULL REFERENCES Company(ticker),
  year INTEGER NOT NULL,
  quarter INTEGER NOT NULL,
  risk INTEGER NOT NULL,
  expected_growth FLOAT NOT NULL,
  yearly_revenue INTEGER NOT NULL,
  PperE FLOAT NOT NULL,
  PRIMARY KEY(ticker, year, quarter)
);

--populate the database with fake data
INSERT INTO CEO VALUES ('john', 12, 123333, 'm');

INSERT INTO CEO VALUES ('Mary', 12, 123333, 'f');

INSERT INTO Company VALUES ('SPE', 123456789, 'NYSE', 'john');

INSERT INTO company VALUES ('ATO', 23, 'NASDAQ', 'Mary');

INSERT INTO InIndustry VALUES ('SPE', 'Tech');

INSERT INTO InIndustry VALUES ('ATO', 'oil');

INSERT INTO AnnualReports VALUES ('SPE', 2014, 3, 2000, 342342, 5);

INSERT INTO AnnualReports VALUES ('SPE', 2015, 1, 200, 232342232, 3);

INSERT INTO AnnualReports VALUES ('SPE', 2016, 2, 300, 32323902394, 10);

INSERT INTO AnnualReports VALUES ('ATO', 2014, 40, -20, 342342234234234, 33);

INSERT INTO AnnualReports VALUES ('ATO', 2015, 35, -10, 12341234, 20);

INSERT INTO AnnualReports VALUES ('ATO', 2016, 2323, -110, 1234, 50);

INSERT INTO QuarterlyReports VALUES ('SPE', 2014, 3, 3, 700, 342342, 5);

INSERT INTO QuarterlyReports VALUES ('SPE', 2014, 4, 3, 700, 342342, 5);

INSERT INTO QuarterlyReports VALUES ('SPE', 2015, 1, 5, 80, 32323902394, 5);

INSERT INTO QuarterlyReports VALUES ('SPE', 2015, 2, 2, 80, 32323902394, 9);

INSERT INTO QuarterlyReports VALUES ('SPE', 2015, 3, 5, 80, 32323902394, 2);

INSERT INTO QuarterlyReports VALUES ('SPE', 2015, 4, 1, 80, 32323902394, 1);

INSERT INTO QuarterlyReports VALUES ('ATO', 2014, 3, 43, -10, 234123423, 23);

INSERT INTO QuarterlyReports VALUES ('ATO', 2014, 4, 13, -34, 234123423, 33);

INSERT INTO QuarterlyReports VALUES ('ATO', 2015, 1, 37, -20, 123423, 33);

INSERT INTO QuarterlyReports VALUES ('ATO', 2015, 2, 50, -30, 123423, 93);

INSERT INTO QuarterlyReports VALUES ('ATO', 2015, 3, 23, 10, 123423, 23);

INSERT INTO QuarterlyReports VALUES ('ATO', 2015, 4, 60, -50, 123423, 33);
