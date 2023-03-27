BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Doctor" (
	"StaffNo"	INTEGER NOT NULL UNIQUE,
	FOREIGN KEY("StaffNo") REFERENCES "Staff"("StaffNo"),
	PRIMARY KEY("StaffNo")
);
CREATE TABLE IF NOT EXISTS "Receptionist" (
	"staffNo"	INTEGER NOT NULL UNIQUE,
	FOREIGN KEY("staffNo") REFERENCES "Staff"("StaffNo"),
	PRIMARY KEY("staffNo")
);
CREATE TABLE IF NOT EXISTS "Staff" (
	"StaffNo"	INTEGER NOT NULL UNIQUE,
	"staffFullName"	TEXT NOT NULL,
	"staffAddress"	TEXT NOT NULL,
	PRIMARY KEY("StaffNo")
);
CREATE TABLE IF NOT EXISTS "GP Surgery" (
	"gp_ID"	INTEGER NOT NULL UNIQUE,
	"surgeryAddress"	TEXT,
	PRIMARY KEY("gp_ID")
);
CREATE TABLE IF NOT EXISTS "User" (
	"user_ID"	INTEGER NOT NULL UNIQUE,
	"userPostcode"	TEXT,
	"userFirstname"	TEXT,
	"userSurname"	TEXT,
	"genderCode"	TEXT,
	"gp_ID"	INTEGER NOT NULL UNIQUE,
	FOREIGN KEY("gp_ID") REFERENCES "GP Surgery"("gp_ID"),
	PRIMARY KEY("user_ID")
);
CREATE TABLE IF NOT EXISTS "central_Records" (
	"NHS_Number"	INTEGER NOT NULL UNIQUE,
	"PatientPostcode"	TEXT,
	"PatientFirstName"	TEXT,
	"PatientSurname"	TEXT,
	"genderCode"	TEXT,
	"record_Date"	NUMERIC,
	"record_Notes"	TEXT,
	"patient_ID"	INTEGER UNIQUE,
	"DoseNo"	INTEGER NOT NULL,
	"VaccinationDate"	NUMERIC,
	"VaccineManufacturer"	TEXT,
	"DiseaseTargeted"	TEXT,
	"VaccineType"	TEXT,
	"Product"	TEXT,
	"VaccineBatchNumber"	INTEGER,
	"CountryOfVaccination"	TEXT,
	"Authority"	TEXT,
	"Site"	TEXT,
	"TotalSeriesOfDoses"	INTEGER,
	"DisplayName"	TEXT,
	"SnomedCode"	INTEGER,
	"DataEntered"	TEXT,
	"ProcedureCode"	INTEGER,
	"Booster"	INTEGER,
	"User_ID"	INTEGER NOT NULL UNIQUE,
	FOREIGN KEY("User_ID") REFERENCES "User"("user_ID"),
	PRIMARY KEY("NHS_Number")
);
CREATE TABLE IF NOT EXISTS "Appointment" (
	"appointmentID"	INTEGER NOT NULL UNIQUE,
	"appointmentTime"	NUMERIC,
	"appointmentDate"	TEXT,
	"NHS_number"	INTEGER NOT NULL UNIQUE,
	"staffNo"	INTEGER NOT NULL UNIQUE,
	FOREIGN KEY("staffNo") REFERENCES "Staff"("StaffNo"),
	FOREIGN KEY("NHS_number") REFERENCES "central_Records"("NHS_Number"),
	PRIMARY KEY("appointmentID")
);
COMMIT;
