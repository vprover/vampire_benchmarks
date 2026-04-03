(set-info :smt-lib-version 2.6)
(set-logic UFLRA)

(declare-fun f (Real Real) Real)
(declare-fun g (Real Real) Real)

; f(x,y)  > x + y
; ---------------
; exists z. f(x,z) > y

; 1. g(x,y) > 2 x + y
(assert (forall ( (x Real) (y Real) ) 
                    (> (g x y) (+ (* 2.0 x) y) )
                 ))

; 2.  f(x,y) > 7 -  g(x,y)
(assert (forall ( (x Real) (y Real) ) 
                    (> (f x y) (+ 7.0 (g x y)) )
                 ))

; 3.  ~(forall x, y.exists z.   f(x,z) > y)
(assert (not  (forall ( (x Real) 
                        (y Real) )
                      (exists ( (z Real) ) 
                              (> (f x z) y) ))))

(check-sat)
