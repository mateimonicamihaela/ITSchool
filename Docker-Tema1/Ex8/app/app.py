import time
from datetime import datetime

log_file_path = "/log/app.log"

while True:
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    message = f"[{timestamp}] Aplicatia ruleaza..."
    
    print(message)

    with open(log_file_path, "a") as log_file:
        log_file.write(message + "\n")

    time.sleep(1)

