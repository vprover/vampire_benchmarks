(set-info :smt-lib-version 2.6)
(set-logic LRA)
(set-info :source |
   Monniaux, David; Quantifier Elimination by Lazy Model Enumeration, CAV 2010
|)
(set-info :category "random")
; ./Mjollnir_examples/B3/formula_058.m
(set-info :status unsat)
(assert
 (forall ((|v11:0| Real) )(forall ((|v10:1| Real) )(forall ((|v9:2| Real) )(forall ((|v8:3| Real) )(exists ((|v7:4| Real) )(exists ((|v6:5| Real) )(exists ((|v5:6| Real) )(exists ((|v4:7| Real) )(forall ((|v3:8| Real) )(forall ((|v2:9| Real) )(forall ((|v1:10| Real) )(forall ((|v0:11| Real) )(let ((?x21 (+ (+ (* (- 2) |v10:1|) (* 7 |v4:7|)) (* (- 5) |v5:6|))))
(<= (+ ?x21 (* 2 |v2:9|)) (- 9))))
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

