#!/bin/bash

# Check if the file exists, if not then create
if [ -e "$HOME/.todo_file.txt" ]; then
        TODO_FILE="$HOME/.todo_file.txt"
else
        touch "$HOME/.todo_file.txt"
        TODO_FILE="$HOME/.todo_file.txt"
fi

# Function to add a task
add_task() {
        echo "$1" >> "$TODO_FILE"
        echo "Task added: $1"
}

# Function to view tasks
view_tasks() {
        if [ ! -s "$TODO_FILE" ]; then
                echo "No task founded"
                return
        else
                echo "Tasks":
                nl -w2 -s'. ' "$TODO_FILE"
        fi
}

#Function to delete a task
delete_task() {
        if [ ! -f "$TODO_FILE" ]; then
                echo "No task to be deleted"
                return
        else
                sed -i "${1}d" "$TODO_FILE"
                echo "Task $1 deleted"
        fi
}

# Show options
show_options() {
        echo "[-] Use: $0 [option] [task]"
        echo "$0 add 'new task' - Add new task"
        echo "$0 view           - To view tasks"
        echo "$0 del N          - To delete task number N"
}

#Check the command
case "$1" in
        add)
                shift
                add_task "$*"
                ;;
        view)
                view_tasks
                ;;
        del)
                delete_task "$2"
                ;;
        *)
                show_options
                ;;
esac
