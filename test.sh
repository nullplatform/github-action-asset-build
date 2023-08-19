clean_path() {
    local path="$1"

    # Remove "./" from the beginning of the path
    path="${path#./}"

    # Remove trailing slashes
    path="${path%/}"

    echo "$path"
}

clean_path1() {
  local path="$1"
  # Remove "./" from the beginning of the path, but preserve "."
  if [ "$path" != "./" ]; then
      path="${path#./}"
  fi
  # Remove trailing slashes
  path="${path%/}"
  echo "$path"
}

clean_path2() {
    local path="$1"
    # Remove leading "./" and replace consecutive slashes with a single slash
    path=$(echo "$path" | sed -E 's,^\./,,; s,//+,/,g')
    # Remove trailing slashes
    path="${path%/}"
    echo "$path"
}

echo "----------"
original_path="/src/build/"
standardized_path=$(clean_path1 "$original_path")
echo "Original Path: $original_path"
echo "Standardized Path: $standardized_path"
echo "----------"

original_path="./build/"
standardized_path=$(clean_path1 "$original_path")
echo "Original Path: $original_path"
echo "Standardized Path: $standardized_path"
echo "----------"

original_path="./build"
standardized_path=$(clean_path1 "$original_path")
echo "Original Path: $original_path"
echo "Standardized Path: $standardized_path"
echo "----------"

original_path="build"
standardized_path=$(clean_path1 "$original_path")
echo "Original Path: $original_path"
echo "Standardized Path: $standardized_path"
echo "----------"

original_path="."
standardized_path=$(clean_path1 "$original_path")
echo "Original Path: $original_path"
echo "Standardized Path: $standardized_path"
echo "----------"

original_path="./"
standardized_path=$(clean_path1 "$original_path")
echo "Original Path: $original_path"
echo "Standardized Path: $standardized_path"
echo "----------"
