# FOR loop sintax

```bash
List of fixed values for syntax is as follows:
for VARIABLE in Mo Tu We Th Fr Sa Su ; do
    command1
    command2
    commandN
done

```

OR

```bash
Numeric ranges for syntax is as follows:
for VARIABLE in 1 2 3 4 5 .. N ; do
    command1
    command2
    commandN
done
```

OR

```bash
for VARIABLE in file1 file2 file3; do
    command1 on $VARIABLE
    command2
    commandN
done
```

OR

```bash
for OUTPUT in $(Linux-Or-Unix-Command-Here); do
    command1 on $OUTPUT
    command2 on $OUTPUT
    commandN
done
```


