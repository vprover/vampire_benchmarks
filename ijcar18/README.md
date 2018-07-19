# Experiments with Encoding of the Next State Relations of Imperative Programs

The problems in this collection encode partial correctness properties of simple [Boogie](https://www.microsoft.com/en-us/research/project/boogie-an-intermediate-verification-language/) programs. We generated these problems from a collection of 50 Boogie programs, annotated with pre and post-conditions, using Boogie itself, [Voogie](https://github.com/aztek/voogie) and [BLT](https://github.com/emptylambda/BLT).

All problems in this collection are unsatisfiable and use the theory of arrays and linear integer arithmetics. The problems in `boogie` are written in SMT-LIB. The problems in `voogie` are written in TPTP and make heavy use of features of FOOL, namely, first class boolean sort, `if-then-else` and `let-in` with tuple definitions. The problems in `blt` are written in TPTP and somewhat rely on FOOL.

Vampire was run on all of these problems with the options `-t 5m --newcnf on -tha some -sas z3`. On SMT-LIB problems Vampire was run with `--input_syntax smtlib2`.

These problems were used in the paper [A FOOLish Encoding of the Next State Relations of Imperative Programs](https://link.springer.com/chapter/10.1007/978-3-319-94205-6_27) by E. Kotelnikov, L. Kovacs and A. Voronkov, published at IJCAR 2018. See the paper for motivation for these experiments and details on the translation.

The latest revision of Vampire tested on these problems is `f28e0f3` in the `master` branch.