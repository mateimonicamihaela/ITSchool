lista_colegi=["Ana","Ionut","Alin"]

coleg_nou=input("Introduceti numele noului coleg: ")


if coleg_nou not in lista_colegi and coleg_nou != " ":
    print("Colegul nu este in lista")
    lista_colegi.append(coleg_nou)

print("Lista colegilor este: \n", lista_colegi)
