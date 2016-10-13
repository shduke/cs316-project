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
