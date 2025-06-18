
#!/usr/bin/env python3
"""
Exercițiul 1:
Scrieti un script de python in care:
1. Definim variabile de tip string, number, boolean, None, list, set, dictionary, tuple
2. Pentru fiecare variabila afișați valoarea și tipul ei folosind metoda print
3. Creați o alta variabila cu numele documentație de tip string pe mai multe linii in care
sa puneti pentru fiecare variabila ceva de genul:

Variabila X1 este de tipul Y1 si are valoare Z1
Variabila X2 este de tipul Y2 si are valoare Z2
“””
4. Afisati si acest string documentatie in consola.
"""

# 1. Definirea variabilelor
string_var = "Salut"                           # string
number_var = 42                                # number(int)
boolean_var = True                             # boolean
none_var = None                                # NoneType 
list_var = ["mate", "info", "biologie"]        # list
set_var = {10, 9, 8}                           # set - seturile nu pot avea două articole cu aceeași valoare.
dict_var = {
           "nume": "Ana",
           "clasa": 12
           }                                   # dictionary - Dicționarele sunt folosite pentru a stoca valorile datelor în perechi cheie:valoare. 
tuple_var = (1, 2, 3)                          # tuple - nu putem modifica, adăuga sau elimina elemente după ce a fost creat

# 2. Afișarea valorii și tipului
print(f"string_var: {string_var} (tip: {type(string_var).__name__})")
print(f"number_var: {number_var} (tip: {type(number_var).__name__})")
print(f"boolean_var: {boolean_var} (tip: {type(boolean_var).__name__})")
print(f"none_var: {none_var} (tip: {type(none_var).__name__})")
print(f"list_var: {list_var} (tip: {type(list_var).__name__})")
print(f"set_var: {set_var} (tip: {type(set_var).__name__})")
print(f"dict_var: {dict_var} (tip: {type(dict_var).__name__})")
print(f"tuple_var: {tuple_var} (tip: {type(tuple_var).__name__})")

# 3. Crearea variabilei documentație
documentatie = f"""
Variabila string_var este de tipul {type(string_var).__name__} si are valoarea {string_var}
Variabila number_var este de tipul {type(number_var).__name__} si are valoarea {number_var}
Variabila boolean_var este de tipul {type(boolean_var).__name__} si are valoarea {boolean_var}
Variabila none_var este de tipul {type(none_var).__name__} si are valoarea {none_var}
Variabila list_var este de tipul {type(list_var).__name__} si are valoarea {list_var}
Variabila set_var este de tipul {type(set_var).__name__} si are valoarea {set_var}
Variabila dict_var este de tipul {type(dict_var).__name__} si are valoarea {dict_var}
Variabila tuple_var este de tipul {type(tuple_var).__name__} si are valoarea {tuple_var}
"""

# 4. Afișarea documentației
print("\nDocumentație:\n" + documentatie)

