
DROP TABLE IF EXISTS FUND_TABLE;

CREATE TABLE FUND_TABLE (
    FUND_ID         CHAR(8) PRIMARY KEY,
    FUND_NAME       VARCHAR(30) NOT NULL,
    FUND_TYPE       VARCHAR(10) NOT NULL,
    MANAGER         VARCHAR(20) NOT NULL,
    INCEPTION_DATE  DATE NOT NULL
);

INSERT INTO FUND_TABLE (FUND_ID, FUND_NAME, FUND_TYPE, MANAGER, INCEPTION_DATE) VALUES
('FUND0001', 'Growth Equity Fund Alpha', 'EQUITY', 'John Smith', '2020-01-15'),
('FUND0002', 'Bond Income Fund Beta', 'FIXED', 'Sarah Johnson', '2019-03-22'),
('FUND0003', 'International Diversified', 'MIXED', 'Michael Chen', '2021-06-10'),
('FUND0004', 'Technology Sector Fund', 'EQUITY', 'Lisa Rodriguez', '2018-11-05'),
('FUND0005', 'Conservative Income Fund', 'FIXED', 'David Wilson', '2022-02-28'),
('FUND0006', 'Emerging Markets Fund', 'EQUITY', 'Anna Kowalski', '2020-09-14'),
('FUND0007', 'Real Estate Investment', 'REIT', 'Robert Taylor', '2019-12-03');

SELECT * FROM FUND_TABLE ORDER BY FUND_ID;
