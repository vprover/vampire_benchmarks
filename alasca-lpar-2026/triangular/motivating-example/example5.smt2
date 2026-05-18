
; master can't find a solution in protfolio mode within 100 sec

(set-info :smt-lib-version 2.6)
(set-logic UFLRA)

(declare-fun f (Real Real) Real)
(declare-fun t (Real) Real)

; 1. forall x,y. f(2 x,y) > x + 2 y \/ f(x + 1, y) > 2 x + y
(assert (forall ( (x Real) (y Real) ) 
                    (or 
                      (> (f (* 2 x) y) (+ (* 2.0 x)        y  ) )
                      (> (f (+ x 1) y) (+        x  (* 2.0 y) ) )
                    )
                 ))

; 2. exists k. forall x. exists z. f(k,z) > x
(assert (not  (exists ( (k Real) )
                 (forall ( (x Real) )
                      (exists ( (z Real) ) 
                              (> (f k z) x) )))))
(check-sat)

