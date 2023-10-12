#!/usr/bin/env bash
# Function to create a student record
create_student() {
    echo -e "Enter student details: \n"
    read -p "Student Email: " email
    read -p "Age: " age
    read -p "Student ID: " student_id
    if [  -e "students-list_0923.txt" ];then
       
    # Check if the student ID already exists
    if grep -q "^$student_id:" students-list_0923.txt; then
        echo -e "Student ID $student_id already exists.\n"
	sleep 0.5




	
	./main.sh
    else
        echo "$student_id:$email:$age" >> students-list_0923.txt
        echo "Student record created."
	sleep 0.5
	./main.sh
    fi
       else
	echo "$student_id:$email:$age" >> students-list_0923.txt
        echo "Student record created."
		sleep 0.5
	./main.sh
    fi
       
}

# Function to view all student records
view_students() {
    echo -e "List of all students: \n"
    cat students-list_0923.txt
    		sleep 0.5
	./main.sh
}

# Function to delete a student record by ID
delete_student() {
    read -p "Enter student ID to delete: " student_id
    if grep -q "^$student_id:" students-list_0923.txt; then
        sed -i "/^$student_id:/d" students-list_0923.txt
        echo "Student with ID $student_id deleted."
	
    else
        echo "Student with ID $student_id not found."
			sleep 0.5
	./main.sh
    fi
}

# Function to update a student record by ID
update_student() {
    read -p "Enter student ID to update: " student_id
    if grep -q "^$student_id:" students-list_0923.txt; then
        echo "Enter updated student details:"
        read -p "Updated Student Email: " updated_email
        read -p "Updated Age: " updated_age

        # Replace the old student record with the updated one
        sed -i "s/^$student_id:.*$/$student_id:$updated_email:$updated_age/" students-list_0923.txt
        echo "Student with ID $student_id updated."
	
    else
        echo "Student with ID $student_id not found."
			sleep 0.5
	./main.sh
    fi
}

# Function to exit the application
exit_application() {
    echo "Exiting the application."
    exit 0
}

# Main menu

    echo -e "\nMain Menu: \n"
    echo "1. Create Student Record"
    echo "2. View Students"
    echo "3. Delete Student"
    echo "4. Update Student"
    echo "5. Select emails"
    echo "6. Exit"
    echo -e "\n"
    read -p "Select an option (1-6): " choice
    echo -e "\n"
    case $choice in
        1)
            create_student
            ;;
        2)
            view_students
            ;;
        3)
            delete_student
            ;;
        4)
            update_student
            ;;
	5)
	    ./select-emails.sh
	    ;;
        6)
            exit_application
            ;;
        *)
	    clear
            echo "Invalid option. Please select a valid option (1-6)."
	    ./main.sh
            ;;
    esac


