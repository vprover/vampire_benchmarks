(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; forall x1...x2. lim[x -> a] t = t
; 
; where t is a random term with 
; - 4 functions with arity in 1..3
; - 8 constants
; - 2 variables
; - 64 number of function applications

(declare-fun f0 (Real Real) Real)
(declare-fun f1 (Real Real Real) Real)
(declare-fun f2 (Real Real) Real)
(declare-fun f3 (Real) Real)
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
(assert (not (forall ( (x0 Real) (x1 Real) ) ; lim[x -> a](f2 (f1 (f1 x1 x0 x1) (f1 (f2 c3 c5) (f2 (f2 (f1 c6 c0 (f1 c5 c6 c4)) (f1 x1 x1 x1)) (f0 (f3 c1) (f0 (f0 c7 x0) (f0 (f1 c7 c3 c0) c3)))) x1) (f0 (f3 c2) c7)) (f1 (f3 (f3 (f1 x1 c0 (f3 c5)))) (f3 (f2 (f0 c7 (f3 (f3 (f1 (f2 (f1 c2 c3 c3) (f3 (f3 x1))) (f3 (f0 x0 (f0 x1 x1))) c7)))) (f3 (f2 (f3 (f1 (f2 (f0 c4 x0) (f3 c4)) (f3 c1) (f2 (f3 c4) (f1 c6 x1 c7)))) (f3 (f0 (f2 (f1 c7 c6 (f1 c4 c7 c0)) c1) (f2 (f0 (f1 c3 c0 c1) c5) (f3 (f0 c2 x0))))))))) (f3 (f3 (f1 (f0 (f3 x1) (f3 c6)) (f0 x0 c6) x0))))) = (f2 (f1 (f1 x1 x0 x1) (f1 (f2 c3 c5) (f2 (f2 (f1 c6 c0 (f1 c5 c6 c4)) (f1 x1 x1 x1)) (f0 (f3 c1) (f0 (f0 c7 x0) (f0 (f1 c7 c3 c0) c3)))) x1) (f0 (f3 c2) c7)) (f1 (f3 (f3 (f1 x1 c0 (f3 c5)))) (f3 (f2 (f0 c7 (f3 (f3 (f1 (f2 (f1 c2 c3 c3) (f3 (f3 x1))) (f3 (f0 x0 (f0 x1 x1))) c7)))) (f3 (f2 (f3 (f1 (f2 (f0 c4 x0) (f3 c4)) (f3 c1) (f2 (f3 c4) (f1 c6 x1 c7)))) (f3 (f0 (f2 (f1 c7 c6 (f1 c4 c7 c0)) c1) (f2 (f0 (f1 c3 c0 c1) c5) (f3 (f0 c2 x0))))))))) (f3 (f3 (f1 (f0 (f3 x1) (f3 c6)) (f0 x0 c6) x0)))))
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
                                          ; | (f2 (f1 (f1 x1 x0 x1) (f1 (f2 c3 c5) (f2 (f2 (f1 c6 c0 (f1 c5 c6 c4)) (f1 x1 x1 x1)) (f0 (f3 c1) (f0 (f0 c7 x0) (f0 (f1 c7 c3 c0) c3)))) x1) (f0 (f3 c2) c7)) (f1 (f3 (f3 (f1 x1 c0 (f3 c5)))) (f3 (f2 (f0 c7 (f3 (f3 (f1 (f2 (f1 c2 c3 c3) (f3 (f3 x1))) (f3 (f0 x0 (f0 x1 x1))) c7)))) (f3 (f2 (f3 (f1 (f2 (f0 c4 x0) (f3 c4)) (f3 c1) (f2 (f3 c4) (f1 c6 x1 c7)))) (f3 (f0 (f2 (f1 c7 c6 (f1 c4 c7 c0)) c1) (f2 (f0 (f1 c3 c0 c1) c5) (f3 (f0 c2 x0))))))))) (f3 (f3 (f1 (f0 (f3 x1) (f3 c6)) (f0 x0 c6) x0))))) - (f2 (f1 (f1 x1 x0 x1) (f1 (f2 c3 c5) (f2 (f2 (f1 c6 c0 (f1 c5 c6 c4)) (f1 x1 x1 x1)) (f0 (f3 c1) (f0 (f0 c7 x0) (f0 (f1 c7 c3 c0) c3)))) x1) (f0 (f3 c2) c7)) (f1 (f3 (f3 (f1 x1 c0 (f3 c5)))) (f3 (f2 (f0 c7 (f3 (f3 (f1 (f2 (f1 c2 c3 c3) (f3 (f3 x1))) (f3 (f0 x0 (f0 x1 x1))) c7)))) (f3 (f2 (f3 (f1 (f2 (f0 c4 x0) (f3 c4)) (f3 c1) (f2 (f3 c4) (f1 c6 x1 c7)))) (f3 (f0 (f2 (f1 c7 c6 (f1 c4 c7 c0)) c1) (f2 (f0 (f1 c3 c0 c1) c5) (f3 (f0 c2 x0))))))))) (f3 (f3 (f1 (f0 (f3 x1) (f3 c6)) (f0 x0 c6) x0))))) | < epsilon
                                          (< (ite (>= (- (f2 (f1 (f1 x1 x0 x1) (f1 (f2 c3 c5) (f2 (f2 (f1 c6 c0 (f1 c5 c6 c4)) (f1 x1 x1 x1)) (f0 (f3 c1) (f0 (f0 c7 x0) (f0 (f1 c7 c3 c0) c3)))) x1) (f0 (f3 c2) c7)) (f1 (f3 (f3 (f1 x1 c0 (f3 c5)))) (f3 (f2 (f0 c7 (f3 (f3 (f1 (f2 (f1 c2 c3 c3) (f3 (f3 x1))) (f3 (f0 x0 (f0 x1 x1))) c7)))) (f3 (f2 (f3 (f1 (f2 (f0 c4 x0) (f3 c4)) (f3 c1) (f2 (f3 c4) (f1 c6 x1 c7)))) (f3 (f0 (f2 (f1 c7 c6 (f1 c4 c7 c0)) c1) (f2 (f0 (f1 c3 c0 c1) c5) (f3 (f0 c2 x0))))))))) (f3 (f3 (f1 (f0 (f3 x1) (f3 c6)) (f0 x0 c6) x0))))) (f2 (f1 (f1 x1 x0 x1) (f1 (f2 c3 c5) (f2 (f2 (f1 c6 c0 (f1 c5 c6 c4)) (f1 x1 x1 x1)) (f0 (f3 c1) (f0 (f0 c7 x0) (f0 (f1 c7 c3 c0) c3)))) x1) (f0 (f3 c2) c7)) (f1 (f3 (f3 (f1 x1 c0 (f3 c5)))) (f3 (f2 (f0 c7 (f3 (f3 (f1 (f2 (f1 c2 c3 c3) (f3 (f3 x1))) (f3 (f0 x0 (f0 x1 x1))) c7)))) (f3 (f2 (f3 (f1 (f2 (f0 c4 x0) (f3 c4)) (f3 c1) (f2 (f3 c4) (f1 c6 x1 c7)))) (f3 (f0 (f2 (f1 c7 c6 (f1 c4 c7 c0)) c1) (f2 (f0 (f1 c3 c0 c1) c5) (f3 (f0 c2 x0))))))))) (f3 (f3 (f1 (f0 (f3 x1) (f3 c6)) (f0 x0 c6) x0)))))) 0.0) (- (f2 (f1 (f1 x1 x0 x1) (f1 (f2 c3 c5) (f2 (f2 (f1 c6 c0 (f1 c5 c6 c4)) (f1 x1 x1 x1)) (f0 (f3 c1) (f0 (f0 c7 x0) (f0 (f1 c7 c3 c0) c3)))) x1) (f0 (f3 c2) c7)) (f1 (f3 (f3 (f1 x1 c0 (f3 c5)))) (f3 (f2 (f0 c7 (f3 (f3 (f1 (f2 (f1 c2 c3 c3) (f3 (f3 x1))) (f3 (f0 x0 (f0 x1 x1))) c7)))) (f3 (f2 (f3 (f1 (f2 (f0 c4 x0) (f3 c4)) (f3 c1) (f2 (f3 c4) (f1 c6 x1 c7)))) (f3 (f0 (f2 (f1 c7 c6 (f1 c4 c7 c0)) c1) (f2 (f0 (f1 c3 c0 c1) c5) (f3 (f0 c2 x0))))))))) (f3 (f3 (f1 (f0 (f3 x1) (f3 c6)) (f0 x0 c6) x0))))) (f2 (f1 (f1 x1 x0 x1) (f1 (f2 c3 c5) (f2 (f2 (f1 c6 c0 (f1 c5 c6 c4)) (f1 x1 x1 x1)) (f0 (f3 c1) (f0 (f0 c7 x0) (f0 (f1 c7 c3 c0) c3)))) x1) (f0 (f3 c2) c7)) (f1 (f3 (f3 (f1 x1 c0 (f3 c5)))) (f3 (f2 (f0 c7 (f3 (f3 (f1 (f2 (f1 c2 c3 c3) (f3 (f3 x1))) (f3 (f0 x0 (f0 x1 x1))) c7)))) (f3 (f2 (f3 (f1 (f2 (f0 c4 x0) (f3 c4)) (f3 c1) (f2 (f3 c4) (f1 c6 x1 c7)))) (f3 (f0 (f2 (f1 c7 c6 (f1 c4 c7 c0)) c1) (f2 (f0 (f1 c3 c0 c1) c5) (f3 (f0 c2 x0))))))))) (f3 (f3 (f1 (f0 (f3 x1) (f3 c6)) (f0 x0 c6) x0)))))) (- (- (f2 (f1 (f1 x1 x0 x1) (f1 (f2 c3 c5) (f2 (f2 (f1 c6 c0 (f1 c5 c6 c4)) (f1 x1 x1 x1)) (f0 (f3 c1) (f0 (f0 c7 x0) (f0 (f1 c7 c3 c0) c3)))) x1) (f0 (f3 c2) c7)) (f1 (f3 (f3 (f1 x1 c0 (f3 c5)))) (f3 (f2 (f0 c7 (f3 (f3 (f1 (f2 (f1 c2 c3 c3) (f3 (f3 x1))) (f3 (f0 x0 (f0 x1 x1))) c7)))) (f3 (f2 (f3 (f1 (f2 (f0 c4 x0) (f3 c4)) (f3 c1) (f2 (f3 c4) (f1 c6 x1 c7)))) (f3 (f0 (f2 (f1 c7 c6 (f1 c4 c7 c0)) c1) (f2 (f0 (f1 c3 c0 c1) c5) (f3 (f0 c2 x0))))))))) (f3 (f3 (f1 (f0 (f3 x1) (f3 c6)) (f0 x0 c6) x0))))) (f2 (f1 (f1 x1 x0 x1) (f1 (f2 c3 c5) (f2 (f2 (f1 c6 c0 (f1 c5 c6 c4)) (f1 x1 x1 x1)) (f0 (f3 c1) (f0 (f0 c7 x0) (f0 (f1 c7 c3 c0) c3)))) x1) (f0 (f3 c2) c7)) (f1 (f3 (f3 (f1 x1 c0 (f3 c5)))) (f3 (f2 (f0 c7 (f3 (f3 (f1 (f2 (f1 c2 c3 c3) (f3 (f3 x1))) (f3 (f0 x0 (f0 x1 x1))) c7)))) (f3 (f2 (f3 (f1 (f2 (f0 c4 x0) (f3 c4)) (f3 c1) (f2 (f3 c4) (f1 c6 x1 c7)))) (f3 (f0 (f2 (f1 c7 c6 (f1 c4 c7 c0)) c1) (f2 (f0 (f1 c3 c0 c1) c5) (f3 (f0 c2 x0))))))))) (f3 (f3 (f1 (f0 (f3 x1) (f3 c6)) (f0 x0 c6) x0)))))))) epsilon)
                 ))
               ))
             )))))

(check-sat)

