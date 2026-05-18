(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; (IV) lim[x -> a](c) = c

(declare-fun f (Real) Real)
(declare-const a Real)
(declare-const c Real)

; Conclusion
(assert (not ; lim[x -> a]c = c
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
                                          ; | c - c | < epsilon
                                          (< (ite (>= (- c c) 0.0) (- c c) (- (- c c))) epsilon)
                 ))
               ))
             ))))

(check-sat)

