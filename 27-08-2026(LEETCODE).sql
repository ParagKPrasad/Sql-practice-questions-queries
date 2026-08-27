-- 1148. Article View
select distinct author_id as id
from views 
where author_id = viewer_id
order by author_id asc;

-- 584. Customer Referee
select name 
from customer
where referee_id!=2 or referee_id is null;

-- 1581. Customer who visited but did not make any Transactions
SELECT 
    customer_id, 
    COUNT(visit_id) AS count_no_trans
FROM Visits
LEFT JOIN Transactions USING (visit_id)
WHERE transaction_id IS NULL
GROUP BY customer_id;

-- 1280. Students and Examinations
SELECT 
    s.student_id, 
    s.student_name, 
    sub.subject_name, 
    COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e 
    ON s.student_id = e.student_id 
    AND sub.subject_name = e.subject_name
GROUP BY 
    s.student_id, 
    s.student_name, 
    sub.subject_name
ORDER BY 
    s.student_id, 
    sub.subject_name;
    
-- 197. Rising Temperature
select w1.id 
from weather w1
join weather w2 
 on datediff(w1.recorddate,w2.recorddate) = 1
where w1.temperature > w2.temperature;

