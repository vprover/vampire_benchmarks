(set-info :smt-lib-version 2.6)
(set-logic UFLRA)

(declare-fun f (Real Real) Real)

; 1. f(x,y) > x + 2 y \/ f(x, y) > 2 x + y
(assert (forall ( (x Real) (y Real) ) 
                    (or 
                      (> (f x y) (+ (* 2.0 x) y) )
                      (> (f x y) (+ x (* 2.0 y)) )
                    )
                 ))

; 2. exists z. f(x,z) > y
(assert (not  (forall ( (x Real) 
                        (y Real) )
                      (exists ( (z Real) ) 
                              (> (f x z) y) ))))

(check-sat)
