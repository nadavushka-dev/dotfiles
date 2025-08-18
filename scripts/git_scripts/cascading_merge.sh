#!/bin/bash
declare -A merge_success_obj

# Check if there are at least two arguments (starting branch and at least one branch to merge into)
if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <branch1> <branch2> [<branch3> ... <branchN>]"
  exit 1
fi

# Define the prefix
BRANCH_PREFIX="sprint/"

# Store all the branches in an array, and prepend the prefix to each branch
BRANCHES=()
for branch in "$@"; do
  BRANCHES+=("${BRANCH_PREFIX}${branch}")
done

# Define project paths
TEST_PROJECT="./test_git_scripts"
SUBMODULE_PATH="./subProj"
PROJ1_PATH="./proj1"
PROJ2_PATH="./proj2"

# The submodule reference file
SUBMODULE_FILE="sp-submodule-file"

# Define the log file for errors and failures
LOG_FILE="/Users/Nadavushka/code/scripts/git_scripts/merge_errors_$(date '+%Y-%m-%d').log"

# Function to log only errors or failed merges
log_error() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - ERROR: $1" | tee -a "$LOG_FILE"
}

format_conflicted_files() {
  # Check if any conflicted files were passed
  if [[ -z "$1" ]]; then
    return 0
  fi

  # Read the conflicted files into an array, splitting by newline
  IFS=$'\n' read -rd '' -a files_array <<< "$1"  # Read into an array using newline as delimiter

  # Create a formatted string with each filename on a new line
  formatted_output=""
  for file in "${files_array[@]}"; do
    formatted_output+="${file}, "
  done

  # Remove the trailing comma and space
  formatted_output="${formatted_output%, }"

  # Print the formatted output (each filename in a new line, separated by commas)
  echo "$formatted_output" | tr ', ' '\n'  # Convert to newline-separated format for output
}

navigate_home() {
 cd "$(dirname "$0")"
}

handle_versions() {
  for ((i=0; i<${#BRANCHES[@]}-1; i++)); do

    CURRENT_BRANCH=${BRANCHES[$i]}
    NEXT_BRANCH=${BRANCHES[$i+1]}

    navigate_work_folder $SUBMODULE_PATH
    handle_branch $SUBMODULE_PATH $NEXT_BRANCH
    handle_merge $SUBMODULE_PATH $NEXT_BRANCH $CURRENT_BRANCH

    navigate_work_folder $PROJ1_PATH
    handle_branch $PROJ1_PATH $NEXT_BRANCH
    handle_merge $PROJ1_PATH $NEXT_BRANCH $CURRENT_BRANCH

    navigate_work_folder $PROJ2_PATH
    handle_branch $PROJ2_PATH $NEXT_BRANCH
    handle_merge $PROJ2_PATH $NEXT_BRANCH $CURRENT_BRANCH
  done
}

navigate_work_folder() {
  WORK_FOLDER=$1

  navigate_home

  cd "$WORK_FOLDER" || { log_error "Failed to navigate to $WORK_FOLDER"; return 1; }

  if [[ "$WORK_FOLDER" == "$SUBMODULE_PATH" ]]; then
   for key in "${!merge_success_obj[@]}"; do
    unset merge_success_obj["$key"]
   done
  fi

}

handle_branch() {
  PROJECT_PATH=$1
  NEXT_BRANCH=$2

  echo "Checking out branch: $NEXT_BRANCH in $PROJECT_PATH"
  git checkout "$NEXT_BRANCH" || { log_error "Failed to checkout branch $NEXT_BRANCH in $PROJECT_PATH"; return 1; }

  echo "====================================="
}

handle_merge() {
  PROJECT_PATH=$1 
  NEXT_BRANCH=$2 
  CURRENT_BRANCH=$3

    # Merge the current branch into the next branch
    echo "Merging $CURRENT_BRANCH into $NEXT_BRANCH in $PROJECT_PATH"
    git merge "$CURRENT_BRANCH"
    MERGE_STATUS=$?
    echo "====================================="

    # Check if there were any merge conflicts
    if [ $MERGE_STATUS -ne 0 ]; then
      handle_merge_conflict $PROJECT_PATH $NEXT_BRANCH
      navigate_home
      handle_reset_head $NEXT_BRANCH
    else
      merge_success_obj["$PROJECT_PATH"]=true
      navigate_home
    fi

}

handle_merge_conflict() {
  PROJECT_PATH=$1
  NEXT_BRANCH=$2

  echo "Merge conflict detected in branch $NEXT_BRANCH in $PROJECT_PATH."

  CONFLICT_FILES="[$(git diff --name-only --diff-filter=U)]" 

  # Check if the only conflict is in the submodule file
  if [[ "$CONFLICT_FILES" == "$SUBMODULE_FILE" ]]; then
    echo "The only conflict is in $SUBMODULE_FILE. Continuing with merge."
    echo "====================================="

    # Reset submodule if needed, or handle the conflict resolution
    # TODO: change to submodule reset 
    git submodule update --init --recursive
    git add "$SUBMODULE_FILE"
    git commit -m "Resolved conflict in submodule reference file"

  else
    formatted_conflicts=$(format_conflicted_files "$CONFLICT_FILES")
    log_error "Conflicts detected in branch $NEXT_BRANCH in files: $formatted_conflicts. Aborting merge."
    echo "====================================="
    git merge --abort
    echo "====================================="
  fi
}

handle_reset_head() {
  NEXT_BRANCH=$1

   for key in "${!merge_success_obj[@]}"; do
    cd "$key" || { log_error "Failed to navigate to $key"; return 1; }
    git reset HEAD~ --hard
   done

}

# Perform merge in subProj
handle_versions
echo "scripts ended"
