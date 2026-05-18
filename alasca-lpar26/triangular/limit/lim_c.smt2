(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; (IV) lim[x -> a](c) = c

(declare-fun absolute (Real) Real)
(declare-fun f (Real) Real)
(declare-const a Real)
(declare-const c Real)
; Axiom 0
(assert (forall ( (x Real) ) (= (absolute x) (ite (>= x 0.0) x (- x)))))


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
                                               (< (absolute (- x a)) delta))
                                          ;
                                          ; | c - c | < epsilon
                                          (< (absolute (- c c)) epsilon)
                 ))
               ))
             ))))

(check-sat)

