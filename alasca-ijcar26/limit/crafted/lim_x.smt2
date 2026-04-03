(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; (V) lim[x -> a](x) = a

(declare-fun f (Real) Real)
(declare-const a Real)

; Conclusion
(assert (not ; lim[x -> a]x = a
             ;
             ; forall epsilon > 0
             (forall ((epsilon Real)) (=> (< 0.0 epsilon)
               ;
               ; exists delta > 0
               (exists ( (delta Real) ) (and (< 0.0 delta)
                 (forall ((x Real)) (=> ;
                                               ; a != x
                                          (and (not (= x a))
                                               ; | x - a | < delta
                                               (< (ite (>= (- x a) 0.0) (- x a) (- (- x a))) delta))
                                          ;
                                          ; | x - a | < epsilon
                                          (< (ite (>= (- x a) 0.0) (- x a) (- (- x a))) epsilon)
                 ))
               ))
             ))))

(check-sat)

