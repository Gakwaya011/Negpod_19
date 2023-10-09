#!/bin/bash
#Students record
touch students-list_0923.txt
creat ( ) {
echo "enter students details:"
read -p "student " main
read -p "age:" age
read -p "students ID:" Student ID 

# check if the student ID already exist
if grep -q "student_id;" students-list_0923.txt”
	echo "student id $ student_id already exist"
	
else
       	echo " student_id:$email:$age >> students-list_0923.txt”
	echo "student record created"

fi
}
#View all students records 
view_students ( ) {
echo "list of all students
cat students-list_0923.txt
