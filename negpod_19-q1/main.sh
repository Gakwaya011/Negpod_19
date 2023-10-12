#!/usr/bin/env bash 

#Students record
touch students-list_0923.txt

create_student() {
    echo "Enter student details:"
    read -p "Student email: " email
    read -p "Age: " age
    read -p "Student ID: " student_id

    # check if the student ID already exists
    if grep -q "$student_id" students-list_0923.txt; then
        echo "Student ID $student_id already exists"
    else
        echo "Email: $email Age: $age StudentID: $student_id" >> students-list_0923.txt
        echo "Student record created"
    fi
}

#View all students records 
view_student() {
    echo "List of all students: "
    cat students-list_0923.txt
}

# function to delete a student record by ID
delete_student() {
    read -p "Enter student ID to delete: " student_id
    if grep -q "^$student_id:" students-list_0923.txt; then
        sed -i "/^$student_id:/d" students-list_0923.txt
        echo "Student with ID $student_id deleted."
    else 
        echo "Student with ID $student_id not found."
    fi
}

# function to update a student record by ID
update_student() {
    read -p "Enter student ID to update: " student_id
    if grep -q "^$student_id:" students-list_0923.txt; then
        echo "Enter updated student details:"
        read -p "Updated student email: " updated_email
        read -p "Updated age: " updated_age

        # replace the old student record with the updated one
        sed -i "s/^$student_id:.*$/$student_id:$updated_email:$updated_age/" students-list_0923.txt
        echo "Student with ID $student_id updated."
    else
        echo "Student with ID $student_id not found."
    fi
}

# main menu 
while true; do
    echo "Main menu"
    echo "1. Create student record"
    echo "2. View students"
    echo "3. Delete student"
    echo "4. Update student"
    echo "5. Select emails"
    echo "6. Exit"

    read -p "Select an option (1-6): " choice 

    case $choice in
        1)
            create_student
            ;;
        2)
            view_student
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
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option. Please select a valid option (1-6)."
            ;;
    esac
done

