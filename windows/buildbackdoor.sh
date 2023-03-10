# Delete the current collection script if it exists
if test -f "backdoors.ps1"; then
  rm backdoors.ps1
fi

# Loop through the rest of the scripts, concantenating them together
for script in *.ps1
do
  echo "Adding $script"
  cat $script >> backdoors.ps1
  echo "" >> backdoors.ps1
done
