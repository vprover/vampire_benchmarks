(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; lim[x -> l1](f_i1(x)) ~ l
; lim[x -> l2](f_i2(x)) ~ l1
; lim[x -> l3](f_i3(x)) ~ l2
; ...
; lim[x -> l15](f_i15(x)) ~ l14
; lim[x -> a](f_i16(x)) ~ l15
; ============================
; lim[x -> a](f_i1(f_i2(f_i3(...f_i16(x)...)))) ~ l
; 
; 
; where
; - 2 functions with arity 1
; - 16 number of function applications

(declare-fun f0 (Real) Real)
(declare-fun f1 (Real) Real)
(declare-const l Real)
(declare-const a Real)
(declare-const l1 Real)
(declare-const l2 Real)
(declare-const l3 Real)
(declare-const l4 Real)
(declare-const l5 Real)
(declare-const l6 Real)
(declare-const l7 Real)
(declare-const l8 Real)
(declare-const l9 Real)
(declare-const l10 Real)
(declare-const l11 Real)
(declare-const l12 Real)
(declare-const l13 Real)
(declare-const l14 Real)
(declare-const l15 Real)
; Axiom 0
(assert ; lim[x -> l1](f1 x) = l
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l1 != x
                                     (and (not (= x l1))
                                          ; | x - l1 | < delta
                                          (< (ite (>= (- x l1) 0.0) (- x l1) (- (- x l1))) delta))
                                     ;
                                     ; | (f1 x) - l | < epsilon
                                     (< (ite (>= (- (f1 x) l) 0.0) (- (f1 x) l) (- (- (f1 x) l))) epsilon)
            ))
          ))
        )))

; Axiom 1
(assert ; lim[x -> l2](f1 x) = l1
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l2 != x
                                     (and (not (= x l2))
                                          ; | x - l2 | < delta
                                          (< (ite (>= (- x l2) 0.0) (- x l2) (- (- x l2))) delta))
                                     ;
                                     ; | (f1 x) - l1 | < epsilon
                                     (< (ite (>= (- (f1 x) l1) 0.0) (- (f1 x) l1) (- (- (f1 x) l1))) epsilon)
            ))
          ))
        )))

; Axiom 2
(assert ; lim[x -> l3](f1 x) = l2
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l3 != x
                                     (and (not (= x l3))
                                          ; | x - l3 | < delta
                                          (< (ite (>= (- x l3) 0.0) (- x l3) (- (- x l3))) delta))
                                     ;
                                     ; | (f1 x) - l2 | < epsilon
                                     (< (ite (>= (- (f1 x) l2) 0.0) (- (f1 x) l2) (- (- (f1 x) l2))) epsilon)
            ))
          ))
        )))

; Axiom 3
(assert ; lim[x -> l4](f1 x) = l3
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l4 != x
                                     (and (not (= x l4))
                                          ; | x - l4 | < delta
                                          (< (ite (>= (- x l4) 0.0) (- x l4) (- (- x l4))) delta))
                                     ;
                                     ; | (f1 x) - l3 | < epsilon
                                     (< (ite (>= (- (f1 x) l3) 0.0) (- (f1 x) l3) (- (- (f1 x) l3))) epsilon)
            ))
          ))
        )))

; Axiom 4
(assert ; lim[x -> l5](f1 x) = l4
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l5 != x
                                     (and (not (= x l5))
                                          ; | x - l5 | < delta
                                          (< (ite (>= (- x l5) 0.0) (- x l5) (- (- x l5))) delta))
                                     ;
                                     ; | (f1 x) - l4 | < epsilon
                                     (< (ite (>= (- (f1 x) l4) 0.0) (- (f1 x) l4) (- (- (f1 x) l4))) epsilon)
            ))
          ))
        )))

; Axiom 5
(assert ; lim[x -> l6](f1 x) = l5
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l6 != x
                                     (and (not (= x l6))
                                          ; | x - l6 | < delta
                                          (< (ite (>= (- x l6) 0.0) (- x l6) (- (- x l6))) delta))
                                     ;
                                     ; | (f1 x) - l5 | < epsilon
                                     (< (ite (>= (- (f1 x) l5) 0.0) (- (f1 x) l5) (- (- (f1 x) l5))) epsilon)
            ))
          ))
        )))

; Axiom 6
(assert ; lim[x -> l7](f1 x) = l6
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l7 != x
                                     (and (not (= x l7))
                                          ; | x - l7 | < delta
                                          (< (ite (>= (- x l7) 0.0) (- x l7) (- (- x l7))) delta))
                                     ;
                                     ; | (f1 x) - l6 | < epsilon
                                     (< (ite (>= (- (f1 x) l6) 0.0) (- (f1 x) l6) (- (- (f1 x) l6))) epsilon)
            ))
          ))
        )))

; Axiom 7
(assert ; lim[x -> l8](f0 x) = l7
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l8 != x
                                     (and (not (= x l8))
                                          ; | x - l8 | < delta
                                          (< (ite (>= (- x l8) 0.0) (- x l8) (- (- x l8))) delta))
                                     ;
                                     ; | (f0 x) - l7 | < epsilon
                                     (< (ite (>= (- (f0 x) l7) 0.0) (- (f0 x) l7) (- (- (f0 x) l7))) epsilon)
            ))
          ))
        )))

