SELECT TaskType.TypeName, IsNull(Temp.TempCount,0) AS count
From TaskType
Left Join
(select count(*) as TempCount, typeid from task 
where (statusid=4) group by typeid ) Temp
On TaskType.TypeID=Temp.TypeID
order by count desc

SELECT TaskPriority.PriorityName, IsNull(Temp.TempCount,0) AS count
FROM TaskPriority
Left Join
(SELECT COUNT(*) AS TempCount, PriorityID FROM task
WHERE (statusid=4) GROUP BY PriorityID) Temp
ON TaskPriority.PriorityID=Temp.PriorityID
ORDER BY count DESC