-- Câu 1:
-- Tạo một thủ tục  có tên là proSalary  để xét thưởng cuối năm như sau: 
-- Nếu nhân viên làm trên : >= 9 năm thì hưởng lương là 12 tr 
-- Nếu làm trên 6 năm thì thưởng 8 tr
-- Nếu làm trên 4 năm thì thưởng 6 tr
-- Còn lại thì thưởng 5tr 
delimiter //
CREATE PROCEDURE csdl.proc_Search_Name
(first_namepr NVARCHAR(50))

begin
    SELECT CONCAT(first_name,' ',last_name) AS full_Name,email,phone_number,hire_date,job_id,salary,department_id
    FROM csdl.employees
    WHERE first_name =  first_namepr;
end;
// delimiter ;
call csdl.proc_Search_Name('Adam')

-- câu 2:
-- Tạo Pro_SearchName
--  sau đó hiển thị toàn bộ thông tin của nhân viên đó
--  trong đó nối họ và tên  Firt_name + Last_name = Full_name 
delimiter //
CREATE PROCEDURE csdl.proc_Salary ()

begin
 select first_name ,  last_name , (year(CURRENT_DATE()) - year(hire_date)) AS years ,
case 
when (year(CURRENT_DATE()) - year(hire_date)) >= 9 then 12000
when (year(CURRENT_DATE()) - year(hire_date)) > 6 then 8000
when (year(CURRENT_DATE()) - year(hire_date)) > 4 then 6000
else 5000
end as Tet_bonus FROM csdl.employees;
end;
// delimiter ;