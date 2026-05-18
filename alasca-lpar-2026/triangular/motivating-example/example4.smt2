
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

; 2. forall x. exists z. f(2,z) > x
(assert (not  (forall ( (x Real) )
                      (exists ( (z Real) ) 
                              (> (f 2 z) x) ))))
(check-sat)

; 9. -f(2,y) + sK0  >= 0 [theory normalization 7]
; 10. f(2 y,x) - 2 y - x > 0 | f(1 + y,x) - y - 2 x > 0 [theory normalization 8]
; --------------------------------------------------------------------------------------------------------------
; 14. f(2 x,y) - 2 x - y > 0 | y + 2 x - 2 y - x > 0 | 2 x != 1 + x [lasca inequality literal factoring 10]
;                                                      ^^^^^^^^^^^^<- constraint 
; 17. f(2 x,y) - 2 x - y > 0 | x - y > 0 | 0 != x - 1 [lasca normalization 14]
; 19. -2 x + -y + sK0 > 0 | x - y > 0 | 0 != x - 1 | 2 != 2 x [lasca fourier motzkin 17,9]
; 21. -2 x + -y + sK0 > 0 | x - y > 0 | 0 != x - 1 | 0 != x - 1 [lasca normalization 19]
; 22. -2 x + -y + sK0 > 0 | x - y > 0 | 0 != x - 1              [duplicate literal removal 21]
; 23.                                   0 != x - 1              [lasca variable elimination 22]
; 24. $false                                                    [lasca variable elimination 23]
