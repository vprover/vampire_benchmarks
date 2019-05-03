# Problems with datatypes and codatatypes.

* ```game_theory/game*``` : does not rely on (a)cyclicity properties.
* ```cyclic_values/g_acycl*``` : test acyclicity of datatypes. Ground.
* ```cyclic_values/uq_acycl*``` : test acyclicity of datatypes. Quantified.
* ```cyclic_values/g_uniqfp*``` : test uniqueness of codatatype fixpoints. Ground.
* ```cyclic_values/uq_uniqfp*``` : test uniqueness of codatatype fixpoints. Quantified.
* ```cyclic_values/exfp*``` : test existence of codatatype fixpoints.

All problems are unsat by construction, but not all have been
successfully verified by Vampire so far.

Options -tar and -tac are relevant for these problems.

Tested with commit ```4044``` of branch ```master```, but some
problems in ```cyclic_values``` rely on feature found in branch
```codatatypes```.