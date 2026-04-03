(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; (III) lim[x -> a](f(g(x))) = lim[x -> lim[x -> a](g(x))](f(x))

(declare-fun f (Real) Real)
(declare-fun g (Real) Real)
(declare-const a Real)
(declare-const l Real)
(declare-const lg Real)
; Axiom 0
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
                                          (< (ite (>= (- x a) 0.0) (- x a) (- (- x a))) delta))
                                     ;
                                     ; | (f (g x)) - l | < epsilon
                                     (< (ite (>= (- (f (g x)) l) 0.0) (- (f (g x)) l) (- (- (f (g x)) l))) epsilon)
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
                                               (< (ite (>= (- x lg) 0.0) (- x lg) (- (- x lg))) delta))
                                          ;
                                          ; | (f x) - l | < epsilon
                                          (< (ite (>= (- (f x) l) 0.0) (- (f x) l) (- (- (f x) l))) epsilon)
                 ))
               ))
             ))))

(check-sat)

