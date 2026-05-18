(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; (V) f(x) > g(x) => lim[x -> a] f(x) > lim[x -> a] g(x)

(declare-fun absolute (Real) Real)
(declare-fun f (Real) Real)
(declare-fun g (Real) Real)
(declare-const a Real)
(declare-const lg Real)
(declare-const lf Real)
; Axiom 0
(assert (forall ( (x Real) ) (= (absolute x) (ite (>= x 0.0) x (- x)))))

; Axiom 1
(assert (forall ( (x Real) ) (> (f x) (g x))))

; Axiom 2
(assert ; lim[x -> a](f x) = lf
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
                                     ; | (f x) - lf | < epsilon
                                     (< (absolute (- (f x) lf)) epsilon)
            ))
          ))
        )))

; Axiom 3
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
(assert (not (> lf lg)))

(check-sat)

