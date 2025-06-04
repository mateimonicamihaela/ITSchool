users = []

for index in range(1, 6):
    user_name = input(f"Numele userului {index} din 5: ")
    if not user_name:
        print("NU ai introdus username valid")
    elif user_name not in users:
        print(f"INtroducem userul in lista: {user_name}")
        users.append(user_name)
    else:
        print(f"Userul {user_name} este deja in lista")

print(f"Lista finala {users}")
