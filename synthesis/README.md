# Synthesis benchmarks

This directory contains benchmarks for total function synthesis using uncomputable symbols. The dataset is under submission to CICM 2025.

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

To view only these benchmarks in directories corresponding to the two papers, go to commit [3a1f2a0](https://github.com/vprover/vampire_benchmarks/tree/3a1f2a0cc057564029516771c3739548edcede69/synthesis).

## References

[1]: Hajdu, M., Hozzová, P., Kovács L., Voronkov A., Wagner, E. M., Žilinčík, R.S. (2025). Synthesis Benchmarks for Automated Reasoning. Under submission to CICM 2025.

[2]: Hozzová, P., Kovács, L., Norman, C., Voronkov, A. (2023). Program Synthesis in Saturation. In: Pientka, B., Tinelli, C. (eds) Automated Deduction – CADE 29. CADE 2023. Lecture Notes in Computer Science(), vol 14132. Springer, Cham. https://doi.org/10.1007/978-3-031-38499-8_18

[3]: Hozzová, P., Amrollahi, D., Hajdu, M., Kovács, L., Voronkov, A., Wagner, E.M. (2024). Synthesis of Recursive Programs in Saturation. In: Benzmüller, C., Heule, M.J., Schmidt, R.A. (eds) Automated Reasoning. IJCAR 2024. Lecture Notes in Computer Science(), vol 14739. Springer, Cham. https://doi.org/10.1007/978-3-031-63498-7_10
