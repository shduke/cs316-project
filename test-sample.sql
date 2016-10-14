--Companies that have expected growth over 3
SELECT company.name, AnnualReports.expected_growth
FROM company, AnnualReports
WHERE AnnualReports.year = 2014 and AnnualReports.expected_growth > 3 and AnnualReports.ticker = company.ticker;

-- Companies that have a female CEO
SELECT ceo.name, company.name
FROM CEO, company
WHERE company.ceo_name = ceo.name AND ceo.gender = 'f';

--yearly revenue for company SPE
Select ticker, year, yearly_revenue
FROM AnnualReports
WHERE ticker='SPE';

--Max quarterly p/e for every company
SELECT ticker, MAX(PperE) FROM QuarterlyReports GROUP BY ticker;

