# Synthesis benchmarks

This directory contains benchmarks for total function synthesis using uncomputable symbols.
All benchmarks are in $\forall x\exists y. F[x, y]$ format -- i.e., a synthesis problem is encoded as "for all inputs $x$, there exists an output $y$, such that _the relation $F$_ between $x$ and $y$ holds".
We include the benchmarks in an SMT-LIB-like format (`.smt2`), as well as their translations to the SyGuS format (`.sl`), when possible.

Descriptions of subdirectories follows.

## `NR_LIA` and `NR_UF`

These directories contain selected benchmarks from a new comprehensive dataset, which the Vampire team is currently working on, and which will be fully published in the near future.
They use first-order logic (FOL) + linear integer arithmetic (LIA) and unconstrained uninterpreted functions (UF).

The format of the benchmarks is SMT-LIB-like with the following differences:
- to encode the synthesis specification $\forall x_1\in S_1,\dots, x_n\in S_n . \exists y_1\in T_1,\dots, y_m\in T_m . F[\bar{x}, \bar{y}]$, we use:

  `(assert-synth ((x1 S1) ... (xn Sn)) ((y1 T1) ... (ym Tm)) (<SMT-LIB encoding of F>))`

- to mark the symbols $u_1, \dots, u_k$ as uncomputable, we use:

  `(set-option :uncomputable (u1 ... uk))`

Additionally we provide encoding of the benchmarks in SyGuS format.

## `non-recursive` and `recursive`

These benchmarks are using FOL + integer arithmetic (`non-recursive`) or FOL + inductive datatypes (`recursive`).
The `non-recursive` benchmarks were produced for [1], `recursive` for [2].

The format of the benchmarks is SMT-LIB-like with the following differences:
- to encode the synthesis specification $\forall x_1\in S_1,\dots, x_n\in S_n . \exists y_1\in T_1,\dots, y_m\in T_m . F[\bar{x}, \bar{y}]$, we use:

  `(assert-not (forall ((x1 S1) ... (xn Sn)) (exists ((y1 T1) ... (ym Tm)) (<SMT-LIB encoding of F>)))`

- to denote that the symbols $u_1, \dots, u_k$ are uncomputable, we use:

  `(set-option :uncomputable (u1 ... uk))`

Additionally we provide encoding of the benchmarks in SyGuS format.

[1]: Hozzová, P., Kovács, L., Norman, C., Voronkov, A. (2023). Program Synthesis in Saturation. In: Pientka, B., Tinelli, C. (eds) Automated Deduction – CADE 29. CADE 2023. Lecture Notes in Computer Science(), vol 14132. Springer, Cham. https://doi.org/10.1007/978-3-031-38499-8_18

[2]: Hozzová, P., Amrollahi, D., Hajdu, M., Kovács, L., Voronkov, A., Wagner, E.M. (2024). Synthesis of Recursive Programs in Saturation. In: Benzmüller, C., Heule, M.J., Schmidt, R.A. (eds) Automated Reasoning. IJCAR 2024. Lecture Notes in Computer Science(), vol 14739. Springer, Cham. https://doi.org/10.1007/978-3-031-63498-7_10
