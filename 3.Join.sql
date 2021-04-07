--inner join
SELECT CityName 'City',
	   ct.Population 'City Population',
	   CountryName 'Country',
	   c.Population 'Country Population'
FROM Cities ct JOIN Countries c
ON
ct.CountryId=c.Id

--LEFT OUTER JOIN

SELECT CityName 'City',
	   ct.Population 'City Population',
	   CountryName 'Country',
	   c.Population 'Country Population'
FROM Cities ct LEFT JOIN Countries c
ON
ct.CountryId=c.Id

--RIGHT OUTER JOIN

SELECT CityName 'City',
	   ct.Population 'City Population',
	   CountryName 'Country',
	   c.Population 'Country Population'
FROM Cities ct RIGHT JOIN Countries c
ON
ct.CountryId=c.Id

--FULL OUTER JOIN

SELECT CityName 'City',
	   ct.Population 'City Population',
	   CountryName 'Country',
	   c.Population 'Country Population'
FROM Cities ct FULL JOIN Countries c
ON
ct.CountryId=c.Id


--SELF JOIN

CREATE TABLE Ranks(
	Id int identity primary key,
	Position nvarchar(255) not null,
	Dependency int
)

SELECT r1.Position,r2.Position 'Dependency' FROM Ranks r1
LEFT JOIN Ranks r2
ON
r1.Dependency=r2.Id

--NON-EQUAL JOIN

ALTER TABLE Students
ADD Score int

CREATE TABLE Grades(
	Id int identity primary key,
	MinGrade int,
	MaxGrade int,
	Letter nchar
)

SELECT Name,Surname,Age,Email,Score,Letter FROM Students st
JOIN Grades g
ON
st.Score BETWEEN g.MinGrade AND g.MaxGrade

--cross join

CREATE TABLE Products(
	Id int identity primary key,
	Name nvarchar(100) not null
)

CREATE TABLE Sizes(
	Id int identity primary key,
	Size nvarchar(10) not null
)

SELECT Name 'Product',Size FROM Products
CROSS JOIN Sizes

--query
CREATE TABLE GroupTypes(
	Id int identity primary key,
	Name nvarchar(100) not null
)


CREATE TABLE Groups(
	Id int identity primary key,
	Name nvarchar(100) not null,
	GroupTypeId int references GroupTypes(Id)
)

CREATE TABLE StudentGroups(
	Id int identity primary key,
	GroupId int references Groups(Id),
	StudentId int references Students(Id)
)



