USE PARTS;
SELECT * FROM SUPPLIER;
SELECT * FROM PROJECT;
SELECT * FROM PART;
SELECT * FROM SUPPLY;

-- 1. Find the name and status of each supplier who supplies project J2:
SELECT 
s.SNAME, s.STATUS
FROM SUPPLIER s
INNER JOIN 
SUPPLY su
ON 
s.S_ID = su.S_ID
WHERE 
su.J_ID = 'J2'; 

-- 2. Find the name and city of each project supplied by a London-based supplier 
SELECT 
p.JNAME, p.city
FROM SUPPLIER s
INNER JOIN
SUPPLY su
ON s.S_ID = su.S_ID
INNER JOIN
PROJECT p 
ON su.J_ID = p.J_ID
WHERE s.CITY = 'LONDON';

-- 3.  Find the name and city of each project NOT supplied by a London-based supplier
SELECT 
p.JNAME, p.city
FROM PROJECT p
LEFT JOIN 
supply su 
ON p.J_ID = su.J_ID
LEFT JOIN 
supplier s 
ON su.S_ID = s.S_ID AND s.CITY = 'LONDON'
WHERE s.S_ID IS NULL;            

-- 4. Find the supplier name, part name and project name for each case WHERE a supplier supplies a project with a part, BUT ALSO the supplier city, project city AND part city are the same
SELECT
s.SNAME, p.PNAME, pr.JNAME, s.CITY, pr.CITY, p.CITY
FROM SUPPLIER S
INNER JOIN 
supply sp 
ON 
s.S_ID = sp.s_ID

INNER JOIN 
project pr 
ON sp.J_ID = pr.J_ID

INNER JOIN 
part p 
ON 
sp.P_ID = p.P_ID
WHERE
s.CITY = pr.CITY 
AND 
s.CITY = p.CITY;
