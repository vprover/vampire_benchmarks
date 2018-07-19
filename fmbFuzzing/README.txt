Inputs where vampire4.2.2 in fmb incorrectly reports SAT, or crashes (check in debug mode).

Discovered by Mikolas Janota.

./vampire4.2.2 -m 32000 -sa fmb  -t 600s --proof off $1
