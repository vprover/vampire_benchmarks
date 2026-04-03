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
(declare-fun f1 (Real) Real)
(declare-fun f2 (Real Real) Real)
(declare-fun f3 (Real Real Real) Real)
(declare-fun f4 (Real Real) Real)
(declare-fun f5 (Real) Real)
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
(assert (not (forall ( (x0 Real) (x1 Real) ) ; lim[x -> a](f4 (f5 (f6 (f7 (f7 c2 (f1 c6) (f1 x1)) (f0 (f6 (f5 (f7 x0 (f6 c13 c0) (f0 (f6 c6 c2) (f5 (f2 c0 c6))))) c8) x1) (f2 (f6 (f7 (f5 (f3 c12 c14 c3)) c14 (f5 c9)) (f5 c12)) (f2 (f4 (f5 c2) (f4 (f4 (f4 (f1 c12) c3) (f2 (f2 (f5 c7) c0) (f2 x1 c11))) c8)) (f6 (f1 c1) (f2 c9 c12))))) (f1 (f7 (f1 (f4 (f0 c0 (f4 c4 (f7 x1 (f0 c15 c6) c10))) c4)) (f4 c12 c15) (f6 c12 (f6 (f7 x0 c6 c2) (f3 c13 c0 c2))))))) (f4 (f2 (f4 (f3 c9 c12 c15) c12) (f6 c7 (f4 (f1 (f7 c10 (f3 c11 c4 c15) (f0 c11 c7))) (f7 c0 c14 c6)))) (f0 c7 (f7 c14 (f5 c1) c2)))) = (f4 (f5 (f6 (f7 (f7 c2 (f1 c6) (f1 x1)) (f0 (f6 (f5 (f7 x0 (f6 c13 c0) (f0 (f6 c6 c2) (f5 (f2 c0 c6))))) c8) x1) (f2 (f6 (f7 (f5 (f3 c12 c14 c3)) c14 (f5 c9)) (f5 c12)) (f2 (f4 (f5 c2) (f4 (f4 (f4 (f1 c12) c3) (f2 (f2 (f5 c7) c0) (f2 x1 c11))) c8)) (f6 (f1 c1) (f2 c9 c12))))) (f1 (f7 (f1 (f4 (f0 c0 (f4 c4 (f7 x1 (f0 c15 c6) c10))) c4)) (f4 c12 c15) (f6 c12 (f6 (f7 x0 c6 c2) (f3 c13 c0 c2))))))) (f4 (f2 (f4 (f3 c9 c12 c15) c12) (f6 c7 (f4 (f1 (f7 c10 (f3 c11 c4 c15) (f0 c11 c7))) (f7 c0 c14 c6)))) (f0 c7 (f7 c14 (f5 c1) c2))))
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
                                          ; | (f4 (f5 (f6 (f7 (f7 c2 (f1 c6) (f1 x1)) (f0 (f6 (f5 (f7 x0 (f6 c13 c0) (f0 (f6 c6 c2) (f5 (f2 c0 c6))))) c8) x1) (f2 (f6 (f7 (f5 (f3 c12 c14 c3)) c14 (f5 c9)) (f5 c12)) (f2 (f4 (f5 c2) (f4 (f4 (f4 (f1 c12) c3) (f2 (f2 (f5 c7) c0) (f2 x1 c11))) c8)) (f6 (f1 c1) (f2 c9 c12))))) (f1 (f7 (f1 (f4 (f0 c0 (f4 c4 (f7 x1 (f0 c15 c6) c10))) c4)) (f4 c12 c15) (f6 c12 (f6 (f7 x0 c6 c2) (f3 c13 c0 c2))))))) (f4 (f2 (f4 (f3 c9 c12 c15) c12) (f6 c7 (f4 (f1 (f7 c10 (f3 c11 c4 c15) (f0 c11 c7))) (f7 c0 c14 c6)))) (f0 c7 (f7 c14 (f5 c1) c2)))) - (f4 (f5 (f6 (f7 (f7 c2 (f1 c6) (f1 x1)) (f0 (f6 (f5 (f7 x0 (f6 c13 c0) (f0 (f6 c6 c2) (f5 (f2 c0 c6))))) c8) x1) (f2 (f6 (f7 (f5 (f3 c12 c14 c3)) c14 (f5 c9)) (f5 c12)) (f2 (f4 (f5 c2) (f4 (f4 (f4 (f1 c12) c3) (f2 (f2 (f5 c7) c0) (f2 x1 c11))) c8)) (f6 (f1 c1) (f2 c9 c12))))) (f1 (f7 (f1 (f4 (f0 c0 (f4 c4 (f7 x1 (f0 c15 c6) c10))) c4)) (f4 c12 c15) (f6 c12 (f6 (f7 x0 c6 c2) (f3 c13 c0 c2))))))) (f4 (f2 (f4 (f3 c9 c12 c15) c12) (f6 c7 (f4 (f1 (f7 c10 (f3 c11 c4 c15) (f0 c11 c7))) (f7 c0 c14 c6)))) (f0 c7 (f7 c14 (f5 c1) c2)))) | < epsilon
                                          (< (ite (>= (- (f4 (f5 (f6 (f7 (f7 c2 (f1 c6) (f1 x1)) (f0 (f6 (f5 (f7 x0 (f6 c13 c0) (f0 (f6 c6 c2) (f5 (f2 c0 c6))))) c8) x1) (f2 (f6 (f7 (f5 (f3 c12 c14 c3)) c14 (f5 c9)) (f5 c12)) (f2 (f4 (f5 c2) (f4 (f4 (f4 (f1 c12) c3) (f2 (f2 (f5 c7) c0) (f2 x1 c11))) c8)) (f6 (f1 c1) (f2 c9 c12))))) (f1 (f7 (f1 (f4 (f0 c0 (f4 c4 (f7 x1 (f0 c15 c6) c10))) c4)) (f4 c12 c15) (f6 c12 (f6 (f7 x0 c6 c2) (f3 c13 c0 c2))))))) (f4 (f2 (f4 (f3 c9 c12 c15) c12) (f6 c7 (f4 (f1 (f7 c10 (f3 c11 c4 c15) (f0 c11 c7))) (f7 c0 c14 c6)))) (f0 c7 (f7 c14 (f5 c1) c2)))) (f4 (f5 (f6 (f7 (f7 c2 (f1 c6) (f1 x1)) (f0 (f6 (f5 (f7 x0 (f6 c13 c0) (f0 (f6 c6 c2) (f5 (f2 c0 c6))))) c8) x1) (f2 (f6 (f7 (f5 (f3 c12 c14 c3)) c14 (f5 c9)) (f5 c12)) (f2 (f4 (f5 c2) (f4 (f4 (f4 (f1 c12) c3) (f2 (f2 (f5 c7) c0) (f2 x1 c11))) c8)) (f6 (f1 c1) (f2 c9 c12))))) (f1 (f7 (f1 (f4 (f0 c0 (f4 c4 (f7 x1 (f0 c15 c6) c10))) c4)) (f4 c12 c15) (f6 c12 (f6 (f7 x0 c6 c2) (f3 c13 c0 c2))))))) (f4 (f2 (f4 (f3 c9 c12 c15) c12) (f6 c7 (f4 (f1 (f7 c10 (f3 c11 c4 c15) (f0 c11 c7))) (f7 c0 c14 c6)))) (f0 c7 (f7 c14 (f5 c1) c2))))) 0.0) (- (f4 (f5 (f6 (f7 (f7 c2 (f1 c6) (f1 x1)) (f0 (f6 (f5 (f7 x0 (f6 c13 c0) (f0 (f6 c6 c2) (f5 (f2 c0 c6))))) c8) x1) (f2 (f6 (f7 (f5 (f3 c12 c14 c3)) c14 (f5 c9)) (f5 c12)) (f2 (f4 (f5 c2) (f4 (f4 (f4 (f1 c12) c3) (f2 (f2 (f5 c7) c0) (f2 x1 c11))) c8)) (f6 (f1 c1) (f2 c9 c12))))) (f1 (f7 (f1 (f4 (f0 c0 (f4 c4 (f7 x1 (f0 c15 c6) c10))) c4)) (f4 c12 c15) (f6 c12 (f6 (f7 x0 c6 c2) (f3 c13 c0 c2))))))) (f4 (f2 (f4 (f3 c9 c12 c15) c12) (f6 c7 (f4 (f1 (f7 c10 (f3 c11 c4 c15) (f0 c11 c7))) (f7 c0 c14 c6)))) (f0 c7 (f7 c14 (f5 c1) c2)))) (f4 (f5 (f6 (f7 (f7 c2 (f1 c6) (f1 x1)) (f0 (f6 (f5 (f7 x0 (f6 c13 c0) (f0 (f6 c6 c2) (f5 (f2 c0 c6))))) c8) x1) (f2 (f6 (f7 (f5 (f3 c12 c14 c3)) c14 (f5 c9)) (f5 c12)) (f2 (f4 (f5 c2) (f4 (f4 (f4 (f1 c12) c3) (f2 (f2 (f5 c7) c0) (f2 x1 c11))) c8)) (f6 (f1 c1) (f2 c9 c12))))) (f1 (f7 (f1 (f4 (f0 c0 (f4 c4 (f7 x1 (f0 c15 c6) c10))) c4)) (f4 c12 c15) (f6 c12 (f6 (f7 x0 c6 c2) (f3 c13 c0 c2))))))) (f4 (f2 (f4 (f3 c9 c12 c15) c12) (f6 c7 (f4 (f1 (f7 c10 (f3 c11 c4 c15) (f0 c11 c7))) (f7 c0 c14 c6)))) (f0 c7 (f7 c14 (f5 c1) c2))))) (- (- (f4 (f5 (f6 (f7 (f7 c2 (f1 c6) (f1 x1)) (f0 (f6 (f5 (f7 x0 (f6 c13 c0) (f0 (f6 c6 c2) (f5 (f2 c0 c6))))) c8) x1) (f2 (f6 (f7 (f5 (f3 c12 c14 c3)) c14 (f5 c9)) (f5 c12)) (f2 (f4 (f5 c2) (f4 (f4 (f4 (f1 c12) c3) (f2 (f2 (f5 c7) c0) (f2 x1 c11))) c8)) (f6 (f1 c1) (f2 c9 c12))))) (f1 (f7 (f1 (f4 (f0 c0 (f4 c4 (f7 x1 (f0 c15 c6) c10))) c4)) (f4 c12 c15) (f6 c12 (f6 (f7 x0 c6 c2) (f3 c13 c0 c2))))))) (f4 (f2 (f4 (f3 c9 c12 c15) c12) (f6 c7 (f4 (f1 (f7 c10 (f3 c11 c4 c15) (f0 c11 c7))) (f7 c0 c14 c6)))) (f0 c7 (f7 c14 (f5 c1) c2)))) (f4 (f5 (f6 (f7 (f7 c2 (f1 c6) (f1 x1)) (f0 (f6 (f5 (f7 x0 (f6 c13 c0) (f0 (f6 c6 c2) (f5 (f2 c0 c6))))) c8) x1) (f2 (f6 (f7 (f5 (f3 c12 c14 c3)) c14 (f5 c9)) (f5 c12)) (f2 (f4 (f5 c2) (f4 (f4 (f4 (f1 c12) c3) (f2 (f2 (f5 c7) c0) (f2 x1 c11))) c8)) (f6 (f1 c1) (f2 c9 c12))))) (f1 (f7 (f1 (f4 (f0 c0 (f4 c4 (f7 x1 (f0 c15 c6) c10))) c4)) (f4 c12 c15) (f6 c12 (f6 (f7 x0 c6 c2) (f3 c13 c0 c2))))))) (f4 (f2 (f4 (f3 c9 c12 c15) c12) (f6 c7 (f4 (f1 (f7 c10 (f3 c11 c4 c15) (f0 c11 c7))) (f7 c0 c14 c6)))) (f0 c7 (f7 c14 (f5 c1) c2))))))) epsilon)
                 ))
               ))
             )))))

(check-sat)

