create database HR_analysis;
use HR_analysis;
-- ------------------------------------------------- import table no 1 HR_1--------------------------------------------------------------
CREATE TABLE HR_1 (
  Employee_ID bigint DEFAULT NULL,
  Age smallint,
  Attrition Varchar(10),
  BusinessTravel Varchar(30),
  Dailyrate smallint DEFAULT NULL,
  Department Varchar(30),
  DistanceFromHome smallint DEFAULT NULL,
  Education smallint DEFAULT NULL,
  Educationfield Varchar(30),
  EmployeeCount smallint DEFAULT NULL,
  EnvironmentSatisfaction smallint DEFAULT NULL,
  Gender Varchar(20),
  HourlyRate smallint DEFAULT NULL,
  JobInvolvement smallint DEFAULT NULL,
  joblevel smallint DEFAULT NULL,
  jobrole Varchar(30),
  JobSatisfaction smallint DEFAULT NULL,
  MaritalStatus Varchar(30) DEFAULT NULL
  
) ;

SHOW VARIABLES LIKE 'secure_file_priv';

select * from HR_1;

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = on;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/uploads/HR_1.csv'
INTO TABLE HR_1
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

select count(*)  from HR_1;


-- --------------------------------------------------------------------------------------------------------------------------------------

-- -------------------------------------------- import table no 2 HR_2--------------------------------------------------------------------

CREATE TABLE HR_2 (
  Employee_ID bigint DEFAULT NULL,
  MonthlyIncome bigint,
  monthlyrate bigint,
  NumofCompaniesWorked smallint,
  over18 Varchar(5) DEFAULT NULL,
  overtime Varchar(5),
  PercentSalaryHike smallint DEFAULT NULL,
  PerformanceRating smallint DEFAULT NULL,
  RelationshipSatisfaction smallint DEFAULT NULL,
  StandardHours smallint DEFAULT NULL,
  StockOptionLevel smallint DEFAULT NULL,
  TotalWorkingYears smallint DEFAULT NULL,
  TrainingTimesLastYear smallint DEFAULT NULL,
  WorkLifeBalance smallint DEFAULT NULL,
  YearsAtCompany smallint DEFAULT NULL,
  YearsInCurrentRole smallint DEFAULT NULL,
  YearsSinceLastPromotion smallint DEFAULT NULL,
  YearsWithCurrManager smallint DEFAULT NULL
  
) ;

SHOW VARIABLES LIKE 'secure_file_priv';

select * from HR_2;

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = on;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/uploads/HR_2.csv'
INTO TABLE HR_2
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

select count(*)  from HR_2;
-- -------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------1. Average Attrition rate for all Departments--------------------------------------------
SELECT 
    Department,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS Avg_Attrition_Rate
FROM HR_1
GROUP BY Department;



-- ---------------------------------------------2. Average Hourly rate of Male Research Scientist-----------------------------------------
SELECT 
    ROUND(AVG(HourlyRate), 2) AS Avg_HourlyRate_Male_ResearchScientist
FROM HR_1
WHERE Gender = 'Male' AND JobRole = 'Research Scientist';



-- ---------------------------------------------3. Attrition rate Vs Monthly income stats-------------------------------------------------
SELECT 
    h1.Attrition,
    ROUND(AVG(h2.MonthlyIncome), 2) AS Avg_MonthlyIncome,
    ROUND(MIN(h2.MonthlyIncome), 2) AS Min_Income,
    ROUND(MAX(h2.MonthlyIncome), 2) AS Max_Income
FROM HR_1 as h1
JOIN HR_2 as h2 ON h1.Employee_ID = h2.Employee_ID
GROUP BY h1.Attrition;

-- ------------------------------------------------------4. Average working years for each Department------------------------------------

SELECT 
    h1.Department,
    ROUND(AVG(h2.TotalWorkingYears), 2) AS Avg_Working_Years
FROM HR_1 h1
JOIN HR_2 h2 ON h1.Employee_ID = h2.Employee_ID
GROUP BY h1.Department;

-- ------------------------------------------------------5. Job Role Vs Work life balance ------------------------------------------------

SELECT 
    h1.JobRole,
    ROUND(AVG(h2.WorkLifeBalance), 2) AS Avg_WorkLife_Balance,
    CASE 
        WHEN ROUND(AVG(h2.WorkLifeBalance), 2) >= 4 THEN 'Excellent'
        WHEN ROUND(AVG(h2.WorkLifeBalance), 2) >= 2.5 THEN 'Good'
        WHEN ROUND(AVG(h2.WorkLifeBalance), 2) >= 2 THEN 'Average'
        ELSE 'Poor'
    END AS WorkLife_Rating
FROM HR_1 as h1
JOIN HR_2 as h2 
    ON h1.Employee_ID = h2.Employee_ID
GROUP BY h1.JobRole
ORDER BY Avg_WorkLife_Balance DESC;

-- ----------------------------------------------------6. Attrition rate Vs Year since last promotion relation---------------------------

SELECT 
    h2.YearsSinceLastPromotion, 
    CONCAT(
        ROUND(AVG(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2),
        '%'
    ) AS Attrition_Rate_Percent,
    CASE 
        WHEN ROUND(AVG(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2) >= 70 THEN ' very High Attrition'
         WHEN ROUND(AVG(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2) >= 50 THEN 'High Attrition'
        WHEN ROUND(AVG(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2) >= 25 THEN 'Moderate Attrition'
        ELSE 'low Attrition'
    END AS Attrition_Level
FROM HR_1 h1
JOIN HR_2 h2 
    ON h1.Employee_ID = h2.Employee_ID
GROUP BY h2.YearsSinceLastPromotion
ORDER BY h2.YearsSinceLastPromotion;




