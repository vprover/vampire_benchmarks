(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; forall x1...x8. lim[x -> a] t = t
; 
; where t is a random term with 
; - 4 functions with arity in 1..3
; - 8 constants
; - 8 variables
; - 64 number of function applications

(declare-fun f0 (Real Real) Real)
(declare-fun f1 (Real Real Real) Real)
(declare-fun f2 (Real Real Real) Real)
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
(assert (not (forall ( (x0 Real) (x1 Real) (x2 Real) (x3 Real) (x4 Real) (x5 Real) (x6 Real) (x7 Real) ) ; lim[x -> a](f1 (f3 (f3 c2 (f1 (f1 x4 c5 c6) (f1 c7 x1 c7) x4) c6) (f3 (f1 (f3 (f0 x7 (f0 x5 x3)) (f1 x5 x2 x2) x0) x1 (f0 c7 (f0 c6 c3))) (f1 (f1 c5 x2 c2) (f1 (f1 (f2 x2 x2 (f2 c7 x0 c0)) (f2 x6 c1 c4) x7) x1 x1) (f0 (f2 c6 c2 x4) (f0 x2 (f1 c5 x7 c1)))) (f3 c5 (f1 x0 x1 x5) (f3 c1 c6 x0))) (f3 (f2 x5 x5 (f0 x5 c7)) (f0 x2 (f0 x1 x2)) c6)) (f0 c1 x1) (f3 (f3 (f0 (f2 c5 x4 x3) x7) (f2 (f3 c5 c0 x1) c3 c5) (f0 (f1 c4 c5 c3) (f0 (f2 (f2 c1 x2 x6) (f0 (f1 c7 x1 x0) c1) (f1 (f2 x5 c3 c6) c7 x5)) (f1 c0 (f3 c1 x3 c4) c3)))) (f2 (f1 (f0 x2 x1) x4 (f2 c6 x0 c1)) x2 (f3 x5 (f2 c3 c2 x7) (f2 x3 x7 x4))) (f3 (f3 c0 x0 x2) (f3 x6 (f1 x6 c7 x2) (f1 x1 c4 x5)) (f1 c7 x5 x0)))) = (f1 (f3 (f3 c2 (f1 (f1 x4 c5 c6) (f1 c7 x1 c7) x4) c6) (f3 (f1 (f3 (f0 x7 (f0 x5 x3)) (f1 x5 x2 x2) x0) x1 (f0 c7 (f0 c6 c3))) (f1 (f1 c5 x2 c2) (f1 (f1 (f2 x2 x2 (f2 c7 x0 c0)) (f2 x6 c1 c4) x7) x1 x1) (f0 (f2 c6 c2 x4) (f0 x2 (f1 c5 x7 c1)))) (f3 c5 (f1 x0 x1 x5) (f3 c1 c6 x0))) (f3 (f2 x5 x5 (f0 x5 c7)) (f0 x2 (f0 x1 x2)) c6)) (f0 c1 x1) (f3 (f3 (f0 (f2 c5 x4 x3) x7) (f2 (f3 c5 c0 x1) c3 c5) (f0 (f1 c4 c5 c3) (f0 (f2 (f2 c1 x2 x6) (f0 (f1 c7 x1 x0) c1) (f1 (f2 x5 c3 c6) c7 x5)) (f1 c0 (f3 c1 x3 c4) c3)))) (f2 (f1 (f0 x2 x1) x4 (f2 c6 x0 c1)) x2 (f3 x5 (f2 c3 c2 x7) (f2 x3 x7 x4))) (f3 (f3 c0 x0 x2) (f3 x6 (f1 x6 c7 x2) (f1 x1 c4 x5)) (f1 c7 x5 x0))))
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
                                          ; | (f1 (f3 (f3 c2 (f1 (f1 x4 c5 c6) (f1 c7 x1 c7) x4) c6) (f3 (f1 (f3 (f0 x7 (f0 x5 x3)) (f1 x5 x2 x2) x0) x1 (f0 c7 (f0 c6 c3))) (f1 (f1 c5 x2 c2) (f1 (f1 (f2 x2 x2 (f2 c7 x0 c0)) (f2 x6 c1 c4) x7) x1 x1) (f0 (f2 c6 c2 x4) (f0 x2 (f1 c5 x7 c1)))) (f3 c5 (f1 x0 x1 x5) (f3 c1 c6 x0))) (f3 (f2 x5 x5 (f0 x5 c7)) (f0 x2 (f0 x1 x2)) c6)) (f0 c1 x1) (f3 (f3 (f0 (f2 c5 x4 x3) x7) (f2 (f3 c5 c0 x1) c3 c5) (f0 (f1 c4 c5 c3) (f0 (f2 (f2 c1 x2 x6) (f0 (f1 c7 x1 x0) c1) (f1 (f2 x5 c3 c6) c7 x5)) (f1 c0 (f3 c1 x3 c4) c3)))) (f2 (f1 (f0 x2 x1) x4 (f2 c6 x0 c1)) x2 (f3 x5 (f2 c3 c2 x7) (f2 x3 x7 x4))) (f3 (f3 c0 x0 x2) (f3 x6 (f1 x6 c7 x2) (f1 x1 c4 x5)) (f1 c7 x5 x0)))) - (f1 (f3 (f3 c2 (f1 (f1 x4 c5 c6) (f1 c7 x1 c7) x4) c6) (f3 (f1 (f3 (f0 x7 (f0 x5 x3)) (f1 x5 x2 x2) x0) x1 (f0 c7 (f0 c6 c3))) (f1 (f1 c5 x2 c2) (f1 (f1 (f2 x2 x2 (f2 c7 x0 c0)) (f2 x6 c1 c4) x7) x1 x1) (f0 (f2 c6 c2 x4) (f0 x2 (f1 c5 x7 c1)))) (f3 c5 (f1 x0 x1 x5) (f3 c1 c6 x0))) (f3 (f2 x5 x5 (f0 x5 c7)) (f0 x2 (f0 x1 x2)) c6)) (f0 c1 x1) (f3 (f3 (f0 (f2 c5 x4 x3) x7) (f2 (f3 c5 c0 x1) c3 c5) (f0 (f1 c4 c5 c3) (f0 (f2 (f2 c1 x2 x6) (f0 (f1 c7 x1 x0) c1) (f1 (f2 x5 c3 c6) c7 x5)) (f1 c0 (f3 c1 x3 c4) c3)))) (f2 (f1 (f0 x2 x1) x4 (f2 c6 x0 c1)) x2 (f3 x5 (f2 c3 c2 x7) (f2 x3 x7 x4))) (f3 (f3 c0 x0 x2) (f3 x6 (f1 x6 c7 x2) (f1 x1 c4 x5)) (f1 c7 x5 x0)))) | < epsilon
                                          (< (ite (>= (- (f1 (f3 (f3 c2 (f1 (f1 x4 c5 c6) (f1 c7 x1 c7) x4) c6) (f3 (f1 (f3 (f0 x7 (f0 x5 x3)) (f1 x5 x2 x2) x0) x1 (f0 c7 (f0 c6 c3))) (f1 (f1 c5 x2 c2) (f1 (f1 (f2 x2 x2 (f2 c7 x0 c0)) (f2 x6 c1 c4) x7) x1 x1) (f0 (f2 c6 c2 x4) (f0 x2 (f1 c5 x7 c1)))) (f3 c5 (f1 x0 x1 x5) (f3 c1 c6 x0))) (f3 (f2 x5 x5 (f0 x5 c7)) (f0 x2 (f0 x1 x2)) c6)) (f0 c1 x1) (f3 (f3 (f0 (f2 c5 x4 x3) x7) (f2 (f3 c5 c0 x1) c3 c5) (f0 (f1 c4 c5 c3) (f0 (f2 (f2 c1 x2 x6) (f0 (f1 c7 x1 x0) c1) (f1 (f2 x5 c3 c6) c7 x5)) (f1 c0 (f3 c1 x3 c4) c3)))) (f2 (f1 (f0 x2 x1) x4 (f2 c6 x0 c1)) x2 (f3 x5 (f2 c3 c2 x7) (f2 x3 x7 x4))) (f3 (f3 c0 x0 x2) (f3 x6 (f1 x6 c7 x2) (f1 x1 c4 x5)) (f1 c7 x5 x0)))) (f1 (f3 (f3 c2 (f1 (f1 x4 c5 c6) (f1 c7 x1 c7) x4) c6) (f3 (f1 (f3 (f0 x7 (f0 x5 x3)) (f1 x5 x2 x2) x0) x1 (f0 c7 (f0 c6 c3))) (f1 (f1 c5 x2 c2) (f1 (f1 (f2 x2 x2 (f2 c7 x0 c0)) (f2 x6 c1 c4) x7) x1 x1) (f0 (f2 c6 c2 x4) (f0 x2 (f1 c5 x7 c1)))) (f3 c5 (f1 x0 x1 x5) (f3 c1 c6 x0))) (f3 (f2 x5 x5 (f0 x5 c7)) (f0 x2 (f0 x1 x2)) c6)) (f0 c1 x1) (f3 (f3 (f0 (f2 c5 x4 x3) x7) (f2 (f3 c5 c0 x1) c3 c5) (f0 (f1 c4 c5 c3) (f0 (f2 (f2 c1 x2 x6) (f0 (f1 c7 x1 x0) c1) (f1 (f2 x5 c3 c6) c7 x5)) (f1 c0 (f3 c1 x3 c4) c3)))) (f2 (f1 (f0 x2 x1) x4 (f2 c6 x0 c1)) x2 (f3 x5 (f2 c3 c2 x7) (f2 x3 x7 x4))) (f3 (f3 c0 x0 x2) (f3 x6 (f1 x6 c7 x2) (f1 x1 c4 x5)) (f1 c7 x5 x0))))) 0.0) (- (f1 (f3 (f3 c2 (f1 (f1 x4 c5 c6) (f1 c7 x1 c7) x4) c6) (f3 (f1 (f3 (f0 x7 (f0 x5 x3)) (f1 x5 x2 x2) x0) x1 (f0 c7 (f0 c6 c3))) (f1 (f1 c5 x2 c2) (f1 (f1 (f2 x2 x2 (f2 c7 x0 c0)) (f2 x6 c1 c4) x7) x1 x1) (f0 (f2 c6 c2 x4) (f0 x2 (f1 c5 x7 c1)))) (f3 c5 (f1 x0 x1 x5) (f3 c1 c6 x0))) (f3 (f2 x5 x5 (f0 x5 c7)) (f0 x2 (f0 x1 x2)) c6)) (f0 c1 x1) (f3 (f3 (f0 (f2 c5 x4 x3) x7) (f2 (f3 c5 c0 x1) c3 c5) (f0 (f1 c4 c5 c3) (f0 (f2 (f2 c1 x2 x6) (f0 (f1 c7 x1 x0) c1) (f1 (f2 x5 c3 c6) c7 x5)) (f1 c0 (f3 c1 x3 c4) c3)))) (f2 (f1 (f0 x2 x1) x4 (f2 c6 x0 c1)) x2 (f3 x5 (f2 c3 c2 x7) (f2 x3 x7 x4))) (f3 (f3 c0 x0 x2) (f3 x6 (f1 x6 c7 x2) (f1 x1 c4 x5)) (f1 c7 x5 x0)))) (f1 (f3 (f3 c2 (f1 (f1 x4 c5 c6) (f1 c7 x1 c7) x4) c6) (f3 (f1 (f3 (f0 x7 (f0 x5 x3)) (f1 x5 x2 x2) x0) x1 (f0 c7 (f0 c6 c3))) (f1 (f1 c5 x2 c2) (f1 (f1 (f2 x2 x2 (f2 c7 x0 c0)) (f2 x6 c1 c4) x7) x1 x1) (f0 (f2 c6 c2 x4) (f0 x2 (f1 c5 x7 c1)))) (f3 c5 (f1 x0 x1 x5) (f3 c1 c6 x0))) (f3 (f2 x5 x5 (f0 x5 c7)) (f0 x2 (f0 x1 x2)) c6)) (f0 c1 x1) (f3 (f3 (f0 (f2 c5 x4 x3) x7) (f2 (f3 c5 c0 x1) c3 c5) (f0 (f1 c4 c5 c3) (f0 (f2 (f2 c1 x2 x6) (f0 (f1 c7 x1 x0) c1) (f1 (f2 x5 c3 c6) c7 x5)) (f1 c0 (f3 c1 x3 c4) c3)))) (f2 (f1 (f0 x2 x1) x4 (f2 c6 x0 c1)) x2 (f3 x5 (f2 c3 c2 x7) (f2 x3 x7 x4))) (f3 (f3 c0 x0 x2) (f3 x6 (f1 x6 c7 x2) (f1 x1 c4 x5)) (f1 c7 x5 x0))))) (- (- (f1 (f3 (f3 c2 (f1 (f1 x4 c5 c6) (f1 c7 x1 c7) x4) c6) (f3 (f1 (f3 (f0 x7 (f0 x5 x3)) (f1 x5 x2 x2) x0) x1 (f0 c7 (f0 c6 c3))) (f1 (f1 c5 x2 c2) (f1 (f1 (f2 x2 x2 (f2 c7 x0 c0)) (f2 x6 c1 c4) x7) x1 x1) (f0 (f2 c6 c2 x4) (f0 x2 (f1 c5 x7 c1)))) (f3 c5 (f1 x0 x1 x5) (f3 c1 c6 x0))) (f3 (f2 x5 x5 (f0 x5 c7)) (f0 x2 (f0 x1 x2)) c6)) (f0 c1 x1) (f3 (f3 (f0 (f2 c5 x4 x3) x7) (f2 (f3 c5 c0 x1) c3 c5) (f0 (f1 c4 c5 c3) (f0 (f2 (f2 c1 x2 x6) (f0 (f1 c7 x1 x0) c1) (f1 (f2 x5 c3 c6) c7 x5)) (f1 c0 (f3 c1 x3 c4) c3)))) (f2 (f1 (f0 x2 x1) x4 (f2 c6 x0 c1)) x2 (f3 x5 (f2 c3 c2 x7) (f2 x3 x7 x4))) (f3 (f3 c0 x0 x2) (f3 x6 (f1 x6 c7 x2) (f1 x1 c4 x5)) (f1 c7 x5 x0)))) (f1 (f3 (f3 c2 (f1 (f1 x4 c5 c6) (f1 c7 x1 c7) x4) c6) (f3 (f1 (f3 (f0 x7 (f0 x5 x3)) (f1 x5 x2 x2) x0) x1 (f0 c7 (f0 c6 c3))) (f1 (f1 c5 x2 c2) (f1 (f1 (f2 x2 x2 (f2 c7 x0 c0)) (f2 x6 c1 c4) x7) x1 x1) (f0 (f2 c6 c2 x4) (f0 x2 (f1 c5 x7 c1)))) (f3 c5 (f1 x0 x1 x5) (f3 c1 c6 x0))) (f3 (f2 x5 x5 (f0 x5 c7)) (f0 x2 (f0 x1 x2)) c6)) (f0 c1 x1) (f3 (f3 (f0 (f2 c5 x4 x3) x7) (f2 (f3 c5 c0 x1) c3 c5) (f0 (f1 c4 c5 c3) (f0 (f2 (f2 c1 x2 x6) (f0 (f1 c7 x1 x0) c1) (f1 (f2 x5 c3 c6) c7 x5)) (f1 c0 (f3 c1 x3 c4) c3)))) (f2 (f1 (f0 x2 x1) x4 (f2 c6 x0 c1)) x2 (f3 x5 (f2 c3 c2 x7) (f2 x3 x7 x4))) (f3 (f3 c0 x0 x2) (f3 x6 (f1 x6 c7 x2) (f1 x1 c4 x5)) (f1 c7 x5 x0))))))) epsilon)
                 ))
               ))
             )))))

(check-sat)

