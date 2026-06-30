select sum(Total) as total_revenue_summed from sales;

-- Q2: which branch generates the highest profit 
/*Insight: Branch C generated the highest total profit, making it the strongest-performing branch in the dataset. 
 Branch B produced the lowest profit and may require further analysis into sales volume, 
product mix, or customer preferences to identify opportunities for improvement.*/
SELECT
    Branch,
    ROUND(SUM(`Gross income`), 2) AS Total_Profit
FROM sales
GROUP BY Branch
ORDER BY Total_Profit DESC;



-- Q3 Which city generates the highest revenue?
SELECT
    City,
    ROUND(SUM(Total), 2) AS Total_Revenue
FROM sales
GROUP BY City
ORDER BY Total_Revenue DESC;




-- Question 4:  Which customer type spends more on average?
SELECT
    `Customer type`,
    ROUND(AVG(Total), 2) AS Average_Spending
FROM sales
GROUP BY `Customer type`
ORDER BY Average_Spending DESC;



-- Q5: Which payment method generates the highest revenue?
SELECT
    Payment,
    ROUND(SUM(Total), 2) AS Total_Revenue
FROM sales
GROUP BY Payment
ORDER BY Total_Revenue DESC;




-- Question 6: Which day of the week generates the highest revenue?
SELECT
    DAYNAME(Date) AS Day,
    ROUND(SUM(Total),2) AS Revenue
FROM sales
GROUP BY DAYNAME(Date)
ORDER BY Revenue DESC;


-- Question 7: Which time of day generates the most revenue?
SELECT
    CASE
        WHEN HOUR(Time) < 12 THEN 'Morning'
        WHEN HOUR(Time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS Time_of_Day,
    ROUND(SUM(Total),2) AS Revenue
FROM sales
GROUP BY Time_of_Day
ORDER BY Revenue DESC;



-- Question 8: Which branch has the highest average customer rating?
SELECT
    Branch,
    ROUND(AVG(Rating),2) AS Average_Rating
FROM sales
GROUP BY Branch
ORDER BY Average_Rating DESC;




-- Question 9: Which product lines receive low ratings despite high revenue?
-- Food & Beverages produced high revenue but had one of the lowest ratings. 
-- Management should investigate product quality or customer experience.
SELECT
    `Product line`,
    ROUND(SUM(Total),2) AS Revenue,
    ROUND(AVG(Rating),2) AS Avg_Rating
FROM sales
GROUP BY `Product line`
ORDER BY Revenue DESC;




-- Q10: Which customer type is more profitable?
SELECT
    `Customer type`,
    ROUND(SUM(`Gross income`),2) AS Profit
FROM sales
GROUP BY `Customer type`
ORDER BY Profit DESC;



-- Q11: Which city has the highest average customer spending?
SELECT
    City,
    ROUND(AVG(Total),2) AS Average_Spending
FROM sales
GROUP BY City
ORDER BY Average_Spending DESC;



-- Q12: Which payment method is associated with the highest average purchase?
SELECT
    Payment,
    ROUND(AVG(Total),2) AS Average_Purchase
FROM sales
GROUP BY Payment
ORDER BY Average_Purchase DESC;



-- Q13: Rank the branches by profit.
SELECT
    Branch,
    ROUND(SUM(`Gross income`),2) AS Profit,
    RANK() OVER(ORDER BY SUM(`Gross income`) DESC) AS Branch_Rank
FROM sales
GROUP BY Branch;