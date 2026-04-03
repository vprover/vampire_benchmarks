(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; lim(-6/88 f(x)) = -6/88 lim(f(x))

(declare-fun f (Real) Real)
(declare-fun g (Real) Real)
(declare-const a Real)
(declare-const l Real)
; Axiom 0
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
                                          (< (ite (>= (- x a) 0.0) (- x a) (- (- x a))) delta))
                                     ;
                                     ; | (f x) - l | < epsilon
                                     (< (ite (>= (- (f x) l) 0.0) (- (f x) l) (- (- (f x) l))) epsilon)
            ))
          ))
        )))


; Conclusion
(assert (not ; lim[x -> a](* (- (/ 6.0 88.0)) (f x)) = (* (- (/ 6.0 88.0)) l)
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
                                          ; | (* (- (/ 6.0 88.0)) (f x)) - (* (- (/ 6.0 88.0)) l) | < epsilon
                                          (< (ite (>= (- (* (- (/ 6.0 88.0)) (f x)) (* (- (/ 6.0 88.0)) l)) 0.0) (- (* (- (/ 6.0 88.0)) (f x)) (* (- (/ 6.0 88.0)) l)) (- (- (* (- (/ 6.0 88.0)) (f x)) (* (- (/ 6.0 88.0)) l)))) epsilon)
                 ))
               ))
             ))))

(check-sat)

