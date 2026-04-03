(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; (I) lim(f(x)) + lim(g(x)) = lim(f(x) + g(x))

(declare-fun absolute (Real) Real)
(declare-fun f (Real) Real)
(declare-fun g (Real) Real)
(declare-const a Real)
(declare-const lf Real)
(declare-const lg Real)
; Axiom 0
(assert (forall ( (x Real) ) (= (absolute x) (ite (>= x 0.0) x (- x)))))

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
                                          (< (absolute (- x a)) delta))
                                     ;
                                     ; | (f x) - lf | < epsilon
                                     (< (absolute (- (f x) lf)) epsilon)
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
(assert (not ; lim[x -> a](+ (f x) (g x)) = (+ lf lg)
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
                                          ; | (+ (f x) (g x)) - (+ lf lg) | < epsilon
                                          (< (absolute (- (+ (f x) (g x)) (+ lf lg))) epsilon)
                 ))
               ))
             ))))

(check-sat)

