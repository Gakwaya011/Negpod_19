#!/usr/bin/env bash 
#Students record
touch students-list_0923.txt
create ( ) {
echo "enter students details:"
read -p "student emails: " email
read -p "age:" age
read -p "students ID:" student_id

# check if the student ID already exist
if grep -q "$student_id" students-list_0923.txt”; then
	echo "student id $ student_id already exist"
	
else
       	echo "Email : $email Age : $age StudentID : $student_id" >> students-list_0923.txt
	echo "student record created"

fi
ii}

#View all students records 

view_students ( ) {
echo "list of all students: "
cat students-list_0923.txt
}
#call functions
create
view_students

# fuction delete a student record by ID
delete_student( ){
read - "enter student ID to delete: " student_id
if grep -q  "^$student_id:/d" students-list_0923.txt; then
	sed -i "/^$student_id:/d" students-list_0923.txt
	echo "student with ID $student_id  deleted."
else 
	echo "student with ID $student_id not found."
fi
}

# function to update a student record by ID
update_student() {
	read -p "enter student ID to update: " student_id
	if grep -q "^$student_id:" students-list_0923.txt; then
		echo "enter updated student details:"
		read -p "updated student email; " updated-email
		read -p "updated age: " updated_age


		# replace the old student record with the updated one
		sed -i "s/^$student_id:.*$/$student_id:$updated_email:$updated_age/" students-list_0923.txt
		echo "student with ID $student_id updated."
	else
		echo "student with ID $student_id not found."
	fi
}

#main menu 
while true; do
	echo "main menu"
	echo "1. create student record"
	echo "2. view students"
	echo "3. delete student"
	echo "4. update student"
	echo "5. select emails"
	echo "6. Exit"

	read -p " select an option (1-6): " choice 

	case $choice in
		1)
			create_student
			;;
		2)
			view_student
			;;

		3)      delete_student
			;;

		4)     
			update_student
		        ;;	

		5)
		        ./select-emaills.sh
			;;

		6)
		       echo "invalid option. please select a valid option (1-6)
		       ;;

		   esac
		  done
