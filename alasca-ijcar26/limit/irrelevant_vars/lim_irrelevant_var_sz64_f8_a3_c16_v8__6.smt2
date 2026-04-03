(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; forall x1...x8. lim[x -> a] t = t
; 
; where t is a random term with 
; - 8 functions with arity in 1..3
; - 16 constants
; - 8 variables
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
(assert (not (forall ( (x0 Real) (x1 Real) (x2 Real) (x3 Real) (x4 Real) (x5 Real) (x6 Real) (x7 Real) ) ; lim[x -> a](f1 (f7 c1 (f5 c14 x3) x7) (f6 (f3 (f0 (f2 (f6 (f5 (f6 x1 x7 c2) x5) (f2 c0 c6 c5) (f2 x0 x2 (f1 x4 (f4 (f5 c6 x4) x7) x2))) x0 c11) x3) (f5 c13 (f6 c12 c5 x2)) c0) (f1 (f5 (f7 c7 (f0 c2 c6) (f6 x2 x3 c2)) c5) (f7 (f5 (f1 c1 c7 (f0 (f3 x0 c5 c12) c0)) (f3 x1 (f2 (f0 (f7 c14 c4 c5) x5) c2 x7) (f2 c0 (f7 x3 (f1 x4 c14 x0) (f7 c13 c10 c5)) c13))) x3 (f2 c5 c6 x6)) (f6 (f3 (f4 x0 x2) c11 c4) (f0 c12 x5) (f1 (f0 (f6 c9 c9 c5) x5) (f4 x3 (f4 c2 x3)) (f4 c1 (f5 x1 x0))))) (f4 (f4 c8 c4) (f7 (f7 x6 c9 x1) (f4 c1 c3) (f4 c10 c8)))) (f5 (f4 (f2 c12 (f1 c5 c9 x6) c13) (f0 (f1 x4 x7 c8) (f2 c7 c2 c6))) (f7 c3 (f2 (f1 x6 c5 x0) x3 c15) (f1 c0 x6 c12)))) = (f1 (f7 c1 (f5 c14 x3) x7) (f6 (f3 (f0 (f2 (f6 (f5 (f6 x1 x7 c2) x5) (f2 c0 c6 c5) (f2 x0 x2 (f1 x4 (f4 (f5 c6 x4) x7) x2))) x0 c11) x3) (f5 c13 (f6 c12 c5 x2)) c0) (f1 (f5 (f7 c7 (f0 c2 c6) (f6 x2 x3 c2)) c5) (f7 (f5 (f1 c1 c7 (f0 (f3 x0 c5 c12) c0)) (f3 x1 (f2 (f0 (f7 c14 c4 c5) x5) c2 x7) (f2 c0 (f7 x3 (f1 x4 c14 x0) (f7 c13 c10 c5)) c13))) x3 (f2 c5 c6 x6)) (f6 (f3 (f4 x0 x2) c11 c4) (f0 c12 x5) (f1 (f0 (f6 c9 c9 c5) x5) (f4 x3 (f4 c2 x3)) (f4 c1 (f5 x1 x0))))) (f4 (f4 c8 c4) (f7 (f7 x6 c9 x1) (f4 c1 c3) (f4 c10 c8)))) (f5 (f4 (f2 c12 (f1 c5 c9 x6) c13) (f0 (f1 x4 x7 c8) (f2 c7 c2 c6))) (f7 c3 (f2 (f1 x6 c5 x0) x3 c15) (f1 c0 x6 c12))))
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
                                          ; | (f1 (f7 c1 (f5 c14 x3) x7) (f6 (f3 (f0 (f2 (f6 (f5 (f6 x1 x7 c2) x5) (f2 c0 c6 c5) (f2 x0 x2 (f1 x4 (f4 (f5 c6 x4) x7) x2))) x0 c11) x3) (f5 c13 (f6 c12 c5 x2)) c0) (f1 (f5 (f7 c7 (f0 c2 c6) (f6 x2 x3 c2)) c5) (f7 (f5 (f1 c1 c7 (f0 (f3 x0 c5 c12) c0)) (f3 x1 (f2 (f0 (f7 c14 c4 c5) x5) c2 x7) (f2 c0 (f7 x3 (f1 x4 c14 x0) (f7 c13 c10 c5)) c13))) x3 (f2 c5 c6 x6)) (f6 (f3 (f4 x0 x2) c11 c4) (f0 c12 x5) (f1 (f0 (f6 c9 c9 c5) x5) (f4 x3 (f4 c2 x3)) (f4 c1 (f5 x1 x0))))) (f4 (f4 c8 c4) (f7 (f7 x6 c9 x1) (f4 c1 c3) (f4 c10 c8)))) (f5 (f4 (f2 c12 (f1 c5 c9 x6) c13) (f0 (f1 x4 x7 c8) (f2 c7 c2 c6))) (f7 c3 (f2 (f1 x6 c5 x0) x3 c15) (f1 c0 x6 c12)))) - (f1 (f7 c1 (f5 c14 x3) x7) (f6 (f3 (f0 (f2 (f6 (f5 (f6 x1 x7 c2) x5) (f2 c0 c6 c5) (f2 x0 x2 (f1 x4 (f4 (f5 c6 x4) x7) x2))) x0 c11) x3) (f5 c13 (f6 c12 c5 x2)) c0) (f1 (f5 (f7 c7 (f0 c2 c6) (f6 x2 x3 c2)) c5) (f7 (f5 (f1 c1 c7 (f0 (f3 x0 c5 c12) c0)) (f3 x1 (f2 (f0 (f7 c14 c4 c5) x5) c2 x7) (f2 c0 (f7 x3 (f1 x4 c14 x0) (f7 c13 c10 c5)) c13))) x3 (f2 c5 c6 x6)) (f6 (f3 (f4 x0 x2) c11 c4) (f0 c12 x5) (f1 (f0 (f6 c9 c9 c5) x5) (f4 x3 (f4 c2 x3)) (f4 c1 (f5 x1 x0))))) (f4 (f4 c8 c4) (f7 (f7 x6 c9 x1) (f4 c1 c3) (f4 c10 c8)))) (f5 (f4 (f2 c12 (f1 c5 c9 x6) c13) (f0 (f1 x4 x7 c8) (f2 c7 c2 c6))) (f7 c3 (f2 (f1 x6 c5 x0) x3 c15) (f1 c0 x6 c12)))) | < epsilon
                                          (< (ite (>= (- (f1 (f7 c1 (f5 c14 x3) x7) (f6 (f3 (f0 (f2 (f6 (f5 (f6 x1 x7 c2) x5) (f2 c0 c6 c5) (f2 x0 x2 (f1 x4 (f4 (f5 c6 x4) x7) x2))) x0 c11) x3) (f5 c13 (f6 c12 c5 x2)) c0) (f1 (f5 (f7 c7 (f0 c2 c6) (f6 x2 x3 c2)) c5) (f7 (f5 (f1 c1 c7 (f0 (f3 x0 c5 c12) c0)) (f3 x1 (f2 (f0 (f7 c14 c4 c5) x5) c2 x7) (f2 c0 (f7 x3 (f1 x4 c14 x0) (f7 c13 c10 c5)) c13))) x3 (f2 c5 c6 x6)) (f6 (f3 (f4 x0 x2) c11 c4) (f0 c12 x5) (f1 (f0 (f6 c9 c9 c5) x5) (f4 x3 (f4 c2 x3)) (f4 c1 (f5 x1 x0))))) (f4 (f4 c8 c4) (f7 (f7 x6 c9 x1) (f4 c1 c3) (f4 c10 c8)))) (f5 (f4 (f2 c12 (f1 c5 c9 x6) c13) (f0 (f1 x4 x7 c8) (f2 c7 c2 c6))) (f7 c3 (f2 (f1 x6 c5 x0) x3 c15) (f1 c0 x6 c12)))) (f1 (f7 c1 (f5 c14 x3) x7) (f6 (f3 (f0 (f2 (f6 (f5 (f6 x1 x7 c2) x5) (f2 c0 c6 c5) (f2 x0 x2 (f1 x4 (f4 (f5 c6 x4) x7) x2))) x0 c11) x3) (f5 c13 (f6 c12 c5 x2)) c0) (f1 (f5 (f7 c7 (f0 c2 c6) (f6 x2 x3 c2)) c5) (f7 (f5 (f1 c1 c7 (f0 (f3 x0 c5 c12) c0)) (f3 x1 (f2 (f0 (f7 c14 c4 c5) x5) c2 x7) (f2 c0 (f7 x3 (f1 x4 c14 x0) (f7 c13 c10 c5)) c13))) x3 (f2 c5 c6 x6)) (f6 (f3 (f4 x0 x2) c11 c4) (f0 c12 x5) (f1 (f0 (f6 c9 c9 c5) x5) (f4 x3 (f4 c2 x3)) (f4 c1 (f5 x1 x0))))) (f4 (f4 c8 c4) (f7 (f7 x6 c9 x1) (f4 c1 c3) (f4 c10 c8)))) (f5 (f4 (f2 c12 (f1 c5 c9 x6) c13) (f0 (f1 x4 x7 c8) (f2 c7 c2 c6))) (f7 c3 (f2 (f1 x6 c5 x0) x3 c15) (f1 c0 x6 c12))))) 0.0) (- (f1 (f7 c1 (f5 c14 x3) x7) (f6 (f3 (f0 (f2 (f6 (f5 (f6 x1 x7 c2) x5) (f2 c0 c6 c5) (f2 x0 x2 (f1 x4 (f4 (f5 c6 x4) x7) x2))) x0 c11) x3) (f5 c13 (f6 c12 c5 x2)) c0) (f1 (f5 (f7 c7 (f0 c2 c6) (f6 x2 x3 c2)) c5) (f7 (f5 (f1 c1 c7 (f0 (f3 x0 c5 c12) c0)) (f3 x1 (f2 (f0 (f7 c14 c4 c5) x5) c2 x7) (f2 c0 (f7 x3 (f1 x4 c14 x0) (f7 c13 c10 c5)) c13))) x3 (f2 c5 c6 x6)) (f6 (f3 (f4 x0 x2) c11 c4) (f0 c12 x5) (f1 (f0 (f6 c9 c9 c5) x5) (f4 x3 (f4 c2 x3)) (f4 c1 (f5 x1 x0))))) (f4 (f4 c8 c4) (f7 (f7 x6 c9 x1) (f4 c1 c3) (f4 c10 c8)))) (f5 (f4 (f2 c12 (f1 c5 c9 x6) c13) (f0 (f1 x4 x7 c8) (f2 c7 c2 c6))) (f7 c3 (f2 (f1 x6 c5 x0) x3 c15) (f1 c0 x6 c12)))) (f1 (f7 c1 (f5 c14 x3) x7) (f6 (f3 (f0 (f2 (f6 (f5 (f6 x1 x7 c2) x5) (f2 c0 c6 c5) (f2 x0 x2 (f1 x4 (f4 (f5 c6 x4) x7) x2))) x0 c11) x3) (f5 c13 (f6 c12 c5 x2)) c0) (f1 (f5 (f7 c7 (f0 c2 c6) (f6 x2 x3 c2)) c5) (f7 (f5 (f1 c1 c7 (f0 (f3 x0 c5 c12) c0)) (f3 x1 (f2 (f0 (f7 c14 c4 c5) x5) c2 x7) (f2 c0 (f7 x3 (f1 x4 c14 x0) (f7 c13 c10 c5)) c13))) x3 (f2 c5 c6 x6)) (f6 (f3 (f4 x0 x2) c11 c4) (f0 c12 x5) (f1 (f0 (f6 c9 c9 c5) x5) (f4 x3 (f4 c2 x3)) (f4 c1 (f5 x1 x0))))) (f4 (f4 c8 c4) (f7 (f7 x6 c9 x1) (f4 c1 c3) (f4 c10 c8)))) (f5 (f4 (f2 c12 (f1 c5 c9 x6) c13) (f0 (f1 x4 x7 c8) (f2 c7 c2 c6))) (f7 c3 (f2 (f1 x6 c5 x0) x3 c15) (f1 c0 x6 c12))))) (- (- (f1 (f7 c1 (f5 c14 x3) x7) (f6 (f3 (f0 (f2 (f6 (f5 (f6 x1 x7 c2) x5) (f2 c0 c6 c5) (f2 x0 x2 (f1 x4 (f4 (f5 c6 x4) x7) x2))) x0 c11) x3) (f5 c13 (f6 c12 c5 x2)) c0) (f1 (f5 (f7 c7 (f0 c2 c6) (f6 x2 x3 c2)) c5) (f7 (f5 (f1 c1 c7 (f0 (f3 x0 c5 c12) c0)) (f3 x1 (f2 (f0 (f7 c14 c4 c5) x5) c2 x7) (f2 c0 (f7 x3 (f1 x4 c14 x0) (f7 c13 c10 c5)) c13))) x3 (f2 c5 c6 x6)) (f6 (f3 (f4 x0 x2) c11 c4) (f0 c12 x5) (f1 (f0 (f6 c9 c9 c5) x5) (f4 x3 (f4 c2 x3)) (f4 c1 (f5 x1 x0))))) (f4 (f4 c8 c4) (f7 (f7 x6 c9 x1) (f4 c1 c3) (f4 c10 c8)))) (f5 (f4 (f2 c12 (f1 c5 c9 x6) c13) (f0 (f1 x4 x7 c8) (f2 c7 c2 c6))) (f7 c3 (f2 (f1 x6 c5 x0) x3 c15) (f1 c0 x6 c12)))) (f1 (f7 c1 (f5 c14 x3) x7) (f6 (f3 (f0 (f2 (f6 (f5 (f6 x1 x7 c2) x5) (f2 c0 c6 c5) (f2 x0 x2 (f1 x4 (f4 (f5 c6 x4) x7) x2))) x0 c11) x3) (f5 c13 (f6 c12 c5 x2)) c0) (f1 (f5 (f7 c7 (f0 c2 c6) (f6 x2 x3 c2)) c5) (f7 (f5 (f1 c1 c7 (f0 (f3 x0 c5 c12) c0)) (f3 x1 (f2 (f0 (f7 c14 c4 c5) x5) c2 x7) (f2 c0 (f7 x3 (f1 x4 c14 x0) (f7 c13 c10 c5)) c13))) x3 (f2 c5 c6 x6)) (f6 (f3 (f4 x0 x2) c11 c4) (f0 c12 x5) (f1 (f0 (f6 c9 c9 c5) x5) (f4 x3 (f4 c2 x3)) (f4 c1 (f5 x1 x0))))) (f4 (f4 c8 c4) (f7 (f7 x6 c9 x1) (f4 c1 c3) (f4 c10 c8)))) (f5 (f4 (f2 c12 (f1 c5 c9 x6) c13) (f0 (f1 x4 x7 c8) (f2 c7 c2 c6))) (f7 c3 (f2 (f1 x6 c5 x0) x3 c15) (f1 c0 x6 c12))))))) epsilon)
                 ))
               ))
             )))))

(check-sat)

