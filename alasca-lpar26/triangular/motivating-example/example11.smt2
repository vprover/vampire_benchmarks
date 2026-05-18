(set-info :smt-lib-version 2.6)
(set-logic UFLRA)

(declare-fun f (Real Real) Real)
(declare-fun g (Real) Real)
(declare-const a Real)

(assert (forall ( (x Real) (y Real) ) 
                    (or 
                      (> (f (- (g (* 3.0 x)) (g (+ 84.0 x))) y) (+ (* 2.0 x)        y  ) )
                      (> (f (- x 42.0)                       y) (+        x  (* 2.0 y) ) )
                    )
                 ))

(assert (not  (forall ( (x Real) )
                (exists ( (z Real) ) 
                    (> (f 0 z) x) ))))
(check-sat)

