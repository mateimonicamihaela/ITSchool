import os
import time
import shutil

input_dir = "/input"
output_dir = "/output"

while True:
    fisiere = os.listdir(input_dir)
    if not fisiere:
        print("Nu mai sunt fisiere de mutat.")
        break

    for fisier in fisiere:
        sursa = os.path.join(input_dir, fisier)
        destinatie = os.path.join(output_dir, fisier)

        if os.path.isfile(sursa):
            print(f"Mutam: {fisier}")
            shutil.move(sursa, destinatie)
            time.sleep(5)

