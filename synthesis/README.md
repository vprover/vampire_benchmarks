# Synthesis benchmarks

This directory contains benchmarks for total function synthesis using uncomputable symbols. The dataset was published at CICM 2025.

All benchmarks are in $\forall x\exists y. F[x, y]$ format -- i.e., a synthesis problem is encoded as "for all inputs $x$, there exists an output $y$, such that the relation $F$ between $x$ and $y$ holds".

The format of the benchmarks is SMT-LIB-like with the following differences:
- to encode the synthesis specification $\forall x_1\in S_1,\dots, x_n\in S_n . \exists y_1\in T_1,\dots, y_m\in T_m . F[\bar{x}, \bar{y}]$, we use the command:

  `(assert-synth ((x1 S1) ... (xn Sn)) ((y1 T1) ... (ym Tm)) (<SMT-LIB encoding of F>))`

- to denote that the symbols $u_1, \dots, u_k$ are uncomputable, we use:

  `(set-option :uncomputable (u1 ... uk))`

- we use the following command to assert auxiliary lemmas. The solver can either treat them as axioms, or can first prove them and only then use them:

  `(assert-claim (<SMT-LIB encoding of the auxiliary lemma>))`

Additionally we provide encoding of the benchmarks in SyGuS format.

## Benchmark categories

The bechmarks are categorized into directories `{NR,R}_<logic>`, where `<logic>` corresponds to SMT-LIB logic name, and `NR` and `R` denotes non-recursive and recursive benchmarks, respectively.
Recursive benchmarks use recursive function definitions while non-recursive functions do not.
Since proving the specifications of recursive benchmarks may require induction, their solutions may be recursive programs.

Some category directories contain sub-directories, grouping similar benchmarks. E.g., `R_UFDT/list/rev` contains problems using list reversal.

Finally, the deepest nested folder in the directory structure is either `smt2` or `sl`, containing the SMT-LIB or SyGuS files, respectively.

## Benchmarks used in the "synthesis in saturation" papers [2, 3]

The benchmarks used in [2] are included in the directories `NR_UF`, `NR_LIA`, `NR_NIA`, and the benchmarks used in [3] are included in `R_UFDT`.
Note that the benchmarks might have been changed slightly: e.g., lemmas not useful for the problem might have been removed. Further, the benchmarks in this repository use the new `assert-synth` command, while the benchmarks used in [2] and [3] used the `assert-not` syntax.

