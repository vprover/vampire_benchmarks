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
(declare-fun f1 (Real Real) Real)
(declare-fun f2 (Real Real) Real)
(declare-fun f3 (Real Real) Real)
(declare-fun f4 (Real Real) Real)
(declare-fun f5 (Real Real Real) Real)
(declare-fun f6 (Real) Real)
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
(assert (not (forall ( (x0 Real) (x1 Real) ) ; lim[x -> a](f2 (f0 (f6 (f4 (f5 (f7 c5 c1 (f7 c4 c4 c2)) c1 (f7 x1 c11 x0)) (f3 (f7 c1 c12 c15) c15))) (f7 (f0 (f0 (f5 c1 c15 c5) (f2 c0 c4)) (f7 x1 c9 c14)) (f7 (f4 (f1 (f2 c13 (f5 x0 (f3 (f4 c6 c1) c2) (f3 x1 c0))) c14) (f6 (f0 (f2 (f1 c10 x0) c1) (f7 c2 c8 c6)))) (f7 (f1 (f4 x1 (f4 c14 (f1 x0 (f2 (f5 c13 x0 (f6 c14)) c7)))) c8) (f3 c5 (f4 c6 (f4 (f5 c2 x0 x1) (f1 c3 c3)))) (f3 (f2 (f4 (f7 c9 x0 c6) (f6 (f4 c4 c6))) (f1 c0 (f0 c15 c12))) (f7 (f2 (f2 c4 x0) (f4 (f5 c7 c5 c7) c3)) (f2 c1 (f3 x0 c15)) c7))) (f3 (f1 c13 (f0 (f4 c13 c6) x1)) (f3 (f6 (f1 c15 c1)) c7))) c8)) c6) = (f2 (f0 (f6 (f4 (f5 (f7 c5 c1 (f7 c4 c4 c2)) c1 (f7 x1 c11 x0)) (f3 (f7 c1 c12 c15) c15))) (f7 (f0 (f0 (f5 c1 c15 c5) (f2 c0 c4)) (f7 x1 c9 c14)) (f7 (f4 (f1 (f2 c13 (f5 x0 (f3 (f4 c6 c1) c2) (f3 x1 c0))) c14) (f6 (f0 (f2 (f1 c10 x0) c1) (f7 c2 c8 c6)))) (f7 (f1 (f4 x1 (f4 c14 (f1 x0 (f2 (f5 c13 x0 (f6 c14)) c7)))) c8) (f3 c5 (f4 c6 (f4 (f5 c2 x0 x1) (f1 c3 c3)))) (f3 (f2 (f4 (f7 c9 x0 c6) (f6 (f4 c4 c6))) (f1 c0 (f0 c15 c12))) (f7 (f2 (f2 c4 x0) (f4 (f5 c7 c5 c7) c3)) (f2 c1 (f3 x0 c15)) c7))) (f3 (f1 c13 (f0 (f4 c13 c6) x1)) (f3 (f6 (f1 c15 c1)) c7))) c8)) c6)
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
                                          ; | (f2 (f0 (f6 (f4 (f5 (f7 c5 c1 (f7 c4 c4 c2)) c1 (f7 x1 c11 x0)) (f3 (f7 c1 c12 c15) c15))) (f7 (f0 (f0 (f5 c1 c15 c5) (f2 c0 c4)) (f7 x1 c9 c14)) (f7 (f4 (f1 (f2 c13 (f5 x0 (f3 (f4 c6 c1) c2) (f3 x1 c0))) c14) (f6 (f0 (f2 (f1 c10 x0) c1) (f7 c2 c8 c6)))) (f7 (f1 (f4 x1 (f4 c14 (f1 x0 (f2 (f5 c13 x0 (f6 c14)) c7)))) c8) (f3 c5 (f4 c6 (f4 (f5 c2 x0 x1) (f1 c3 c3)))) (f3 (f2 (f4 (f7 c9 x0 c6) (f6 (f4 c4 c6))) (f1 c0 (f0 c15 c12))) (f7 (f2 (f2 c4 x0) (f4 (f5 c7 c5 c7) c3)) (f2 c1 (f3 x0 c15)) c7))) (f3 (f1 c13 (f0 (f4 c13 c6) x1)) (f3 (f6 (f1 c15 c1)) c7))) c8)) c6) - (f2 (f0 (f6 (f4 (f5 (f7 c5 c1 (f7 c4 c4 c2)) c1 (f7 x1 c11 x0)) (f3 (f7 c1 c12 c15) c15))) (f7 (f0 (f0 (f5 c1 c15 c5) (f2 c0 c4)) (f7 x1 c9 c14)) (f7 (f4 (f1 (f2 c13 (f5 x0 (f3 (f4 c6 c1) c2) (f3 x1 c0))) c14) (f6 (f0 (f2 (f1 c10 x0) c1) (f7 c2 c8 c6)))) (f7 (f1 (f4 x1 (f4 c14 (f1 x0 (f2 (f5 c13 x0 (f6 c14)) c7)))) c8) (f3 c5 (f4 c6 (f4 (f5 c2 x0 x1) (f1 c3 c3)))) (f3 (f2 (f4 (f7 c9 x0 c6) (f6 (f4 c4 c6))) (f1 c0 (f0 c15 c12))) (f7 (f2 (f2 c4 x0) (f4 (f5 c7 c5 c7) c3)) (f2 c1 (f3 x0 c15)) c7))) (f3 (f1 c13 (f0 (f4 c13 c6) x1)) (f3 (f6 (f1 c15 c1)) c7))) c8)) c6) | < epsilon
                                          (< (ite (>= (- (f2 (f0 (f6 (f4 (f5 (f7 c5 c1 (f7 c4 c4 c2)) c1 (f7 x1 c11 x0)) (f3 (f7 c1 c12 c15) c15))) (f7 (f0 (f0 (f5 c1 c15 c5) (f2 c0 c4)) (f7 x1 c9 c14)) (f7 (f4 (f1 (f2 c13 (f5 x0 (f3 (f4 c6 c1) c2) (f3 x1 c0))) c14) (f6 (f0 (f2 (f1 c10 x0) c1) (f7 c2 c8 c6)))) (f7 (f1 (f4 x1 (f4 c14 (f1 x0 (f2 (f5 c13 x0 (f6 c14)) c7)))) c8) (f3 c5 (f4 c6 (f4 (f5 c2 x0 x1) (f1 c3 c3)))) (f3 (f2 (f4 (f7 c9 x0 c6) (f6 (f4 c4 c6))) (f1 c0 (f0 c15 c12))) (f7 (f2 (f2 c4 x0) (f4 (f5 c7 c5 c7) c3)) (f2 c1 (f3 x0 c15)) c7))) (f3 (f1 c13 (f0 (f4 c13 c6) x1)) (f3 (f6 (f1 c15 c1)) c7))) c8)) c6) (f2 (f0 (f6 (f4 (f5 (f7 c5 c1 (f7 c4 c4 c2)) c1 (f7 x1 c11 x0)) (f3 (f7 c1 c12 c15) c15))) (f7 (f0 (f0 (f5 c1 c15 c5) (f2 c0 c4)) (f7 x1 c9 c14)) (f7 (f4 (f1 (f2 c13 (f5 x0 (f3 (f4 c6 c1) c2) (f3 x1 c0))) c14) (f6 (f0 (f2 (f1 c10 x0) c1) (f7 c2 c8 c6)))) (f7 (f1 (f4 x1 (f4 c14 (f1 x0 (f2 (f5 c13 x0 (f6 c14)) c7)))) c8) (f3 c5 (f4 c6 (f4 (f5 c2 x0 x1) (f1 c3 c3)))) (f3 (f2 (f4 (f7 c9 x0 c6) (f6 (f4 c4 c6))) (f1 c0 (f0 c15 c12))) (f7 (f2 (f2 c4 x0) (f4 (f5 c7 c5 c7) c3)) (f2 c1 (f3 x0 c15)) c7))) (f3 (f1 c13 (f0 (f4 c13 c6) x1)) (f3 (f6 (f1 c15 c1)) c7))) c8)) c6)) 0.0) (- (f2 (f0 (f6 (f4 (f5 (f7 c5 c1 (f7 c4 c4 c2)) c1 (f7 x1 c11 x0)) (f3 (f7 c1 c12 c15) c15))) (f7 (f0 (f0 (f5 c1 c15 c5) (f2 c0 c4)) (f7 x1 c9 c14)) (f7 (f4 (f1 (f2 c13 (f5 x0 (f3 (f4 c6 c1) c2) (f3 x1 c0))) c14) (f6 (f0 (f2 (f1 c10 x0) c1) (f7 c2 c8 c6)))) (f7 (f1 (f4 x1 (f4 c14 (f1 x0 (f2 (f5 c13 x0 (f6 c14)) c7)))) c8) (f3 c5 (f4 c6 (f4 (f5 c2 x0 x1) (f1 c3 c3)))) (f3 (f2 (f4 (f7 c9 x0 c6) (f6 (f4 c4 c6))) (f1 c0 (f0 c15 c12))) (f7 (f2 (f2 c4 x0) (f4 (f5 c7 c5 c7) c3)) (f2 c1 (f3 x0 c15)) c7))) (f3 (f1 c13 (f0 (f4 c13 c6) x1)) (f3 (f6 (f1 c15 c1)) c7))) c8)) c6) (f2 (f0 (f6 (f4 (f5 (f7 c5 c1 (f7 c4 c4 c2)) c1 (f7 x1 c11 x0)) (f3 (f7 c1 c12 c15) c15))) (f7 (f0 (f0 (f5 c1 c15 c5) (f2 c0 c4)) (f7 x1 c9 c14)) (f7 (f4 (f1 (f2 c13 (f5 x0 (f3 (f4 c6 c1) c2) (f3 x1 c0))) c14) (f6 (f0 (f2 (f1 c10 x0) c1) (f7 c2 c8 c6)))) (f7 (f1 (f4 x1 (f4 c14 (f1 x0 (f2 (f5 c13 x0 (f6 c14)) c7)))) c8) (f3 c5 (f4 c6 (f4 (f5 c2 x0 x1) (f1 c3 c3)))) (f3 (f2 (f4 (f7 c9 x0 c6) (f6 (f4 c4 c6))) (f1 c0 (f0 c15 c12))) (f7 (f2 (f2 c4 x0) (f4 (f5 c7 c5 c7) c3)) (f2 c1 (f3 x0 c15)) c7))) (f3 (f1 c13 (f0 (f4 c13 c6) x1)) (f3 (f6 (f1 c15 c1)) c7))) c8)) c6)) (- (- (f2 (f0 (f6 (f4 (f5 (f7 c5 c1 (f7 c4 c4 c2)) c1 (f7 x1 c11 x0)) (f3 (f7 c1 c12 c15) c15))) (f7 (f0 (f0 (f5 c1 c15 c5) (f2 c0 c4)) (f7 x1 c9 c14)) (f7 (f4 (f1 (f2 c13 (f5 x0 (f3 (f4 c6 c1) c2) (f3 x1 c0))) c14) (f6 (f0 (f2 (f1 c10 x0) c1) (f7 c2 c8 c6)))) (f7 (f1 (f4 x1 (f4 c14 (f1 x0 (f2 (f5 c13 x0 (f6 c14)) c7)))) c8) (f3 c5 (f4 c6 (f4 (f5 c2 x0 x1) (f1 c3 c3)))) (f3 (f2 (f4 (f7 c9 x0 c6) (f6 (f4 c4 c6))) (f1 c0 (f0 c15 c12))) (f7 (f2 (f2 c4 x0) (f4 (f5 c7 c5 c7) c3)) (f2 c1 (f3 x0 c15)) c7))) (f3 (f1 c13 (f0 (f4 c13 c6) x1)) (f3 (f6 (f1 c15 c1)) c7))) c8)) c6) (f2 (f0 (f6 (f4 (f5 (f7 c5 c1 (f7 c4 c4 c2)) c1 (f7 x1 c11 x0)) (f3 (f7 c1 c12 c15) c15))) (f7 (f0 (f0 (f5 c1 c15 c5) (f2 c0 c4)) (f7 x1 c9 c14)) (f7 (f4 (f1 (f2 c13 (f5 x0 (f3 (f4 c6 c1) c2) (f3 x1 c0))) c14) (f6 (f0 (f2 (f1 c10 x0) c1) (f7 c2 c8 c6)))) (f7 (f1 (f4 x1 (f4 c14 (f1 x0 (f2 (f5 c13 x0 (f6 c14)) c7)))) c8) (f3 c5 (f4 c6 (f4 (f5 c2 x0 x1) (f1 c3 c3)))) (f3 (f2 (f4 (f7 c9 x0 c6) (f6 (f4 c4 c6))) (f1 c0 (f0 c15 c12))) (f7 (f2 (f2 c4 x0) (f4 (f5 c7 c5 c7) c3)) (f2 c1 (f3 x0 c15)) c7))) (f3 (f1 c13 (f0 (f4 c13 c6) x1)) (f3 (f6 (f1 c15 c1)) c7))) c8)) c6)))) epsilon)
                 ))
               ))
             )))))

(check-sat)

