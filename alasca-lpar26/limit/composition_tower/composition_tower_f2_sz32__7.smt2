(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; lim[x -> l1](f_i1(x)) ~ l
; lim[x -> l2](f_i2(x)) ~ l1
; lim[x -> l3](f_i3(x)) ~ l2
; ...
; lim[x -> l31](f_i31(x)) ~ l30
; lim[x -> a](f_i32(x)) ~ l31
; ============================
; lim[x -> a](f_i1(f_i2(f_i3(...f_i32(x)...)))) ~ l
; 
; 
; where
; - 2 functions with arity 1
; - 32 number of function applications

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
(declare-const l16 Real)
(declare-const l17 Real)
(declare-const l18 Real)
(declare-const l19 Real)
(declare-const l20 Real)
(declare-const l21 Real)
(declare-const l22 Real)
(declare-const l23 Real)
(declare-const l24 Real)
(declare-const l25 Real)
(declare-const l26 Real)
(declare-const l27 Real)
(declare-const l28 Real)
(declare-const l29 Real)
(declare-const l30 Real)
(declare-const l31 Real)
; Axiom 0
(assert ; lim[x -> l1](f0 x) = l
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
                                     ; | (f0 x) - l | < epsilon
                                     (< (ite (>= (- (f0 x) l) 0.0) (- (f0 x) l) (- (- (f0 x) l))) epsilon)
            ))
          ))
        )))

; Axiom 1
(assert ; lim[x -> l2](f0 x) = l1
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
                                     ; | (f0 x) - l1 | < epsilon
                                     (< (ite (>= (- (f0 x) l1) 0.0) (- (f0 x) l1) (- (- (f0 x) l1))) epsilon)
            ))
          ))
        )))

; Axiom 2
(assert ; lim[x -> l3](f0 x) = l2
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
                                     ; | (f0 x) - l2 | < epsilon
                                     (< (ite (>= (- (f0 x) l2) 0.0) (- (f0 x) l2) (- (- (f0 x) l2))) epsilon)
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
(assert ; lim[x -> l5](f0 x) = l4
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
                                     ; | (f0 x) - l4 | < epsilon
                                     (< (ite (>= (- (f0 x) l4) 0.0) (- (f0 x) l4) (- (- (f0 x) l4))) epsilon)
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
(assert ; lim[x -> l7](f0 x) = l6
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
                                     ; | (f0 x) - l6 | < epsilon
                                     (< (ite (>= (- (f0 x) l6) 0.0) (- (f0 x) l6) (- (- (f0 x) l6))) epsilon)
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
(assert ; lim[x -> l10](f1 x) = l9
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
                                     ; | (f1 x) - l9 | < epsilon
                                     (< (ite (>= (- (f1 x) l9) 0.0) (- (f1 x) l9) (- (- (f1 x) l9))) epsilon)
            ))
          ))
        )))

; Axiom 10
(assert ; lim[x -> l11](f1 x) = l10
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
                                     ; | (f1 x) - l10 | < epsilon
                                     (< (ite (>= (- (f1 x) l10) 0.0) (- (f1 x) l10) (- (- (f1 x) l10))) epsilon)
            ))
          ))
        )))

; Axiom 11
(assert ; lim[x -> l12](f0 x) = l11
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
                                     ; | (f0 x) - l11 | < epsilon
                                     (< (ite (>= (- (f0 x) l11) 0.0) (- (f0 x) l11) (- (- (f0 x) l11))) epsilon)
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
(assert ; lim[x -> l14](f0 x) = l13
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
                                     ; | (f0 x) - l13 | < epsilon
                                     (< (ite (>= (- (f0 x) l13) 0.0) (- (f0 x) l13) (- (- (f0 x) l13))) epsilon)
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
(assert ; lim[x -> l16](f1 x) = l15
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l16 != x
                                     (and (not (= x l16))
                                          ; | x - l16 | < delta
                                          (< (ite (>= (- x l16) 0.0) (- x l16) (- (- x l16))) delta))
                                     ;
                                     ; | (f1 x) - l15 | < epsilon
                                     (< (ite (>= (- (f1 x) l15) 0.0) (- (f1 x) l15) (- (- (f1 x) l15))) epsilon)
            ))
          ))
        )))

; Axiom 16
(assert ; lim[x -> l17](f1 x) = l16
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l17 != x
                                     (and (not (= x l17))
                                          ; | x - l17 | < delta
                                          (< (ite (>= (- x l17) 0.0) (- x l17) (- (- x l17))) delta))
                                     ;
                                     ; | (f1 x) - l16 | < epsilon
                                     (< (ite (>= (- (f1 x) l16) 0.0) (- (f1 x) l16) (- (- (f1 x) l16))) epsilon)
            ))
          ))
        )))

