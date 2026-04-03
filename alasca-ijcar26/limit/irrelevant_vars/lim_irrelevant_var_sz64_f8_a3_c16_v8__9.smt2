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
(assert (not (forall ( (x0 Real) (x1 Real) (x2 Real) (x3 Real) (x4 Real) (x5 Real) (x6 Real) (x7 Real) ) ; lim[x -> a](f6 (f3 c14 (f7 (f3 c7 c2 c15) c8 c3) (f5 (f6 c4 c10) (f0 (f6 x7 c14)) c6)) (f5 (f2 (f2 (f7 x3 x5 (f7 x2 c10 c9)))) (f4 (f5 (f5 (f2 (f5 c12 c11 c1)) (f1 c7 (f5 c11 c14 x2) c9) (f4 x1 (f3 c6 c1 x2) (f7 (f5 x0 c14 c14) c2 c5))) (f7 (f3 c13 c0 c2) (f4 c1 x4 (f2 (f7 x1 x2 x7))) (f0 (f2 (f2 (f7 c4 x6 x7))))) (f3 (f1 (f5 x7 c10 c0) (f3 c13 c4 c7) (f3 x2 c3 c7)) (f0 (f2 (f1 (f5 c14 (f5 c1 c12 x6) x5) (f4 c6 c4 c14) c7))) x1)) (f3 (f5 c12 (f5 c4 c15 c4) (f3 x4 x6 c2)) c5 c6) (f5 (f7 c4 x1 c11) (f1 (f5 c13 c7 c4) (f1 c0 x1 x6) (f7 c9 (f0 (f1 x1 c1 c11)) c12)) (f3 c7 c8 (f5 c4 c4 c2)))) (f2 (f4 (f3 x5 (f6 x7 c1) c15) (f3 x5 c3 x7) (f3 c10 x7 c13))))) = (f6 (f3 c14 (f7 (f3 c7 c2 c15) c8 c3) (f5 (f6 c4 c10) (f0 (f6 x7 c14)) c6)) (f5 (f2 (f2 (f7 x3 x5 (f7 x2 c10 c9)))) (f4 (f5 (f5 (f2 (f5 c12 c11 c1)) (f1 c7 (f5 c11 c14 x2) c9) (f4 x1 (f3 c6 c1 x2) (f7 (f5 x0 c14 c14) c2 c5))) (f7 (f3 c13 c0 c2) (f4 c1 x4 (f2 (f7 x1 x2 x7))) (f0 (f2 (f2 (f7 c4 x6 x7))))) (f3 (f1 (f5 x7 c10 c0) (f3 c13 c4 c7) (f3 x2 c3 c7)) (f0 (f2 (f1 (f5 c14 (f5 c1 c12 x6) x5) (f4 c6 c4 c14) c7))) x1)) (f3 (f5 c12 (f5 c4 c15 c4) (f3 x4 x6 c2)) c5 c6) (f5 (f7 c4 x1 c11) (f1 (f5 c13 c7 c4) (f1 c0 x1 x6) (f7 c9 (f0 (f1 x1 c1 c11)) c12)) (f3 c7 c8 (f5 c4 c4 c2)))) (f2 (f4 (f3 x5 (f6 x7 c1) c15) (f3 x5 c3 x7) (f3 c10 x7 c13)))))
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
                                          ; | (f6 (f3 c14 (f7 (f3 c7 c2 c15) c8 c3) (f5 (f6 c4 c10) (f0 (f6 x7 c14)) c6)) (f5 (f2 (f2 (f7 x3 x5 (f7 x2 c10 c9)))) (f4 (f5 (f5 (f2 (f5 c12 c11 c1)) (f1 c7 (f5 c11 c14 x2) c9) (f4 x1 (f3 c6 c1 x2) (f7 (f5 x0 c14 c14) c2 c5))) (f7 (f3 c13 c0 c2) (f4 c1 x4 (f2 (f7 x1 x2 x7))) (f0 (f2 (f2 (f7 c4 x6 x7))))) (f3 (f1 (f5 x7 c10 c0) (f3 c13 c4 c7) (f3 x2 c3 c7)) (f0 (f2 (f1 (f5 c14 (f5 c1 c12 x6) x5) (f4 c6 c4 c14) c7))) x1)) (f3 (f5 c12 (f5 c4 c15 c4) (f3 x4 x6 c2)) c5 c6) (f5 (f7 c4 x1 c11) (f1 (f5 c13 c7 c4) (f1 c0 x1 x6) (f7 c9 (f0 (f1 x1 c1 c11)) c12)) (f3 c7 c8 (f5 c4 c4 c2)))) (f2 (f4 (f3 x5 (f6 x7 c1) c15) (f3 x5 c3 x7) (f3 c10 x7 c13))))) - (f6 (f3 c14 (f7 (f3 c7 c2 c15) c8 c3) (f5 (f6 c4 c10) (f0 (f6 x7 c14)) c6)) (f5 (f2 (f2 (f7 x3 x5 (f7 x2 c10 c9)))) (f4 (f5 (f5 (f2 (f5 c12 c11 c1)) (f1 c7 (f5 c11 c14 x2) c9) (f4 x1 (f3 c6 c1 x2) (f7 (f5 x0 c14 c14) c2 c5))) (f7 (f3 c13 c0 c2) (f4 c1 x4 (f2 (f7 x1 x2 x7))) (f0 (f2 (f2 (f7 c4 x6 x7))))) (f3 (f1 (f5 x7 c10 c0) (f3 c13 c4 c7) (f3 x2 c3 c7)) (f0 (f2 (f1 (f5 c14 (f5 c1 c12 x6) x5) (f4 c6 c4 c14) c7))) x1)) (f3 (f5 c12 (f5 c4 c15 c4) (f3 x4 x6 c2)) c5 c6) (f5 (f7 c4 x1 c11) (f1 (f5 c13 c7 c4) (f1 c0 x1 x6) (f7 c9 (f0 (f1 x1 c1 c11)) c12)) (f3 c7 c8 (f5 c4 c4 c2)))) (f2 (f4 (f3 x5 (f6 x7 c1) c15) (f3 x5 c3 x7) (f3 c10 x7 c13))))) | < epsilon
                                          (< (ite (>= (- (f6 (f3 c14 (f7 (f3 c7 c2 c15) c8 c3) (f5 (f6 c4 c10) (f0 (f6 x7 c14)) c6)) (f5 (f2 (f2 (f7 x3 x5 (f7 x2 c10 c9)))) (f4 (f5 (f5 (f2 (f5 c12 c11 c1)) (f1 c7 (f5 c11 c14 x2) c9) (f4 x1 (f3 c6 c1 x2) (f7 (f5 x0 c14 c14) c2 c5))) (f7 (f3 c13 c0 c2) (f4 c1 x4 (f2 (f7 x1 x2 x7))) (f0 (f2 (f2 (f7 c4 x6 x7))))) (f3 (f1 (f5 x7 c10 c0) (f3 c13 c4 c7) (f3 x2 c3 c7)) (f0 (f2 (f1 (f5 c14 (f5 c1 c12 x6) x5) (f4 c6 c4 c14) c7))) x1)) (f3 (f5 c12 (f5 c4 c15 c4) (f3 x4 x6 c2)) c5 c6) (f5 (f7 c4 x1 c11) (f1 (f5 c13 c7 c4) (f1 c0 x1 x6) (f7 c9 (f0 (f1 x1 c1 c11)) c12)) (f3 c7 c8 (f5 c4 c4 c2)))) (f2 (f4 (f3 x5 (f6 x7 c1) c15) (f3 x5 c3 x7) (f3 c10 x7 c13))))) (f6 (f3 c14 (f7 (f3 c7 c2 c15) c8 c3) (f5 (f6 c4 c10) (f0 (f6 x7 c14)) c6)) (f5 (f2 (f2 (f7 x3 x5 (f7 x2 c10 c9)))) (f4 (f5 (f5 (f2 (f5 c12 c11 c1)) (f1 c7 (f5 c11 c14 x2) c9) (f4 x1 (f3 c6 c1 x2) (f7 (f5 x0 c14 c14) c2 c5))) (f7 (f3 c13 c0 c2) (f4 c1 x4 (f2 (f7 x1 x2 x7))) (f0 (f2 (f2 (f7 c4 x6 x7))))) (f3 (f1 (f5 x7 c10 c0) (f3 c13 c4 c7) (f3 x2 c3 c7)) (f0 (f2 (f1 (f5 c14 (f5 c1 c12 x6) x5) (f4 c6 c4 c14) c7))) x1)) (f3 (f5 c12 (f5 c4 c15 c4) (f3 x4 x6 c2)) c5 c6) (f5 (f7 c4 x1 c11) (f1 (f5 c13 c7 c4) (f1 c0 x1 x6) (f7 c9 (f0 (f1 x1 c1 c11)) c12)) (f3 c7 c8 (f5 c4 c4 c2)))) (f2 (f4 (f3 x5 (f6 x7 c1) c15) (f3 x5 c3 x7) (f3 c10 x7 c13)))))) 0.0) (- (f6 (f3 c14 (f7 (f3 c7 c2 c15) c8 c3) (f5 (f6 c4 c10) (f0 (f6 x7 c14)) c6)) (f5 (f2 (f2 (f7 x3 x5 (f7 x2 c10 c9)))) (f4 (f5 (f5 (f2 (f5 c12 c11 c1)) (f1 c7 (f5 c11 c14 x2) c9) (f4 x1 (f3 c6 c1 x2) (f7 (f5 x0 c14 c14) c2 c5))) (f7 (f3 c13 c0 c2) (f4 c1 x4 (f2 (f7 x1 x2 x7))) (f0 (f2 (f2 (f7 c4 x6 x7))))) (f3 (f1 (f5 x7 c10 c0) (f3 c13 c4 c7) (f3 x2 c3 c7)) (f0 (f2 (f1 (f5 c14 (f5 c1 c12 x6) x5) (f4 c6 c4 c14) c7))) x1)) (f3 (f5 c12 (f5 c4 c15 c4) (f3 x4 x6 c2)) c5 c6) (f5 (f7 c4 x1 c11) (f1 (f5 c13 c7 c4) (f1 c0 x1 x6) (f7 c9 (f0 (f1 x1 c1 c11)) c12)) (f3 c7 c8 (f5 c4 c4 c2)))) (f2 (f4 (f3 x5 (f6 x7 c1) c15) (f3 x5 c3 x7) (f3 c10 x7 c13))))) (f6 (f3 c14 (f7 (f3 c7 c2 c15) c8 c3) (f5 (f6 c4 c10) (f0 (f6 x7 c14)) c6)) (f5 (f2 (f2 (f7 x3 x5 (f7 x2 c10 c9)))) (f4 (f5 (f5 (f2 (f5 c12 c11 c1)) (f1 c7 (f5 c11 c14 x2) c9) (f4 x1 (f3 c6 c1 x2) (f7 (f5 x0 c14 c14) c2 c5))) (f7 (f3 c13 c0 c2) (f4 c1 x4 (f2 (f7 x1 x2 x7))) (f0 (f2 (f2 (f7 c4 x6 x7))))) (f3 (f1 (f5 x7 c10 c0) (f3 c13 c4 c7) (f3 x2 c3 c7)) (f0 (f2 (f1 (f5 c14 (f5 c1 c12 x6) x5) (f4 c6 c4 c14) c7))) x1)) (f3 (f5 c12 (f5 c4 c15 c4) (f3 x4 x6 c2)) c5 c6) (f5 (f7 c4 x1 c11) (f1 (f5 c13 c7 c4) (f1 c0 x1 x6) (f7 c9 (f0 (f1 x1 c1 c11)) c12)) (f3 c7 c8 (f5 c4 c4 c2)))) (f2 (f4 (f3 x5 (f6 x7 c1) c15) (f3 x5 c3 x7) (f3 c10 x7 c13)))))) (- (- (f6 (f3 c14 (f7 (f3 c7 c2 c15) c8 c3) (f5 (f6 c4 c10) (f0 (f6 x7 c14)) c6)) (f5 (f2 (f2 (f7 x3 x5 (f7 x2 c10 c9)))) (f4 (f5 (f5 (f2 (f5 c12 c11 c1)) (f1 c7 (f5 c11 c14 x2) c9) (f4 x1 (f3 c6 c1 x2) (f7 (f5 x0 c14 c14) c2 c5))) (f7 (f3 c13 c0 c2) (f4 c1 x4 (f2 (f7 x1 x2 x7))) (f0 (f2 (f2 (f7 c4 x6 x7))))) (f3 (f1 (f5 x7 c10 c0) (f3 c13 c4 c7) (f3 x2 c3 c7)) (f0 (f2 (f1 (f5 c14 (f5 c1 c12 x6) x5) (f4 c6 c4 c14) c7))) x1)) (f3 (f5 c12 (f5 c4 c15 c4) (f3 x4 x6 c2)) c5 c6) (f5 (f7 c4 x1 c11) (f1 (f5 c13 c7 c4) (f1 c0 x1 x6) (f7 c9 (f0 (f1 x1 c1 c11)) c12)) (f3 c7 c8 (f5 c4 c4 c2)))) (f2 (f4 (f3 x5 (f6 x7 c1) c15) (f3 x5 c3 x7) (f3 c10 x7 c13))))) (f6 (f3 c14 (f7 (f3 c7 c2 c15) c8 c3) (f5 (f6 c4 c10) (f0 (f6 x7 c14)) c6)) (f5 (f2 (f2 (f7 x3 x5 (f7 x2 c10 c9)))) (f4 (f5 (f5 (f2 (f5 c12 c11 c1)) (f1 c7 (f5 c11 c14 x2) c9) (f4 x1 (f3 c6 c1 x2) (f7 (f5 x0 c14 c14) c2 c5))) (f7 (f3 c13 c0 c2) (f4 c1 x4 (f2 (f7 x1 x2 x7))) (f0 (f2 (f2 (f7 c4 x6 x7))))) (f3 (f1 (f5 x7 c10 c0) (f3 c13 c4 c7) (f3 x2 c3 c7)) (f0 (f2 (f1 (f5 c14 (f5 c1 c12 x6) x5) (f4 c6 c4 c14) c7))) x1)) (f3 (f5 c12 (f5 c4 c15 c4) (f3 x4 x6 c2)) c5 c6) (f5 (f7 c4 x1 c11) (f1 (f5 c13 c7 c4) (f1 c0 x1 x6) (f7 c9 (f0 (f1 x1 c1 c11)) c12)) (f3 c7 c8 (f5 c4 c4 c2)))) (f2 (f4 (f3 x5 (f6 x7 c1) c15) (f3 x5 c3 x7) (f3 c10 x7 c13)))))))) epsilon)
                 ))
               ))
             )))))

(check-sat)

