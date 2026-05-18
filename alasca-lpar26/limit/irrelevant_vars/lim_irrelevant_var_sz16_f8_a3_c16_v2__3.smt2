(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; forall x1...x2. lim[x -> a] t = t
; 
; where t is a random term with 
; - 8 functions with arity in 1..3
; - 16 constants
; - 2 variables
; - 16 number of function applications

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
(assert (not (forall ( (x0 Real) (x1 Real) ) ; lim[x -> a](f7 (f4 (f7 (f1 (f6 (f7 c8 (f7 c2 c12)) c11) (f5 (f0 c5) c14)) c12)) (f3 (f6 c13 (f4 (f1 (f1 c14 c15) c7))) (f7 c8 (f5 c13 c13)))) = (f7 (f4 (f7 (f1 (f6 (f7 c8 (f7 c2 c12)) c11) (f5 (f0 c5) c14)) c12)) (f3 (f6 c13 (f4 (f1 (f1 c14 c15) c7))) (f7 c8 (f5 c13 c13))))
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
                                          ; | (f7 (f4 (f7 (f1 (f6 (f7 c8 (f7 c2 c12)) c11) (f5 (f0 c5) c14)) c12)) (f3 (f6 c13 (f4 (f1 (f1 c14 c15) c7))) (f7 c8 (f5 c13 c13)))) - (f7 (f4 (f7 (f1 (f6 (f7 c8 (f7 c2 c12)) c11) (f5 (f0 c5) c14)) c12)) (f3 (f6 c13 (f4 (f1 (f1 c14 c15) c7))) (f7 c8 (f5 c13 c13)))) | < epsilon
                                          (< (ite (>= (- (f7 (f4 (f7 (f1 (f6 (f7 c8 (f7 c2 c12)) c11) (f5 (f0 c5) c14)) c12)) (f3 (f6 c13 (f4 (f1 (f1 c14 c15) c7))) (f7 c8 (f5 c13 c13)))) (f7 (f4 (f7 (f1 (f6 (f7 c8 (f7 c2 c12)) c11) (f5 (f0 c5) c14)) c12)) (f3 (f6 c13 (f4 (f1 (f1 c14 c15) c7))) (f7 c8 (f5 c13 c13))))) 0.0) (- (f7 (f4 (f7 (f1 (f6 (f7 c8 (f7 c2 c12)) c11) (f5 (f0 c5) c14)) c12)) (f3 (f6 c13 (f4 (f1 (f1 c14 c15) c7))) (f7 c8 (f5 c13 c13)))) (f7 (f4 (f7 (f1 (f6 (f7 c8 (f7 c2 c12)) c11) (f5 (f0 c5) c14)) c12)) (f3 (f6 c13 (f4 (f1 (f1 c14 c15) c7))) (f7 c8 (f5 c13 c13))))) (- (- (f7 (f4 (f7 (f1 (f6 (f7 c8 (f7 c2 c12)) c11) (f5 (f0 c5) c14)) c12)) (f3 (f6 c13 (f4 (f1 (f1 c14 c15) c7))) (f7 c8 (f5 c13 c13)))) (f7 (f4 (f7 (f1 (f6 (f7 c8 (f7 c2 c12)) c11) (f5 (f0 c5) c14)) c12)) (f3 (f6 c13 (f4 (f1 (f1 c14 c15) c7))) (f7 c8 (f5 c13 c13))))))) epsilon)
                 ))
               ))
             )))))

(check-sat)

