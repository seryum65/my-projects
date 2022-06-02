grep -i "Invalid user" auth.log | cut -d' ' -f8 | uniq -c > invalid_user.sh

grep -i "Invalid user" auth.log | cut -d' ' -f9 | uniq -c >> invalid_user.sh

cat auth.log | grep -v "from" | grep -v "for" | grep -v "invalid" >> invalid_user.sh

