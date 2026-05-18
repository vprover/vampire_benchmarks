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
(declare-fun f1 (Real Real Real) Real)
(declare-fun f2 (Real) Real)
(declare-fun f3 (Real Real Real) Real)
(declare-fun f4 (Real) Real)
(declare-fun f5 (Real Real Real) Real)
(declare-fun f6 (Real Real Real) Real)
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
(assert (not (forall ( (x0 Real) (x1 Real) ) ; lim[x -> a](f0 (f3 (f1 c13 c1 c7) (f5 c13 x1 c15) c1) (f7 (f7 (f5 c9 (f4 (f6 x1 (f4 c11) c13)) (f0 (f4 (f7 (f2 (f2 (f7 (f5 (f2 (f5 c1 c9 c8)) (f1 c4 c8 c9) x0)))))) (f0 (f0 c8 (f0 c13 c14 c11) c13) c4 (f7 (f4 (f0 (f6 c7 c1 x1) c3 (f2 (f2 c3)))))) (f6 (f4 (f6 (f7 c11) (f1 (f1 (f2 c13) c8 (f1 c0 (f6 c9 c13 c8) c6)) (f1 c9 c2 c15) x1) (f0 c2 (f0 x0 (f3 c13 (f1 c9 c9 c13) (f0 x0 c9 c3)) (f4 c7)) (f7 c9)))) (f0 (f5 (f6 c7 c7 x1) (f3 (f4 c0) x0 (f3 x1 c0 c9)) (f7 (f2 (f4 c8)))) (f0 x0 (f0 c14 c13 c0) c5) (f6 c10 c7 c15)) (f7 (f6 c1 (f7 x1) (f6 c3 c8 x1)))))))) (f4 (f3 x0 c6 c2))) = (f0 (f3 (f1 c13 c1 c7) (f5 c13 x1 c15) c1) (f7 (f7 (f5 c9 (f4 (f6 x1 (f4 c11) c13)) (f0 (f4 (f7 (f2 (f2 (f7 (f5 (f2 (f5 c1 c9 c8)) (f1 c4 c8 c9) x0)))))) (f0 (f0 c8 (f0 c13 c14 c11) c13) c4 (f7 (f4 (f0 (f6 c7 c1 x1) c3 (f2 (f2 c3)))))) (f6 (f4 (f6 (f7 c11) (f1 (f1 (f2 c13) c8 (f1 c0 (f6 c9 c13 c8) c6)) (f1 c9 c2 c15) x1) (f0 c2 (f0 x0 (f3 c13 (f1 c9 c9 c13) (f0 x0 c9 c3)) (f4 c7)) (f7 c9)))) (f0 (f5 (f6 c7 c7 x1) (f3 (f4 c0) x0 (f3 x1 c0 c9)) (f7 (f2 (f4 c8)))) (f0 x0 (f0 c14 c13 c0) c5) (f6 c10 c7 c15)) (f7 (f6 c1 (f7 x1) (f6 c3 c8 x1)))))))) (f4 (f3 x0 c6 c2)))
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
                                          ; | (f0 (f3 (f1 c13 c1 c7) (f5 c13 x1 c15) c1) (f7 (f7 (f5 c9 (f4 (f6 x1 (f4 c11) c13)) (f0 (f4 (f7 (f2 (f2 (f7 (f5 (f2 (f5 c1 c9 c8)) (f1 c4 c8 c9) x0)))))) (f0 (f0 c8 (f0 c13 c14 c11) c13) c4 (f7 (f4 (f0 (f6 c7 c1 x1) c3 (f2 (f2 c3)))))) (f6 (f4 (f6 (f7 c11) (f1 (f1 (f2 c13) c8 (f1 c0 (f6 c9 c13 c8) c6)) (f1 c9 c2 c15) x1) (f0 c2 (f0 x0 (f3 c13 (f1 c9 c9 c13) (f0 x0 c9 c3)) (f4 c7)) (f7 c9)))) (f0 (f5 (f6 c7 c7 x1) (f3 (f4 c0) x0 (f3 x1 c0 c9)) (f7 (f2 (f4 c8)))) (f0 x0 (f0 c14 c13 c0) c5) (f6 c10 c7 c15)) (f7 (f6 c1 (f7 x1) (f6 c3 c8 x1)))))))) (f4 (f3 x0 c6 c2))) - (f0 (f3 (f1 c13 c1 c7) (f5 c13 x1 c15) c1) (f7 (f7 (f5 c9 (f4 (f6 x1 (f4 c11) c13)) (f0 (f4 (f7 (f2 (f2 (f7 (f5 (f2 (f5 c1 c9 c8)) (f1 c4 c8 c9) x0)))))) (f0 (f0 c8 (f0 c13 c14 c11) c13) c4 (f7 (f4 (f0 (f6 c7 c1 x1) c3 (f2 (f2 c3)))))) (f6 (f4 (f6 (f7 c11) (f1 (f1 (f2 c13) c8 (f1 c0 (f6 c9 c13 c8) c6)) (f1 c9 c2 c15) x1) (f0 c2 (f0 x0 (f3 c13 (f1 c9 c9 c13) (f0 x0 c9 c3)) (f4 c7)) (f7 c9)))) (f0 (f5 (f6 c7 c7 x1) (f3 (f4 c0) x0 (f3 x1 c0 c9)) (f7 (f2 (f4 c8)))) (f0 x0 (f0 c14 c13 c0) c5) (f6 c10 c7 c15)) (f7 (f6 c1 (f7 x1) (f6 c3 c8 x1)))))))) (f4 (f3 x0 c6 c2))) | < epsilon
                                          (< (ite (>= (- (f0 (f3 (f1 c13 c1 c7) (f5 c13 x1 c15) c1) (f7 (f7 (f5 c9 (f4 (f6 x1 (f4 c11) c13)) (f0 (f4 (f7 (f2 (f2 (f7 (f5 (f2 (f5 c1 c9 c8)) (f1 c4 c8 c9) x0)))))) (f0 (f0 c8 (f0 c13 c14 c11) c13) c4 (f7 (f4 (f0 (f6 c7 c1 x1) c3 (f2 (f2 c3)))))) (f6 (f4 (f6 (f7 c11) (f1 (f1 (f2 c13) c8 (f1 c0 (f6 c9 c13 c8) c6)) (f1 c9 c2 c15) x1) (f0 c2 (f0 x0 (f3 c13 (f1 c9 c9 c13) (f0 x0 c9 c3)) (f4 c7)) (f7 c9)))) (f0 (f5 (f6 c7 c7 x1) (f3 (f4 c0) x0 (f3 x1 c0 c9)) (f7 (f2 (f4 c8)))) (f0 x0 (f0 c14 c13 c0) c5) (f6 c10 c7 c15)) (f7 (f6 c1 (f7 x1) (f6 c3 c8 x1)))))))) (f4 (f3 x0 c6 c2))) (f0 (f3 (f1 c13 c1 c7) (f5 c13 x1 c15) c1) (f7 (f7 (f5 c9 (f4 (f6 x1 (f4 c11) c13)) (f0 (f4 (f7 (f2 (f2 (f7 (f5 (f2 (f5 c1 c9 c8)) (f1 c4 c8 c9) x0)))))) (f0 (f0 c8 (f0 c13 c14 c11) c13) c4 (f7 (f4 (f0 (f6 c7 c1 x1) c3 (f2 (f2 c3)))))) (f6 (f4 (f6 (f7 c11) (f1 (f1 (f2 c13) c8 (f1 c0 (f6 c9 c13 c8) c6)) (f1 c9 c2 c15) x1) (f0 c2 (f0 x0 (f3 c13 (f1 c9 c9 c13) (f0 x0 c9 c3)) (f4 c7)) (f7 c9)))) (f0 (f5 (f6 c7 c7 x1) (f3 (f4 c0) x0 (f3 x1 c0 c9)) (f7 (f2 (f4 c8)))) (f0 x0 (f0 c14 c13 c0) c5) (f6 c10 c7 c15)) (f7 (f6 c1 (f7 x1) (f6 c3 c8 x1)))))))) (f4 (f3 x0 c6 c2)))) 0.0) (- (f0 (f3 (f1 c13 c1 c7) (f5 c13 x1 c15) c1) (f7 (f7 (f5 c9 (f4 (f6 x1 (f4 c11) c13)) (f0 (f4 (f7 (f2 (f2 (f7 (f5 (f2 (f5 c1 c9 c8)) (f1 c4 c8 c9) x0)))))) (f0 (f0 c8 (f0 c13 c14 c11) c13) c4 (f7 (f4 (f0 (f6 c7 c1 x1) c3 (f2 (f2 c3)))))) (f6 (f4 (f6 (f7 c11) (f1 (f1 (f2 c13) c8 (f1 c0 (f6 c9 c13 c8) c6)) (f1 c9 c2 c15) x1) (f0 c2 (f0 x0 (f3 c13 (f1 c9 c9 c13) (f0 x0 c9 c3)) (f4 c7)) (f7 c9)))) (f0 (f5 (f6 c7 c7 x1) (f3 (f4 c0) x0 (f3 x1 c0 c9)) (f7 (f2 (f4 c8)))) (f0 x0 (f0 c14 c13 c0) c5) (f6 c10 c7 c15)) (f7 (f6 c1 (f7 x1) (f6 c3 c8 x1)))))))) (f4 (f3 x0 c6 c2))) (f0 (f3 (f1 c13 c1 c7) (f5 c13 x1 c15) c1) (f7 (f7 (f5 c9 (f4 (f6 x1 (f4 c11) c13)) (f0 (f4 (f7 (f2 (f2 (f7 (f5 (f2 (f5 c1 c9 c8)) (f1 c4 c8 c9) x0)))))) (f0 (f0 c8 (f0 c13 c14 c11) c13) c4 (f7 (f4 (f0 (f6 c7 c1 x1) c3 (f2 (f2 c3)))))) (f6 (f4 (f6 (f7 c11) (f1 (f1 (f2 c13) c8 (f1 c0 (f6 c9 c13 c8) c6)) (f1 c9 c2 c15) x1) (f0 c2 (f0 x0 (f3 c13 (f1 c9 c9 c13) (f0 x0 c9 c3)) (f4 c7)) (f7 c9)))) (f0 (f5 (f6 c7 c7 x1) (f3 (f4 c0) x0 (f3 x1 c0 c9)) (f7 (f2 (f4 c8)))) (f0 x0 (f0 c14 c13 c0) c5) (f6 c10 c7 c15)) (f7 (f6 c1 (f7 x1) (f6 c3 c8 x1)))))))) (f4 (f3 x0 c6 c2)))) (- (- (f0 (f3 (f1 c13 c1 c7) (f5 c13 x1 c15) c1) (f7 (f7 (f5 c9 (f4 (f6 x1 (f4 c11) c13)) (f0 (f4 (f7 (f2 (f2 (f7 (f5 (f2 (f5 c1 c9 c8)) (f1 c4 c8 c9) x0)))))) (f0 (f0 c8 (f0 c13 c14 c11) c13) c4 (f7 (f4 (f0 (f6 c7 c1 x1) c3 (f2 (f2 c3)))))) (f6 (f4 (f6 (f7 c11) (f1 (f1 (f2 c13) c8 (f1 c0 (f6 c9 c13 c8) c6)) (f1 c9 c2 c15) x1) (f0 c2 (f0 x0 (f3 c13 (f1 c9 c9 c13) (f0 x0 c9 c3)) (f4 c7)) (f7 c9)))) (f0 (f5 (f6 c7 c7 x1) (f3 (f4 c0) x0 (f3 x1 c0 c9)) (f7 (f2 (f4 c8)))) (f0 x0 (f0 c14 c13 c0) c5) (f6 c10 c7 c15)) (f7 (f6 c1 (f7 x1) (f6 c3 c8 x1)))))))) (f4 (f3 x0 c6 c2))) (f0 (f3 (f1 c13 c1 c7) (f5 c13 x1 c15) c1) (f7 (f7 (f5 c9 (f4 (f6 x1 (f4 c11) c13)) (f0 (f4 (f7 (f2 (f2 (f7 (f5 (f2 (f5 c1 c9 c8)) (f1 c4 c8 c9) x0)))))) (f0 (f0 c8 (f0 c13 c14 c11) c13) c4 (f7 (f4 (f0 (f6 c7 c1 x1) c3 (f2 (f2 c3)))))) (f6 (f4 (f6 (f7 c11) (f1 (f1 (f2 c13) c8 (f1 c0 (f6 c9 c13 c8) c6)) (f1 c9 c2 c15) x1) (f0 c2 (f0 x0 (f3 c13 (f1 c9 c9 c13) (f0 x0 c9 c3)) (f4 c7)) (f7 c9)))) (f0 (f5 (f6 c7 c7 x1) (f3 (f4 c0) x0 (f3 x1 c0 c9)) (f7 (f2 (f4 c8)))) (f0 x0 (f0 c14 c13 c0) c5) (f6 c10 c7 c15)) (f7 (f6 c1 (f7 x1) (f6 c3 c8 x1)))))))) (f4 (f3 x0 c6 c2)))))) epsilon)
                 ))
               ))
             )))))

(check-sat)

