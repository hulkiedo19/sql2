CREATE TABLE WorkTypes (
	IdWorkType INT PRIMARY KEY IDENTITY,
	[Description] NVARCHAR(MAX) NOT NULL,
	HowManyDaysInWork INT NOT NULL
);

CREATE TABLE MaterialTypes (
	IdMaterialType INT PRIMARY KEY IDENTITY,
	[Description] NVARCHAR(MAX) NOT NULL,
	WorkType INT FOREIGN KEY REFERENCES WorkTypes(IdWorkType) NOT NULL
);

CREATE TABLE Departments (
	IdDepartment INT PRIMARY KEY IDENTITY,
	DepartmentName NVARCHAR(50) NOT NULL,
	EmployeeNumber INT NOT NULL,
	WorkType INT FOREIGN KEY REFERENCES WorkTypes(IdWorkType) NOT NULL,
	IsWork NVARCHAR(10) NOT NULL
);

CREATE TABLE ProductTypes (
	IdProductType INT PRIMARY KEY IDENTITY,
	[Description] NVARCHAR(MAX) NOT NULL,
	UsedMaterialType INT FOREIGN KEY REFERENCES MaterialTypes(IdMaterialType) NOT NULL
);

---------------------------------

CREATE TABLE Materials (
	IdMaterial INT PRIMARY KEY IDENTITY,
	InventoryNumber NVARCHAR(20) NOT NULL,
	MaterialType INT FOREIGN KEY REFERENCES MaterialTypes(IdMaterialType) NOT NULL,
	Amount INT NOT NULL,
	WherePlace NVARCHAR(MAX) NOT NULL,
	ArrivalTime DATE NOT NULL
);

CREATE TABLE Processes (
	IdProcess INT PRIMARY KEY IDENTITY,
	MaterialId INT UNIQUE FOREIGN KEY REFERENCES Materials(IdMaterial) NOT NULL,
	ProductType INT FOREIGN KEY REFERENCES ProductTypes(IdProductType) NOT NULL,
	DepartmentNumber INT UNIQUE FOREIGN KEY REFERENCES Departments(IdDepartment) NOT NULL,
	StartDateWork DATE NOT NULL,
	EndDateWork DATE NOT NULL,
	IsCompleted NVARCHAR(10) NOT NULL
);

CREATE TABLE Products (
	IdProduct INT PRIMARY KEY IDENTITY,
	InventoryNumber NVARCHAR(20) NOT NULL,
	ProductType INT FOREIGN KEY REFERENCES ProductTypes(IdProductType) NOT NULL,
	Recipient NVARCHAR(MAX) NOT NULL,
	DeliveryDate DATE NOT NULL,
	IsSent NVARCHAR(10) NOT NULL
)