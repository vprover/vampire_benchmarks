(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; forall x1...x2. lim[x -> a] t = t
; 
; where t is a random term with 
; - 8 functions with arity in 1..3
; - 16 constants
; - 2 variables
; - 64 number of function applications

(declare-fun f0 (Real) Real)
(declare-fun f1 (Real Real Real) Real)
(declare-fun f2 (Real) Real)
(declare-fun f3 (Real Real Real) Real)
(declare-fun f4 (Real Real Real) Real)
(declare-fun f5 (Real Real Real) Real)
(declare-fun f6 (Real Real) Real)
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
(assert (not (forall ( (x0 Real) (x1 Real) ) ; lim[x -> a](f6 (f3 c14 (f7 (f3 c9 c5 c15) c10 c6) (f5 (f6 c7 c12) (f0 (f6 c3 c15)) c9)) (f5 (f2 (f2 (f7 c0 c1 (f7 x1 c11 c10)))) (f4 (f5 (f5 (f2 (f5 c13 c12 c5)) (f1 c9 (f5 c12 c15 x1) c11) (f4 x1 (f3 c9 c5 x1) (f7 (f5 x0 c14 c14) c5 c8))) (f7 (f3 c14 c4 c5) (f4 c4 c1 (f2 (f7 x1 c0 c3))) (f0 (f2 (f2 (f7 c7 c2 c3))))) (f3 (f1 (f5 c3 c11 c4) (f3 c14 c7 c9) (f3 x1 c6 c9)) (f0 (f2 (f1 (f5 c15 (f5 c5 c13 c2) c2) (f4 c9 c7 c14) c9))) x1)) (f3 (f5 c13 (f5 c7 c15 c7) (f3 c1 c3 c5)) c7 c8) (f5 (f7 c7 x1 c12) (f1 (f5 c14 c9 c7) (f1 c4 x1 c3) (f7 c10 (f0 (f1 x0 c5 c12)) c13)) (f3 c9 c10 (f5 c7 c7 c5)))) (f2 (f4 (f3 c2 (f6 c3 c4) c15) (f3 c2 c6 c3) (f3 c11 c3 c14))))) = (f6 (f3 c14 (f7 (f3 c9 c5 c15) c10 c6) (f5 (f6 c7 c12) (f0 (f6 c3 c15)) c9)) (f5 (f2 (f2 (f7 c0 c1 (f7 x1 c11 c10)))) (f4 (f5 (f5 (f2 (f5 c13 c12 c5)) (f1 c9 (f5 c12 c15 x1) c11) (f4 x1 (f3 c9 c5 x1) (f7 (f5 x0 c14 c14) c5 c8))) (f7 (f3 c14 c4 c5) (f4 c4 c1 (f2 (f7 x1 c0 c3))) (f0 (f2 (f2 (f7 c7 c2 c3))))) (f3 (f1 (f5 c3 c11 c4) (f3 c14 c7 c9) (f3 x1 c6 c9)) (f0 (f2 (f1 (f5 c15 (f5 c5 c13 c2) c2) (f4 c9 c7 c14) c9))) x1)) (f3 (f5 c13 (f5 c7 c15 c7) (f3 c1 c3 c5)) c7 c8) (f5 (f7 c7 x1 c12) (f1 (f5 c14 c9 c7) (f1 c4 x1 c3) (f7 c10 (f0 (f1 x0 c5 c12)) c13)) (f3 c9 c10 (f5 c7 c7 c5)))) (f2 (f4 (f3 c2 (f6 c3 c4) c15) (f3 c2 c6 c3) (f3 c11 c3 c14)))))
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
                                          ; | (f6 (f3 c14 (f7 (f3 c9 c5 c15) c10 c6) (f5 (f6 c7 c12) (f0 (f6 c3 c15)) c9)) (f5 (f2 (f2 (f7 c0 c1 (f7 x1 c11 c10)))) (f4 (f5 (f5 (f2 (f5 c13 c12 c5)) (f1 c9 (f5 c12 c15 x1) c11) (f4 x1 (f3 c9 c5 x1) (f7 (f5 x0 c14 c14) c5 c8))) (f7 (f3 c14 c4 c5) (f4 c4 c1 (f2 (f7 x1 c0 c3))) (f0 (f2 (f2 (f7 c7 c2 c3))))) (f3 (f1 (f5 c3 c11 c4) (f3 c14 c7 c9) (f3 x1 c6 c9)) (f0 (f2 (f1 (f5 c15 (f5 c5 c13 c2) c2) (f4 c9 c7 c14) c9))) x1)) (f3 (f5 c13 (f5 c7 c15 c7) (f3 c1 c3 c5)) c7 c8) (f5 (f7 c7 x1 c12) (f1 (f5 c14 c9 c7) (f1 c4 x1 c3) (f7 c10 (f0 (f1 x0 c5 c12)) c13)) (f3 c9 c10 (f5 c7 c7 c5)))) (f2 (f4 (f3 c2 (f6 c3 c4) c15) (f3 c2 c6 c3) (f3 c11 c3 c14))))) - (f6 (f3 c14 (f7 (f3 c9 c5 c15) c10 c6) (f5 (f6 c7 c12) (f0 (f6 c3 c15)) c9)) (f5 (f2 (f2 (f7 c0 c1 (f7 x1 c11 c10)))) (f4 (f5 (f5 (f2 (f5 c13 c12 c5)) (f1 c9 (f5 c12 c15 x1) c11) (f4 x1 (f3 c9 c5 x1) (f7 (f5 x0 c14 c14) c5 c8))) (f7 (f3 c14 c4 c5) (f4 c4 c1 (f2 (f7 x1 c0 c3))) (f0 (f2 (f2 (f7 c7 c2 c3))))) (f3 (f1 (f5 c3 c11 c4) (f3 c14 c7 c9) (f3 x1 c6 c9)) (f0 (f2 (f1 (f5 c15 (f5 c5 c13 c2) c2) (f4 c9 c7 c14) c9))) x1)) (f3 (f5 c13 (f5 c7 c15 c7) (f3 c1 c3 c5)) c7 c8) (f5 (f7 c7 x1 c12) (f1 (f5 c14 c9 c7) (f1 c4 x1 c3) (f7 c10 (f0 (f1 x0 c5 c12)) c13)) (f3 c9 c10 (f5 c7 c7 c5)))) (f2 (f4 (f3 c2 (f6 c3 c4) c15) (f3 c2 c6 c3) (f3 c11 c3 c14))))) | < epsilon
                                          (< (ite (>= (- (f6 (f3 c14 (f7 (f3 c9 c5 c15) c10 c6) (f5 (f6 c7 c12) (f0 (f6 c3 c15)) c9)) (f5 (f2 (f2 (f7 c0 c1 (f7 x1 c11 c10)))) (f4 (f5 (f5 (f2 (f5 c13 c12 c5)) (f1 c9 (f5 c12 c15 x1) c11) (f4 x1 (f3 c9 c5 x1) (f7 (f5 x0 c14 c14) c5 c8))) (f7 (f3 c14 c4 c5) (f4 c4 c1 (f2 (f7 x1 c0 c3))) (f0 (f2 (f2 (f7 c7 c2 c3))))) (f3 (f1 (f5 c3 c11 c4) (f3 c14 c7 c9) (f3 x1 c6 c9)) (f0 (f2 (f1 (f5 c15 (f5 c5 c13 c2) c2) (f4 c9 c7 c14) c9))) x1)) (f3 (f5 c13 (f5 c7 c15 c7) (f3 c1 c3 c5)) c7 c8) (f5 (f7 c7 x1 c12) (f1 (f5 c14 c9 c7) (f1 c4 x1 c3) (f7 c10 (f0 (f1 x0 c5 c12)) c13)) (f3 c9 c10 (f5 c7 c7 c5)))) (f2 (f4 (f3 c2 (f6 c3 c4) c15) (f3 c2 c6 c3) (f3 c11 c3 c14))))) (f6 (f3 c14 (f7 (f3 c9 c5 c15) c10 c6) (f5 (f6 c7 c12) (f0 (f6 c3 c15)) c9)) (f5 (f2 (f2 (f7 c0 c1 (f7 x1 c11 c10)))) (f4 (f5 (f5 (f2 (f5 c13 c12 c5)) (f1 c9 (f5 c12 c15 x1) c11) (f4 x1 (f3 c9 c5 x1) (f7 (f5 x0 c14 c14) c5 c8))) (f7 (f3 c14 c4 c5) (f4 c4 c1 (f2 (f7 x1 c0 c3))) (f0 (f2 (f2 (f7 c7 c2 c3))))) (f3 (f1 (f5 c3 c11 c4) (f3 c14 c7 c9) (f3 x1 c6 c9)) (f0 (f2 (f1 (f5 c15 (f5 c5 c13 c2) c2) (f4 c9 c7 c14) c9))) x1)) (f3 (f5 c13 (f5 c7 c15 c7) (f3 c1 c3 c5)) c7 c8) (f5 (f7 c7 x1 c12) (f1 (f5 c14 c9 c7) (f1 c4 x1 c3) (f7 c10 (f0 (f1 x0 c5 c12)) c13)) (f3 c9 c10 (f5 c7 c7 c5)))) (f2 (f4 (f3 c2 (f6 c3 c4) c15) (f3 c2 c6 c3) (f3 c11 c3 c14)))))) 0.0) (- (f6 (f3 c14 (f7 (f3 c9 c5 c15) c10 c6) (f5 (f6 c7 c12) (f0 (f6 c3 c15)) c9)) (f5 (f2 (f2 (f7 c0 c1 (f7 x1 c11 c10)))) (f4 (f5 (f5 (f2 (f5 c13 c12 c5)) (f1 c9 (f5 c12 c15 x1) c11) (f4 x1 (f3 c9 c5 x1) (f7 (f5 x0 c14 c14) c5 c8))) (f7 (f3 c14 c4 c5) (f4 c4 c1 (f2 (f7 x1 c0 c3))) (f0 (f2 (f2 (f7 c7 c2 c3))))) (f3 (f1 (f5 c3 c11 c4) (f3 c14 c7 c9) (f3 x1 c6 c9)) (f0 (f2 (f1 (f5 c15 (f5 c5 c13 c2) c2) (f4 c9 c7 c14) c9))) x1)) (f3 (f5 c13 (f5 c7 c15 c7) (f3 c1 c3 c5)) c7 c8) (f5 (f7 c7 x1 c12) (f1 (f5 c14 c9 c7) (f1 c4 x1 c3) (f7 c10 (f0 (f1 x0 c5 c12)) c13)) (f3 c9 c10 (f5 c7 c7 c5)))) (f2 (f4 (f3 c2 (f6 c3 c4) c15) (f3 c2 c6 c3) (f3 c11 c3 c14))))) (f6 (f3 c14 (f7 (f3 c9 c5 c15) c10 c6) (f5 (f6 c7 c12) (f0 (f6 c3 c15)) c9)) (f5 (f2 (f2 (f7 c0 c1 (f7 x1 c11 c10)))) (f4 (f5 (f5 (f2 (f5 c13 c12 c5)) (f1 c9 (f5 c12 c15 x1) c11) (f4 x1 (f3 c9 c5 x1) (f7 (f5 x0 c14 c14) c5 c8))) (f7 (f3 c14 c4 c5) (f4 c4 c1 (f2 (f7 x1 c0 c3))) (f0 (f2 (f2 (f7 c7 c2 c3))))) (f3 (f1 (f5 c3 c11 c4) (f3 c14 c7 c9) (f3 x1 c6 c9)) (f0 (f2 (f1 (f5 c15 (f5 c5 c13 c2) c2) (f4 c9 c7 c14) c9))) x1)) (f3 (f5 c13 (f5 c7 c15 c7) (f3 c1 c3 c5)) c7 c8) (f5 (f7 c7 x1 c12) (f1 (f5 c14 c9 c7) (f1 c4 x1 c3) (f7 c10 (f0 (f1 x0 c5 c12)) c13)) (f3 c9 c10 (f5 c7 c7 c5)))) (f2 (f4 (f3 c2 (f6 c3 c4) c15) (f3 c2 c6 c3) (f3 c11 c3 c14)))))) (- (- (f6 (f3 c14 (f7 (f3 c9 c5 c15) c10 c6) (f5 (f6 c7 c12) (f0 (f6 c3 c15)) c9)) (f5 (f2 (f2 (f7 c0 c1 (f7 x1 c11 c10)))) (f4 (f5 (f5 (f2 (f5 c13 c12 c5)) (f1 c9 (f5 c12 c15 x1) c11) (f4 x1 (f3 c9 c5 x1) (f7 (f5 x0 c14 c14) c5 c8))) (f7 (f3 c14 c4 c5) (f4 c4 c1 (f2 (f7 x1 c0 c3))) (f0 (f2 (f2 (f7 c7 c2 c3))))) (f3 (f1 (f5 c3 c11 c4) (f3 c14 c7 c9) (f3 x1 c6 c9)) (f0 (f2 (f1 (f5 c15 (f5 c5 c13 c2) c2) (f4 c9 c7 c14) c9))) x1)) (f3 (f5 c13 (f5 c7 c15 c7) (f3 c1 c3 c5)) c7 c8) (f5 (f7 c7 x1 c12) (f1 (f5 c14 c9 c7) (f1 c4 x1 c3) (f7 c10 (f0 (f1 x0 c5 c12)) c13)) (f3 c9 c10 (f5 c7 c7 c5)))) (f2 (f4 (f3 c2 (f6 c3 c4) c15) (f3 c2 c6 c3) (f3 c11 c3 c14))))) (f6 (f3 c14 (f7 (f3 c9 c5 c15) c10 c6) (f5 (f6 c7 c12) (f0 (f6 c3 c15)) c9)) (f5 (f2 (f2 (f7 c0 c1 (f7 x1 c11 c10)))) (f4 (f5 (f5 (f2 (f5 c13 c12 c5)) (f1 c9 (f5 c12 c15 x1) c11) (f4 x1 (f3 c9 c5 x1) (f7 (f5 x0 c14 c14) c5 c8))) (f7 (f3 c14 c4 c5) (f4 c4 c1 (f2 (f7 x1 c0 c3))) (f0 (f2 (f2 (f7 c7 c2 c3))))) (f3 (f1 (f5 c3 c11 c4) (f3 c14 c7 c9) (f3 x1 c6 c9)) (f0 (f2 (f1 (f5 c15 (f5 c5 c13 c2) c2) (f4 c9 c7 c14) c9))) x1)) (f3 (f5 c13 (f5 c7 c15 c7) (f3 c1 c3 c5)) c7 c8) (f5 (f7 c7 x1 c12) (f1 (f5 c14 c9 c7) (f1 c4 x1 c3) (f7 c10 (f0 (f1 x0 c5 c12)) c13)) (f3 c9 c10 (f5 c7 c7 c5)))) (f2 (f4 (f3 c2 (f6 c3 c4) c15) (f3 c2 c6 c3) (f3 c11 c3 c14)))))))) epsilon)
                 ))
               ))
             )))))

(check-sat)

