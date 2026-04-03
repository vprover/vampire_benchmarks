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
(declare-fun f2 (Real Real) Real)
(declare-fun f3 (Real) Real)
(declare-fun f4 (Real Real) Real)
(declare-fun f5 (Real Real Real) Real)
(declare-fun f6 (Real) Real)
(declare-fun f7 (Real Real) Real)
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
(assert (not (forall ( (x0 Real) (x1 Real) ) ; lim[x -> a](f0 (f0 c1 (f2 (f7 (f7 c11 c10) c6) (f5 (f3 (f3 (f7 c6 (f3 (f3 (f5 c4 c11 c14)))))) (f1 x1 c3 (f7 (f1 c15 c15 x0) (f1 c8 (f1 c2 c7 c0) x0))) (f6 (f7 (f7 x1 c12) (f7 c5 c5)))))) (f3 (f1 (f5 (f2 x1 (f7 (f7 c7 (f7 c3 c3)) x1)) (f4 c7 (f4 c11 c0)) (f6 c1)) (f3 (f0 (f5 c14 c11 c10) (f3 (f7 (f4 (f5 (f0 x0 c15) (f5 c8 c8 c12) (f5 (f2 x1 c15) (f7 c4 c10) c14)) (f3 (f1 (f6 c2) (f7 c9 (f7 c4 (f5 c12 c4 c3))) c0))) (f4 (f2 (f6 (f0 c6 x0)) c12) (f7 (f6 (f6 c0)) (f2 (f1 (f1 c13 (f0 (f5 c13 c5 c7) (f4 c4 c11)) (f0 c3 c10)) c12 c1) c8))))))) (f5 c7 c10 x1)))) = (f0 (f0 c1 (f2 (f7 (f7 c11 c10) c6) (f5 (f3 (f3 (f7 c6 (f3 (f3 (f5 c4 c11 c14)))))) (f1 x1 c3 (f7 (f1 c15 c15 x0) (f1 c8 (f1 c2 c7 c0) x0))) (f6 (f7 (f7 x1 c12) (f7 c5 c5)))))) (f3 (f1 (f5 (f2 x1 (f7 (f7 c7 (f7 c3 c3)) x1)) (f4 c7 (f4 c11 c0)) (f6 c1)) (f3 (f0 (f5 c14 c11 c10) (f3 (f7 (f4 (f5 (f0 x0 c15) (f5 c8 c8 c12) (f5 (f2 x1 c15) (f7 c4 c10) c14)) (f3 (f1 (f6 c2) (f7 c9 (f7 c4 (f5 c12 c4 c3))) c0))) (f4 (f2 (f6 (f0 c6 x0)) c12) (f7 (f6 (f6 c0)) (f2 (f1 (f1 c13 (f0 (f5 c13 c5 c7) (f4 c4 c11)) (f0 c3 c10)) c12 c1) c8))))))) (f5 c7 c10 x1))))
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
                                          ; | (f0 (f0 c1 (f2 (f7 (f7 c11 c10) c6) (f5 (f3 (f3 (f7 c6 (f3 (f3 (f5 c4 c11 c14)))))) (f1 x1 c3 (f7 (f1 c15 c15 x0) (f1 c8 (f1 c2 c7 c0) x0))) (f6 (f7 (f7 x1 c12) (f7 c5 c5)))))) (f3 (f1 (f5 (f2 x1 (f7 (f7 c7 (f7 c3 c3)) x1)) (f4 c7 (f4 c11 c0)) (f6 c1)) (f3 (f0 (f5 c14 c11 c10) (f3 (f7 (f4 (f5 (f0 x0 c15) (f5 c8 c8 c12) (f5 (f2 x1 c15) (f7 c4 c10) c14)) (f3 (f1 (f6 c2) (f7 c9 (f7 c4 (f5 c12 c4 c3))) c0))) (f4 (f2 (f6 (f0 c6 x0)) c12) (f7 (f6 (f6 c0)) (f2 (f1 (f1 c13 (f0 (f5 c13 c5 c7) (f4 c4 c11)) (f0 c3 c10)) c12 c1) c8))))))) (f5 c7 c10 x1)))) - (f0 (f0 c1 (f2 (f7 (f7 c11 c10) c6) (f5 (f3 (f3 (f7 c6 (f3 (f3 (f5 c4 c11 c14)))))) (f1 x1 c3 (f7 (f1 c15 c15 x0) (f1 c8 (f1 c2 c7 c0) x0))) (f6 (f7 (f7 x1 c12) (f7 c5 c5)))))) (f3 (f1 (f5 (f2 x1 (f7 (f7 c7 (f7 c3 c3)) x1)) (f4 c7 (f4 c11 c0)) (f6 c1)) (f3 (f0 (f5 c14 c11 c10) (f3 (f7 (f4 (f5 (f0 x0 c15) (f5 c8 c8 c12) (f5 (f2 x1 c15) (f7 c4 c10) c14)) (f3 (f1 (f6 c2) (f7 c9 (f7 c4 (f5 c12 c4 c3))) c0))) (f4 (f2 (f6 (f0 c6 x0)) c12) (f7 (f6 (f6 c0)) (f2 (f1 (f1 c13 (f0 (f5 c13 c5 c7) (f4 c4 c11)) (f0 c3 c10)) c12 c1) c8))))))) (f5 c7 c10 x1)))) | < epsilon
                                          (< (ite (>= (- (f0 (f0 c1 (f2 (f7 (f7 c11 c10) c6) (f5 (f3 (f3 (f7 c6 (f3 (f3 (f5 c4 c11 c14)))))) (f1 x1 c3 (f7 (f1 c15 c15 x0) (f1 c8 (f1 c2 c7 c0) x0))) (f6 (f7 (f7 x1 c12) (f7 c5 c5)))))) (f3 (f1 (f5 (f2 x1 (f7 (f7 c7 (f7 c3 c3)) x1)) (f4 c7 (f4 c11 c0)) (f6 c1)) (f3 (f0 (f5 c14 c11 c10) (f3 (f7 (f4 (f5 (f0 x0 c15) (f5 c8 c8 c12) (f5 (f2 x1 c15) (f7 c4 c10) c14)) (f3 (f1 (f6 c2) (f7 c9 (f7 c4 (f5 c12 c4 c3))) c0))) (f4 (f2 (f6 (f0 c6 x0)) c12) (f7 (f6 (f6 c0)) (f2 (f1 (f1 c13 (f0 (f5 c13 c5 c7) (f4 c4 c11)) (f0 c3 c10)) c12 c1) c8))))))) (f5 c7 c10 x1)))) (f0 (f0 c1 (f2 (f7 (f7 c11 c10) c6) (f5 (f3 (f3 (f7 c6 (f3 (f3 (f5 c4 c11 c14)))))) (f1 x1 c3 (f7 (f1 c15 c15 x0) (f1 c8 (f1 c2 c7 c0) x0))) (f6 (f7 (f7 x1 c12) (f7 c5 c5)))))) (f3 (f1 (f5 (f2 x1 (f7 (f7 c7 (f7 c3 c3)) x1)) (f4 c7 (f4 c11 c0)) (f6 c1)) (f3 (f0 (f5 c14 c11 c10) (f3 (f7 (f4 (f5 (f0 x0 c15) (f5 c8 c8 c12) (f5 (f2 x1 c15) (f7 c4 c10) c14)) (f3 (f1 (f6 c2) (f7 c9 (f7 c4 (f5 c12 c4 c3))) c0))) (f4 (f2 (f6 (f0 c6 x0)) c12) (f7 (f6 (f6 c0)) (f2 (f1 (f1 c13 (f0 (f5 c13 c5 c7) (f4 c4 c11)) (f0 c3 c10)) c12 c1) c8))))))) (f5 c7 c10 x1))))) 0.0) (- (f0 (f0 c1 (f2 (f7 (f7 c11 c10) c6) (f5 (f3 (f3 (f7 c6 (f3 (f3 (f5 c4 c11 c14)))))) (f1 x1 c3 (f7 (f1 c15 c15 x0) (f1 c8 (f1 c2 c7 c0) x0))) (f6 (f7 (f7 x1 c12) (f7 c5 c5)))))) (f3 (f1 (f5 (f2 x1 (f7 (f7 c7 (f7 c3 c3)) x1)) (f4 c7 (f4 c11 c0)) (f6 c1)) (f3 (f0 (f5 c14 c11 c10) (f3 (f7 (f4 (f5 (f0 x0 c15) (f5 c8 c8 c12) (f5 (f2 x1 c15) (f7 c4 c10) c14)) (f3 (f1 (f6 c2) (f7 c9 (f7 c4 (f5 c12 c4 c3))) c0))) (f4 (f2 (f6 (f0 c6 x0)) c12) (f7 (f6 (f6 c0)) (f2 (f1 (f1 c13 (f0 (f5 c13 c5 c7) (f4 c4 c11)) (f0 c3 c10)) c12 c1) c8))))))) (f5 c7 c10 x1)))) (f0 (f0 c1 (f2 (f7 (f7 c11 c10) c6) (f5 (f3 (f3 (f7 c6 (f3 (f3 (f5 c4 c11 c14)))))) (f1 x1 c3 (f7 (f1 c15 c15 x0) (f1 c8 (f1 c2 c7 c0) x0))) (f6 (f7 (f7 x1 c12) (f7 c5 c5)))))) (f3 (f1 (f5 (f2 x1 (f7 (f7 c7 (f7 c3 c3)) x1)) (f4 c7 (f4 c11 c0)) (f6 c1)) (f3 (f0 (f5 c14 c11 c10) (f3 (f7 (f4 (f5 (f0 x0 c15) (f5 c8 c8 c12) (f5 (f2 x1 c15) (f7 c4 c10) c14)) (f3 (f1 (f6 c2) (f7 c9 (f7 c4 (f5 c12 c4 c3))) c0))) (f4 (f2 (f6 (f0 c6 x0)) c12) (f7 (f6 (f6 c0)) (f2 (f1 (f1 c13 (f0 (f5 c13 c5 c7) (f4 c4 c11)) (f0 c3 c10)) c12 c1) c8))))))) (f5 c7 c10 x1))))) (- (- (f0 (f0 c1 (f2 (f7 (f7 c11 c10) c6) (f5 (f3 (f3 (f7 c6 (f3 (f3 (f5 c4 c11 c14)))))) (f1 x1 c3 (f7 (f1 c15 c15 x0) (f1 c8 (f1 c2 c7 c0) x0))) (f6 (f7 (f7 x1 c12) (f7 c5 c5)))))) (f3 (f1 (f5 (f2 x1 (f7 (f7 c7 (f7 c3 c3)) x1)) (f4 c7 (f4 c11 c0)) (f6 c1)) (f3 (f0 (f5 c14 c11 c10) (f3 (f7 (f4 (f5 (f0 x0 c15) (f5 c8 c8 c12) (f5 (f2 x1 c15) (f7 c4 c10) c14)) (f3 (f1 (f6 c2) (f7 c9 (f7 c4 (f5 c12 c4 c3))) c0))) (f4 (f2 (f6 (f0 c6 x0)) c12) (f7 (f6 (f6 c0)) (f2 (f1 (f1 c13 (f0 (f5 c13 c5 c7) (f4 c4 c11)) (f0 c3 c10)) c12 c1) c8))))))) (f5 c7 c10 x1)))) (f0 (f0 c1 (f2 (f7 (f7 c11 c10) c6) (f5 (f3 (f3 (f7 c6 (f3 (f3 (f5 c4 c11 c14)))))) (f1 x1 c3 (f7 (f1 c15 c15 x0) (f1 c8 (f1 c2 c7 c0) x0))) (f6 (f7 (f7 x1 c12) (f7 c5 c5)))))) (f3 (f1 (f5 (f2 x1 (f7 (f7 c7 (f7 c3 c3)) x1)) (f4 c7 (f4 c11 c0)) (f6 c1)) (f3 (f0 (f5 c14 c11 c10) (f3 (f7 (f4 (f5 (f0 x0 c15) (f5 c8 c8 c12) (f5 (f2 x1 c15) (f7 c4 c10) c14)) (f3 (f1 (f6 c2) (f7 c9 (f7 c4 (f5 c12 c4 c3))) c0))) (f4 (f2 (f6 (f0 c6 x0)) c12) (f7 (f6 (f6 c0)) (f2 (f1 (f1 c13 (f0 (f5 c13 c5 c7) (f4 c4 c11)) (f0 c3 c10)) c12 c1) c8))))))) (f5 c7 c10 x1))))))) epsilon)
                 ))
               ))
             )))))

(check-sat)

