(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; (VI) lim[x -> a](lim[y -> b])(f(x, y)) = lim[y -> b](lim[x -> a])(f(x, y))

(declare-fun f (Real Real) Real)
(declare-fun fa (Real) Real)
(declare-fun fb (Real) Real)
(declare-const a Real)
(declare-const b Real)
(declare-const lxy Real)
(declare-const lyx Real)
; Axiom 0
(assert (forall ( (y Real) ) ; lim[x -> a](f x y) = (fa y)
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
                                     ; | (f x y) - (fa y) | < epsilon
                                     (< (ite (>= (- (f x y) (fa y)) 0.0) (- (f x y) (fa y)) (- (- (f x y) (fa y)))) epsilon)
            ))
          ))
        ))))

; Axiom 1
(assert ; lim[y -> b](fa y) = lxy
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((y Real)) (=> ;
                                          ; b != y
                                     (and (not (= y b))
                                          ; | y - b | < delta
                                          (< (ite (>= (- y b) 0.0) (- y b) (- (- y b))) delta))
                                     ;
                                     ; | (fa y) - lxy | < epsilon
                                     (< (ite (>= (- (fa y) lxy) 0.0) (- (fa y) lxy) (- (- (fa y) lxy))) epsilon)
            ))
          ))
        )))

; Axiom 2
(assert (forall ( (x Real) ) ; lim[y -> b](f x y) = (fb x)
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((y Real)) (=> ;
                                          ; b != y
                                     (and (not (= y b))
                                          ; | y - b | < delta
                                          (< (ite (>= (- y b) 0.0) (- y b) (- (- y b))) delta))
                                     ;
                                     ; | (f x y) - (fb x) | < epsilon
                                     (< (ite (>= (- (f x y) (fb x)) 0.0) (- (f x y) (fb x)) (- (- (f x y) (fb x)))) epsilon)
            ))
          ))
        ))))

; Axiom 3
(assert ; lim[x -> a](fb x) = lyx
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
                                     ; | (fb x) - lyx | < epsilon
                                     (< (ite (>= (- (fb x) lyx) 0.0) (- (fb x) lyx) (- (- (fb x) lyx))) epsilon)
            ))
          ))
        )))


; Conclusion
(assert (not (= lxy lyx)))

(check-sat)

