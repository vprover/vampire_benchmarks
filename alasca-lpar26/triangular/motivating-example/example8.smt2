(set-info :smt-lib-version 2.6)
(set-logic UFLRA)

(declare-fun f (Real Real) Real)
(declare-fun g (Real) Real)
(declare-const a Real)

(assert (forall ( (x Real) (y Real) ) 
                    (or 
                      (> (f (+ (*  58.0 (g x)) (* 42.0 (g a) ))  y) (+ (* 2.0 x)        y  ) )
                      (> (f    (* 100.0 (g x))                   y) (+        x  (* 2.0 y) ) )
                    )
                 ))

(assert (not  (exists ( (k Real) )
                 (forall ( (x Real) )
                      (exists ( (z Real) ) 
                              (> (f k z) x) )))))
(check-sat)

