(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; (I) lim(f(x)) + lim(g(x)) = lim(f(x) + g(x))

(declare-fun f (Real) Real)
(declare-fun g (Real) Real)
(declare-const a Real)
(declare-const lf Real)
(declare-const lg Real)
; Axiom 0
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

; Axiom 1
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
                                               (< (ite (>= (- x a) 0.0) (- x a) (- (- x a))) delta))
                                          ;
                                          ; | (+ (f x) (g x)) - (+ lf lg) | < epsilon
                                          (< (ite (>= (- (+ (f x) (g x)) (+ lf lg)) 0.0) (- (+ (f x) (g x)) (+ lf lg)) (- (- (+ (f x) (g x)) (+ lf lg)))) epsilon)
                 ))
               ))
             ))))

(check-sat)

