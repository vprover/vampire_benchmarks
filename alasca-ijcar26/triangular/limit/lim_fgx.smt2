(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; (III) lim[x -> a](f(g(x))) = lim[x -> lim[x -> a](g(x))](f(x))

(declare-fun absolute (Real) Real)
(declare-fun f (Real) Real)
(declare-fun g (Real) Real)
(declare-const a Real)
(declare-const l Real)
(declare-const lg Real)
; Axiom 0
(assert (forall ( (x Real) ) (= (absolute x) (ite (>= x 0.0) x (- x)))))

; Axiom 1
(assert ; lim[x -> a](f (g x)) = l
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
                                     ; | (f (g x)) - l | < epsilon
                                     (< (absolute (- (f (g x)) l)) epsilon)
            ))
          ))
        )))

; Axiom 2
(assert ; lim[x -> a](g x) = lg
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
                                     ; | (g x) - lg | < epsilon
                                     (< (absolute (- (g x) lg)) epsilon)
            ))
          ))
        )))


; Conclusion
(assert (not ; lim[x -> lg](f x) = l
             ;
             ; forall epsilon > 0
             (forall ((epsilon Real)) (=> (< 0.0 epsilon)
               ;
               ; exists delta > 0
               (exists ( (delta Real) ) (and (< 0.0 delta)
                 (forall ((x Real)) (=> ;
                                               ; lg != x
                                          (and (not (= x lg))
                                               ; | x - lg | < delta
                                               (< (absolute (- x lg)) delta))
                                          ;
                                          ; | (f x) - l | < epsilon
                                          (< (absolute (- (f x) l)) epsilon)
                 ))
               ))
             ))))

(check-sat)

