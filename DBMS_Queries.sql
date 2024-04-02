-- Q1 Which donors have blood type 'O+', and what are their details along with the corresponding blood information from the Blood table?
Select*from Donor Left join Blood ON Donor.blood_group=BLood.Blood_group Where blood_id=1;
 

-- Q2 Find the total number of donors
SELECT COUNT(*) AS Total_Donors FROM Donor;
 

-- Q3  List the names and blood types of patients who used blood.
SELECT p.name, b.blood_group FROM Patient p JOIN Usage_Record u ON p.patient_id = u.patient_id JOIN Blood b ON u.blood_id = b.blood_id;
 

-- Q4 Retrieve the names and blood types of donors who donated more than 2.0 units of blood.
SELECT name, blood_group FROM Donor WHERE donor_id IN (SELECT donor_id FROM Donation_Record WHERE quantity_donated > 2.0);
 

-- Q5 Provide a list of donor names along with their respective blood groups.
SELECT d.name AS Donor_Name, d.blood_group AS Blood_Group FROM Donor d;
 

-- Q6 Which hospitals are associated with blood banks, and where are these blood banks located?
SELECT h.name AS Hospital_Name, h.Address AS Hospital_Address, bb.location AS Blood_Bank_Location FROM Hospital h JOIN Blood_Bank bb ON h.BloodBank_id = bb.BloodBank_id;
 

-- Q7 What are the names of patients along with the quantity of blood they have used?
SELECT p.name AS Patient_Name, u.quantity_used AS Quantity_Used FROM Patient p JOIN Usage_Record u ON p.patient_id = u.patient_id;
 

-- Q8 Display peoples names starting from "J" from person..
select * from Person where name like 'J%';
 

-- Q9 Find out place where they have the maximum amount of orders
SELECT bb.location AS Blood_Bank_Location FROM Blood_Bank bb WHERE bb.orders = ( SELECT MAX(orders) FROM Blood_Bank );
 

-- Q10 What is the name, email, and blood group of the donor who made the largest donation?
SELECT d.name AS Donor_Name, d.email AS Donor_Email, d.blood_group AS Blood_Group FROM Donor d WHERE d.donor_id = ( SELECT donor_id FROM Donation_Record ORDER BY quantity_donated DESC LIMIT 1 );
 

-- Q11. Give details of people whose blood_group is O+ and is a male.
SELECT*FROM Donor WHERE blood_group="O+" AND gender="M";
 

-- Q12. Update contact number of Michael Johnson to 1928374655
UPDATE Person SET Contact_no=1928374655 WHERE name="Michael Johnson";
SELECT * FROM Person WHERE name="Michael Johnson";
 

-- Q13. What are the details of individuals with a blood group of "AB-" whose names start with the letter "J" after performing a full join with the "Blood" table?
SELECT * FROM Person FULL JOIN Blood WHERE blood_group="AB-" AND name like "J%";
 

-- Q14. Retrieve the Oldest and Newest Donation Dates
SELECT MIN(donation_date) AS Oldest_Donation_Date, MAX(donation_date) AS Newest_Donation_Date FROM Donation_Record;
 

-- Q15. Retrive the lowest and highest Blood count cells
SELECT MIN(BLood_cells) AS Lowest_BLood_Cell_Count, MAX(BLood_cells) AS HIghest_BLood_Cell_Count FROM BLood;

 

-- Q16. Retrieve the Earliest and Latest Expiry Dates of Blood Stock
SELECT MIN(expiry_date) AS Earliest_Expiry_Date, MAX(expiry_date) AS Latest_Expiry_Date FROM Stock;
 

-- Q17. Find the names and genders of patients who used more than 2.0 units of blood.
SELECT name, gender FROM Patient WHERE patient_id IN (SELECT patient_id FROM Usage_Record WHERE quantity_used > 2.0);
 

-- Q18. Retrieve the blood types and expiry dates of blood in the stock.
SELECT blood_group, expiry_date FROM Stock WHERE blood_id IN (SELECT blood_id FROM Blood WHERE Blood_cells > 5000000);
 

-- Q19. List the names and genders of donors who have donated blood.
SELECT name, gender FROM Donor WHERE EXISTS (SELECT * FROM Donation_Record WHERE Donor.donor_id = Donation_Record.donor_id);
 

-- Q20. Retrieve the top 5 donors who donated the highest quantity of blood.
SELECT name, SUM(quantity_donated) AS total_donation FROM Donation_Record JOIN Donor ON Donation_Record.donor_id = Donor.donor_id GROUP BY Donor.donor_id ORDER BY total_donation DESC LIMIT 5;
 
