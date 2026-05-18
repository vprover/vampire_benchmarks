(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; forall x1...x2. lim[x -> a] t = t
; 
; where t is a random term with 
; - 8 functions with arity in 1..3
; - 16 constants
; - 2 variables
; - 64 number of function applications

(declare-fun f0 (Real) Real)
(declare-fun f1 (Real Real) Real)
(declare-fun f2 (Real Real) Real)
(declare-fun f3 (Real) Real)
(declare-fun f4 (Real Real Real) Real)
(declare-fun f5 (Real) Real)
(declare-fun f6 (Real) Real)
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
(assert (not (forall ( (x0 Real) (x1 Real) ) ; lim[x -> a](f6 (f3 (f6 (f3 (f5 (f7 (f1 (f7 (f7 x0 c4) (f5 (f0 c12))) (f3 (f4 (f5 (f3 c14)) c10 c4))) (f2 (f2 c13 c5) (f1 (f0 (f5 (f6 (f1 (f7 (f7 (f6 c0) (f3 (f5 (f2 (f4 (f3 (f5 (f7 c11 (f5 c4)))) (f0 (f4 (f5 (f4 c9 (f0 (f5 c7)) c15)) (f5 c12) c3)) (f3 (f4 c8 c1 c15))) c4)))) (f6 (f6 (f5 (f7 (f1 c0 (f5 c13)) (f6 (f1 (f3 c4) c14))))))) (f7 (f5 (f7 (f3 (f1 c3 (f3 (f1 c13 c15)))) (f3 (f1 (f7 c12 c7) c10)))) (f7 c10 c12)))))) (f7 c0 (f6 c9)))))))))) = (f6 (f3 (f6 (f3 (f5 (f7 (f1 (f7 (f7 x0 c4) (f5 (f0 c12))) (f3 (f4 (f5 (f3 c14)) c10 c4))) (f2 (f2 c13 c5) (f1 (f0 (f5 (f6 (f1 (f7 (f7 (f6 c0) (f3 (f5 (f2 (f4 (f3 (f5 (f7 c11 (f5 c4)))) (f0 (f4 (f5 (f4 c9 (f0 (f5 c7)) c15)) (f5 c12) c3)) (f3 (f4 c8 c1 c15))) c4)))) (f6 (f6 (f5 (f7 (f1 c0 (f5 c13)) (f6 (f1 (f3 c4) c14))))))) (f7 (f5 (f7 (f3 (f1 c3 (f3 (f1 c13 c15)))) (f3 (f1 (f7 c12 c7) c10)))) (f7 c10 c12)))))) (f7 c0 (f6 c9))))))))))
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
                                          ; | (f6 (f3 (f6 (f3 (f5 (f7 (f1 (f7 (f7 x0 c4) (f5 (f0 c12))) (f3 (f4 (f5 (f3 c14)) c10 c4))) (f2 (f2 c13 c5) (f1 (f0 (f5 (f6 (f1 (f7 (f7 (f6 c0) (f3 (f5 (f2 (f4 (f3 (f5 (f7 c11 (f5 c4)))) (f0 (f4 (f5 (f4 c9 (f0 (f5 c7)) c15)) (f5 c12) c3)) (f3 (f4 c8 c1 c15))) c4)))) (f6 (f6 (f5 (f7 (f1 c0 (f5 c13)) (f6 (f1 (f3 c4) c14))))))) (f7 (f5 (f7 (f3 (f1 c3 (f3 (f1 c13 c15)))) (f3 (f1 (f7 c12 c7) c10)))) (f7 c10 c12)))))) (f7 c0 (f6 c9)))))))))) - (f6 (f3 (f6 (f3 (f5 (f7 (f1 (f7 (f7 x0 c4) (f5 (f0 c12))) (f3 (f4 (f5 (f3 c14)) c10 c4))) (f2 (f2 c13 c5) (f1 (f0 (f5 (f6 (f1 (f7 (f7 (f6 c0) (f3 (f5 (f2 (f4 (f3 (f5 (f7 c11 (f5 c4)))) (f0 (f4 (f5 (f4 c9 (f0 (f5 c7)) c15)) (f5 c12) c3)) (f3 (f4 c8 c1 c15))) c4)))) (f6 (f6 (f5 (f7 (f1 c0 (f5 c13)) (f6 (f1 (f3 c4) c14))))))) (f7 (f5 (f7 (f3 (f1 c3 (f3 (f1 c13 c15)))) (f3 (f1 (f7 c12 c7) c10)))) (f7 c10 c12)))))) (f7 c0 (f6 c9)))))))))) | < epsilon
                                          (< (ite (>= (- (f6 (f3 (f6 (f3 (f5 (f7 (f1 (f7 (f7 x0 c4) (f5 (f0 c12))) (f3 (f4 (f5 (f3 c14)) c10 c4))) (f2 (f2 c13 c5) (f1 (f0 (f5 (f6 (f1 (f7 (f7 (f6 c0) (f3 (f5 (f2 (f4 (f3 (f5 (f7 c11 (f5 c4)))) (f0 (f4 (f5 (f4 c9 (f0 (f5 c7)) c15)) (f5 c12) c3)) (f3 (f4 c8 c1 c15))) c4)))) (f6 (f6 (f5 (f7 (f1 c0 (f5 c13)) (f6 (f1 (f3 c4) c14))))))) (f7 (f5 (f7 (f3 (f1 c3 (f3 (f1 c13 c15)))) (f3 (f1 (f7 c12 c7) c10)))) (f7 c10 c12)))))) (f7 c0 (f6 c9)))))))))) (f6 (f3 (f6 (f3 (f5 (f7 (f1 (f7 (f7 x0 c4) (f5 (f0 c12))) (f3 (f4 (f5 (f3 c14)) c10 c4))) (f2 (f2 c13 c5) (f1 (f0 (f5 (f6 (f1 (f7 (f7 (f6 c0) (f3 (f5 (f2 (f4 (f3 (f5 (f7 c11 (f5 c4)))) (f0 (f4 (f5 (f4 c9 (f0 (f5 c7)) c15)) (f5 c12) c3)) (f3 (f4 c8 c1 c15))) c4)))) (f6 (f6 (f5 (f7 (f1 c0 (f5 c13)) (f6 (f1 (f3 c4) c14))))))) (f7 (f5 (f7 (f3 (f1 c3 (f3 (f1 c13 c15)))) (f3 (f1 (f7 c12 c7) c10)))) (f7 c10 c12)))))) (f7 c0 (f6 c9))))))))))) 0.0) (- (f6 (f3 (f6 (f3 (f5 (f7 (f1 (f7 (f7 x0 c4) (f5 (f0 c12))) (f3 (f4 (f5 (f3 c14)) c10 c4))) (f2 (f2 c13 c5) (f1 (f0 (f5 (f6 (f1 (f7 (f7 (f6 c0) (f3 (f5 (f2 (f4 (f3 (f5 (f7 c11 (f5 c4)))) (f0 (f4 (f5 (f4 c9 (f0 (f5 c7)) c15)) (f5 c12) c3)) (f3 (f4 c8 c1 c15))) c4)))) (f6 (f6 (f5 (f7 (f1 c0 (f5 c13)) (f6 (f1 (f3 c4) c14))))))) (f7 (f5 (f7 (f3 (f1 c3 (f3 (f1 c13 c15)))) (f3 (f1 (f7 c12 c7) c10)))) (f7 c10 c12)))))) (f7 c0 (f6 c9)))))))))) (f6 (f3 (f6 (f3 (f5 (f7 (f1 (f7 (f7 x0 c4) (f5 (f0 c12))) (f3 (f4 (f5 (f3 c14)) c10 c4))) (f2 (f2 c13 c5) (f1 (f0 (f5 (f6 (f1 (f7 (f7 (f6 c0) (f3 (f5 (f2 (f4 (f3 (f5 (f7 c11 (f5 c4)))) (f0 (f4 (f5 (f4 c9 (f0 (f5 c7)) c15)) (f5 c12) c3)) (f3 (f4 c8 c1 c15))) c4)))) (f6 (f6 (f5 (f7 (f1 c0 (f5 c13)) (f6 (f1 (f3 c4) c14))))))) (f7 (f5 (f7 (f3 (f1 c3 (f3 (f1 c13 c15)))) (f3 (f1 (f7 c12 c7) c10)))) (f7 c10 c12)))))) (f7 c0 (f6 c9))))))))))) (- (- (f6 (f3 (f6 (f3 (f5 (f7 (f1 (f7 (f7 x0 c4) (f5 (f0 c12))) (f3 (f4 (f5 (f3 c14)) c10 c4))) (f2 (f2 c13 c5) (f1 (f0 (f5 (f6 (f1 (f7 (f7 (f6 c0) (f3 (f5 (f2 (f4 (f3 (f5 (f7 c11 (f5 c4)))) (f0 (f4 (f5 (f4 c9 (f0 (f5 c7)) c15)) (f5 c12) c3)) (f3 (f4 c8 c1 c15))) c4)))) (f6 (f6 (f5 (f7 (f1 c0 (f5 c13)) (f6 (f1 (f3 c4) c14))))))) (f7 (f5 (f7 (f3 (f1 c3 (f3 (f1 c13 c15)))) (f3 (f1 (f7 c12 c7) c10)))) (f7 c10 c12)))))) (f7 c0 (f6 c9)))))))))) (f6 (f3 (f6 (f3 (f5 (f7 (f1 (f7 (f7 x0 c4) (f5 (f0 c12))) (f3 (f4 (f5 (f3 c14)) c10 c4))) (f2 (f2 c13 c5) (f1 (f0 (f5 (f6 (f1 (f7 (f7 (f6 c0) (f3 (f5 (f2 (f4 (f3 (f5 (f7 c11 (f5 c4)))) (f0 (f4 (f5 (f4 c9 (f0 (f5 c7)) c15)) (f5 c12) c3)) (f3 (f4 c8 c1 c15))) c4)))) (f6 (f6 (f5 (f7 (f1 c0 (f5 c13)) (f6 (f1 (f3 c4) c14))))))) (f7 (f5 (f7 (f3 (f1 c3 (f3 (f1 c13 c15)))) (f3 (f1 (f7 c12 c7) c10)))) (f7 c10 c12)))))) (f7 c0 (f6 c9))))))))))))) epsilon)
                 ))
               ))
             )))))

(check-sat)

