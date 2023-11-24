use finance
select * from customer

-- Year wise loan amount Stats;
select date_issue,sum(loan_amnt) as loan_amnt from customer
group by date_issue
order by date_issue asc

-- Grade and sub grade wise revol_bal;
select grade,sub_grade,sum(revol_bal) as revol_bal from customer
group by grade,sub_grade
order by grade,sub_grade asc 

-- Total Payment for Verified Status Vs Total Payment for Non Verified Status;
SELECT 
    CASE 
        WHEN verification_status = 'Verified' THEN 'Verified'
        ELSE 'Non Verified'
    END AS verification_status,
    SUM(total_pymnt) AS Total_payment
FROM customer
GROUP BY verification_status;
    
-- State wise and last_credit_pull_d wise loan status;
SELECT last_credit_pull_d, addr_state AS state_wise, loan_status, COUNT(*) as loan_count FROM customer
GROUP BY last_credit_pull_d, addr_state, loan_status;
order by last_credit_pull_d Asc

-- Home ownership Vs last payment date stats;
SELECT 
    home_ownership,
    MAX(last_payment_date) AS latest_payment_date,
    MIN(last_payment_date) AS earliest_payment_date,
    COUNT(*) AS total_records
FROM customer
GROUP BY home_ownership;






