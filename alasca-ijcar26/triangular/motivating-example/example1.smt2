(set-info :smt-lib-version 2.6)
(set-logic UFLRA)

(declare-fun f (Real Real) Real)

; f(x,y)  > x + y
; ---------------
; exists z. f(x,z) > y

; 1. f(x,y) > x + y
(assert (forall ( (x Real) (y Real) ) 
                    (> (f x y) (+ x y) )
                 ))

; 2.  ~(forall x, y.exists z.   f(x,z) > y)
(assert (not  (forall ( (x Real) 
                        (y Real) )
                      (exists ( (z Real) ) 
                              (> (f x z) y) ))))

(check-sat)
