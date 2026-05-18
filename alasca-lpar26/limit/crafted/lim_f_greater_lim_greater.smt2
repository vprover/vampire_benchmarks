(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; (V) f(x) > g(x) => lim[x -> a] f(x) > lim[x -> a] g(x)

(declare-fun f (Real) Real)
(declare-fun g (Real) Real)
(declare-const a Real)
(declare-const lg Real)
(declare-const lf Real)
; Axiom 0
(assert (forall ( (x Real) ) (> (f x) (g x))))

; Axiom 1
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
                                          (< (ite (>= (- x a) 0.0) (- x a) (- (- x a))) delta))
                                     ;
                                     ; | (f x) - lf | < epsilon
                                     (< (ite (>= (- (f x) lf) 0.0) (- (f x) lf) (- (- (f x) lf))) epsilon)
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
                                          (< (ite (>= (- x a) 0.0) (- x a) (- (- x a))) delta))
                                     ;
                                     ; | (g x) - lg | < epsilon
                                     (< (ite (>= (- (g x) lg) 0.0) (- (g x) lg) (- (- (g x) lg))) epsilon)
            ))
          ))
        )))


; Conclusion
(assert (not (> lf lg)))

(check-sat)