; Axiom 17
(assert ; lim[x -> l18](f1 x) = l17
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l18 != x
                                     (and (not (= x l18))
                                          ; | x - l18 | < delta
                                          (< (ite (>= (- x l18) 0.0) (- x l18) (- (- x l18))) delta))
                                     ;
                                     ; | (f1 x) - l17 | < epsilon
                                     (< (ite (>= (- (f1 x) l17) 0.0) (- (f1 x) l17) (- (- (f1 x) l17))) epsilon)
            ))
          ))
        )))

; Axiom 18
(assert ; lim[x -> l19](f1 x) = l18
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l19 != x
                                     (and (not (= x l19))
                                          ; | x - l19 | < delta
                                          (< (ite (>= (- x l19) 0.0) (- x l19) (- (- x l19))) delta))
                                     ;
                                     ; | (f1 x) - l18 | < epsilon
                                     (< (ite (>= (- (f1 x) l18) 0.0) (- (f1 x) l18) (- (- (f1 x) l18))) epsilon)
            ))
          ))
        )))

; Axiom 19
(assert ; lim[x -> l20](f1 x) = l19
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l20 != x
                                     (and (not (= x l20))
                                          ; | x - l20 | < delta
                                          (< (ite (>= (- x l20) 0.0) (- x l20) (- (- x l20))) delta))
                                     ;
                                     ; | (f1 x) - l19 | < epsilon
                                     (< (ite (>= (- (f1 x) l19) 0.0) (- (f1 x) l19) (- (- (f1 x) l19))) epsilon)
            ))
          ))
        )))

; Axiom 20
(assert ; lim[x -> l21](f0 x) = l20
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l21 != x
                                     (and (not (= x l21))
                                          ; | x - l21 | < delta
                                          (< (ite (>= (- x l21) 0.0) (- x l21) (- (- x l21))) delta))
                                     ;
                                     ; | (f0 x) - l20 | < epsilon
                                     (< (ite (>= (- (f0 x) l20) 0.0) (- (f0 x) l20) (- (- (f0 x) l20))) epsilon)
            ))
          ))
        )))

; Axiom 21
(assert ; lim[x -> l22](f0 x) = l21
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l22 != x
                                     (and (not (= x l22))
                                          ; | x - l22 | < delta
                                          (< (ite (>= (- x l22) 0.0) (- x l22) (- (- x l22))) delta))
                                     ;
                                     ; | (f0 x) - l21 | < epsilon
                                     (< (ite (>= (- (f0 x) l21) 0.0) (- (f0 x) l21) (- (- (f0 x) l21))) epsilon)
            ))
          ))
        )))

; Axiom 22
(assert ; lim[x -> l23](f0 x) = l22
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l23 != x
                                     (and (not (= x l23))
                                          ; | x - l23 | < delta
                                          (< (ite (>= (- x l23) 0.0) (- x l23) (- (- x l23))) delta))
                                     ;
                                     ; | (f0 x) - l22 | < epsilon
                                     (< (ite (>= (- (f0 x) l22) 0.0) (- (f0 x) l22) (- (- (f0 x) l22))) epsilon)
            ))
          ))
        )))

; Axiom 23
(assert ; lim[x -> l24](f1 x) = l23
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l24 != x
                                     (and (not (= x l24))
                                          ; | x - l24 | < delta
                                          (< (ite (>= (- x l24) 0.0) (- x l24) (- (- x l24))) delta))
                                     ;
                                     ; | (f1 x) - l23 | < epsilon
                                     (< (ite (>= (- (f1 x) l23) 0.0) (- (f1 x) l23) (- (- (f1 x) l23))) epsilon)
            ))
          ))
        )))

; Axiom 24
(assert ; lim[x -> l25](f0 x) = l24
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l25 != x
                                     (and (not (= x l25))
                                          ; | x - l25 | < delta
                                          (< (ite (>= (- x l25) 0.0) (- x l25) (- (- x l25))) delta))
                                     ;
                                     ; | (f0 x) - l24 | < epsilon
                                     (< (ite (>= (- (f0 x) l24) 0.0) (- (f0 x) l24) (- (- (f0 x) l24))) epsilon)
            ))
          ))
        )))

; Axiom 25
(assert ; lim[x -> l26](f0 x) = l25
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l26 != x
                                     (and (not (= x l26))
                                          ; | x - l26 | < delta
                                          (< (ite (>= (- x l26) 0.0) (- x l26) (- (- x l26))) delta))
                                     ;
                                     ; | (f0 x) - l25 | < epsilon
                                     (< (ite (>= (- (f0 x) l25) 0.0) (- (f0 x) l25) (- (- (f0 x) l25))) epsilon)
            ))
          ))
        )))

