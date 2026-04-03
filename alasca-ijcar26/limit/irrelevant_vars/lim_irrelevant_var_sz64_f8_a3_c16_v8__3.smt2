(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; forall x1...x8. lim[x -> a] t = t
; 
; where t is a random term with 
; - 8 functions with arity in 1..3
; - 16 constants
; - 8 variables
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
(assert (not (forall ( (x0 Real) (x1 Real) (x2 Real) (x3 Real) (x4 Real) (x5 Real) (x6 Real) (x7 Real) ) ; lim[x -> a](f7 (f4 (f7 (f1 (f6 (f7 (f4 (f7 x5 (f6 c9 c6))) (f0 (f3 (f6 (f5 (f1 c5 x4) c9) (f1 (f7 c4 c13) c2)) c5))) (f5 (f6 (f3 c13 (f5 c10 (f2 c10))) c11) c15)) (f1 (f5 (f6 x3 (f7 c15 x7)) c2) (f3 (f4 (f3 (f4 (f7 x2 (f4 x3))) (f5 c12 c13))) c8))) (f7 c8 (f6 c13 x7)))) (f5 (f0 (f4 (f1 (f2 (f4 (f1 (f4 c3) (f7 (f3 (f5 (f3 (f3 x5 x2) (f3 c9 (f5 c3 (f6 c5 c4)))) x3) (f2 (f4 c5))) (f6 (f6 (f1 c13 c13) c12) c15))))) x2))) (f7 (f1 c7 (f4 c0)) (f7 (f3 (f1 (f0 c4) (f1 c0 c8)) (f5 x4 c14)) c8)))) = (f7 (f4 (f7 (f1 (f6 (f7 (f4 (f7 x5 (f6 c9 c6))) (f0 (f3 (f6 (f5 (f1 c5 x4) c9) (f1 (f7 c4 c13) c2)) c5))) (f5 (f6 (f3 c13 (f5 c10 (f2 c10))) c11) c15)) (f1 (f5 (f6 x3 (f7 c15 x7)) c2) (f3 (f4 (f3 (f4 (f7 x2 (f4 x3))) (f5 c12 c13))) c8))) (f7 c8 (f6 c13 x7)))) (f5 (f0 (f4 (f1 (f2 (f4 (f1 (f4 c3) (f7 (f3 (f5 (f3 (f3 x5 x2) (f3 c9 (f5 c3 (f6 c5 c4)))) x3) (f2 (f4 c5))) (f6 (f6 (f1 c13 c13) c12) c15))))) x2))) (f7 (f1 c7 (f4 c0)) (f7 (f3 (f1 (f0 c4) (f1 c0 c8)) (f5 x4 c14)) c8))))
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
                                          ; | (f7 (f4 (f7 (f1 (f6 (f7 (f4 (f7 x5 (f6 c9 c6))) (f0 (f3 (f6 (f5 (f1 c5 x4) c9) (f1 (f7 c4 c13) c2)) c5))) (f5 (f6 (f3 c13 (f5 c10 (f2 c10))) c11) c15)) (f1 (f5 (f6 x3 (f7 c15 x7)) c2) (f3 (f4 (f3 (f4 (f7 x2 (f4 x3))) (f5 c12 c13))) c8))) (f7 c8 (f6 c13 x7)))) (f5 (f0 (f4 (f1 (f2 (f4 (f1 (f4 c3) (f7 (f3 (f5 (f3 (f3 x5 x2) (f3 c9 (f5 c3 (f6 c5 c4)))) x3) (f2 (f4 c5))) (f6 (f6 (f1 c13 c13) c12) c15))))) x2))) (f7 (f1 c7 (f4 c0)) (f7 (f3 (f1 (f0 c4) (f1 c0 c8)) (f5 x4 c14)) c8)))) - (f7 (f4 (f7 (f1 (f6 (f7 (f4 (f7 x5 (f6 c9 c6))) (f0 (f3 (f6 (f5 (f1 c5 x4) c9) (f1 (f7 c4 c13) c2)) c5))) (f5 (f6 (f3 c13 (f5 c10 (f2 c10))) c11) c15)) (f1 (f5 (f6 x3 (f7 c15 x7)) c2) (f3 (f4 (f3 (f4 (f7 x2 (f4 x3))) (f5 c12 c13))) c8))) (f7 c8 (f6 c13 x7)))) (f5 (f0 (f4 (f1 (f2 (f4 (f1 (f4 c3) (f7 (f3 (f5 (f3 (f3 x5 x2) (f3 c9 (f5 c3 (f6 c5 c4)))) x3) (f2 (f4 c5))) (f6 (f6 (f1 c13 c13) c12) c15))))) x2))) (f7 (f1 c7 (f4 c0)) (f7 (f3 (f1 (f0 c4) (f1 c0 c8)) (f5 x4 c14)) c8)))) | < epsilon
                                          (< (ite (>= (- (f7 (f4 (f7 (f1 (f6 (f7 (f4 (f7 x5 (f6 c9 c6))) (f0 (f3 (f6 (f5 (f1 c5 x4) c9) (f1 (f7 c4 c13) c2)) c5))) (f5 (f6 (f3 c13 (f5 c10 (f2 c10))) c11) c15)) (f1 (f5 (f6 x3 (f7 c15 x7)) c2) (f3 (f4 (f3 (f4 (f7 x2 (f4 x3))) (f5 c12 c13))) c8))) (f7 c8 (f6 c13 x7)))) (f5 (f0 (f4 (f1 (f2 (f4 (f1 (f4 c3) (f7 (f3 (f5 (f3 (f3 x5 x2) (f3 c9 (f5 c3 (f6 c5 c4)))) x3) (f2 (f4 c5))) (f6 (f6 (f1 c13 c13) c12) c15))))) x2))) (f7 (f1 c7 (f4 c0)) (f7 (f3 (f1 (f0 c4) (f1 c0 c8)) (f5 x4 c14)) c8)))) (f7 (f4 (f7 (f1 (f6 (f7 (f4 (f7 x5 (f6 c9 c6))) (f0 (f3 (f6 (f5 (f1 c5 x4) c9) (f1 (f7 c4 c13) c2)) c5))) (f5 (f6 (f3 c13 (f5 c10 (f2 c10))) c11) c15)) (f1 (f5 (f6 x3 (f7 c15 x7)) c2) (f3 (f4 (f3 (f4 (f7 x2 (f4 x3))) (f5 c12 c13))) c8))) (f7 c8 (f6 c13 x7)))) (f5 (f0 (f4 (f1 (f2 (f4 (f1 (f4 c3) (f7 (f3 (f5 (f3 (f3 x5 x2) (f3 c9 (f5 c3 (f6 c5 c4)))) x3) (f2 (f4 c5))) (f6 (f6 (f1 c13 c13) c12) c15))))) x2))) (f7 (f1 c7 (f4 c0)) (f7 (f3 (f1 (f0 c4) (f1 c0 c8)) (f5 x4 c14)) c8))))) 0.0) (- (f7 (f4 (f7 (f1 (f6 (f7 (f4 (f7 x5 (f6 c9 c6))) (f0 (f3 (f6 (f5 (f1 c5 x4) c9) (f1 (f7 c4 c13) c2)) c5))) (f5 (f6 (f3 c13 (f5 c10 (f2 c10))) c11) c15)) (f1 (f5 (f6 x3 (f7 c15 x7)) c2) (f3 (f4 (f3 (f4 (f7 x2 (f4 x3))) (f5 c12 c13))) c8))) (f7 c8 (f6 c13 x7)))) (f5 (f0 (f4 (f1 (f2 (f4 (f1 (f4 c3) (f7 (f3 (f5 (f3 (f3 x5 x2) (f3 c9 (f5 c3 (f6 c5 c4)))) x3) (f2 (f4 c5))) (f6 (f6 (f1 c13 c13) c12) c15))))) x2))) (f7 (f1 c7 (f4 c0)) (f7 (f3 (f1 (f0 c4) (f1 c0 c8)) (f5 x4 c14)) c8)))) (f7 (f4 (f7 (f1 (f6 (f7 (f4 (f7 x5 (f6 c9 c6))) (f0 (f3 (f6 (f5 (f1 c5 x4) c9) (f1 (f7 c4 c13) c2)) c5))) (f5 (f6 (f3 c13 (f5 c10 (f2 c10))) c11) c15)) (f1 (f5 (f6 x3 (f7 c15 x7)) c2) (f3 (f4 (f3 (f4 (f7 x2 (f4 x3))) (f5 c12 c13))) c8))) (f7 c8 (f6 c13 x7)))) (f5 (f0 (f4 (f1 (f2 (f4 (f1 (f4 c3) (f7 (f3 (f5 (f3 (f3 x5 x2) (f3 c9 (f5 c3 (f6 c5 c4)))) x3) (f2 (f4 c5))) (f6 (f6 (f1 c13 c13) c12) c15))))) x2))) (f7 (f1 c7 (f4 c0)) (f7 (f3 (f1 (f0 c4) (f1 c0 c8)) (f5 x4 c14)) c8))))) (- (- (f7 (f4 (f7 (f1 (f6 (f7 (f4 (f7 x5 (f6 c9 c6))) (f0 (f3 (f6 (f5 (f1 c5 x4) c9) (f1 (f7 c4 c13) c2)) c5))) (f5 (f6 (f3 c13 (f5 c10 (f2 c10))) c11) c15)) (f1 (f5 (f6 x3 (f7 c15 x7)) c2) (f3 (f4 (f3 (f4 (f7 x2 (f4 x3))) (f5 c12 c13))) c8))) (f7 c8 (f6 c13 x7)))) (f5 (f0 (f4 (f1 (f2 (f4 (f1 (f4 c3) (f7 (f3 (f5 (f3 (f3 x5 x2) (f3 c9 (f5 c3 (f6 c5 c4)))) x3) (f2 (f4 c5))) (f6 (f6 (f1 c13 c13) c12) c15))))) x2))) (f7 (f1 c7 (f4 c0)) (f7 (f3 (f1 (f0 c4) (f1 c0 c8)) (f5 x4 c14)) c8)))) (f7 (f4 (f7 (f1 (f6 (f7 (f4 (f7 x5 (f6 c9 c6))) (f0 (f3 (f6 (f5 (f1 c5 x4) c9) (f1 (f7 c4 c13) c2)) c5))) (f5 (f6 (f3 c13 (f5 c10 (f2 c10))) c11) c15)) (f1 (f5 (f6 x3 (f7 c15 x7)) c2) (f3 (f4 (f3 (f4 (f7 x2 (f4 x3))) (f5 c12 c13))) c8))) (f7 c8 (f6 c13 x7)))) (f5 (f0 (f4 (f1 (f2 (f4 (f1 (f4 c3) (f7 (f3 (f5 (f3 (f3 x5 x2) (f3 c9 (f5 c3 (f6 c5 c4)))) x3) (f2 (f4 c5))) (f6 (f6 (f1 c13 c13) c12) c15))))) x2))) (f7 (f1 c7 (f4 c0)) (f7 (f3 (f1 (f0 c4) (f1 c0 c8)) (f5 x4 c14)) c8))))))) epsilon)
                 ))
               ))
             )))))

(check-sat)

