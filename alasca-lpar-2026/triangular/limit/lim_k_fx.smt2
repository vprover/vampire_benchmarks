(set-info :smt-lib-version 2.6)
(set-logic AUFNIRA)
; (II) lim(k f(x)) = k lim(f(x))

(declare-fun absolute (Real) Real)
(declare-fun f (Real) Real)
(declare-const a Real)
(declare-const l Real)
(declare-const k Real)
; Axiom 0
(assert (forall ( (x Real) ) (= (absolute x) (ite (>= x 0.0) x (- x)))))

; Axiom 1
(assert ; lim[x -> a](f x) = l
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
                                     ; | (f x) - l | < epsilon
                                     (< (absolute (- (f x) l)) epsilon)
            ))
          ))
        )))


; Conclusion
(assert (not ; lim[x -> a](* k (f x)) = (* k l)
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
                                          ; | (* k (f x)) - (* k l) | < epsilon
                                          (< (absolute (- (* k (f x)) (* k l))) epsilon)
                 ))
               ))
             ))))

(check-sat)

