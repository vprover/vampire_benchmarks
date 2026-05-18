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
(assert (not (forall ( (x0 Real) (x1 Real) (x2 Real) (x3 Real) (x4 Real) (x5 Real) (x6 Real) (x7 Real) ) ; lim[x -> a](f0 (f0 x4 (f2 (f7 (f7 c9 c8) c2) (f5 (f3 (f3 (f7 c2 (f3 (f3 (f5 c0 c9 c14)))))) (f1 x1 x7 (f7 (f1 c15 c15 x0) (f1 c5 (f1 x5 c4 x3) x0))) (f6 (f7 (f7 x2 c11) (f7 c1 c1)))))) (f3 (f1 (f5 (f2 x1 (f7 (f7 c4 (f7 x6 x6)) x1)) (f4 c5 (f4 c10 x3)) (f6 x5)) (f3 (f0 (f5 c13 c10 c8) (f3 (f7 (f4 (f5 (f0 x1 c15) (f5 c6 c5 c10) (f5 (f2 x2 c15) (f7 c1 c8) c13)) (f3 (f1 (f6 x6) (f7 c7 (f7 c1 (f5 c11 c0 x7))) x2))) (f4 (f2 (f6 (f0 c3 x0)) c10) (f7 (f6 (f6 x2)) (f2 (f1 (f1 c13 (f0 (f5 c12 c2 c5) (f4 c0 c10)) (f0 x7 c8)) c11 x5) c6))))))) (f5 c4 c9 x1)))) = (f0 (f0 x4 (f2 (f7 (f7 c9 c8) c2) (f5 (f3 (f3 (f7 c2 (f3 (f3 (f5 c0 c9 c14)))))) (f1 x1 x7 (f7 (f1 c15 c15 x0) (f1 c5 (f1 x5 c4 x3) x0))) (f6 (f7 (f7 x2 c11) (f7 c1 c1)))))) (f3 (f1 (f5 (f2 x1 (f7 (f7 c4 (f7 x6 x6)) x1)) (f4 c5 (f4 c10 x3)) (f6 x5)) (f3 (f0 (f5 c13 c10 c8) (f3 (f7 (f4 (f5 (f0 x1 c15) (f5 c6 c5 c10) (f5 (f2 x2 c15) (f7 c1 c8) c13)) (f3 (f1 (f6 x6) (f7 c7 (f7 c1 (f5 c11 c0 x7))) x2))) (f4 (f2 (f6 (f0 c3 x0)) c10) (f7 (f6 (f6 x2)) (f2 (f1 (f1 c13 (f0 (f5 c12 c2 c5) (f4 c0 c10)) (f0 x7 c8)) c11 x5) c6))))))) (f5 c4 c9 x1))))
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
                                          ; | (f0 (f0 x4 (f2 (f7 (f7 c9 c8) c2) (f5 (f3 (f3 (f7 c2 (f3 (f3 (f5 c0 c9 c14)))))) (f1 x1 x7 (f7 (f1 c15 c15 x0) (f1 c5 (f1 x5 c4 x3) x0))) (f6 (f7 (f7 x2 c11) (f7 c1 c1)))))) (f3 (f1 (f5 (f2 x1 (f7 (f7 c4 (f7 x6 x6)) x1)) (f4 c5 (f4 c10 x3)) (f6 x5)) (f3 (f0 (f5 c13 c10 c8) (f3 (f7 (f4 (f5 (f0 x1 c15) (f5 c6 c5 c10) (f5 (f2 x2 c15) (f7 c1 c8) c13)) (f3 (f1 (f6 x6) (f7 c7 (f7 c1 (f5 c11 c0 x7))) x2))) (f4 (f2 (f6 (f0 c3 x0)) c10) (f7 (f6 (f6 x2)) (f2 (f1 (f1 c13 (f0 (f5 c12 c2 c5) (f4 c0 c10)) (f0 x7 c8)) c11 x5) c6))))))) (f5 c4 c9 x1)))) - (f0 (f0 x4 (f2 (f7 (f7 c9 c8) c2) (f5 (f3 (f3 (f7 c2 (f3 (f3 (f5 c0 c9 c14)))))) (f1 x1 x7 (f7 (f1 c15 c15 x0) (f1 c5 (f1 x5 c4 x3) x0))) (f6 (f7 (f7 x2 c11) (f7 c1 c1)))))) (f3 (f1 (f5 (f2 x1 (f7 (f7 c4 (f7 x6 x6)) x1)) (f4 c5 (f4 c10 x3)) (f6 x5)) (f3 (f0 (f5 c13 c10 c8) (f3 (f7 (f4 (f5 (f0 x1 c15) (f5 c6 c5 c10) (f5 (f2 x2 c15) (f7 c1 c8) c13)) (f3 (f1 (f6 x6) (f7 c7 (f7 c1 (f5 c11 c0 x7))) x2))) (f4 (f2 (f6 (f0 c3 x0)) c10) (f7 (f6 (f6 x2)) (f2 (f1 (f1 c13 (f0 (f5 c12 c2 c5) (f4 c0 c10)) (f0 x7 c8)) c11 x5) c6))))))) (f5 c4 c9 x1)))) | < epsilon
                                          (< (ite (>= (- (f0 (f0 x4 (f2 (f7 (f7 c9 c8) c2) (f5 (f3 (f3 (f7 c2 (f3 (f3 (f5 c0 c9 c14)))))) (f1 x1 x7 (f7 (f1 c15 c15 x0) (f1 c5 (f1 x5 c4 x3) x0))) (f6 (f7 (f7 x2 c11) (f7 c1 c1)))))) (f3 (f1 (f5 (f2 x1 (f7 (f7 c4 (f7 x6 x6)) x1)) (f4 c5 (f4 c10 x3)) (f6 x5)) (f3 (f0 (f5 c13 c10 c8) (f3 (f7 (f4 (f5 (f0 x1 c15) (f5 c6 c5 c10) (f5 (f2 x2 c15) (f7 c1 c8) c13)) (f3 (f1 (f6 x6) (f7 c7 (f7 c1 (f5 c11 c0 x7))) x2))) (f4 (f2 (f6 (f0 c3 x0)) c10) (f7 (f6 (f6 x2)) (f2 (f1 (f1 c13 (f0 (f5 c12 c2 c5) (f4 c0 c10)) (f0 x7 c8)) c11 x5) c6))))))) (f5 c4 c9 x1)))) (f0 (f0 x4 (f2 (f7 (f7 c9 c8) c2) (f5 (f3 (f3 (f7 c2 (f3 (f3 (f5 c0 c9 c14)))))) (f1 x1 x7 (f7 (f1 c15 c15 x0) (f1 c5 (f1 x5 c4 x3) x0))) (f6 (f7 (f7 x2 c11) (f7 c1 c1)))))) (f3 (f1 (f5 (f2 x1 (f7 (f7 c4 (f7 x6 x6)) x1)) (f4 c5 (f4 c10 x3)) (f6 x5)) (f3 (f0 (f5 c13 c10 c8) (f3 (f7 (f4 (f5 (f0 x1 c15) (f5 c6 c5 c10) (f5 (f2 x2 c15) (f7 c1 c8) c13)) (f3 (f1 (f6 x6) (f7 c7 (f7 c1 (f5 c11 c0 x7))) x2))) (f4 (f2 (f6 (f0 c3 x0)) c10) (f7 (f6 (f6 x2)) (f2 (f1 (f1 c13 (f0 (f5 c12 c2 c5) (f4 c0 c10)) (f0 x7 c8)) c11 x5) c6))))))) (f5 c4 c9 x1))))) 0.0) (- (f0 (f0 x4 (f2 (f7 (f7 c9 c8) c2) (f5 (f3 (f3 (f7 c2 (f3 (f3 (f5 c0 c9 c14)))))) (f1 x1 x7 (f7 (f1 c15 c15 x0) (f1 c5 (f1 x5 c4 x3) x0))) (f6 (f7 (f7 x2 c11) (f7 c1 c1)))))) (f3 (f1 (f5 (f2 x1 (f7 (f7 c4 (f7 x6 x6)) x1)) (f4 c5 (f4 c10 x3)) (f6 x5)) (f3 (f0 (f5 c13 c10 c8) (f3 (f7 (f4 (f5 (f0 x1 c15) (f5 c6 c5 c10) (f5 (f2 x2 c15) (f7 c1 c8) c13)) (f3 (f1 (f6 x6) (f7 c7 (f7 c1 (f5 c11 c0 x7))) x2))) (f4 (f2 (f6 (f0 c3 x0)) c10) (f7 (f6 (f6 x2)) (f2 (f1 (f1 c13 (f0 (f5 c12 c2 c5) (f4 c0 c10)) (f0 x7 c8)) c11 x5) c6))))))) (f5 c4 c9 x1)))) (f0 (f0 x4 (f2 (f7 (f7 c9 c8) c2) (f5 (f3 (f3 (f7 c2 (f3 (f3 (f5 c0 c9 c14)))))) (f1 x1 x7 (f7 (f1 c15 c15 x0) (f1 c5 (f1 x5 c4 x3) x0))) (f6 (f7 (f7 x2 c11) (f7 c1 c1)))))) (f3 (f1 (f5 (f2 x1 (f7 (f7 c4 (f7 x6 x6)) x1)) (f4 c5 (f4 c10 x3)) (f6 x5)) (f3 (f0 (f5 c13 c10 c8) (f3 (f7 (f4 (f5 (f0 x1 c15) (f5 c6 c5 c10) (f5 (f2 x2 c15) (f7 c1 c8) c13)) (f3 (f1 (f6 x6) (f7 c7 (f7 c1 (f5 c11 c0 x7))) x2))) (f4 (f2 (f6 (f0 c3 x0)) c10) (f7 (f6 (f6 x2)) (f2 (f1 (f1 c13 (f0 (f5 c12 c2 c5) (f4 c0 c10)) (f0 x7 c8)) c11 x5) c6))))))) (f5 c4 c9 x1))))) (- (- (f0 (f0 x4 (f2 (f7 (f7 c9 c8) c2) (f5 (f3 (f3 (f7 c2 (f3 (f3 (f5 c0 c9 c14)))))) (f1 x1 x7 (f7 (f1 c15 c15 x0) (f1 c5 (f1 x5 c4 x3) x0))) (f6 (f7 (f7 x2 c11) (f7 c1 c1)))))) (f3 (f1 (f5 (f2 x1 (f7 (f7 c4 (f7 x6 x6)) x1)) (f4 c5 (f4 c10 x3)) (f6 x5)) (f3 (f0 (f5 c13 c10 c8) (f3 (f7 (f4 (f5 (f0 x1 c15) (f5 c6 c5 c10) (f5 (f2 x2 c15) (f7 c1 c8) c13)) (f3 (f1 (f6 x6) (f7 c7 (f7 c1 (f5 c11 c0 x7))) x2))) (f4 (f2 (f6 (f0 c3 x0)) c10) (f7 (f6 (f6 x2)) (f2 (f1 (f1 c13 (f0 (f5 c12 c2 c5) (f4 c0 c10)) (f0 x7 c8)) c11 x5) c6))))))) (f5 c4 c9 x1)))) (f0 (f0 x4 (f2 (f7 (f7 c9 c8) c2) (f5 (f3 (f3 (f7 c2 (f3 (f3 (f5 c0 c9 c14)))))) (f1 x1 x7 (f7 (f1 c15 c15 x0) (f1 c5 (f1 x5 c4 x3) x0))) (f6 (f7 (f7 x2 c11) (f7 c1 c1)))))) (f3 (f1 (f5 (f2 x1 (f7 (f7 c4 (f7 x6 x6)) x1)) (f4 c5 (f4 c10 x3)) (f6 x5)) (f3 (f0 (f5 c13 c10 c8) (f3 (f7 (f4 (f5 (f0 x1 c15) (f5 c6 c5 c10) (f5 (f2 x2 c15) (f7 c1 c8) c13)) (f3 (f1 (f6 x6) (f7 c7 (f7 c1 (f5 c11 c0 x7))) x2))) (f4 (f2 (f6 (f0 c3 x0)) c10) (f7 (f6 (f6 x2)) (f2 (f1 (f1 c13 (f0 (f5 c12 c2 c5) (f4 c0 c10)) (f0 x7 c8)) c11 x5) c6))))))) (f5 c4 c9 x1))))))) epsilon)
                 ))
               ))
             )))))

(check-sat)

