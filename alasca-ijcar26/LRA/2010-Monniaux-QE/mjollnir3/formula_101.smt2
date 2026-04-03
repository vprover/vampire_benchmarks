(set-info :smt-lib-version 2.6)
(set-logic LRA)
(set-info :source |
   Monniaux, David; Quantifier Elimination by Lazy Model Enumeration, CAV 2010
|)
(set-info :category "random")
; ./Mjollnir_examples/B3/formula_101.m
(set-info :status unsat)
(assert
 (forall ((|v11:0| Real) )(forall ((|v10:1| Real) )(forall ((|v9:2| Real) )(forall ((|v8:3| Real) )(exists ((|v7:4| Real) )(exists ((|v6:5| Real) )(exists ((|v5:6| Real) )(exists ((|v4:7| Real) )(forall ((|v3:8| Real) )(forall ((|v2:9| Real) )(forall ((|v1:10| Real) )(forall ((|v0:11| Real) )(let ((?x37 (+ (+ (* 17 |v6:5|) (* 9 |v10:1|)) (* (- 8) |v8:3|))))
(let ((?x23 (+ (+ (+ |v7:4| (* 3 |v6:5|)) (* 17 |v3:8|)) (* (- 5) |v5:6|))))
(or (<= ?x23 (- 7)) (<= (+ ?x37 (* (- 17) |v0:11|)) (- 13))))))
)
)
)
)
)
)
)
)
)
)
)
)
(check-sat)
(exit)

