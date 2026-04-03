(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; forall x1...x8. lim[x -> a] t = t
; 
; where t is a random term with 
; - 8 functions with arity in 1..3
; - 16 constants
; - 8 variables
; - 16 number of function applications

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
(assert (not (forall ( (x0 Real) (x1 Real) (x2 Real) (x3 Real) (x4 Real) (x5 Real) (x6 Real) (x7 Real) ) ; lim[x -> a](f6 (f3 c14 c15 c7) (f6 (f1 (f3 (f3 c12 (f6 c4 c10) x2) c12 c8) (f2 c14) (f4 x2 x6 x6)) (f7 (f1 x0 x0 x2) (f6 c6 c10) (f5 (f4 c4 x7 c7) (f0 x3) (f6 c1 x5))))) = (f6 (f3 c14 c15 c7) (f6 (f1 (f3 (f3 c12 (f6 c4 c10) x2) c12 c8) (f2 c14) (f4 x2 x6 x6)) (f7 (f1 x0 x0 x2) (f6 c6 c10) (f5 (f4 c4 x7 c7) (f0 x3) (f6 c1 x5)))))
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
                                          ; | (f6 (f3 c14 c15 c7) (f6 (f1 (f3 (f3 c12 (f6 c4 c10) x2) c12 c8) (f2 c14) (f4 x2 x6 x6)) (f7 (f1 x0 x0 x2) (f6 c6 c10) (f5 (f4 c4 x7 c7) (f0 x3) (f6 c1 x5))))) - (f6 (f3 c14 c15 c7) (f6 (f1 (f3 (f3 c12 (f6 c4 c10) x2) c12 c8) (f2 c14) (f4 x2 x6 x6)) (f7 (f1 x0 x0 x2) (f6 c6 c10) (f5 (f4 c4 x7 c7) (f0 x3) (f6 c1 x5))))) | < epsilon
                                          (< (ite (>= (- (f6 (f3 c14 c15 c7) (f6 (f1 (f3 (f3 c12 (f6 c4 c10) x2) c12 c8) (f2 c14) (f4 x2 x6 x6)) (f7 (f1 x0 x0 x2) (f6 c6 c10) (f5 (f4 c4 x7 c7) (f0 x3) (f6 c1 x5))))) (f6 (f3 c14 c15 c7) (f6 (f1 (f3 (f3 c12 (f6 c4 c10) x2) c12 c8) (f2 c14) (f4 x2 x6 x6)) (f7 (f1 x0 x0 x2) (f6 c6 c10) (f5 (f4 c4 x7 c7) (f0 x3) (f6 c1 x5)))))) 0.0) (- (f6 (f3 c14 c15 c7) (f6 (f1 (f3 (f3 c12 (f6 c4 c10) x2) c12 c8) (f2 c14) (f4 x2 x6 x6)) (f7 (f1 x0 x0 x2) (f6 c6 c10) (f5 (f4 c4 x7 c7) (f0 x3) (f6 c1 x5))))) (f6 (f3 c14 c15 c7) (f6 (f1 (f3 (f3 c12 (f6 c4 c10) x2) c12 c8) (f2 c14) (f4 x2 x6 x6)) (f7 (f1 x0 x0 x2) (f6 c6 c10) (f5 (f4 c4 x7 c7) (f0 x3) (f6 c1 x5)))))) (- (- (f6 (f3 c14 c15 c7) (f6 (f1 (f3 (f3 c12 (f6 c4 c10) x2) c12 c8) (f2 c14) (f4 x2 x6 x6)) (f7 (f1 x0 x0 x2) (f6 c6 c10) (f5 (f4 c4 x7 c7) (f0 x3) (f6 c1 x5))))) (f6 (f3 c14 c15 c7) (f6 (f1 (f3 (f3 c12 (f6 c4 c10) x2) c12 c8) (f2 c14) (f4 x2 x6 x6)) (f7 (f1 x0 x0 x2) (f6 c6 c10) (f5 (f4 c4 x7 c7) (f0 x3) (f6 c1 x5)))))))) epsilon)
                 ))
               ))
             )))))

(check-sat)

