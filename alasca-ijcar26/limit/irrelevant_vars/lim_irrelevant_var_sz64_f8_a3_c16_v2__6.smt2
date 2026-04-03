(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; forall x1...x2. lim[x -> a] t = t
; 
; where t is a random term with 
; - 8 functions with arity in 1..3
; - 16 constants
; - 2 variables
; - 64 number of function applications

(declare-fun f0 (Real Real) Real)
(declare-fun f1 (Real Real Real) Real)
(declare-fun f2 (Real Real Real) Real)
(declare-fun f3 (Real Real Real) Real)
(declare-fun f4 (Real Real) Real)
(declare-fun f5 (Real Real) Real)
(declare-fun f6 (Real Real Real) Real)
(declare-fun f7 (Real Real Real) Real)
(declare-const c0 Real)
(declare-const c1 Real)
(declare-const c2 Real)
(declare-const c3 Real)
(declare-const c4 Real)
(declare-const c5 Real)
(declare-const c6 Real)
(declare-const c7 Real)
(declare-const c8 Real)
(declare-const c9 Real)
(declare-const c10 Real)
(declare-const c11 Real)
(declare-const c12 Real)
(declare-const c13 Real)
(declare-const c14 Real)
(declare-const c15 Real)
(declare-const a Real)

; Conclusion
(assert (not (forall ( (x0 Real) (x1 Real) ) ; lim[x -> a](f1 (f7 c5 (f5 c14 c0) c3) (f6 (f3 (f0 (f2 (f6 (f5 (f6 x0 c3 c6) c1) (f2 c4 c8 c8) (f2 x0 x1 (f1 c1 (f4 (f5 c9 c1) c3) c0))) x0 c12) c0) (f5 c14 (f6 c13 c7 x1)) c4) (f1 (f5 (f7 c9 (f0 c5 c8) (f6 x1 c0 c5)) c7) (f7 (f5 (f1 c4 c9 (f0 (f3 x0 c7 c13) c4)) (f3 x1 (f2 (f0 (f7 c14 c7 c8) c1) c5 c3) (f2 c4 (f7 c0 (f1 c1 c14 x0) (f7 c14 c11 c7)) c14))) c0 (f2 c8 c8 c2)) (f6 (f3 (f4 x0 x1) c12 c7) (f0 c13 c1) (f1 (f0 (f6 c11 c11 c8) c1) (f4 c0 (f4 c5 c0)) (f4 c4 (f5 x1 x0))))) (f4 (f4 c10 c7) (f7 (f7 c2 c10 x0) (f4 c4 c6) (f4 c12 c10)))) (f5 (f4 (f2 c13 (f1 c7 c10 c2) c14) (f0 (f1 c1 c3 c10) (f2 c9 c6 c8))) (f7 c6 (f2 (f1 c3 c7 x0) c0 c15) (f1 c4 c2 c13)))) = (f1 (f7 c5 (f5 c14 c0) c3) (f6 (f3 (f0 (f2 (f6 (f5 (f6 x0 c3 c6) c1) (f2 c4 c8 c8) (f2 x0 x1 (f1 c1 (f4 (f5 c9 c1) c3) c0))) x0 c12) c0) (f5 c14 (f6 c13 c7 x1)) c4) (f1 (f5 (f7 c9 (f0 c5 c8) (f6 x1 c0 c5)) c7) (f7 (f5 (f1 c4 c9 (f0 (f3 x0 c7 c13) c4)) (f3 x1 (f2 (f0 (f7 c14 c7 c8) c1) c5 c3) (f2 c4 (f7 c0 (f1 c1 c14 x0) (f7 c14 c11 c7)) c14))) c0 (f2 c8 c8 c2)) (f6 (f3 (f4 x0 x1) c12 c7) (f0 c13 c1) (f1 (f0 (f6 c11 c11 c8) c1) (f4 c0 (f4 c5 c0)) (f4 c4 (f5 x1 x0))))) (f4 (f4 c10 c7) (f7 (f7 c2 c10 x0) (f4 c4 c6) (f4 c12 c10)))) (f5 (f4 (f2 c13 (f1 c7 c10 c2) c14) (f0 (f1 c1 c3 c10) (f2 c9 c6 c8))) (f7 c6 (f2 (f1 c3 c7 x0) c0 c15) (f1 c4 c2 c13))))
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
                                          ; | (f1 (f7 c5 (f5 c14 c0) c3) (f6 (f3 (f0 (f2 (f6 (f5 (f6 x0 c3 c6) c1) (f2 c4 c8 c8) (f2 x0 x1 (f1 c1 (f4 (f5 c9 c1) c3) c0))) x0 c12) c0) (f5 c14 (f6 c13 c7 x1)) c4) (f1 (f5 (f7 c9 (f0 c5 c8) (f6 x1 c0 c5)) c7) (f7 (f5 (f1 c4 c9 (f0 (f3 x0 c7 c13) c4)) (f3 x1 (f2 (f0 (f7 c14 c7 c8) c1) c5 c3) (f2 c4 (f7 c0 (f1 c1 c14 x0) (f7 c14 c11 c7)) c14))) c0 (f2 c8 c8 c2)) (f6 (f3 (f4 x0 x1) c12 c7) (f0 c13 c1) (f1 (f0 (f6 c11 c11 c8) c1) (f4 c0 (f4 c5 c0)) (f4 c4 (f5 x1 x0))))) (f4 (f4 c10 c7) (f7 (f7 c2 c10 x0) (f4 c4 c6) (f4 c12 c10)))) (f5 (f4 (f2 c13 (f1 c7 c10 c2) c14) (f0 (f1 c1 c3 c10) (f2 c9 c6 c8))) (f7 c6 (f2 (f1 c3 c7 x0) c0 c15) (f1 c4 c2 c13)))) - (f1 (f7 c5 (f5 c14 c0) c3) (f6 (f3 (f0 (f2 (f6 (f5 (f6 x0 c3 c6) c1) (f2 c4 c8 c8) (f2 x0 x1 (f1 c1 (f4 (f5 c9 c1) c3) c0))) x0 c12) c0) (f5 c14 (f6 c13 c7 x1)) c4) (f1 (f5 (f7 c9 (f0 c5 c8) (f6 x1 c0 c5)) c7) (f7 (f5 (f1 c4 c9 (f0 (f3 x0 c7 c13) c4)) (f3 x1 (f2 (f0 (f7 c14 c7 c8) c1) c5 c3) (f2 c4 (f7 c0 (f1 c1 c14 x0) (f7 c14 c11 c7)) c14))) c0 (f2 c8 c8 c2)) (f6 (f3 (f4 x0 x1) c12 c7) (f0 c13 c1) (f1 (f0 (f6 c11 c11 c8) c1) (f4 c0 (f4 c5 c0)) (f4 c4 (f5 x1 x0))))) (f4 (f4 c10 c7) (f7 (f7 c2 c10 x0) (f4 c4 c6) (f4 c12 c10)))) (f5 (f4 (f2 c13 (f1 c7 c10 c2) c14) (f0 (f1 c1 c3 c10) (f2 c9 c6 c8))) (f7 c6 (f2 (f1 c3 c7 x0) c0 c15) (f1 c4 c2 c13)))) | < epsilon
                                          (< (ite (>= (- (f1 (f7 c5 (f5 c14 c0) c3) (f6 (f3 (f0 (f2 (f6 (f5 (f6 x0 c3 c6) c1) (f2 c4 c8 c8) (f2 x0 x1 (f1 c1 (f4 (f5 c9 c1) c3) c0))) x0 c12) c0) (f5 c14 (f6 c13 c7 x1)) c4) (f1 (f5 (f7 c9 (f0 c5 c8) (f6 x1 c0 c5)) c7) (f7 (f5 (f1 c4 c9 (f0 (f3 x0 c7 c13) c4)) (f3 x1 (f2 (f0 (f7 c14 c7 c8) c1) c5 c3) (f2 c4 (f7 c0 (f1 c1 c14 x0) (f7 c14 c11 c7)) c14))) c0 (f2 c8 c8 c2)) (f6 (f3 (f4 x0 x1) c12 c7) (f0 c13 c1) (f1 (f0 (f6 c11 c11 c8) c1) (f4 c0 (f4 c5 c0)) (f4 c4 (f5 x1 x0))))) (f4 (f4 c10 c7) (f7 (f7 c2 c10 x0) (f4 c4 c6) (f4 c12 c10)))) (f5 (f4 (f2 c13 (f1 c7 c10 c2) c14) (f0 (f1 c1 c3 c10) (f2 c9 c6 c8))) (f7 c6 (f2 (f1 c3 c7 x0) c0 c15) (f1 c4 c2 c13)))) (f1 (f7 c5 (f5 c14 c0) c3) (f6 (f3 (f0 (f2 (f6 (f5 (f6 x0 c3 c6) c1) (f2 c4 c8 c8) (f2 x0 x1 (f1 c1 (f4 (f5 c9 c1) c3) c0))) x0 c12) c0) (f5 c14 (f6 c13 c7 x1)) c4) (f1 (f5 (f7 c9 (f0 c5 c8) (f6 x1 c0 c5)) c7) (f7 (f5 (f1 c4 c9 (f0 (f3 x0 c7 c13) c4)) (f3 x1 (f2 (f0 (f7 c14 c7 c8) c1) c5 c3) (f2 c4 (f7 c0 (f1 c1 c14 x0) (f7 c14 c11 c7)) c14))) c0 (f2 c8 c8 c2)) (f6 (f3 (f4 x0 x1) c12 c7) (f0 c13 c1) (f1 (f0 (f6 c11 c11 c8) c1) (f4 c0 (f4 c5 c0)) (f4 c4 (f5 x1 x0))))) (f4 (f4 c10 c7) (f7 (f7 c2 c10 x0) (f4 c4 c6) (f4 c12 c10)))) (f5 (f4 (f2 c13 (f1 c7 c10 c2) c14) (f0 (f1 c1 c3 c10) (f2 c9 c6 c8))) (f7 c6 (f2 (f1 c3 c7 x0) c0 c15) (f1 c4 c2 c13))))) 0.0) (- (f1 (f7 c5 (f5 c14 c0) c3) (f6 (f3 (f0 (f2 (f6 (f5 (f6 x0 c3 c6) c1) (f2 c4 c8 c8) (f2 x0 x1 (f1 c1 (f4 (f5 c9 c1) c3) c0))) x0 c12) c0) (f5 c14 (f6 c13 c7 x1)) c4) (f1 (f5 (f7 c9 (f0 c5 c8) (f6 x1 c0 c5)) c7) (f7 (f5 (f1 c4 c9 (f0 (f3 x0 c7 c13) c4)) (f3 x1 (f2 (f0 (f7 c14 c7 c8) c1) c5 c3) (f2 c4 (f7 c0 (f1 c1 c14 x0) (f7 c14 c11 c7)) c14))) c0 (f2 c8 c8 c2)) (f6 (f3 (f4 x0 x1) c12 c7) (f0 c13 c1) (f1 (f0 (f6 c11 c11 c8) c1) (f4 c0 (f4 c5 c0)) (f4 c4 (f5 x1 x0))))) (f4 (f4 c10 c7) (f7 (f7 c2 c10 x0) (f4 c4 c6) (f4 c12 c10)))) (f5 (f4 (f2 c13 (f1 c7 c10 c2) c14) (f0 (f1 c1 c3 c10) (f2 c9 c6 c8))) (f7 c6 (f2 (f1 c3 c7 x0) c0 c15) (f1 c4 c2 c13)))) (f1 (f7 c5 (f5 c14 c0) c3) (f6 (f3 (f0 (f2 (f6 (f5 (f6 x0 c3 c6) c1) (f2 c4 c8 c8) (f2 x0 x1 (f1 c1 (f4 (f5 c9 c1) c3) c0))) x0 c12) c0) (f5 c14 (f6 c13 c7 x1)) c4) (f1 (f5 (f7 c9 (f0 c5 c8) (f6 x1 c0 c5)) c7) (f7 (f5 (f1 c4 c9 (f0 (f3 x0 c7 c13) c4)) (f3 x1 (f2 (f0 (f7 c14 c7 c8) c1) c5 c3) (f2 c4 (f7 c0 (f1 c1 c14 x0) (f7 c14 c11 c7)) c14))) c0 (f2 c8 c8 c2)) (f6 (f3 (f4 x0 x1) c12 c7) (f0 c13 c1) (f1 (f0 (f6 c11 c11 c8) c1) (f4 c0 (f4 c5 c0)) (f4 c4 (f5 x1 x0))))) (f4 (f4 c10 c7) (f7 (f7 c2 c10 x0) (f4 c4 c6) (f4 c12 c10)))) (f5 (f4 (f2 c13 (f1 c7 c10 c2) c14) (f0 (f1 c1 c3 c10) (f2 c9 c6 c8))) (f7 c6 (f2 (f1 c3 c7 x0) c0 c15) (f1 c4 c2 c13))))) (- (- (f1 (f7 c5 (f5 c14 c0) c3) (f6 (f3 (f0 (f2 (f6 (f5 (f6 x0 c3 c6) c1) (f2 c4 c8 c8) (f2 x0 x1 (f1 c1 (f4 (f5 c9 c1) c3) c0))) x0 c12) c0) (f5 c14 (f6 c13 c7 x1)) c4) (f1 (f5 (f7 c9 (f0 c5 c8) (f6 x1 c0 c5)) c7) (f7 (f5 (f1 c4 c9 (f0 (f3 x0 c7 c13) c4)) (f3 x1 (f2 (f0 (f7 c14 c7 c8) c1) c5 c3) (f2 c4 (f7 c0 (f1 c1 c14 x0) (f7 c14 c11 c7)) c14))) c0 (f2 c8 c8 c2)) (f6 (f3 (f4 x0 x1) c12 c7) (f0 c13 c1) (f1 (f0 (f6 c11 c11 c8) c1) (f4 c0 (f4 c5 c0)) (f4 c4 (f5 x1 x0))))) (f4 (f4 c10 c7) (f7 (f7 c2 c10 x0) (f4 c4 c6) (f4 c12 c10)))) (f5 (f4 (f2 c13 (f1 c7 c10 c2) c14) (f0 (f1 c1 c3 c10) (f2 c9 c6 c8))) (f7 c6 (f2 (f1 c3 c7 x0) c0 c15) (f1 c4 c2 c13)))) (f1 (f7 c5 (f5 c14 c0) c3) (f6 (f3 (f0 (f2 (f6 (f5 (f6 x0 c3 c6) c1) (f2 c4 c8 c8) (f2 x0 x1 (f1 c1 (f4 (f5 c9 c1) c3) c0))) x0 c12) c0) (f5 c14 (f6 c13 c7 x1)) c4) (f1 (f5 (f7 c9 (f0 c5 c8) (f6 x1 c0 c5)) c7) (f7 (f5 (f1 c4 c9 (f0 (f3 x0 c7 c13) c4)) (f3 x1 (f2 (f0 (f7 c14 c7 c8) c1) c5 c3) (f2 c4 (f7 c0 (f1 c1 c14 x0) (f7 c14 c11 c7)) c14))) c0 (f2 c8 c8 c2)) (f6 (f3 (f4 x0 x1) c12 c7) (f0 c13 c1) (f1 (f0 (f6 c11 c11 c8) c1) (f4 c0 (f4 c5 c0)) (f4 c4 (f5 x1 x0))))) (f4 (f4 c10 c7) (f7 (f7 c2 c10 x0) (f4 c4 c6) (f4 c12 c10)))) (f5 (f4 (f2 c13 (f1 c7 c10 c2) c14) (f0 (f1 c1 c3 c10) (f2 c9 c6 c8))) (f7 c6 (f2 (f1 c3 c7 x0) c0 c15) (f1 c4 c2 c13))))))) epsilon)
                 ))
               ))
             )))))

(check-sat)