; Axiom 26
(assert ; lim[x -> l27](f1 x) = l26
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l27 != x
                                     (and (not (= x l27))
                                          ; | x - l27 | < delta
                                          (< (ite (>= (- x l27) 0.0) (- x l27) (- (- x l27))) delta))
                                     ;
                                     ; | (f1 x) - l26 | < epsilon
                                     (< (ite (>= (- (f1 x) l26) 0.0) (- (f1 x) l26) (- (- (f1 x) l26))) epsilon)
            ))
          ))
        )))

; Axiom 27
(assert ; lim[x -> l28](f1 x) = l27
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l28 != x
                                     (and (not (= x l28))
                                          ; | x - l28 | < delta
                                          (< (ite (>= (- x l28) 0.0) (- x l28) (- (- x l28))) delta))
                                     ;
                                     ; | (f1 x) - l27 | < epsilon
                                     (< (ite (>= (- (f1 x) l27) 0.0) (- (f1 x) l27) (- (- (f1 x) l27))) epsilon)
            ))
          ))
        )))

; Axiom 28
(assert ; lim[x -> l29](f0 x) = l28
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l29 != x
                                     (and (not (= x l29))
                                          ; | x - l29 | < delta
                                          (< (ite (>= (- x l29) 0.0) (- x l29) (- (- x l29))) delta))
                                     ;
                                     ; | (f0 x) - l28 | < epsilon
                                     (< (ite (>= (- (f0 x) l28) 0.0) (- (f0 x) l28) (- (- (f0 x) l28))) epsilon)
            ))
          ))
        )))

; Axiom 29
(assert ; lim[x -> l30](f1 x) = l29
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l30 != x
                                     (and (not (= x l30))
                                          ; | x - l30 | < delta
                                          (< (ite (>= (- x l30) 0.0) (- x l30) (- (- x l30))) delta))
                                     ;
                                     ; | (f1 x) - l29 | < epsilon
                                     (< (ite (>= (- (f1 x) l29) 0.0) (- (f1 x) l29) (- (- (f1 x) l29))) epsilon)
            ))
          ))
        )))

; Axiom 30
(assert ; lim[x -> l31](f0 x) = l30
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l31 != x
                                     (and (not (= x l31))
                                          ; | x - l31 | < delta
                                          (< (ite (>= (- x l31) 0.0) (- x l31) (- (- x l31))) delta))
                                     ;
                                     ; | (f0 x) - l30 | < epsilon
                                     (< (ite (>= (- (f0 x) l30) 0.0) (- (f0 x) l30) (- (- (f0 x) l30))) epsilon)
            ))
          ))
        )))

; Axiom 31
(assert ; lim[x -> a](f0 x) = l31
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
                                     ; | (f0 x) - l31 | < epsilon
                                     (< (ite (>= (- (f0 x) l31) 0.0) (- (f0 x) l31) (- (- (f0 x) l31))) epsilon)
            ))
          ))
        )))


; Conclusion
(assert (not ; lim[x -> a](f0 (f0 (f0 (f1 (f0 (f1 (f0 (f0 (f0 (f1 (f1 (f0 (f0 (f0 (f1 (f1 (f1 (f1 (f1 (f1 (f0 (f0 (f0 (f1 (f0 (f0 (f1 (f1 (f0 (f1 (f0 (f0 x)))))))))))))))))))))))))))))))) = l
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
                                          ; | (f0 (f0 (f0 (f1 (f0 (f1 (f0 (f0 (f0 (f1 (f1 (f0 (f0 (f0 (f1 (f1 (f1 (f1 (f1 (f1 (f0 (f0 (f0 (f1 (f0 (f0 (f1 (f1 (f0 (f1 (f0 (f0 x)))))))))))))))))))))))))))))))) - l | < epsilon
                                          (< (ite (>= (- (f0 (f0 (f0 (f1 (f0 (f1 (f0 (f0 (f0 (f1 (f1 (f0 (f0 (f0 (f1 (f1 (f1 (f1 (f1 (f1 (f0 (f0 (f0 (f1 (f0 (f0 (f1 (f1 (f0 (f1 (f0 (f0 x)))))))))))))))))))))))))))))))) l) 0.0) (- (f0 (f0 (f0 (f1 (f0 (f1 (f0 (f0 (f0 (f1 (f1 (f0 (f0 (f0 (f1 (f1 (f1 (f1 (f1 (f1 (f0 (f0 (f0 (f1 (f0 (f0 (f1 (f1 (f0 (f1 (f0 (f0 x)))))))))))))))))))))))))))))))) l) (- (- (f0 (f0 (f0 (f1 (f0 (f1 (f0 (f0 (f0 (f1 (f1 (f0 (f0 (f0 (f1 (f1 (f1 (f1 (f1 (f1 (f0 (f0 (f0 (f1 (f0 (f0 (f1 (f1 (f0 (f1 (f0 (f0 x)))))))))))))))))))))))))))))))) l))) epsilon)
                 ))
               ))
             ))))

(check-sat)

