# StudentAdministration

.NET 6 core

Task description

The task is to create a simplified model of student administration in higher education. The student administration system must keep track of study programs and subjects, study program structure, students and student enrollments in a particular higher education institution. A higher education institution can have multiple study programs they teach. Each study program is composed of multiple subjects. Each subject can be composed of multiple sub subjects and this structure could continue indefinitely into the depth. Each study program and subject have unique code, name and credits. Students can enroll to a particular study program every year. Student can only have one active enrollment at a time at the same institution. 

---*Important Notice*---Result of the program code files and database script is in file 'StudentAdministrationDB_CreateFile.sql'. Just copy paste to SQL server database query.
In order to create new database, if needed, write 'Update-Database' in npm console.

Since version .NET 6, every SQL connection to database is encrypted by default, so it needs 'Trust server certificate' to be turned on in SQL server management studio.
adding image, where that option is: 

![image](https://user-images.githubusercontent.com/96888736/203844204-563b9c16-35bf-4ec6-b22e-c40ab94f7bd4.png)

NuGet packages were used:

1) Microsoft.EntityFrameworkCore version 7.0.0

2) Microsoft.EntityFrameworkCore.SqlServer version 7.0.0

3) Microsoft.EntityFrameworkCore.Design version 7.0.0

4) Microsoft.EntityFrameworkCore.Tools version 7.0.0

5) Swashbuckle.AspNetCore version 6.4.0
