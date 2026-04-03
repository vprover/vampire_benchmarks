(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; forall x1...x2. lim[x -> a] t = t
; 
; where t is a random term with 
; - 8 functions with arity in 1..3
; - 16 constants
; - 2 variables
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
(assert (not (forall ( (x0 Real) (x1 Real) ) ; lim[x -> a](f0 (f1 (f7 (f3 (f0 c15 c8 c9) c0)) (f2 (f1 (f2 (f3 (f7 (f2 x0)) (f5 (f3 c12 c2) (f5 (f6 c13 c13) (f4 x0 (f5 c9 (f7 (f0 c9 x1 c0))) (f4 x0 c3 c6)))))) (f2 (f5 (f6 c15 c3) (f2 (f3 c1 (f5 (f6 c6 c11) (f5 c12 c15))))))))) (f0 (f5 (f0 c0 c2 c13) (f7 (f7 (f5 (f1 (f1 (f6 c5 c10) c1) (f0 c15 c12 c3)) (f0 (f2 c0) (f2 (f2 (f6 c10 (f6 c1 c10)))) c8))))) (f1 (f6 (f4 (f6 c0 (f6 c1 c14)) (f4 (f7 c9) c10 c6) c5) x1) (f1 (f6 (f0 c12 c1 c11) (f3 c0 c10)) c5)) (f0 (f0 x1 (f7 c1) (f2 x1)) (f5 c0 c4) c13)) (f5 (f2 (f2 x1)) (f7 c0))) = (f0 (f1 (f7 (f3 (f0 c15 c8 c9) c0)) (f2 (f1 (f2 (f3 (f7 (f2 x0)) (f5 (f3 c12 c2) (f5 (f6 c13 c13) (f4 x0 (f5 c9 (f7 (f0 c9 x1 c0))) (f4 x0 c3 c6)))))) (f2 (f5 (f6 c15 c3) (f2 (f3 c1 (f5 (f6 c6 c11) (f5 c12 c15))))))))) (f0 (f5 (f0 c0 c2 c13) (f7 (f7 (f5 (f1 (f1 (f6 c5 c10) c1) (f0 c15 c12 c3)) (f0 (f2 c0) (f2 (f2 (f6 c10 (f6 c1 c10)))) c8))))) (f1 (f6 (f4 (f6 c0 (f6 c1 c14)) (f4 (f7 c9) c10 c6) c5) x1) (f1 (f6 (f0 c12 c1 c11) (f3 c0 c10)) c5)) (f0 (f0 x1 (f7 c1) (f2 x1)) (f5 c0 c4) c13)) (f5 (f2 (f2 x1)) (f7 c0)))
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
                                          ; | (f0 (f1 (f7 (f3 (f0 c15 c8 c9) c0)) (f2 (f1 (f2 (f3 (f7 (f2 x0)) (f5 (f3 c12 c2) (f5 (f6 c13 c13) (f4 x0 (f5 c9 (f7 (f0 c9 x1 c0))) (f4 x0 c3 c6)))))) (f2 (f5 (f6 c15 c3) (f2 (f3 c1 (f5 (f6 c6 c11) (f5 c12 c15))))))))) (f0 (f5 (f0 c0 c2 c13) (f7 (f7 (f5 (f1 (f1 (f6 c5 c10) c1) (f0 c15 c12 c3)) (f0 (f2 c0) (f2 (f2 (f6 c10 (f6 c1 c10)))) c8))))) (f1 (f6 (f4 (f6 c0 (f6 c1 c14)) (f4 (f7 c9) c10 c6) c5) x1) (f1 (f6 (f0 c12 c1 c11) (f3 c0 c10)) c5)) (f0 (f0 x1 (f7 c1) (f2 x1)) (f5 c0 c4) c13)) (f5 (f2 (f2 x1)) (f7 c0))) - (f0 (f1 (f7 (f3 (f0 c15 c8 c9) c0)) (f2 (f1 (f2 (f3 (f7 (f2 x0)) (f5 (f3 c12 c2) (f5 (f6 c13 c13) (f4 x0 (f5 c9 (f7 (f0 c9 x1 c0))) (f4 x0 c3 c6)))))) (f2 (f5 (f6 c15 c3) (f2 (f3 c1 (f5 (f6 c6 c11) (f5 c12 c15))))))))) (f0 (f5 (f0 c0 c2 c13) (f7 (f7 (f5 (f1 (f1 (f6 c5 c10) c1) (f0 c15 c12 c3)) (f0 (f2 c0) (f2 (f2 (f6 c10 (f6 c1 c10)))) c8))))) (f1 (f6 (f4 (f6 c0 (f6 c1 c14)) (f4 (f7 c9) c10 c6) c5) x1) (f1 (f6 (f0 c12 c1 c11) (f3 c0 c10)) c5)) (f0 (f0 x1 (f7 c1) (f2 x1)) (f5 c0 c4) c13)) (f5 (f2 (f2 x1)) (f7 c0))) | < epsilon
                                          (< (ite (>= (- (f0 (f1 (f7 (f3 (f0 c15 c8 c9) c0)) (f2 (f1 (f2 (f3 (f7 (f2 x0)) (f5 (f3 c12 c2) (f5 (f6 c13 c13) (f4 x0 (f5 c9 (f7 (f0 c9 x1 c0))) (f4 x0 c3 c6)))))) (f2 (f5 (f6 c15 c3) (f2 (f3 c1 (f5 (f6 c6 c11) (f5 c12 c15))))))))) (f0 (f5 (f0 c0 c2 c13) (f7 (f7 (f5 (f1 (f1 (f6 c5 c10) c1) (f0 c15 c12 c3)) (f0 (f2 c0) (f2 (f2 (f6 c10 (f6 c1 c10)))) c8))))) (f1 (f6 (f4 (f6 c0 (f6 c1 c14)) (f4 (f7 c9) c10 c6) c5) x1) (f1 (f6 (f0 c12 c1 c11) (f3 c0 c10)) c5)) (f0 (f0 x1 (f7 c1) (f2 x1)) (f5 c0 c4) c13)) (f5 (f2 (f2 x1)) (f7 c0))) (f0 (f1 (f7 (f3 (f0 c15 c8 c9) c0)) (f2 (f1 (f2 (f3 (f7 (f2 x0)) (f5 (f3 c12 c2) (f5 (f6 c13 c13) (f4 x0 (f5 c9 (f7 (f0 c9 x1 c0))) (f4 x0 c3 c6)))))) (f2 (f5 (f6 c15 c3) (f2 (f3 c1 (f5 (f6 c6 c11) (f5 c12 c15))))))))) (f0 (f5 (f0 c0 c2 c13) (f7 (f7 (f5 (f1 (f1 (f6 c5 c10) c1) (f0 c15 c12 c3)) (f0 (f2 c0) (f2 (f2 (f6 c10 (f6 c1 c10)))) c8))))) (f1 (f6 (f4 (f6 c0 (f6 c1 c14)) (f4 (f7 c9) c10 c6) c5) x1) (f1 (f6 (f0 c12 c1 c11) (f3 c0 c10)) c5)) (f0 (f0 x1 (f7 c1) (f2 x1)) (f5 c0 c4) c13)) (f5 (f2 (f2 x1)) (f7 c0)))) 0.0) (- (f0 (f1 (f7 (f3 (f0 c15 c8 c9) c0)) (f2 (f1 (f2 (f3 (f7 (f2 x0)) (f5 (f3 c12 c2) (f5 (f6 c13 c13) (f4 x0 (f5 c9 (f7 (f0 c9 x1 c0))) (f4 x0 c3 c6)))))) (f2 (f5 (f6 c15 c3) (f2 (f3 c1 (f5 (f6 c6 c11) (f5 c12 c15))))))))) (f0 (f5 (f0 c0 c2 c13) (f7 (f7 (f5 (f1 (f1 (f6 c5 c10) c1) (f0 c15 c12 c3)) (f0 (f2 c0) (f2 (f2 (f6 c10 (f6 c1 c10)))) c8))))) (f1 (f6 (f4 (f6 c0 (f6 c1 c14)) (f4 (f7 c9) c10 c6) c5) x1) (f1 (f6 (f0 c12 c1 c11) (f3 c0 c10)) c5)) (f0 (f0 x1 (f7 c1) (f2 x1)) (f5 c0 c4) c13)) (f5 (f2 (f2 x1)) (f7 c0))) (f0 (f1 (f7 (f3 (f0 c15 c8 c9) c0)) (f2 (f1 (f2 (f3 (f7 (f2 x0)) (f5 (f3 c12 c2) (f5 (f6 c13 c13) (f4 x0 (f5 c9 (f7 (f0 c9 x1 c0))) (f4 x0 c3 c6)))))) (f2 (f5 (f6 c15 c3) (f2 (f3 c1 (f5 (f6 c6 c11) (f5 c12 c15))))))))) (f0 (f5 (f0 c0 c2 c13) (f7 (f7 (f5 (f1 (f1 (f6 c5 c10) c1) (f0 c15 c12 c3)) (f0 (f2 c0) (f2 (f2 (f6 c10 (f6 c1 c10)))) c8))))) (f1 (f6 (f4 (f6 c0 (f6 c1 c14)) (f4 (f7 c9) c10 c6) c5) x1) (f1 (f6 (f0 c12 c1 c11) (f3 c0 c10)) c5)) (f0 (f0 x1 (f7 c1) (f2 x1)) (f5 c0 c4) c13)) (f5 (f2 (f2 x1)) (f7 c0)))) (- (- (f0 (f1 (f7 (f3 (f0 c15 c8 c9) c0)) (f2 (f1 (f2 (f3 (f7 (f2 x0)) (f5 (f3 c12 c2) (f5 (f6 c13 c13) (f4 x0 (f5 c9 (f7 (f0 c9 x1 c0))) (f4 x0 c3 c6)))))) (f2 (f5 (f6 c15 c3) (f2 (f3 c1 (f5 (f6 c6 c11) (f5 c12 c15))))))))) (f0 (f5 (f0 c0 c2 c13) (f7 (f7 (f5 (f1 (f1 (f6 c5 c10) c1) (f0 c15 c12 c3)) (f0 (f2 c0) (f2 (f2 (f6 c10 (f6 c1 c10)))) c8))))) (f1 (f6 (f4 (f6 c0 (f6 c1 c14)) (f4 (f7 c9) c10 c6) c5) x1) (f1 (f6 (f0 c12 c1 c11) (f3 c0 c10)) c5)) (f0 (f0 x1 (f7 c1) (f2 x1)) (f5 c0 c4) c13)) (f5 (f2 (f2 x1)) (f7 c0))) (f0 (f1 (f7 (f3 (f0 c15 c8 c9) c0)) (f2 (f1 (f2 (f3 (f7 (f2 x0)) (f5 (f3 c12 c2) (f5 (f6 c13 c13) (f4 x0 (f5 c9 (f7 (f0 c9 x1 c0))) (f4 x0 c3 c6)))))) (f2 (f5 (f6 c15 c3) (f2 (f3 c1 (f5 (f6 c6 c11) (f5 c12 c15))))))))) (f0 (f5 (f0 c0 c2 c13) (f7 (f7 (f5 (f1 (f1 (f6 c5 c10) c1) (f0 c15 c12 c3)) (f0 (f2 c0) (f2 (f2 (f6 c10 (f6 c1 c10)))) c8))))) (f1 (f6 (f4 (f6 c0 (f6 c1 c14)) (f4 (f7 c9) c10 c6) c5) x1) (f1 (f6 (f0 c12 c1 c11) (f3 c0 c10)) c5)) (f0 (f0 x1 (f7 c1) (f2 x1)) (f5 c0 c4) c13)) (f5 (f2 (f2 x1)) (f7 c0)))))) epsilon)
                 ))
               ))
             )))))

(check-sat)

