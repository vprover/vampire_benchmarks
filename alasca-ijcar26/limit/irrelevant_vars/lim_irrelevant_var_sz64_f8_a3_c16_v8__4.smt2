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
(assert (not (forall ( (x0 Real) (x1 Real) (x2 Real) (x3 Real) (x4 Real) (x5 Real) (x6 Real) (x7 Real) ) ; lim[x -> a](f2 (f0 (f6 (f4 (f5 (f7 c1 x5 (f7 c0 c0 x6)) x4 (f7 x2 c10 x1)) (f3 (f7 x5 c11 c14) c15))) (f7 (f0 (f0 (f5 x5 c15 c2) (f2 x2 c1)) (f7 x2 c7 c13)) (f7 (f4 (f1 (f2 c12 (f5 x0 (f3 (f4 c3 x4) x5) (f3 x1 x2))) c14) (f6 (f0 (f2 (f1 c8 x0) x5) (f7 x5 c5 c2)))) (f7 (f1 (f4 x2 (f4 c13 (f1 x0 (f2 (f5 c12 x0 (f6 c14)) c4)))) c5) (f3 c1 (f4 c2 (f4 (f5 x6 x0 x1) (f1 x7 x7)))) (f3 (f2 (f4 (f7 c7 x0 c2) (f6 (f4 c0 c3))) (f1 x3 (f0 c15 c10))) (f7 (f2 (f2 c0 x0) (f4 (f5 c4 c2 c4) x7)) (f2 x4 (f3 x0 c15)) c5))) (f3 (f1 c12 (f0 (f4 c12 c3) x1)) (f3 (f6 (f1 c15 x4)) c4))) c5)) c3) = (f2 (f0 (f6 (f4 (f5 (f7 c1 x5 (f7 c0 c0 x6)) x4 (f7 x2 c10 x1)) (f3 (f7 x5 c11 c14) c15))) (f7 (f0 (f0 (f5 x5 c15 c2) (f2 x2 c1)) (f7 x2 c7 c13)) (f7 (f4 (f1 (f2 c12 (f5 x0 (f3 (f4 c3 x4) x5) (f3 x1 x2))) c14) (f6 (f0 (f2 (f1 c8 x0) x5) (f7 x5 c5 c2)))) (f7 (f1 (f4 x2 (f4 c13 (f1 x0 (f2 (f5 c12 x0 (f6 c14)) c4)))) c5) (f3 c1 (f4 c2 (f4 (f5 x6 x0 x1) (f1 x7 x7)))) (f3 (f2 (f4 (f7 c7 x0 c2) (f6 (f4 c0 c3))) (f1 x3 (f0 c15 c10))) (f7 (f2 (f2 c0 x0) (f4 (f5 c4 c2 c4) x7)) (f2 x4 (f3 x0 c15)) c5))) (f3 (f1 c12 (f0 (f4 c12 c3) x1)) (f3 (f6 (f1 c15 x4)) c4))) c5)) c3)
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
                                          ; | (f2 (f0 (f6 (f4 (f5 (f7 c1 x5 (f7 c0 c0 x6)) x4 (f7 x2 c10 x1)) (f3 (f7 x5 c11 c14) c15))) (f7 (f0 (f0 (f5 x5 c15 c2) (f2 x2 c1)) (f7 x2 c7 c13)) (f7 (f4 (f1 (f2 c12 (f5 x0 (f3 (f4 c3 x4) x5) (f3 x1 x2))) c14) (f6 (f0 (f2 (f1 c8 x0) x5) (f7 x5 c5 c2)))) (f7 (f1 (f4 x2 (f4 c13 (f1 x0 (f2 (f5 c12 x0 (f6 c14)) c4)))) c5) (f3 c1 (f4 c2 (f4 (f5 x6 x0 x1) (f1 x7 x7)))) (f3 (f2 (f4 (f7 c7 x0 c2) (f6 (f4 c0 c3))) (f1 x3 (f0 c15 c10))) (f7 (f2 (f2 c0 x0) (f4 (f5 c4 c2 c4) x7)) (f2 x4 (f3 x0 c15)) c5))) (f3 (f1 c12 (f0 (f4 c12 c3) x1)) (f3 (f6 (f1 c15 x4)) c4))) c5)) c3) - (f2 (f0 (f6 (f4 (f5 (f7 c1 x5 (f7 c0 c0 x6)) x4 (f7 x2 c10 x1)) (f3 (f7 x5 c11 c14) c15))) (f7 (f0 (f0 (f5 x5 c15 c2) (f2 x2 c1)) (f7 x2 c7 c13)) (f7 (f4 (f1 (f2 c12 (f5 x0 (f3 (f4 c3 x4) x5) (f3 x1 x2))) c14) (f6 (f0 (f2 (f1 c8 x0) x5) (f7 x5 c5 c2)))) (f7 (f1 (f4 x2 (f4 c13 (f1 x0 (f2 (f5 c12 x0 (f6 c14)) c4)))) c5) (f3 c1 (f4 c2 (f4 (f5 x6 x0 x1) (f1 x7 x7)))) (f3 (f2 (f4 (f7 c7 x0 c2) (f6 (f4 c0 c3))) (f1 x3 (f0 c15 c10))) (f7 (f2 (f2 c0 x0) (f4 (f5 c4 c2 c4) x7)) (f2 x4 (f3 x0 c15)) c5))) (f3 (f1 c12 (f0 (f4 c12 c3) x1)) (f3 (f6 (f1 c15 x4)) c4))) c5)) c3) | < epsilon
                                          (< (ite (>= (- (f2 (f0 (f6 (f4 (f5 (f7 c1 x5 (f7 c0 c0 x6)) x4 (f7 x2 c10 x1)) (f3 (f7 x5 c11 c14) c15))) (f7 (f0 (f0 (f5 x5 c15 c2) (f2 x2 c1)) (f7 x2 c7 c13)) (f7 (f4 (f1 (f2 c12 (f5 x0 (f3 (f4 c3 x4) x5) (f3 x1 x2))) c14) (f6 (f0 (f2 (f1 c8 x0) x5) (f7 x5 c5 c2)))) (f7 (f1 (f4 x2 (f4 c13 (f1 x0 (f2 (f5 c12 x0 (f6 c14)) c4)))) c5) (f3 c1 (f4 c2 (f4 (f5 x6 x0 x1) (f1 x7 x7)))) (f3 (f2 (f4 (f7 c7 x0 c2) (f6 (f4 c0 c3))) (f1 x3 (f0 c15 c10))) (f7 (f2 (f2 c0 x0) (f4 (f5 c4 c2 c4) x7)) (f2 x4 (f3 x0 c15)) c5))) (f3 (f1 c12 (f0 (f4 c12 c3) x1)) (f3 (f6 (f1 c15 x4)) c4))) c5)) c3) (f2 (f0 (f6 (f4 (f5 (f7 c1 x5 (f7 c0 c0 x6)) x4 (f7 x2 c10 x1)) (f3 (f7 x5 c11 c14) c15))) (f7 (f0 (f0 (f5 x5 c15 c2) (f2 x2 c1)) (f7 x2 c7 c13)) (f7 (f4 (f1 (f2 c12 (f5 x0 (f3 (f4 c3 x4) x5) (f3 x1 x2))) c14) (f6 (f0 (f2 (f1 c8 x0) x5) (f7 x5 c5 c2)))) (f7 (f1 (f4 x2 (f4 c13 (f1 x0 (f2 (f5 c12 x0 (f6 c14)) c4)))) c5) (f3 c1 (f4 c2 (f4 (f5 x6 x0 x1) (f1 x7 x7)))) (f3 (f2 (f4 (f7 c7 x0 c2) (f6 (f4 c0 c3))) (f1 x3 (f0 c15 c10))) (f7 (f2 (f2 c0 x0) (f4 (f5 c4 c2 c4) x7)) (f2 x4 (f3 x0 c15)) c5))) (f3 (f1 c12 (f0 (f4 c12 c3) x1)) (f3 (f6 (f1 c15 x4)) c4))) c5)) c3)) 0.0) (- (f2 (f0 (f6 (f4 (f5 (f7 c1 x5 (f7 c0 c0 x6)) x4 (f7 x2 c10 x1)) (f3 (f7 x5 c11 c14) c15))) (f7 (f0 (f0 (f5 x5 c15 c2) (f2 x2 c1)) (f7 x2 c7 c13)) (f7 (f4 (f1 (f2 c12 (f5 x0 (f3 (f4 c3 x4) x5) (f3 x1 x2))) c14) (f6 (f0 (f2 (f1 c8 x0) x5) (f7 x5 c5 c2)))) (f7 (f1 (f4 x2 (f4 c13 (f1 x0 (f2 (f5 c12 x0 (f6 c14)) c4)))) c5) (f3 c1 (f4 c2 (f4 (f5 x6 x0 x1) (f1 x7 x7)))) (f3 (f2 (f4 (f7 c7 x0 c2) (f6 (f4 c0 c3))) (f1 x3 (f0 c15 c10))) (f7 (f2 (f2 c0 x0) (f4 (f5 c4 c2 c4) x7)) (f2 x4 (f3 x0 c15)) c5))) (f3 (f1 c12 (f0 (f4 c12 c3) x1)) (f3 (f6 (f1 c15 x4)) c4))) c5)) c3) (f2 (f0 (f6 (f4 (f5 (f7 c1 x5 (f7 c0 c0 x6)) x4 (f7 x2 c10 x1)) (f3 (f7 x5 c11 c14) c15))) (f7 (f0 (f0 (f5 x5 c15 c2) (f2 x2 c1)) (f7 x2 c7 c13)) (f7 (f4 (f1 (f2 c12 (f5 x0 (f3 (f4 c3 x4) x5) (f3 x1 x2))) c14) (f6 (f0 (f2 (f1 c8 x0) x5) (f7 x5 c5 c2)))) (f7 (f1 (f4 x2 (f4 c13 (f1 x0 (f2 (f5 c12 x0 (f6 c14)) c4)))) c5) (f3 c1 (f4 c2 (f4 (f5 x6 x0 x1) (f1 x7 x7)))) (f3 (f2 (f4 (f7 c7 x0 c2) (f6 (f4 c0 c3))) (f1 x3 (f0 c15 c10))) (f7 (f2 (f2 c0 x0) (f4 (f5 c4 c2 c4) x7)) (f2 x4 (f3 x0 c15)) c5))) (f3 (f1 c12 (f0 (f4 c12 c3) x1)) (f3 (f6 (f1 c15 x4)) c4))) c5)) c3)) (- (- (f2 (f0 (f6 (f4 (f5 (f7 c1 x5 (f7 c0 c0 x6)) x4 (f7 x2 c10 x1)) (f3 (f7 x5 c11 c14) c15))) (f7 (f0 (f0 (f5 x5 c15 c2) (f2 x2 c1)) (f7 x2 c7 c13)) (f7 (f4 (f1 (f2 c12 (f5 x0 (f3 (f4 c3 x4) x5) (f3 x1 x2))) c14) (f6 (f0 (f2 (f1 c8 x0) x5) (f7 x5 c5 c2)))) (f7 (f1 (f4 x2 (f4 c13 (f1 x0 (f2 (f5 c12 x0 (f6 c14)) c4)))) c5) (f3 c1 (f4 c2 (f4 (f5 x6 x0 x1) (f1 x7 x7)))) (f3 (f2 (f4 (f7 c7 x0 c2) (f6 (f4 c0 c3))) (f1 x3 (f0 c15 c10))) (f7 (f2 (f2 c0 x0) (f4 (f5 c4 c2 c4) x7)) (f2 x4 (f3 x0 c15)) c5))) (f3 (f1 c12 (f0 (f4 c12 c3) x1)) (f3 (f6 (f1 c15 x4)) c4))) c5)) c3) (f2 (f0 (f6 (f4 (f5 (f7 c1 x5 (f7 c0 c0 x6)) x4 (f7 x2 c10 x1)) (f3 (f7 x5 c11 c14) c15))) (f7 (f0 (f0 (f5 x5 c15 c2) (f2 x2 c1)) (f7 x2 c7 c13)) (f7 (f4 (f1 (f2 c12 (f5 x0 (f3 (f4 c3 x4) x5) (f3 x1 x2))) c14) (f6 (f0 (f2 (f1 c8 x0) x5) (f7 x5 c5 c2)))) (f7 (f1 (f4 x2 (f4 c13 (f1 x0 (f2 (f5 c12 x0 (f6 c14)) c4)))) c5) (f3 c1 (f4 c2 (f4 (f5 x6 x0 x1) (f1 x7 x7)))) (f3 (f2 (f4 (f7 c7 x0 c2) (f6 (f4 c0 c3))) (f1 x3 (f0 c15 c10))) (f7 (f2 (f2 c0 x0) (f4 (f5 c4 c2 c4) x7)) (f2 x4 (f3 x0 c15)) c5))) (f3 (f1 c12 (f0 (f4 c12 c3) x1)) (f3 (f6 (f1 c15 x4)) c4))) c5)) c3)))) epsilon)
                 ))
               ))
             )))))

(check-sat)

