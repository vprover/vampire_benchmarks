(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; forall x1...x2. lim[x -> a] t = t
; 
; where t is a random term with 
; - 4 functions with arity in 1..3
; - 8 constants
; - 2 variables
; - 16 number of function applications

(declare-fun f0 (Real Real) Real)
(declare-fun f1 (Real) Real)
(declare-fun f2 (Real Real) Real)
(declare-fun f3 (Real Real Real) Real)
(declare-const c0 Real)
(declare-const c1 Real)
(declare-const c2 Real)
(declare-const c3 Real)
(declare-const c4 Real)
(declare-const c5 Real)
(declare-const c6 Real)
(declare-const c7 Real)
(declare-const a Real)

; Conclusion
(assert (not (forall ( (x0 Real) (x1 Real) ) ; lim[x -> a](f1 (f0 (f2 (f2 (f2 (f2 (f1 (f0 (f2 c0 x1) c2)) c0) x0) (f0 c6 c7)) (f2 x1 c0)) (f0 (f1 (f3 c1 c5 (f2 c0 (f2 c4 x1)))) c2))) = (f1 (f0 (f2 (f2 (f2 (f2 (f1 (f0 (f2 c0 x1) c2)) c0) x0) (f0 c6 c7)) (f2 x1 c0)) (f0 (f1 (f3 c1 c5 (f2 c0 (f2 c4 x1)))) c2)))
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
                                          ; | (f1 (f0 (f2 (f2 (f2 (f2 (f1 (f0 (f2 c0 x1) c2)) c0) x0) (f0 c6 c7)) (f2 x1 c0)) (f0 (f1 (f3 c1 c5 (f2 c0 (f2 c4 x1)))) c2))) - (f1 (f0 (f2 (f2 (f2 (f2 (f1 (f0 (f2 c0 x1) c2)) c0) x0) (f0 c6 c7)) (f2 x1 c0)) (f0 (f1 (f3 c1 c5 (f2 c0 (f2 c4 x1)))) c2))) | < epsilon
                                          (< (ite (>= (- (f1 (f0 (f2 (f2 (f2 (f2 (f1 (f0 (f2 c0 x1) c2)) c0) x0) (f0 c6 c7)) (f2 x1 c0)) (f0 (f1 (f3 c1 c5 (f2 c0 (f2 c4 x1)))) c2))) (f1 (f0 (f2 (f2 (f2 (f2 (f1 (f0 (f2 c0 x1) c2)) c0) x0) (f0 c6 c7)) (f2 x1 c0)) (f0 (f1 (f3 c1 c5 (f2 c0 (f2 c4 x1)))) c2)))) 0.0) (- (f1 (f0 (f2 (f2 (f2 (f2 (f1 (f0 (f2 c0 x1) c2)) c0) x0) (f0 c6 c7)) (f2 x1 c0)) (f0 (f1 (f3 c1 c5 (f2 c0 (f2 c4 x1)))) c2))) (f1 (f0 (f2 (f2 (f2 (f2 (f1 (f0 (f2 c0 x1) c2)) c0) x0) (f0 c6 c7)) (f2 x1 c0)) (f0 (f1 (f3 c1 c5 (f2 c0 (f2 c4 x1)))) c2)))) (- (- (f1 (f0 (f2 (f2 (f2 (f2 (f1 (f0 (f2 c0 x1) c2)) c0) x0) (f0 c6 c7)) (f2 x1 c0)) (f0 (f1 (f3 c1 c5 (f2 c0 (f2 c4 x1)))) c2))) (f1 (f0 (f2 (f2 (f2 (f2 (f1 (f0 (f2 c0 x1) c2)) c0) x0) (f0 c6 c7)) (f2 x1 c0)) (f0 (f1 (f3 c1 c5 (f2 c0 (f2 c4 x1)))) c2)))))) epsilon)
                 ))
               ))
             )))))

(check-sat)