To view the exact same benchmarks as in [2, 3], go to commit [3a1f2a0](https://github.com/vprover/vampire_benchmarks/tree/3a1f2a0cc057564029516771c3739548edcede69/synthesis).

### Solving the benchmarks from [2, 3]
For future reference, we list Vampire configurations solving those benchmarks from commit [3a1f2a0](https://github.com/vprover/vampire_benchmarks/tree/3a1f2a0cc057564029516771c3739548edcede69/synthesis), which were reported solved in [2, 3].
Use these configurations with Vampire built from commit [92737cf](https://github.com/vprover/vampire/tree/92737cf3a03ea28210bec55a806b56ba71d59c90) and compiled with Z3. If you have a version of Vampire without Z3, remove `:sas=z3` from the configurations.
The configurations use the Otter saturation algorithm for better reproducibility.

#### Non-recursive synthesis problems [2]
```
./vampire --decode ott+10_3:1_av=off:lcm=reverse:qa=synthesis:sp=reverse_arity:urr=on_600 vampire_benchmarks/synthesis/non-recursive/smt2/group-ex1-right_inverse.smt2
./vampire --decode ott+10_3:1_av=off:lcm=reverse:qa=synthesis:sp=reverse_arity:urr=on_600 vampire_benchmarks/synthesis/non-recursive/smt2/group-ex2-inverse_of_ixopiy.smt2
./vampire --decode ott+1011_1_to=lpo:sil=32000:sp=arity:spb=goal:urr=on:bsr=on:fd=preordered:nwc=0.968:br=off:newcnf=on:random_seed=2790537189:s2a=on:i=130:s2at=11:bd=preordered:nm=20:ins=10:av=off:qa=synthesis:gtg=position:gsp=on_600 vampire_benchmarks/synthesis/non-recursive/smt2/group-ex3-square_commutativity.smt2
./vampire --decode ott+10_1_to=kbo:sil=64000:norm_ineq=on:si=on:sp=unary_frequency:random_seed=67687461:st=2:i=4512:doe=on:av=off:rtra=on:qa=synthesis:ss=axioms_600 vampire_benchmarks/synthesis/non-recursive/smt2/polynomial1.smt2
./vampire --decode ott+10_3:1_av=off:lcm=reverse:qa=synthesis:sp=reverse_arity:urr=on_600 vampire_benchmarks/synthesis/non-recursive/smt2/polynomial2.smt2
./vampire --decode ott+35_1_norm_ineq=on:sas=z3:si=on:tha=off:s2a=on:aac=none:rtra=on:qa=synthesis:amm=off_600 vampire_benchmarks/synthesis/non-recursive/smt2/max2.smt2
./vampire --decode ott+35_1_norm_ineq=on:sas=z3:si=on:tha=off:s2a=on:aac=none:rtra=on:qa=synthesis:amm=off_600 --proof off vampire_benchmarks/synthesis/non-recursive/smt2/max15.smt2
```
Note that the last configuration includes `--proof off` to avoid printing the long proof.

#### Recursive synthesis problems [3]
```
./vampire --decode ott+10_1_ind=struct:indmd=1:indnsb=on:indc=goal:updr=off:indgo=off:qa=synthesis_600 vampire_benchmarks/synthesis/recursive/smt2/list-last_elem.smt2
./vampire --decode ott+10_1_ind=struct:indmd=1:indc=goal:updr=off:indgo=off:qa=synthesis_600 vampire_benchmarks/synthesis/recursive/smt2/list-len_concat.smt2
./vampire --decode ott+10_1_ind=struct:indmd=1:indc=goal:updr=off:indgo=off:qa=synthesis_600 vampire_benchmarks/synthesis/recursive/smt2/nat-add_assoc.smt2
./vampire --decode ott+10_1_ind=struct:indmd=1:indc=goal:updr=off:indgo=off:qa=synthesis_600 vampire_benchmarks/synthesis/recursive/smt2/nat-double.smt2
./vampire --decode ott+10_1_ind=struct:indmd=1:indc=goal:updr=off:indgo=off:qa=synthesis_600 vampire_benchmarks/synthesis/recursive/smt2/nat-double_even.smt2
./vampire --decode ott+11_1_to=lpo:ind=struct:indmd=1:plsq=on:sos=all:erd=off:urr=ec_only:s2agt=128:updr=off:random_seed=480541780:s2pl=on:s2a=on:s2at=5:indgo=off:av=off:qa=synthesis:gtg=exists_top:fdi=8_600 vampire_benchmarks/synthesis/recursive/smt2/nat-subtraction.smt2
```
Note that the `-indnsb on` option used in the first configuration is only available on the `synthesis-recursive` branch.

## References

[1]: Hajdu, M., Hozzová, P., Kovács L., Voronkov A., Wagner, E. M., Žilinčík, R.S. (2025). Synthesis Benchmarks for Automated Reasoning. Under submission to CICM 2025.

[2]: Hozzová, P., Kovács, L., Norman, C., Voronkov, A. (2023). Program Synthesis in Saturation. In: Pientka, B., Tinelli, C. (eds) Automated Deduction – CADE 29. CADE 2023. Lecture Notes in Computer Science(), vol 14132. Springer, Cham. https://doi.org/10.1007/978-3-031-38499-8_18

[3]: Hozzová, P., Amrollahi, D., Hajdu, M., Kovács, L., Voronkov, A., Wagner, E.M. (2024). Synthesis of Recursive Programs in Saturation. In: Benzmüller, C., Heule, M.J., Schmidt, R.A. (eds) Automated Reasoning. IJCAR 2024. Lecture Notes in Computer Science(), vol 14739. Springer, Cham. https://doi.org/10.1007/978-3-031-63498-7_10
