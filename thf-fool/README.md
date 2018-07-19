# Some THF problems that can be directly expressed in TFX

THF is a subset of the TPTP language for higher-order logic. TFX is a subset of TPTP for FOOL.

Higher-order logic and FOOL coincide in that they both contain first class boolean sort:

* quantification over the boolean sort is allowed and boolean variables can occur as formulas;
* function and predicate symbols can have boolean arguments, and formulas can occur as boolean arguments.

We found 134 THF problems that are only higher-order for their use of booleans. We translated these problems to TFX by

* replacing each occurrence of the keyword `thf` with `tff`,
* replacing every occurrence of a sort definition of the form `s_1 > ... > s_n > s` with `s_1 * ... * s_n > s`,
* replacing every occurrence of a function application of the form `f @ t_1 @ ... @ t_n` with `f(t_1, ..., t_n)`.

Out of these 134 problems, 123 are marked as Theorem and 5 as Unsatisfiable, 5 as CounterSatisfiable,and 1 as Satisfiable. This information is contained in the SZS status of each problem.

We run Vampire with `--mode casc` on the unsatisfiable problems and with `--mode casc_sat` on the satisfiable ones.

These problems were used in the paper [The Vampire and the FOOL](https://dl.acm.org/citation.cfm?doid=2854065.2854071) by E. Kotelnikov, L. Kovacs, G. Reger and A. Voronkov, published at CPP 2016.