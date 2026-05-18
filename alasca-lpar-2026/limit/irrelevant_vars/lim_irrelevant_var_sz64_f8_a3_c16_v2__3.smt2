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
(declare-fun f1 (Real Real) Real)
(declare-fun f2 (Real) Real)
(declare-fun f3 (Real Real) Real)
(declare-fun f4 (Real) Real)
(declare-fun f5 (Real Real) Real)
(declare-fun f6 (Real Real) Real)
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
(assert (not (forall ( (x0 Real) (x1 Real) ) ; lim[x -> a](f7 (f4 (f7 (f1 (f6 (f7 (f4 (f7 c2 (f6 c11 c8))) (f0 (f3 (f6 (f5 (f1 c8 c1) c11) (f1 (f7 c7 c14) c5)) c8))) (f5 (f6 (f3 c13 (f5 c11 (f2 c11))) c12) c15)) (f1 (f5 (f6 c0 (f7 c15 c3)) c5) (f3 (f4 (f3 (f4 (f7 x1 (f4 c0))) (f5 c13 c14))) c10))) (f7 c10 (f6 c14 c3)))) (f5 (f0 (f4 (f1 (f2 (f4 (f1 (f4 c6) (f7 (f3 (f5 (f3 (f3 c1 c0) (f3 c11 (f5 c6 (f6 c8 c7)))) c0) (f2 (f4 c7))) (f6 (f6 (f1 c14 c14) c13) c15))))) x1))) (f7 (f1 c9 (f4 c4)) (f7 (f3 (f1 (f0 c7) (f1 c4 c10)) (f5 c1 c15)) c10)))) = (f7 (f4 (f7 (f1 (f6 (f7 (f4 (f7 c2 (f6 c11 c8))) (f0 (f3 (f6 (f5 (f1 c8 c1) c11) (f1 (f7 c7 c14) c5)) c8))) (f5 (f6 (f3 c13 (f5 c11 (f2 c11))) c12) c15)) (f1 (f5 (f6 c0 (f7 c15 c3)) c5) (f3 (f4 (f3 (f4 (f7 x1 (f4 c0))) (f5 c13 c14))) c10))) (f7 c10 (f6 c14 c3)))) (f5 (f0 (f4 (f1 (f2 (f4 (f1 (f4 c6) (f7 (f3 (f5 (f3 (f3 c1 c0) (f3 c11 (f5 c6 (f6 c8 c7)))) c0) (f2 (f4 c7))) (f6 (f6 (f1 c14 c14) c13) c15))))) x1))) (f7 (f1 c9 (f4 c4)) (f7 (f3 (f1 (f0 c7) (f1 c4 c10)) (f5 c1 c15)) c10))))
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
                                          ; | (f7 (f4 (f7 (f1 (f6 (f7 (f4 (f7 c2 (f6 c11 c8))) (f0 (f3 (f6 (f5 (f1 c8 c1) c11) (f1 (f7 c7 c14) c5)) c8))) (f5 (f6 (f3 c13 (f5 c11 (f2 c11))) c12) c15)) (f1 (f5 (f6 c0 (f7 c15 c3)) c5) (f3 (f4 (f3 (f4 (f7 x1 (f4 c0))) (f5 c13 c14))) c10))) (f7 c10 (f6 c14 c3)))) (f5 (f0 (f4 (f1 (f2 (f4 (f1 (f4 c6) (f7 (f3 (f5 (f3 (f3 c1 c0) (f3 c11 (f5 c6 (f6 c8 c7)))) c0) (f2 (f4 c7))) (f6 (f6 (f1 c14 c14) c13) c15))))) x1))) (f7 (f1 c9 (f4 c4)) (f7 (f3 (f1 (f0 c7) (f1 c4 c10)) (f5 c1 c15)) c10)))) - (f7 (f4 (f7 (f1 (f6 (f7 (f4 (f7 c2 (f6 c11 c8))) (f0 (f3 (f6 (f5 (f1 c8 c1) c11) (f1 (f7 c7 c14) c5)) c8))) (f5 (f6 (f3 c13 (f5 c11 (f2 c11))) c12) c15)) (f1 (f5 (f6 c0 (f7 c15 c3)) c5) (f3 (f4 (f3 (f4 (f7 x1 (f4 c0))) (f5 c13 c14))) c10))) (f7 c10 (f6 c14 c3)))) (f5 (f0 (f4 (f1 (f2 (f4 (f1 (f4 c6) (f7 (f3 (f5 (f3 (f3 c1 c0) (f3 c11 (f5 c6 (f6 c8 c7)))) c0) (f2 (f4 c7))) (f6 (f6 (f1 c14 c14) c13) c15))))) x1))) (f7 (f1 c9 (f4 c4)) (f7 (f3 (f1 (f0 c7) (f1 c4 c10)) (f5 c1 c15)) c10)))) | < epsilon
                                          (< (ite (>= (- (f7 (f4 (f7 (f1 (f6 (f7 (f4 (f7 c2 (f6 c11 c8))) (f0 (f3 (f6 (f5 (f1 c8 c1) c11) (f1 (f7 c7 c14) c5)) c8))) (f5 (f6 (f3 c13 (f5 c11 (f2 c11))) c12) c15)) (f1 (f5 (f6 c0 (f7 c15 c3)) c5) (f3 (f4 (f3 (f4 (f7 x1 (f4 c0))) (f5 c13 c14))) c10))) (f7 c10 (f6 c14 c3)))) (f5 (f0 (f4 (f1 (f2 (f4 (f1 (f4 c6) (f7 (f3 (f5 (f3 (f3 c1 c0) (f3 c11 (f5 c6 (f6 c8 c7)))) c0) (f2 (f4 c7))) (f6 (f6 (f1 c14 c14) c13) c15))))) x1))) (f7 (f1 c9 (f4 c4)) (f7 (f3 (f1 (f0 c7) (f1 c4 c10)) (f5 c1 c15)) c10)))) (f7 (f4 (f7 (f1 (f6 (f7 (f4 (f7 c2 (f6 c11 c8))) (f0 (f3 (f6 (f5 (f1 c8 c1) c11) (f1 (f7 c7 c14) c5)) c8))) (f5 (f6 (f3 c13 (f5 c11 (f2 c11))) c12) c15)) (f1 (f5 (f6 c0 (f7 c15 c3)) c5) (f3 (f4 (f3 (f4 (f7 x1 (f4 c0))) (f5 c13 c14))) c10))) (f7 c10 (f6 c14 c3)))) (f5 (f0 (f4 (f1 (f2 (f4 (f1 (f4 c6) (f7 (f3 (f5 (f3 (f3 c1 c0) (f3 c11 (f5 c6 (f6 c8 c7)))) c0) (f2 (f4 c7))) (f6 (f6 (f1 c14 c14) c13) c15))))) x1))) (f7 (f1 c9 (f4 c4)) (f7 (f3 (f1 (f0 c7) (f1 c4 c10)) (f5 c1 c15)) c10))))) 0.0) (- (f7 (f4 (f7 (f1 (f6 (f7 (f4 (f7 c2 (f6 c11 c8))) (f0 (f3 (f6 (f5 (f1 c8 c1) c11) (f1 (f7 c7 c14) c5)) c8))) (f5 (f6 (f3 c13 (f5 c11 (f2 c11))) c12) c15)) (f1 (f5 (f6 c0 (f7 c15 c3)) c5) (f3 (f4 (f3 (f4 (f7 x1 (f4 c0))) (f5 c13 c14))) c10))) (f7 c10 (f6 c14 c3)))) (f5 (f0 (f4 (f1 (f2 (f4 (f1 (f4 c6) (f7 (f3 (f5 (f3 (f3 c1 c0) (f3 c11 (f5 c6 (f6 c8 c7)))) c0) (f2 (f4 c7))) (f6 (f6 (f1 c14 c14) c13) c15))))) x1))) (f7 (f1 c9 (f4 c4)) (f7 (f3 (f1 (f0 c7) (f1 c4 c10)) (f5 c1 c15)) c10)))) (f7 (f4 (f7 (f1 (f6 (f7 (f4 (f7 c2 (f6 c11 c8))) (f0 (f3 (f6 (f5 (f1 c8 c1) c11) (f1 (f7 c7 c14) c5)) c8))) (f5 (f6 (f3 c13 (f5 c11 (f2 c11))) c12) c15)) (f1 (f5 (f6 c0 (f7 c15 c3)) c5) (f3 (f4 (f3 (f4 (f7 x1 (f4 c0))) (f5 c13 c14))) c10))) (f7 c10 (f6 c14 c3)))) (f5 (f0 (f4 (f1 (f2 (f4 (f1 (f4 c6) (f7 (f3 (f5 (f3 (f3 c1 c0) (f3 c11 (f5 c6 (f6 c8 c7)))) c0) (f2 (f4 c7))) (f6 (f6 (f1 c14 c14) c13) c15))))) x1))) (f7 (f1 c9 (f4 c4)) (f7 (f3 (f1 (f0 c7) (f1 c4 c10)) (f5 c1 c15)) c10))))) (- (- (f7 (f4 (f7 (f1 (f6 (f7 (f4 (f7 c2 (f6 c11 c8))) (f0 (f3 (f6 (f5 (f1 c8 c1) c11) (f1 (f7 c7 c14) c5)) c8))) (f5 (f6 (f3 c13 (f5 c11 (f2 c11))) c12) c15)) (f1 (f5 (f6 c0 (f7 c15 c3)) c5) (f3 (f4 (f3 (f4 (f7 x1 (f4 c0))) (f5 c13 c14))) c10))) (f7 c10 (f6 c14 c3)))) (f5 (f0 (f4 (f1 (f2 (f4 (f1 (f4 c6) (f7 (f3 (f5 (f3 (f3 c1 c0) (f3 c11 (f5 c6 (f6 c8 c7)))) c0) (f2 (f4 c7))) (f6 (f6 (f1 c14 c14) c13) c15))))) x1))) (f7 (f1 c9 (f4 c4)) (f7 (f3 (f1 (f0 c7) (f1 c4 c10)) (f5 c1 c15)) c10)))) (f7 (f4 (f7 (f1 (f6 (f7 (f4 (f7 c2 (f6 c11 c8))) (f0 (f3 (f6 (f5 (f1 c8 c1) c11) (f1 (f7 c7 c14) c5)) c8))) (f5 (f6 (f3 c13 (f5 c11 (f2 c11))) c12) c15)) (f1 (f5 (f6 c0 (f7 c15 c3)) c5) (f3 (f4 (f3 (f4 (f7 x1 (f4 c0))) (f5 c13 c14))) c10))) (f7 c10 (f6 c14 c3)))) (f5 (f0 (f4 (f1 (f2 (f4 (f1 (f4 c6) (f7 (f3 (f5 (f3 (f3 c1 c0) (f3 c11 (f5 c6 (f6 c8 c7)))) c0) (f2 (f4 c7))) (f6 (f6 (f1 c14 c14) c13) c15))))) x1))) (f7 (f1 c9 (f4 c4)) (f7 (f3 (f1 (f0 c7) (f1 c4 c10)) (f5 c1 c15)) c10))))))) epsilon)
                 ))
               ))
             )))))

(check-sat)