; Axiom 8
(assert ; lim[x -> l9](f0 x) = l8
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l9 != x
                                     (and (not (= x l9))
                                          ; | x - l9 | < delta
                                          (< (ite (>= (- x l9) 0.0) (- x l9) (- (- x l9))) delta))
                                     ;
                                     ; | (f0 x) - l8 | < epsilon
                                     (< (ite (>= (- (f0 x) l8) 0.0) (- (f0 x) l8) (- (- (f0 x) l8))) epsilon)
            ))
          ))
        )))

; Axiom 9
(assert ; lim[x -> l10](f0 x) = l9
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l10 != x
                                     (and (not (= x l10))
                                          ; | x - l10 | < delta
                                          (< (ite (>= (- x l10) 0.0) (- x l10) (- (- x l10))) delta))
                                     ;
                                     ; | (f0 x) - l9 | < epsilon
                                     (< (ite (>= (- (f0 x) l9) 0.0) (- (f0 x) l9) (- (- (f0 x) l9))) epsilon)
            ))
          ))
        )))

; Axiom 10
(assert ; lim[x -> l11](f0 x) = l10
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l11 != x
                                     (and (not (= x l11))
                                          ; | x - l11 | < delta
                                          (< (ite (>= (- x l11) 0.0) (- x l11) (- (- x l11))) delta))
                                     ;
                                     ; | (f0 x) - l10 | < epsilon
                                     (< (ite (>= (- (f0 x) l10) 0.0) (- (f0 x) l10) (- (- (f0 x) l10))) epsilon)
            ))
          ))
        )))

; Axiom 11
(assert ; lim[x -> l12](f1 x) = l11
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l12 != x
                                     (and (not (= x l12))
                                          ; | x - l12 | < delta
                                          (< (ite (>= (- x l12) 0.0) (- x l12) (- (- x l12))) delta))
                                     ;
                                     ; | (f1 x) - l11 | < epsilon
                                     (< (ite (>= (- (f1 x) l11) 0.0) (- (f1 x) l11) (- (- (f1 x) l11))) epsilon)
            ))
          ))
        )))

; Axiom 12
(assert ; lim[x -> l13](f0 x) = l12
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l13 != x
                                     (and (not (= x l13))
                                          ; | x - l13 | < delta
                                          (< (ite (>= (- x l13) 0.0) (- x l13) (- (- x l13))) delta))
                                     ;
                                     ; | (f0 x) - l12 | < epsilon
                                     (< (ite (>= (- (f0 x) l12) 0.0) (- (f0 x) l12) (- (- (f0 x) l12))) epsilon)
            ))
          ))
        )))

; Axiom 13
(assert ; lim[x -> l14](f1 x) = l13
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l14 != x
                                     (and (not (= x l14))
                                          ; | x - l14 | < delta
                                          (< (ite (>= (- x l14) 0.0) (- x l14) (- (- x l14))) delta))
                                     ;
                                     ; | (f1 x) - l13 | < epsilon
                                     (< (ite (>= (- (f1 x) l13) 0.0) (- (f1 x) l13) (- (- (f1 x) l13))) epsilon)
            ))
          ))
        )))

; Axiom 14
(assert ; lim[x -> l15](f1 x) = l14
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l15 != x
                                     (and (not (= x l15))
                                          ; | x - l15 | < delta
                                          (< (ite (>= (- x l15) 0.0) (- x l15) (- (- x l15))) delta))
                                     ;
                                     ; | (f1 x) - l14 | < epsilon
                                     (< (ite (>= (- (f1 x) l14) 0.0) (- (f1 x) l14) (- (- (f1 x) l14))) epsilon)
            ))
          ))
        )))

; Axiom 15
(assert ; lim[x -> a](f0 x) = l15
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
                                     ; | (f0 x) - l15 | < epsilon
                                     (< (ite (>= (- (f0 x) l15) 0.0) (- (f0 x) l15) (- (- (f0 x) l15))) epsilon)
            ))
          ))
        )))


; Conclusion
(assert (not ; lim[x -> a](f1 (f1 (f1 (f1 (f1 (f1 (f1 (f0 (f0 (f0 (f0 (f1 (f0 (f1 (f1 (f0 x)))))))))))))))) = l
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
                                          ; | (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f0 (f0 (f0 (f0 (f1 (f0 (f1 (f1 (f0 x)))))))))))))))) - l | < epsilon
                                          (< (ite (>= (- (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f0 (f0 (f0 (f0 (f1 (f0 (f1 (f1 (f0 x)))))))))))))))) l) 0.0) (- (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f0 (f0 (f0 (f0 (f1 (f0 (f1 (f1 (f0 x)))))))))))))))) l) (- (- (f1 (f1 (f1 (f1 (f1 (f1 (f1 (f0 (f0 (f0 (f0 (f1 (f0 (f1 (f1 (f0 x)))))))))))))))) l))) epsilon)
                 ))
               ))
             ))))

(check-sat)

