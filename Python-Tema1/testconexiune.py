import requests

try:
    response = requests.get("https://www.google.com", timeout=5)
    print(response.status_code)
except Exception as e:
    print("Eroare:", e)
