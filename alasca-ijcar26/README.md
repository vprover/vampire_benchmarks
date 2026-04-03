# ALASCA Selection & Simplification Benchmarks (IJCAR26)

This directory contains benchmarks used in the paper [1], currently under submission in IJCAR26.
The benchmark set is the same as the one used in [2], and contains some parts of SMT-LIB (LRA, NRA, and UFLRA), the benchmark set SH from [3], as well as the benchmark sets limit and triangular that were created for [2].

In the paper [1] vampire is run in two different configurations on these benchmarks:

- `ALASCA0`: Configuration matching the one used in the original ALASCA paper [2].
  - commit: `bb6af541c`
  - command: `vampire --ignore_unrecognized_logic on --input_syntax smtlib2 --mode portfolio -viras off -alascai off -sched smtcomp -alasca on -to qkbo -uwa alasca_main -alascadf off -alascadb off --cores 4 --time_limit 120 <benchmark>`
- `ALASCAsel`: Configuration including the new techniques introduced in [1]. It uses the portfolio file `porfolio-ijcar26` provided in this directory and which needs to be in scope when running the command.
  - commit: `0fdff99f6`
  - command: `vampire --mode portfolio -sched file -viras off -viras off --schedule_file portfolio-ijcar26 --cores 4 --time_limit 120 <benchmark>`


[1]: Konstantin Korovin, Laura Kovács, Johannes Schoisswohl, Andrei Voronkov: Enhancing Superposition Reasoning in Linear Real Arithmetic through Selection and Simplification. Under Submission

[2]: Konstantin Korovin, Laura Kovács, Giles Reger, Johannes Schoisswohl, Andrei Voronkov: ALASCA: Reasoning in Quantified Linear Arithmetic. TACAS (1) 2023: 647-665

[3]: Martin Desharnais, Petar Vukmirovic, Jasmin Blanchette, Makarius Wenzel: Seventeen Provers Under the Hammer. ITP 2022: 8:1-8:18
