# Benchmarks for synthesis of recursive functions

These benchmarks are meant to be run with the [`synthesis-recursive` branch of Vampire](https://github.com/vprover/vampire/tree/synthesis-recursive).

For the benchmarks `nat-add_assoc.smt2`, `nat-double.smt2`, `nat-double_even.smt2`, `list-last_elem.smt2`, `list-len_concat.smt2`, use the following configuration:
```
./vampire --forced_options ind=struct:indu=off:qa=synthesis:tgt=off:erd=off:updr=off:indc=goal:indmd=1 <benchmark.smt2>
```
For the benchmark `nat-subtraction.smt2`, use:
```
./vampire --decode lrs+1011_2:5_av=off:bs=unit_only:erd=off:ind=struct:indmd=1:indu=off:nwc=5.0:plsq=on:qa=synthesis:tgt=off:updr=off_300 nat-subtraction.smt2
```

Vampire solves these benchmarks (i.e., proves the problem and synthesizes and a correct solution) well within one second.

The current implementation does not solve the benchmarks `nat-division.smt2`, `nat-root.smt2`, `list-max_elem.smt2`, `list-prefix_given_suffix.smt2`, `tree-max_elem.smt2`.
