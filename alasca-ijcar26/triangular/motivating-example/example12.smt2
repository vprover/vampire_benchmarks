(set-info :smt-lib-version 2.6)
(set-logic UFLRA)

(declare-fun f (Real Real) Real)
(declare-fun g (Real) Real)
(declare-const a Real)

(assert (forall ( (x Real) (y Real) ) 
                    (or 
                      (> (f (+ (g x) (g a)) y) (+ (* 2.0 x)        y  ) )
                      (> (f (* 2.0   (g x)) y) (+        x  (* 2.0 y) ) )
                    )
                 ))

(assert (not (exists ( (k Real) )
                 (forall ( (x Real) )
                      (exists ( (z Real) ) 
                              (> (f (* 2.0 (g k)) z) x) )))))
(check-sat)

