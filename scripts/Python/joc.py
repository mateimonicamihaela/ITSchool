import random
import os

min_val=int(os.getenv("MIN_VAL",1))
max_val=int(os.getenv("MAX_VAL", 100))

numar_generat = random.randint(min_val, max_val)

def citeste_intreg(min_arg, max_arg = 100):
    while True:
        try:
            valoare_introdusa = int(input(f"Introduceti un numar de la {min_arg} la {max_arg}: "))
            if valoare_introdusa >= min_arg and valoare_introdusa <= max_arg:
                return valoare_introdusa #return inchide functia
            else:
                print(f"Numarul introdus trebuie sa fie intre {min_arg} si {max_arg}")
        except Exception as eroare:
            print(eroare)
            continue
tentativa = 0

while True:
    numar_introdus = citeste_intreg(min_val,max_val)
    tentativa += 1  
    if numar_introdus < numar_generat:
        print(f"Numaraul introdus este mai mic decat numarul cerut. Tentativa {tentativa}")
    elif numar_introdus > numar_generat:
        print(f"Numarul introdus este mai mare decat numarul cerut. tentativa {tentativa}")
    else:
        print(f"Nu ai ghicit numarul. Aceasta este incercarea numarul {tentativa}")
        break

print(f"Ai ghicit numarul din a {tentativa} incercare")