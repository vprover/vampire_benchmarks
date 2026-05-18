(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; forall x1...x8. lim[x -> a] t = t
; 
; where t is a random term with 
; - 4 functions with arity in 1..3
; - 8 constants
; - 8 variables
; - 16 number of function applications

(declare-fun f0 (Real Real) Real)
(declare-fun f1 (Real Real Real) Real)
(declare-fun f2 (Real Real Real) Real)
(declare-fun f3 (Real Real Real) Real)
(declare-const c0 Real)
(declare-const c1 Real)
(declare-const c2 Real)
(declare-const c3 Real)
(declare-const c4 Real)
(declare-const c5 Real)
(declare-const c6 Real)
(declare-const c7 Real)
(declare-const a Real)

; Conclusion
(assert (not (forall ( (x0 Real) (x1 Real) (x2 Real) (x3 Real) (x4 Real) (x5 Real) (x6 Real) (x7 Real) ) ; lim[x -> a](f1 (f3 (f3 c2 x4 x6) (f2 (f0 c5 (f3 c5 c7 x1)) (f3 c7 (f3 c3 c3 c5) c0) c6) (f0 x7 x3)) x5 (f1 (f2 x2 x2 x0) (f0 x3 c7) (f0 (f3 c1 (f0 x1 x0) c5) (f0 x6 c6)))) = (f1 (f3 (f3 c2 x4 x6) (f2 (f0 c5 (f3 c5 c7 x1)) (f3 c7 (f3 c3 c3 c5) c0) c6) (f0 x7 x3)) x5 (f1 (f2 x2 x2 x0) (f0 x3 c7) (f0 (f3 c1 (f0 x1 x0) c5) (f0 x6 c6))))
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
                                          ; | (f1 (f3 (f3 c2 x4 x6) (f2 (f0 c5 (f3 c5 c7 x1)) (f3 c7 (f3 c3 c3 c5) c0) c6) (f0 x7 x3)) x5 (f1 (f2 x2 x2 x0) (f0 x3 c7) (f0 (f3 c1 (f0 x1 x0) c5) (f0 x6 c6)))) - (f1 (f3 (f3 c2 x4 x6) (f2 (f0 c5 (f3 c5 c7 x1)) (f3 c7 (f3 c3 c3 c5) c0) c6) (f0 x7 x3)) x5 (f1 (f2 x2 x2 x0) (f0 x3 c7) (f0 (f3 c1 (f0 x1 x0) c5) (f0 x6 c6)))) | < epsilon
                                          (< (ite (>= (- (f1 (f3 (f3 c2 x4 x6) (f2 (f0 c5 (f3 c5 c7 x1)) (f3 c7 (f3 c3 c3 c5) c0) c6) (f0 x7 x3)) x5 (f1 (f2 x2 x2 x0) (f0 x3 c7) (f0 (f3 c1 (f0 x1 x0) c5) (f0 x6 c6)))) (f1 (f3 (f3 c2 x4 x6) (f2 (f0 c5 (f3 c5 c7 x1)) (f3 c7 (f3 c3 c3 c5) c0) c6) (f0 x7 x3)) x5 (f1 (f2 x2 x2 x0) (f0 x3 c7) (f0 (f3 c1 (f0 x1 x0) c5) (f0 x6 c6))))) 0.0) (- (f1 (f3 (f3 c2 x4 x6) (f2 (f0 c5 (f3 c5 c7 x1)) (f3 c7 (f3 c3 c3 c5) c0) c6) (f0 x7 x3)) x5 (f1 (f2 x2 x2 x0) (f0 x3 c7) (f0 (f3 c1 (f0 x1 x0) c5) (f0 x6 c6)))) (f1 (f3 (f3 c2 x4 x6) (f2 (f0 c5 (f3 c5 c7 x1)) (f3 c7 (f3 c3 c3 c5) c0) c6) (f0 x7 x3)) x5 (f1 (f2 x2 x2 x0) (f0 x3 c7) (f0 (f3 c1 (f0 x1 x0) c5) (f0 x6 c6))))) (- (- (f1 (f3 (f3 c2 x4 x6) (f2 (f0 c5 (f3 c5 c7 x1)) (f3 c7 (f3 c3 c3 c5) c0) c6) (f0 x7 x3)) x5 (f1 (f2 x2 x2 x0) (f0 x3 c7) (f0 (f3 c1 (f0 x1 x0) c5) (f0 x6 c6)))) (f1 (f3 (f3 c2 x4 x6) (f2 (f0 c5 (f3 c5 c7 x1)) (f3 c7 (f3 c3 c3 c5) c0) c6) (f0 x7 x3)) x5 (f1 (f2 x2 x2 x0) (f0 x3 c7) (f0 (f3 c1 (f0 x1 x0) c5) (f0 x6 c6))))))) epsilon)
                 ))
               ))
             )))))

(check-sat)

