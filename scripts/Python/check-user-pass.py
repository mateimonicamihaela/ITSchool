import sys

user_admin= "admin"
pass_admin= "admin1234"

user_prompt = input("Username:" )
pass_prompt = input("Password: ")

if user_prompt == user_admin and pass_prompt ==pass_admin:
    print("You are logged in")
else:
    print("User or password is wrong")
    sys.exit(1)

print("Good Bye!")

