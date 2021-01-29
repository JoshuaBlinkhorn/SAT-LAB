#!/bin/bash

# generates random cnfs with the specified parameters
# then test the solver against lingeling
# parameters to randcnf are set here in the code
# vary them for different testing scenarios

# STUDENTS: you will need to make some changes to this code:
# 1 - replace `randcnf' with your random CNF generator,
# 2 - replace `random-1.cnf' with the filename that your random
#     CNF generator outputs
# 3 - replace `lingeling' with a solver you have installed
#     or install lingeling
# 3 - replace `CDCL.py' with the tool you want to test

# bear in mind that this code generates one random CNF repeatedly
# a random seed based on your system clock will need to be sufficiently
# accurate to avoid generating the same CNF.

for index in {1..50}
do
python3 randcnf.py 1 30 145 3
ling_out=$(lingeling random-1.cnf | grep "SATISFIABLE")
my_out=$(python3 CDCL.py random-1.cnf | grep "SAT")
echo -e "lingeling:"$ling_out "\tmySolver:"$my_out
done
