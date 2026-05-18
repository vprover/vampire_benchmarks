(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; forall x1...x8. lim[x -> a] t = t
; 
; where t is a random term with 
; - 8 functions with arity in 1..3
; - 16 constants
; - 8 variables
; - 64 number of function applications

(declare-fun f0 (Real Real Real) Real)
(declare-fun f1 (Real Real) Real)
(declare-fun f2 (Real) Real)
(declare-fun f3 (Real Real) Real)
(declare-fun f4 (Real Real Real) Real)
(declare-fun f5 (Real Real) Real)
(declare-fun f6 (Real Real) Real)
(declare-fun f7 (Real) Real)
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
(assert (not (forall ( (x0 Real) (x1 Real) (x2 Real) (x3 Real) (x4 Real) (x5 Real) (x6 Real) (x7 Real) ) ; lim[x -> a](f0 (f1 (f7 (f3 (f0 c14 c6 c7) x2)) (f2 (f1 (f2 (f3 (f7 (f2 x1)) (f5 (f3 c10 x6) (f5 (f6 c12 c13) (f4 x0 (f5 c7 (f7 (f0 c7 x1 x3))) (f4 x1 x7 c2)))))) (f2 (f5 (f6 c14 x7) (f2 (f3 x5 (f5 (f6 c3 c9) (f5 c11 c15))))))))) (f0 (f5 (f0 x3 x5 c13) (f7 (f7 (f5 (f1 (f1 (f6 c2 c8) x4) (f0 c15 c11 x7)) (f0 (f2 x3) (f2 (f2 (f6 c8 (f6 x5 c8)))) c5))))) (f1 (f6 (f4 (f6 x3 (f6 x4 c13)) (f4 (f7 c7) c9 c3) c2) x1) (f1 (f6 (f0 c11 x5 c9) (f3 x2 c8)) c1)) (f0 (f0 x1 (f7 x4) (f2 x2)) (f5 x2 c0) c12)) (f5 (f2 (f2 x1)) (f7 x3))) = (f0 (f1 (f7 (f3 (f0 c14 c6 c7) x2)) (f2 (f1 (f2 (f3 (f7 (f2 x1)) (f5 (f3 c10 x6) (f5 (f6 c12 c13) (f4 x0 (f5 c7 (f7 (f0 c7 x1 x3))) (f4 x1 x7 c2)))))) (f2 (f5 (f6 c14 x7) (f2 (f3 x5 (f5 (f6 c3 c9) (f5 c11 c15))))))))) (f0 (f5 (f0 x3 x5 c13) (f7 (f7 (f5 (f1 (f1 (f6 c2 c8) x4) (f0 c15 c11 x7)) (f0 (f2 x3) (f2 (f2 (f6 c8 (f6 x5 c8)))) c5))))) (f1 (f6 (f4 (f6 x3 (f6 x4 c13)) (f4 (f7 c7) c9 c3) c2) x1) (f1 (f6 (f0 c11 x5 c9) (f3 x2 c8)) c1)) (f0 (f0 x1 (f7 x4) (f2 x2)) (f5 x2 c0) c12)) (f5 (f2 (f2 x1)) (f7 x3)))
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
                                          ; | (f0 (f1 (f7 (f3 (f0 c14 c6 c7) x2)) (f2 (f1 (f2 (f3 (f7 (f2 x1)) (f5 (f3 c10 x6) (f5 (f6 c12 c13) (f4 x0 (f5 c7 (f7 (f0 c7 x1 x3))) (f4 x1 x7 c2)))))) (f2 (f5 (f6 c14 x7) (f2 (f3 x5 (f5 (f6 c3 c9) (f5 c11 c15))))))))) (f0 (f5 (f0 x3 x5 c13) (f7 (f7 (f5 (f1 (f1 (f6 c2 c8) x4) (f0 c15 c11 x7)) (f0 (f2 x3) (f2 (f2 (f6 c8 (f6 x5 c8)))) c5))))) (f1 (f6 (f4 (f6 x3 (f6 x4 c13)) (f4 (f7 c7) c9 c3) c2) x1) (f1 (f6 (f0 c11 x5 c9) (f3 x2 c8)) c1)) (f0 (f0 x1 (f7 x4) (f2 x2)) (f5 x2 c0) c12)) (f5 (f2 (f2 x1)) (f7 x3))) - (f0 (f1 (f7 (f3 (f0 c14 c6 c7) x2)) (f2 (f1 (f2 (f3 (f7 (f2 x1)) (f5 (f3 c10 x6) (f5 (f6 c12 c13) (f4 x0 (f5 c7 (f7 (f0 c7 x1 x3))) (f4 x1 x7 c2)))))) (f2 (f5 (f6 c14 x7) (f2 (f3 x5 (f5 (f6 c3 c9) (f5 c11 c15))))))))) (f0 (f5 (f0 x3 x5 c13) (f7 (f7 (f5 (f1 (f1 (f6 c2 c8) x4) (f0 c15 c11 x7)) (f0 (f2 x3) (f2 (f2 (f6 c8 (f6 x5 c8)))) c5))))) (f1 (f6 (f4 (f6 x3 (f6 x4 c13)) (f4 (f7 c7) c9 c3) c2) x1) (f1 (f6 (f0 c11 x5 c9) (f3 x2 c8)) c1)) (f0 (f0 x1 (f7 x4) (f2 x2)) (f5 x2 c0) c12)) (f5 (f2 (f2 x1)) (f7 x3))) | < epsilon
                                          (< (ite (>= (- (f0 (f1 (f7 (f3 (f0 c14 c6 c7) x2)) (f2 (f1 (f2 (f3 (f7 (f2 x1)) (f5 (f3 c10 x6) (f5 (f6 c12 c13) (f4 x0 (f5 c7 (f7 (f0 c7 x1 x3))) (f4 x1 x7 c2)))))) (f2 (f5 (f6 c14 x7) (f2 (f3 x5 (f5 (f6 c3 c9) (f5 c11 c15))))))))) (f0 (f5 (f0 x3 x5 c13) (f7 (f7 (f5 (f1 (f1 (f6 c2 c8) x4) (f0 c15 c11 x7)) (f0 (f2 x3) (f2 (f2 (f6 c8 (f6 x5 c8)))) c5))))) (f1 (f6 (f4 (f6 x3 (f6 x4 c13)) (f4 (f7 c7) c9 c3) c2) x1) (f1 (f6 (f0 c11 x5 c9) (f3 x2 c8)) c1)) (f0 (f0 x1 (f7 x4) (f2 x2)) (f5 x2 c0) c12)) (f5 (f2 (f2 x1)) (f7 x3))) (f0 (f1 (f7 (f3 (f0 c14 c6 c7) x2)) (f2 (f1 (f2 (f3 (f7 (f2 x1)) (f5 (f3 c10 x6) (f5 (f6 c12 c13) (f4 x0 (f5 c7 (f7 (f0 c7 x1 x3))) (f4 x1 x7 c2)))))) (f2 (f5 (f6 c14 x7) (f2 (f3 x5 (f5 (f6 c3 c9) (f5 c11 c15))))))))) (f0 (f5 (f0 x3 x5 c13) (f7 (f7 (f5 (f1 (f1 (f6 c2 c8) x4) (f0 c15 c11 x7)) (f0 (f2 x3) (f2 (f2 (f6 c8 (f6 x5 c8)))) c5))))) (f1 (f6 (f4 (f6 x3 (f6 x4 c13)) (f4 (f7 c7) c9 c3) c2) x1) (f1 (f6 (f0 c11 x5 c9) (f3 x2 c8)) c1)) (f0 (f0 x1 (f7 x4) (f2 x2)) (f5 x2 c0) c12)) (f5 (f2 (f2 x1)) (f7 x3)))) 0.0) (- (f0 (f1 (f7 (f3 (f0 c14 c6 c7) x2)) (f2 (f1 (f2 (f3 (f7 (f2 x1)) (f5 (f3 c10 x6) (f5 (f6 c12 c13) (f4 x0 (f5 c7 (f7 (f0 c7 x1 x3))) (f4 x1 x7 c2)))))) (f2 (f5 (f6 c14 x7) (f2 (f3 x5 (f5 (f6 c3 c9) (f5 c11 c15))))))))) (f0 (f5 (f0 x3 x5 c13) (f7 (f7 (f5 (f1 (f1 (f6 c2 c8) x4) (f0 c15 c11 x7)) (f0 (f2 x3) (f2 (f2 (f6 c8 (f6 x5 c8)))) c5))))) (f1 (f6 (f4 (f6 x3 (f6 x4 c13)) (f4 (f7 c7) c9 c3) c2) x1) (f1 (f6 (f0 c11 x5 c9) (f3 x2 c8)) c1)) (f0 (f0 x1 (f7 x4) (f2 x2)) (f5 x2 c0) c12)) (f5 (f2 (f2 x1)) (f7 x3))) (f0 (f1 (f7 (f3 (f0 c14 c6 c7) x2)) (f2 (f1 (f2 (f3 (f7 (f2 x1)) (f5 (f3 c10 x6) (f5 (f6 c12 c13) (f4 x0 (f5 c7 (f7 (f0 c7 x1 x3))) (f4 x1 x7 c2)))))) (f2 (f5 (f6 c14 x7) (f2 (f3 x5 (f5 (f6 c3 c9) (f5 c11 c15))))))))) (f0 (f5 (f0 x3 x5 c13) (f7 (f7 (f5 (f1 (f1 (f6 c2 c8) x4) (f0 c15 c11 x7)) (f0 (f2 x3) (f2 (f2 (f6 c8 (f6 x5 c8)))) c5))))) (f1 (f6 (f4 (f6 x3 (f6 x4 c13)) (f4 (f7 c7) c9 c3) c2) x1) (f1 (f6 (f0 c11 x5 c9) (f3 x2 c8)) c1)) (f0 (f0 x1 (f7 x4) (f2 x2)) (f5 x2 c0) c12)) (f5 (f2 (f2 x1)) (f7 x3)))) (- (- (f0 (f1 (f7 (f3 (f0 c14 c6 c7) x2)) (f2 (f1 (f2 (f3 (f7 (f2 x1)) (f5 (f3 c10 x6) (f5 (f6 c12 c13) (f4 x0 (f5 c7 (f7 (f0 c7 x1 x3))) (f4 x1 x7 c2)))))) (f2 (f5 (f6 c14 x7) (f2 (f3 x5 (f5 (f6 c3 c9) (f5 c11 c15))))))))) (f0 (f5 (f0 x3 x5 c13) (f7 (f7 (f5 (f1 (f1 (f6 c2 c8) x4) (f0 c15 c11 x7)) (f0 (f2 x3) (f2 (f2 (f6 c8 (f6 x5 c8)))) c5))))) (f1 (f6 (f4 (f6 x3 (f6 x4 c13)) (f4 (f7 c7) c9 c3) c2) x1) (f1 (f6 (f0 c11 x5 c9) (f3 x2 c8)) c1)) (f0 (f0 x1 (f7 x4) (f2 x2)) (f5 x2 c0) c12)) (f5 (f2 (f2 x1)) (f7 x3))) (f0 (f1 (f7 (f3 (f0 c14 c6 c7) x2)) (f2 (f1 (f2 (f3 (f7 (f2 x1)) (f5 (f3 c10 x6) (f5 (f6 c12 c13) (f4 x0 (f5 c7 (f7 (f0 c7 x1 x3))) (f4 x1 x7 c2)))))) (f2 (f5 (f6 c14 x7) (f2 (f3 x5 (f5 (f6 c3 c9) (f5 c11 c15))))))))) (f0 (f5 (f0 x3 x5 c13) (f7 (f7 (f5 (f1 (f1 (f6 c2 c8) x4) (f0 c15 c11 x7)) (f0 (f2 x3) (f2 (f2 (f6 c8 (f6 x5 c8)))) c5))))) (f1 (f6 (f4 (f6 x3 (f6 x4 c13)) (f4 (f7 c7) c9 c3) c2) x1) (f1 (f6 (f0 c11 x5 c9) (f3 x2 c8)) c1)) (f0 (f0 x1 (f7 x4) (f2 x2)) (f5 x2 c0) c12)) (f5 (f2 (f2 x1)) (f7 x3)))))) epsilon)
                 ))
               ))
             )))))

(check-sat)

