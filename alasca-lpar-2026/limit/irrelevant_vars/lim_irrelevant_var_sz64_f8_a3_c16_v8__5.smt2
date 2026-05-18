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
(assert (not (forall ( (x0 Real) (x1 Real) (x2 Real) (x3 Real) (x4 Real) (x5 Real) (x6 Real) (x7 Real) ) ; lim[x -> a](f4 (f5 (f6 (f7 (f7 x6 (f1 c3) (f1 x1)) (f0 (f6 (f5 (f7 x1 (f6 c12 x3) (f0 (f6 c3 x5) (f5 (f2 x3 c2))))) c6) x2) (f2 (f6 (f7 (f5 (f3 c10 c13 x7)) c13 (f5 c7)) (f5 c11)) (f2 (f4 (f5 x6) (f4 (f4 (f4 (f1 c10) x7) (f2 (f2 (f5 c4) x3) (f2 x1 c10))) c5)) (f6 (f1 x5) (f2 c7 c11))))) (f1 (f7 (f1 (f4 (f0 x3 (f4 c1 (f7 x1 (f0 c15 c2) c8))) c0)) (f4 c11 c14) (f6 c11 (f6 (f7 x0 c3 x6) (f3 c13 x2 x5))))))) (f4 (f2 (f4 (f3 c7 c11 c14) c11) (f6 c5 (f4 (f1 (f7 c8 (f3 c10 c0 c15) (f0 c9 c4))) (f7 x3 c13 c3)))) (f0 c4 (f7 c14 (f5 x5) x6)))) = (f4 (f5 (f6 (f7 (f7 x6 (f1 c3) (f1 x1)) (f0 (f6 (f5 (f7 x1 (f6 c12 x3) (f0 (f6 c3 x5) (f5 (f2 x3 c2))))) c6) x2) (f2 (f6 (f7 (f5 (f3 c10 c13 x7)) c13 (f5 c7)) (f5 c11)) (f2 (f4 (f5 x6) (f4 (f4 (f4 (f1 c10) x7) (f2 (f2 (f5 c4) x3) (f2 x1 c10))) c5)) (f6 (f1 x5) (f2 c7 c11))))) (f1 (f7 (f1 (f4 (f0 x3 (f4 c1 (f7 x1 (f0 c15 c2) c8))) c0)) (f4 c11 c14) (f6 c11 (f6 (f7 x0 c3 x6) (f3 c13 x2 x5))))))) (f4 (f2 (f4 (f3 c7 c11 c14) c11) (f6 c5 (f4 (f1 (f7 c8 (f3 c10 c0 c15) (f0 c9 c4))) (f7 x3 c13 c3)))) (f0 c4 (f7 c14 (f5 x5) x6))))
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
                                          ; | (f4 (f5 (f6 (f7 (f7 x6 (f1 c3) (f1 x1)) (f0 (f6 (f5 (f7 x1 (f6 c12 x3) (f0 (f6 c3 x5) (f5 (f2 x3 c2))))) c6) x2) (f2 (f6 (f7 (f5 (f3 c10 c13 x7)) c13 (f5 c7)) (f5 c11)) (f2 (f4 (f5 x6) (f4 (f4 (f4 (f1 c10) x7) (f2 (f2 (f5 c4) x3) (f2 x1 c10))) c5)) (f6 (f1 x5) (f2 c7 c11))))) (f1 (f7 (f1 (f4 (f0 x3 (f4 c1 (f7 x1 (f0 c15 c2) c8))) c0)) (f4 c11 c14) (f6 c11 (f6 (f7 x0 c3 x6) (f3 c13 x2 x5))))))) (f4 (f2 (f4 (f3 c7 c11 c14) c11) (f6 c5 (f4 (f1 (f7 c8 (f3 c10 c0 c15) (f0 c9 c4))) (f7 x3 c13 c3)))) (f0 c4 (f7 c14 (f5 x5) x6)))) - (f4 (f5 (f6 (f7 (f7 x6 (f1 c3) (f1 x1)) (f0 (f6 (f5 (f7 x1 (f6 c12 x3) (f0 (f6 c3 x5) (f5 (f2 x3 c2))))) c6) x2) (f2 (f6 (f7 (f5 (f3 c10 c13 x7)) c13 (f5 c7)) (f5 c11)) (f2 (f4 (f5 x6) (f4 (f4 (f4 (f1 c10) x7) (f2 (f2 (f5 c4) x3) (f2 x1 c10))) c5)) (f6 (f1 x5) (f2 c7 c11))))) (f1 (f7 (f1 (f4 (f0 x3 (f4 c1 (f7 x1 (f0 c15 c2) c8))) c0)) (f4 c11 c14) (f6 c11 (f6 (f7 x0 c3 x6) (f3 c13 x2 x5))))))) (f4 (f2 (f4 (f3 c7 c11 c14) c11) (f6 c5 (f4 (f1 (f7 c8 (f3 c10 c0 c15) (f0 c9 c4))) (f7 x3 c13 c3)))) (f0 c4 (f7 c14 (f5 x5) x6)))) | < epsilon
                                          (< (ite (>= (- (f4 (f5 (f6 (f7 (f7 x6 (f1 c3) (f1 x1)) (f0 (f6 (f5 (f7 x1 (f6 c12 x3) (f0 (f6 c3 x5) (f5 (f2 x3 c2))))) c6) x2) (f2 (f6 (f7 (f5 (f3 c10 c13 x7)) c13 (f5 c7)) (f5 c11)) (f2 (f4 (f5 x6) (f4 (f4 (f4 (f1 c10) x7) (f2 (f2 (f5 c4) x3) (f2 x1 c10))) c5)) (f6 (f1 x5) (f2 c7 c11))))) (f1 (f7 (f1 (f4 (f0 x3 (f4 c1 (f7 x1 (f0 c15 c2) c8))) c0)) (f4 c11 c14) (f6 c11 (f6 (f7 x0 c3 x6) (f3 c13 x2 x5))))))) (f4 (f2 (f4 (f3 c7 c11 c14) c11) (f6 c5 (f4 (f1 (f7 c8 (f3 c10 c0 c15) (f0 c9 c4))) (f7 x3 c13 c3)))) (f0 c4 (f7 c14 (f5 x5) x6)))) (f4 (f5 (f6 (f7 (f7 x6 (f1 c3) (f1 x1)) (f0 (f6 (f5 (f7 x1 (f6 c12 x3) (f0 (f6 c3 x5) (f5 (f2 x3 c2))))) c6) x2) (f2 (f6 (f7 (f5 (f3 c10 c13 x7)) c13 (f5 c7)) (f5 c11)) (f2 (f4 (f5 x6) (f4 (f4 (f4 (f1 c10) x7) (f2 (f2 (f5 c4) x3) (f2 x1 c10))) c5)) (f6 (f1 x5) (f2 c7 c11))))) (f1 (f7 (f1 (f4 (f0 x3 (f4 c1 (f7 x1 (f0 c15 c2) c8))) c0)) (f4 c11 c14) (f6 c11 (f6 (f7 x0 c3 x6) (f3 c13 x2 x5))))))) (f4 (f2 (f4 (f3 c7 c11 c14) c11) (f6 c5 (f4 (f1 (f7 c8 (f3 c10 c0 c15) (f0 c9 c4))) (f7 x3 c13 c3)))) (f0 c4 (f7 c14 (f5 x5) x6))))) 0.0) (- (f4 (f5 (f6 (f7 (f7 x6 (f1 c3) (f1 x1)) (f0 (f6 (f5 (f7 x1 (f6 c12 x3) (f0 (f6 c3 x5) (f5 (f2 x3 c2))))) c6) x2) (f2 (f6 (f7 (f5 (f3 c10 c13 x7)) c13 (f5 c7)) (f5 c11)) (f2 (f4 (f5 x6) (f4 (f4 (f4 (f1 c10) x7) (f2 (f2 (f5 c4) x3) (f2 x1 c10))) c5)) (f6 (f1 x5) (f2 c7 c11))))) (f1 (f7 (f1 (f4 (f0 x3 (f4 c1 (f7 x1 (f0 c15 c2) c8))) c0)) (f4 c11 c14) (f6 c11 (f6 (f7 x0 c3 x6) (f3 c13 x2 x5))))))) (f4 (f2 (f4 (f3 c7 c11 c14) c11) (f6 c5 (f4 (f1 (f7 c8 (f3 c10 c0 c15) (f0 c9 c4))) (f7 x3 c13 c3)))) (f0 c4 (f7 c14 (f5 x5) x6)))) (f4 (f5 (f6 (f7 (f7 x6 (f1 c3) (f1 x1)) (f0 (f6 (f5 (f7 x1 (f6 c12 x3) (f0 (f6 c3 x5) (f5 (f2 x3 c2))))) c6) x2) (f2 (f6 (f7 (f5 (f3 c10 c13 x7)) c13 (f5 c7)) (f5 c11)) (f2 (f4 (f5 x6) (f4 (f4 (f4 (f1 c10) x7) (f2 (f2 (f5 c4) x3) (f2 x1 c10))) c5)) (f6 (f1 x5) (f2 c7 c11))))) (f1 (f7 (f1 (f4 (f0 x3 (f4 c1 (f7 x1 (f0 c15 c2) c8))) c0)) (f4 c11 c14) (f6 c11 (f6 (f7 x0 c3 x6) (f3 c13 x2 x5))))))) (f4 (f2 (f4 (f3 c7 c11 c14) c11) (f6 c5 (f4 (f1 (f7 c8 (f3 c10 c0 c15) (f0 c9 c4))) (f7 x3 c13 c3)))) (f0 c4 (f7 c14 (f5 x5) x6))))) (- (- (f4 (f5 (f6 (f7 (f7 x6 (f1 c3) (f1 x1)) (f0 (f6 (f5 (f7 x1 (f6 c12 x3) (f0 (f6 c3 x5) (f5 (f2 x3 c2))))) c6) x2) (f2 (f6 (f7 (f5 (f3 c10 c13 x7)) c13 (f5 c7)) (f5 c11)) (f2 (f4 (f5 x6) (f4 (f4 (f4 (f1 c10) x7) (f2 (f2 (f5 c4) x3) (f2 x1 c10))) c5)) (f6 (f1 x5) (f2 c7 c11))))) (f1 (f7 (f1 (f4 (f0 x3 (f4 c1 (f7 x1 (f0 c15 c2) c8))) c0)) (f4 c11 c14) (f6 c11 (f6 (f7 x0 c3 x6) (f3 c13 x2 x5))))))) (f4 (f2 (f4 (f3 c7 c11 c14) c11) (f6 c5 (f4 (f1 (f7 c8 (f3 c10 c0 c15) (f0 c9 c4))) (f7 x3 c13 c3)))) (f0 c4 (f7 c14 (f5 x5) x6)))) (f4 (f5 (f6 (f7 (f7 x6 (f1 c3) (f1 x1)) (f0 (f6 (f5 (f7 x1 (f6 c12 x3) (f0 (f6 c3 x5) (f5 (f2 x3 c2))))) c6) x2) (f2 (f6 (f7 (f5 (f3 c10 c13 x7)) c13 (f5 c7)) (f5 c11)) (f2 (f4 (f5 x6) (f4 (f4 (f4 (f1 c10) x7) (f2 (f2 (f5 c4) x3) (f2 x1 c10))) c5)) (f6 (f1 x5) (f2 c7 c11))))) (f1 (f7 (f1 (f4 (f0 x3 (f4 c1 (f7 x1 (f0 c15 c2) c8))) c0)) (f4 c11 c14) (f6 c11 (f6 (f7 x0 c3 x6) (f3 c13 x2 x5))))))) (f4 (f2 (f4 (f3 c7 c11 c14) c11) (f6 c5 (f4 (f1 (f7 c8 (f3 c10 c0 c15) (f0 c9 c4))) (f7 x3 c13 c3)))) (f0 c4 (f7 c14 (f5 x5) x6))))))) epsilon)
                 ))
               ))
             )))))

(check-sat)

