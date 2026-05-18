(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; lim[x -> l1](f_i1(x)) ~ l
; lim[x -> l2](f_i2(x)) ~ l1
; lim[x -> l3](f_i3(x)) ~ l2
; ...
; lim[x -> l127](f_i127(x)) ~ l126
; lim[x -> a](f_i128(x)) ~ l127
; ============================
; lim[x -> a](f_i1(f_i2(f_i3(...f_i128(x)...)))) ~ l
; 
; 
; where
; - 8 functions with arity 1
; - 128 number of function applications

(declare-fun f0 (Real) Real)
(declare-fun f1 (Real) Real)
(declare-fun f2 (Real) Real)
(declare-fun f3 (Real) Real)
(declare-fun f4 (Real) Real)
(declare-fun f5 (Real) Real)
(declare-fun f6 (Real) Real)
(declare-fun f7 (Real) Real)
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
(declare-const l32 Real)
(declare-const l33 Real)
(declare-const l34 Real)
(declare-const l35 Real)
(declare-const l36 Real)
(declare-const l37 Real)
(declare-const l38 Real)
(declare-const l39 Real)
(declare-const l40 Real)
(declare-const l41 Real)
(declare-const l42 Real)
(declare-const l43 Real)
(declare-const l44 Real)
(declare-const l45 Real)
(declare-const l46 Real)
(declare-const l47 Real)
(declare-const l48 Real)
(declare-const l49 Real)
(declare-const l50 Real)
(declare-const l51 Real)
(declare-const l52 Real)
(declare-const l53 Real)
(declare-const l54 Real)
(declare-const l55 Real)
(declare-const l56 Real)
(declare-const l57 Real)
(declare-const l58 Real)
(declare-const l59 Real)
(declare-const l60 Real)
(declare-const l61 Real)
(declare-const l62 Real)
(declare-const l63 Real)
(declare-const l64 Real)
(declare-const l65 Real)
(declare-const l66 Real)
(declare-const l67 Real)
(declare-const l68 Real)
(declare-const l69 Real)
(declare-const l70 Real)
(declare-const l71 Real)
(declare-const l72 Real)
(declare-const l73 Real)
(declare-const l74 Real)
(declare-const l75 Real)
(declare-const l76 Real)
(declare-const l77 Real)
(declare-const l78 Real)
(declare-const l79 Real)
(declare-const l80 Real)
(declare-const l81 Real)
(declare-const l82 Real)
(declare-const l83 Real)
(declare-const l84 Real)
(declare-const l85 Real)
(declare-const l86 Real)
(declare-const l87 Real)
(declare-const l88 Real)
(declare-const l89 Real)
(declare-const l90 Real)
(declare-const l91 Real)
(declare-const l92 Real)
(declare-const l93 Real)
(declare-const l94 Real)
(declare-const l95 Real)
(declare-const l96 Real)
(declare-const l97 Real)
(declare-const l98 Real)
(declare-const l99 Real)
(declare-const l100 Real)
(declare-const l101 Real)
(declare-const l102 Real)
(declare-const l103 Real)
(declare-const l104 Real)
(declare-const l105 Real)
(declare-const l106 Real)
(declare-const l107 Real)
(declare-const l108 Real)
(declare-const l109 Real)
(declare-const l110 Real)
(declare-const l111 Real)
(declare-const l112 Real)
(declare-const l113 Real)
(declare-const l114 Real)
(declare-const l115 Real)
(declare-const l116 Real)
(declare-const l117 Real)
(declare-const l118 Real)
(declare-const l119 Real)
(declare-const l120 Real)
(declare-const l121 Real)
(declare-const l122 Real)
(declare-const l123 Real)
(declare-const l124 Real)
(declare-const l125 Real)
(declare-const l126 Real)
(declare-const l127 Real)
; Axiom 0
(assert ; lim[x -> l1](f7 x) = l
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
                                     ; | (f7 x) - l | < epsilon
                                     (< (ite (>= (- (f7 x) l) 0.0) (- (f7 x) l) (- (- (f7 x) l))) epsilon)
            ))
          ))
        )))

; Axiom 1
(assert ; lim[x -> l2](f5 x) = l1
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
                                     ; | (f5 x) - l1 | < epsilon
                                     (< (ite (>= (- (f5 x) l1) 0.0) (- (f5 x) l1) (- (- (f5 x) l1))) epsilon)
            ))
          ))
        )))

; Axiom 2
(assert ; lim[x -> l3](f3 x) = l2
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
                                     ; | (f3 x) - l2 | < epsilon
                                     (< (ite (>= (- (f3 x) l2) 0.0) (- (f3 x) l2) (- (- (f3 x) l2))) epsilon)
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
(assert ; lim[x -> l5](f2 x) = l4
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
                                     ; | (f2 x) - l4 | < epsilon
                                     (< (ite (>= (- (f2 x) l4) 0.0) (- (f2 x) l4) (- (- (f2 x) l4))) epsilon)
            ))
          ))
        )))

; Axiom 5
(assert ; lim[x -> l6](f7 x) = l5
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
                                     ; | (f7 x) - l5 | < epsilon
                                     (< (ite (>= (- (f7 x) l5) 0.0) (- (f7 x) l5) (- (- (f7 x) l5))) epsilon)
            ))
          ))
        )))

; Axiom 6
(assert ; lim[x -> l7](f3 x) = l6
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
                                     ; | (f3 x) - l6 | < epsilon
                                     (< (ite (>= (- (f3 x) l6) 0.0) (- (f3 x) l6) (- (- (f3 x) l6))) epsilon)
            ))
          ))
        )))

; Axiom 7
(assert ; lim[x -> l8](f5 x) = l7
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
                                     ; | (f5 x) - l7 | < epsilon
                                     (< (ite (>= (- (f5 x) l7) 0.0) (- (f5 x) l7) (- (- (f5 x) l7))) epsilon)
            ))
          ))
        )))

; Axiom 8
(assert ; lim[x -> l9](f4 x) = l8
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
                                     ; | (f4 x) - l8 | < epsilon
                                     (< (ite (>= (- (f4 x) l8) 0.0) (- (f4 x) l8) (- (- (f4 x) l8))) epsilon)
            ))
          ))
        )))

; Axiom 9
(assert ; lim[x -> l10](f3 x) = l9
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
                                     ; | (f3 x) - l9 | < epsilon
                                     (< (ite (>= (- (f3 x) l9) 0.0) (- (f3 x) l9) (- (- (f3 x) l9))) epsilon)
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
(assert ; lim[x -> l13](f7 x) = l12
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
                                     ; | (f7 x) - l12 | < epsilon
                                     (< (ite (>= (- (f7 x) l12) 0.0) (- (f7 x) l12) (- (- (f7 x) l12))) epsilon)
            ))
          ))
        )))

; Axiom 13
(assert ; lim[x -> l14](f3 x) = l13
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
                                     ; | (f3 x) - l13 | < epsilon
                                     (< (ite (>= (- (f3 x) l13) 0.0) (- (f3 x) l13) (- (- (f3 x) l13))) epsilon)
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
(assert ; lim[x -> l17](f7 x) = l16
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
                                     ; | (f7 x) - l16 | < epsilon
                                     (< (ite (>= (- (f7 x) l16) 0.0) (- (f7 x) l16) (- (- (f7 x) l16))) epsilon)
            ))
          ))
        )))

; Axiom 17
(assert ; lim[x -> l18](f3 x) = l17
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
                                     ; | (f3 x) - l17 | < epsilon
                                     (< (ite (>= (- (f3 x) l17) 0.0) (- (f3 x) l17) (- (- (f3 x) l17))) epsilon)
            ))
          ))
        )))

; Axiom 18
(assert ; lim[x -> l19](f7 x) = l18
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
                                     ; | (f7 x) - l18 | < epsilon
                                     (< (ite (>= (- (f7 x) l18) 0.0) (- (f7 x) l18) (- (- (f7 x) l18))) epsilon)
            ))
          ))
        )))

; Axiom 19
(assert ; lim[x -> l20](f0 x) = l19
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
                                     ; | (f0 x) - l19 | < epsilon
                                     (< (ite (>= (- (f0 x) l19) 0.0) (- (f0 x) l19) (- (- (f0 x) l19))) epsilon)
            ))
          ))
        )))

; Axiom 20
(assert ; lim[x -> l21](f4 x) = l20
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
                                     ; | (f4 x) - l20 | < epsilon
                                     (< (ite (>= (- (f4 x) l20) 0.0) (- (f4 x) l20) (- (- (f4 x) l20))) epsilon)
            ))
          ))
        )))

; Axiom 21
(assert ; lim[x -> l22](f2 x) = l21
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
                                     ; | (f2 x) - l21 | < epsilon
                                     (< (ite (>= (- (f2 x) l21) 0.0) (- (f2 x) l21) (- (- (f2 x) l21))) epsilon)
            ))
          ))
        )))

; Axiom 22
(assert ; lim[x -> l23](f7 x) = l22
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
                                     ; | (f7 x) - l22 | < epsilon
                                     (< (ite (>= (- (f7 x) l22) 0.0) (- (f7 x) l22) (- (- (f7 x) l22))) epsilon)
            ))
          ))
        )))

; Axiom 23
(assert ; lim[x -> l24](f4 x) = l23
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
                                     ; | (f4 x) - l23 | < epsilon
                                     (< (ite (>= (- (f4 x) l23) 0.0) (- (f4 x) l23) (- (- (f4 x) l23))) epsilon)
            ))
          ))
        )))

; Axiom 24
(assert ; lim[x -> l25](f5 x) = l24
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
                                     ; | (f5 x) - l24 | < epsilon
                                     (< (ite (>= (- (f5 x) l24) 0.0) (- (f5 x) l24) (- (- (f5 x) l24))) epsilon)
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
(assert ; lim[x -> l27](f2 x) = l26
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
                                     ; | (f2 x) - l26 | < epsilon
                                     (< (ite (>= (- (f2 x) l26) 0.0) (- (f2 x) l26) (- (- (f2 x) l26))) epsilon)
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
(assert ; lim[x -> l29](f4 x) = l28
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
                                     ; | (f4 x) - l28 | < epsilon
                                     (< (ite (>= (- (f4 x) l28) 0.0) (- (f4 x) l28) (- (- (f4 x) l28))) epsilon)
            ))
          ))
        )))

; Axiom 29
(assert ; lim[x -> l30](f2 x) = l29
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
                                     ; | (f2 x) - l29 | < epsilon
                                     (< (ite (>= (- (f2 x) l29) 0.0) (- (f2 x) l29) (- (- (f2 x) l29))) epsilon)
            ))
          ))
        )))

; Axiom 30
(assert ; lim[x -> l31](f3 x) = l30
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
                                     ; | (f3 x) - l30 | < epsilon
                                     (< (ite (>= (- (f3 x) l30) 0.0) (- (f3 x) l30) (- (- (f3 x) l30))) epsilon)
            ))
          ))
        )))

; Axiom 31
(assert ; lim[x -> l32](f1 x) = l31
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l32 != x
                                     (and (not (= x l32))
                                          ; | x - l32 | < delta
                                          (< (ite (>= (- x l32) 0.0) (- x l32) (- (- x l32))) delta))
                                     ;
                                     ; | (f1 x) - l31 | < epsilon
                                     (< (ite (>= (- (f1 x) l31) 0.0) (- (f1 x) l31) (- (- (f1 x) l31))) epsilon)
            ))
          ))
        )))

; Axiom 32
(assert ; lim[x -> l33](f7 x) = l32
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l33 != x
                                     (and (not (= x l33))
                                          ; | x - l33 | < delta
                                          (< (ite (>= (- x l33) 0.0) (- x l33) (- (- x l33))) delta))
                                     ;
                                     ; | (f7 x) - l32 | < epsilon
                                     (< (ite (>= (- (f7 x) l32) 0.0) (- (f7 x) l32) (- (- (f7 x) l32))) epsilon)
            ))
          ))
        )))

; Axiom 33
(assert ; lim[x -> l34](f2 x) = l33
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l34 != x
                                     (and (not (= x l34))
                                          ; | x - l34 | < delta
                                          (< (ite (>= (- x l34) 0.0) (- x l34) (- (- x l34))) delta))
                                     ;
                                     ; | (f2 x) - l33 | < epsilon
                                     (< (ite (>= (- (f2 x) l33) 0.0) (- (f2 x) l33) (- (- (f2 x) l33))) epsilon)
            ))
          ))
        )))

; Axiom 34
(assert ; lim[x -> l35](f0 x) = l34
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l35 != x
                                     (and (not (= x l35))
                                          ; | x - l35 | < delta
                                          (< (ite (>= (- x l35) 0.0) (- x l35) (- (- x l35))) delta))
                                     ;
                                     ; | (f0 x) - l34 | < epsilon
                                     (< (ite (>= (- (f0 x) l34) 0.0) (- (f0 x) l34) (- (- (f0 x) l34))) epsilon)
            ))
          ))
        )))

; Axiom 35
(assert ; lim[x -> l36](f5 x) = l35
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l36 != x
                                     (and (not (= x l36))
                                          ; | x - l36 | < delta
                                          (< (ite (>= (- x l36) 0.0) (- x l36) (- (- x l36))) delta))
                                     ;
                                     ; | (f5 x) - l35 | < epsilon
                                     (< (ite (>= (- (f5 x) l35) 0.0) (- (f5 x) l35) (- (- (f5 x) l35))) epsilon)
            ))
          ))
        )))

; Axiom 36
(assert ; lim[x -> l37](f1 x) = l36
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l37 != x
                                     (and (not (= x l37))
                                          ; | x - l37 | < delta
                                          (< (ite (>= (- x l37) 0.0) (- x l37) (- (- x l37))) delta))
                                     ;
                                     ; | (f1 x) - l36 | < epsilon
                                     (< (ite (>= (- (f1 x) l36) 0.0) (- (f1 x) l36) (- (- (f1 x) l36))) epsilon)
            ))
          ))
        )))

; Axiom 37
(assert ; lim[x -> l38](f3 x) = l37
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l38 != x
                                     (and (not (= x l38))
                                          ; | x - l38 | < delta
                                          (< (ite (>= (- x l38) 0.0) (- x l38) (- (- x l38))) delta))
                                     ;
                                     ; | (f3 x) - l37 | < epsilon
                                     (< (ite (>= (- (f3 x) l37) 0.0) (- (f3 x) l37) (- (- (f3 x) l37))) epsilon)
            ))
          ))
        )))

; Axiom 38
(assert ; lim[x -> l39](f1 x) = l38
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l39 != x
                                     (and (not (= x l39))
                                          ; | x - l39 | < delta
                                          (< (ite (>= (- x l39) 0.0) (- x l39) (- (- x l39))) delta))
                                     ;
                                     ; | (f1 x) - l38 | < epsilon
                                     (< (ite (>= (- (f1 x) l38) 0.0) (- (f1 x) l38) (- (- (f1 x) l38))) epsilon)
            ))
          ))
        )))

; Axiom 39
(assert ; lim[x -> l40](f6 x) = l39
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l40 != x
                                     (and (not (= x l40))
                                          ; | x - l40 | < delta
                                          (< (ite (>= (- x l40) 0.0) (- x l40) (- (- x l40))) delta))
                                     ;
                                     ; | (f6 x) - l39 | < epsilon
                                     (< (ite (>= (- (f6 x) l39) 0.0) (- (f6 x) l39) (- (- (f6 x) l39))) epsilon)
            ))
          ))
        )))

; Axiom 40
(assert ; lim[x -> l41](f2 x) = l40
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l41 != x
                                     (and (not (= x l41))
                                          ; | x - l41 | < delta
                                          (< (ite (>= (- x l41) 0.0) (- x l41) (- (- x l41))) delta))
                                     ;
                                     ; | (f2 x) - l40 | < epsilon
                                     (< (ite (>= (- (f2 x) l40) 0.0) (- (f2 x) l40) (- (- (f2 x) l40))) epsilon)
            ))
          ))
        )))

; Axiom 41
(assert ; lim[x -> l42](f5 x) = l41
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l42 != x
                                     (and (not (= x l42))
                                          ; | x - l42 | < delta
                                          (< (ite (>= (- x l42) 0.0) (- x l42) (- (- x l42))) delta))
                                     ;
                                     ; | (f5 x) - l41 | < epsilon
                                     (< (ite (>= (- (f5 x) l41) 0.0) (- (f5 x) l41) (- (- (f5 x) l41))) epsilon)
            ))
          ))
        )))

; Axiom 42
(assert ; lim[x -> l43](f1 x) = l42
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l43 != x
                                     (and (not (= x l43))
                                          ; | x - l43 | < delta
                                          (< (ite (>= (- x l43) 0.0) (- x l43) (- (- x l43))) delta))
                                     ;
                                     ; | (f1 x) - l42 | < epsilon
                                     (< (ite (>= (- (f1 x) l42) 0.0) (- (f1 x) l42) (- (- (f1 x) l42))) epsilon)
            ))
          ))
        )))

; Axiom 43
(assert ; lim[x -> l44](f6 x) = l43
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l44 != x
                                     (and (not (= x l44))
                                          ; | x - l44 | < delta
                                          (< (ite (>= (- x l44) 0.0) (- x l44) (- (- x l44))) delta))
                                     ;
                                     ; | (f6 x) - l43 | < epsilon
                                     (< (ite (>= (- (f6 x) l43) 0.0) (- (f6 x) l43) (- (- (f6 x) l43))) epsilon)
            ))
          ))
        )))

; Axiom 44
(assert ; lim[x -> l45](f0 x) = l44
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l45 != x
                                     (and (not (= x l45))
                                          ; | x - l45 | < delta
                                          (< (ite (>= (- x l45) 0.0) (- x l45) (- (- x l45))) delta))
                                     ;
                                     ; | (f0 x) - l44 | < epsilon
                                     (< (ite (>= (- (f0 x) l44) 0.0) (- (f0 x) l44) (- (- (f0 x) l44))) epsilon)
            ))
          ))
        )))

; Axiom 45
(assert ; lim[x -> l46](f6 x) = l45
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l46 != x
                                     (and (not (= x l46))
                                          ; | x - l46 | < delta
                                          (< (ite (>= (- x l46) 0.0) (- x l46) (- (- x l46))) delta))
                                     ;
                                     ; | (f6 x) - l45 | < epsilon
                                     (< (ite (>= (- (f6 x) l45) 0.0) (- (f6 x) l45) (- (- (f6 x) l45))) epsilon)
            ))
          ))
        )))

; Axiom 46
(assert ; lim[x -> l47](f7 x) = l46
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l47 != x
                                     (and (not (= x l47))
                                          ; | x - l47 | < delta
                                          (< (ite (>= (- x l47) 0.0) (- x l47) (- (- x l47))) delta))
                                     ;
                                     ; | (f7 x) - l46 | < epsilon
                                     (< (ite (>= (- (f7 x) l46) 0.0) (- (f7 x) l46) (- (- (f7 x) l46))) epsilon)
            ))
          ))
        )))

; Axiom 47
(assert ; lim[x -> l48](f4 x) = l47
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l48 != x
                                     (and (not (= x l48))
                                          ; | x - l48 | < delta
                                          (< (ite (>= (- x l48) 0.0) (- x l48) (- (- x l48))) delta))
                                     ;
                                     ; | (f4 x) - l47 | < epsilon
                                     (< (ite (>= (- (f4 x) l47) 0.0) (- (f4 x) l47) (- (- (f4 x) l47))) epsilon)
            ))
          ))
        )))

; Axiom 48
(assert ; lim[x -> l49](f0 x) = l48
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l49 != x
                                     (and (not (= x l49))
                                          ; | x - l49 | < delta
                                          (< (ite (>= (- x l49) 0.0) (- x l49) (- (- x l49))) delta))
                                     ;
                                     ; | (f0 x) - l48 | < epsilon
                                     (< (ite (>= (- (f0 x) l48) 0.0) (- (f0 x) l48) (- (- (f0 x) l48))) epsilon)
            ))
          ))
        )))

; Axiom 49
(assert ; lim[x -> l50](f5 x) = l49
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l50 != x
                                     (and (not (= x l50))
                                          ; | x - l50 | < delta
                                          (< (ite (>= (- x l50) 0.0) (- x l50) (- (- x l50))) delta))
                                     ;
                                     ; | (f5 x) - l49 | < epsilon
                                     (< (ite (>= (- (f5 x) l49) 0.0) (- (f5 x) l49) (- (- (f5 x) l49))) epsilon)
            ))
          ))
        )))

; Axiom 50
(assert ; lim[x -> l51](f0 x) = l50
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l51 != x
                                     (and (not (= x l51))
                                          ; | x - l51 | < delta
                                          (< (ite (>= (- x l51) 0.0) (- x l51) (- (- x l51))) delta))
                                     ;
                                     ; | (f0 x) - l50 | < epsilon
                                     (< (ite (>= (- (f0 x) l50) 0.0) (- (f0 x) l50) (- (- (f0 x) l50))) epsilon)
            ))
          ))
        )))

; Axiom 51
(assert ; lim[x -> l52](f5 x) = l51
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l52 != x
                                     (and (not (= x l52))
                                          ; | x - l52 | < delta
                                          (< (ite (>= (- x l52) 0.0) (- x l52) (- (- x l52))) delta))
                                     ;
                                     ; | (f5 x) - l51 | < epsilon
                                     (< (ite (>= (- (f5 x) l51) 0.0) (- (f5 x) l51) (- (- (f5 x) l51))) epsilon)
            ))
          ))
        )))

; Axiom 52
(assert ; lim[x -> l53](f2 x) = l52
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l53 != x
                                     (and (not (= x l53))
                                          ; | x - l53 | < delta
                                          (< (ite (>= (- x l53) 0.0) (- x l53) (- (- x l53))) delta))
                                     ;
                                     ; | (f2 x) - l52 | < epsilon
                                     (< (ite (>= (- (f2 x) l52) 0.0) (- (f2 x) l52) (- (- (f2 x) l52))) epsilon)
            ))
          ))
        )))

; Axiom 53
(assert ; lim[x -> l54](f5 x) = l53
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l54 != x
                                     (and (not (= x l54))
                                          ; | x - l54 | < delta
                                          (< (ite (>= (- x l54) 0.0) (- x l54) (- (- x l54))) delta))
                                     ;
                                     ; | (f5 x) - l53 | < epsilon
                                     (< (ite (>= (- (f5 x) l53) 0.0) (- (f5 x) l53) (- (- (f5 x) l53))) epsilon)
            ))
          ))
        )))

; Axiom 54
(assert ; lim[x -> l55](f7 x) = l54
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l55 != x
                                     (and (not (= x l55))
                                          ; | x - l55 | < delta
                                          (< (ite (>= (- x l55) 0.0) (- x l55) (- (- x l55))) delta))
                                     ;
                                     ; | (f7 x) - l54 | < epsilon
                                     (< (ite (>= (- (f7 x) l54) 0.0) (- (f7 x) l54) (- (- (f7 x) l54))) epsilon)
            ))
          ))
        )))

; Axiom 55
(assert ; lim[x -> l56](f0 x) = l55
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l56 != x
                                     (and (not (= x l56))
                                          ; | x - l56 | < delta
                                          (< (ite (>= (- x l56) 0.0) (- x l56) (- (- x l56))) delta))
                                     ;
                                     ; | (f0 x) - l55 | < epsilon
                                     (< (ite (>= (- (f0 x) l55) 0.0) (- (f0 x) l55) (- (- (f0 x) l55))) epsilon)
            ))
          ))
        )))

; Axiom 56
(assert ; lim[x -> l57](f5 x) = l56
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l57 != x
                                     (and (not (= x l57))
                                          ; | x - l57 | < delta
                                          (< (ite (>= (- x l57) 0.0) (- x l57) (- (- x l57))) delta))
                                     ;
                                     ; | (f5 x) - l56 | < epsilon
                                     (< (ite (>= (- (f5 x) l56) 0.0) (- (f5 x) l56) (- (- (f5 x) l56))) epsilon)
            ))
          ))
        )))

; Axiom 57
(assert ; lim[x -> l58](f7 x) = l57
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l58 != x
                                     (and (not (= x l58))
                                          ; | x - l58 | < delta
                                          (< (ite (>= (- x l58) 0.0) (- x l58) (- (- x l58))) delta))
                                     ;
                                     ; | (f7 x) - l57 | < epsilon
                                     (< (ite (>= (- (f7 x) l57) 0.0) (- (f7 x) l57) (- (- (f7 x) l57))) epsilon)
            ))
          ))
        )))

; Axiom 58
(assert ; lim[x -> l59](f5 x) = l58
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l59 != x
                                     (and (not (= x l59))
                                          ; | x - l59 | < delta
                                          (< (ite (>= (- x l59) 0.0) (- x l59) (- (- x l59))) delta))
                                     ;
                                     ; | (f5 x) - l58 | < epsilon
                                     (< (ite (>= (- (f5 x) l58) 0.0) (- (f5 x) l58) (- (- (f5 x) l58))) epsilon)
            ))
          ))
        )))

; Axiom 59
(assert ; lim[x -> l60](f0 x) = l59
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l60 != x
                                     (and (not (= x l60))
                                          ; | x - l60 | < delta
                                          (< (ite (>= (- x l60) 0.0) (- x l60) (- (- x l60))) delta))
                                     ;
                                     ; | (f0 x) - l59 | < epsilon
                                     (< (ite (>= (- (f0 x) l59) 0.0) (- (f0 x) l59) (- (- (f0 x) l59))) epsilon)
            ))
          ))
        )))

; Axiom 60
(assert ; lim[x -> l61](f1 x) = l60
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l61 != x
                                     (and (not (= x l61))
                                          ; | x - l61 | < delta
                                          (< (ite (>= (- x l61) 0.0) (- x l61) (- (- x l61))) delta))
                                     ;
                                     ; | (f1 x) - l60 | < epsilon
                                     (< (ite (>= (- (f1 x) l60) 0.0) (- (f1 x) l60) (- (- (f1 x) l60))) epsilon)
            ))
          ))
        )))

; Axiom 61
(assert ; lim[x -> l62](f4 x) = l61
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l62 != x
                                     (and (not (= x l62))
                                          ; | x - l62 | < delta
                                          (< (ite (>= (- x l62) 0.0) (- x l62) (- (- x l62))) delta))
                                     ;
                                     ; | (f4 x) - l61 | < epsilon
                                     (< (ite (>= (- (f4 x) l61) 0.0) (- (f4 x) l61) (- (- (f4 x) l61))) epsilon)
            ))
          ))
        )))

; Axiom 62
(assert ; lim[x -> l63](f6 x) = l62
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l63 != x
                                     (and (not (= x l63))
                                          ; | x - l63 | < delta
                                          (< (ite (>= (- x l63) 0.0) (- x l63) (- (- x l63))) delta))
                                     ;
                                     ; | (f6 x) - l62 | < epsilon
                                     (< (ite (>= (- (f6 x) l62) 0.0) (- (f6 x) l62) (- (- (f6 x) l62))) epsilon)
            ))
          ))
        )))

; Axiom 63
(assert ; lim[x -> l64](f2 x) = l63
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l64 != x
                                     (and (not (= x l64))
                                          ; | x - l64 | < delta
                                          (< (ite (>= (- x l64) 0.0) (- x l64) (- (- x l64))) delta))
                                     ;
                                     ; | (f2 x) - l63 | < epsilon
                                     (< (ite (>= (- (f2 x) l63) 0.0) (- (f2 x) l63) (- (- (f2 x) l63))) epsilon)
            ))
          ))
        )))

; Axiom 64
(assert ; lim[x -> l65](f0 x) = l64
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l65 != x
                                     (and (not (= x l65))
                                          ; | x - l65 | < delta
                                          (< (ite (>= (- x l65) 0.0) (- x l65) (- (- x l65))) delta))
                                     ;
                                     ; | (f0 x) - l64 | < epsilon
                                     (< (ite (>= (- (f0 x) l64) 0.0) (- (f0 x) l64) (- (- (f0 x) l64))) epsilon)
            ))
          ))
        )))

; Axiom 65
(assert ; lim[x -> l66](f2 x) = l65
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l66 != x
                                     (and (not (= x l66))
                                          ; | x - l66 | < delta
                                          (< (ite (>= (- x l66) 0.0) (- x l66) (- (- x l66))) delta))
                                     ;
                                     ; | (f2 x) - l65 | < epsilon
                                     (< (ite (>= (- (f2 x) l65) 0.0) (- (f2 x) l65) (- (- (f2 x) l65))) epsilon)
            ))
          ))
        )))

; Axiom 66
(assert ; lim[x -> l67](f3 x) = l66
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l67 != x
                                     (and (not (= x l67))
                                          ; | x - l67 | < delta
                                          (< (ite (>= (- x l67) 0.0) (- x l67) (- (- x l67))) delta))
                                     ;
                                     ; | (f3 x) - l66 | < epsilon
                                     (< (ite (>= (- (f3 x) l66) 0.0) (- (f3 x) l66) (- (- (f3 x) l66))) epsilon)
            ))
          ))
        )))

; Axiom 67
(assert ; lim[x -> l68](f2 x) = l67
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l68 != x
                                     (and (not (= x l68))
                                          ; | x - l68 | < delta
                                          (< (ite (>= (- x l68) 0.0) (- x l68) (- (- x l68))) delta))
                                     ;
                                     ; | (f2 x) - l67 | < epsilon
                                     (< (ite (>= (- (f2 x) l67) 0.0) (- (f2 x) l67) (- (- (f2 x) l67))) epsilon)
            ))
          ))
        )))

; Axiom 68
(assert ; lim[x -> l69](f5 x) = l68
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l69 != x
                                     (and (not (= x l69))
                                          ; | x - l69 | < delta
                                          (< (ite (>= (- x l69) 0.0) (- x l69) (- (- x l69))) delta))
                                     ;
                                     ; | (f5 x) - l68 | < epsilon
                                     (< (ite (>= (- (f5 x) l68) 0.0) (- (f5 x) l68) (- (- (f5 x) l68))) epsilon)
            ))
          ))
        )))

; Axiom 69
(assert ; lim[x -> l70](f1 x) = l69
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l70 != x
                                     (and (not (= x l70))
                                          ; | x - l70 | < delta
                                          (< (ite (>= (- x l70) 0.0) (- x l70) (- (- x l70))) delta))
                                     ;
                                     ; | (f1 x) - l69 | < epsilon
                                     (< (ite (>= (- (f1 x) l69) 0.0) (- (f1 x) l69) (- (- (f1 x) l69))) epsilon)
            ))
          ))
        )))

; Axiom 70
(assert ; lim[x -> l71](f6 x) = l70
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l71 != x
                                     (and (not (= x l71))
                                          ; | x - l71 | < delta
                                          (< (ite (>= (- x l71) 0.0) (- x l71) (- (- x l71))) delta))
                                     ;
                                     ; | (f6 x) - l70 | < epsilon
                                     (< (ite (>= (- (f6 x) l70) 0.0) (- (f6 x) l70) (- (- (f6 x) l70))) epsilon)
            ))
          ))
        )))

; Axiom 71
(assert ; lim[x -> l72](f6 x) = l71
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l72 != x
                                     (and (not (= x l72))
                                          ; | x - l72 | < delta
                                          (< (ite (>= (- x l72) 0.0) (- x l72) (- (- x l72))) delta))
                                     ;
                                     ; | (f6 x) - l71 | < epsilon
                                     (< (ite (>= (- (f6 x) l71) 0.0) (- (f6 x) l71) (- (- (f6 x) l71))) epsilon)
            ))
          ))
        )))

; Axiom 72
(assert ; lim[x -> l73](f7 x) = l72
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l73 != x
                                     (and (not (= x l73))
                                          ; | x - l73 | < delta
                                          (< (ite (>= (- x l73) 0.0) (- x l73) (- (- x l73))) delta))
                                     ;
                                     ; | (f7 x) - l72 | < epsilon
                                     (< (ite (>= (- (f7 x) l72) 0.0) (- (f7 x) l72) (- (- (f7 x) l72))) epsilon)
            ))
          ))
        )))

; Axiom 73
(assert ; lim[x -> l74](f2 x) = l73
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l74 != x
                                     (and (not (= x l74))
                                          ; | x - l74 | < delta
                                          (< (ite (>= (- x l74) 0.0) (- x l74) (- (- x l74))) delta))
                                     ;
                                     ; | (f2 x) - l73 | < epsilon
                                     (< (ite (>= (- (f2 x) l73) 0.0) (- (f2 x) l73) (- (- (f2 x) l73))) epsilon)
            ))
          ))
        )))

; Axiom 74
(assert ; lim[x -> l75](f2 x) = l74
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l75 != x
                                     (and (not (= x l75))
                                          ; | x - l75 | < delta
                                          (< (ite (>= (- x l75) 0.0) (- x l75) (- (- x l75))) delta))
                                     ;
                                     ; | (f2 x) - l74 | < epsilon
                                     (< (ite (>= (- (f2 x) l74) 0.0) (- (f2 x) l74) (- (- (f2 x) l74))) epsilon)
            ))
          ))
        )))

; Axiom 75
(assert ; lim[x -> l76](f3 x) = l75
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l76 != x
                                     (and (not (= x l76))
                                          ; | x - l76 | < delta
                                          (< (ite (>= (- x l76) 0.0) (- x l76) (- (- x l76))) delta))
                                     ;
                                     ; | (f3 x) - l75 | < epsilon
                                     (< (ite (>= (- (f3 x) l75) 0.0) (- (f3 x) l75) (- (- (f3 x) l75))) epsilon)
            ))
          ))
        )))

; Axiom 76
(assert ; lim[x -> l77](f0 x) = l76
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l77 != x
                                     (and (not (= x l77))
                                          ; | x - l77 | < delta
                                          (< (ite (>= (- x l77) 0.0) (- x l77) (- (- x l77))) delta))
                                     ;
                                     ; | (f0 x) - l76 | < epsilon
                                     (< (ite (>= (- (f0 x) l76) 0.0) (- (f0 x) l76) (- (- (f0 x) l76))) epsilon)
            ))
          ))
        )))

; Axiom 77
(assert ; lim[x -> l78](f1 x) = l77
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l78 != x
                                     (and (not (= x l78))
                                          ; | x - l78 | < delta
                                          (< (ite (>= (- x l78) 0.0) (- x l78) (- (- x l78))) delta))
                                     ;
                                     ; | (f1 x) - l77 | < epsilon
                                     (< (ite (>= (- (f1 x) l77) 0.0) (- (f1 x) l77) (- (- (f1 x) l77))) epsilon)
            ))
          ))
        )))

; Axiom 78
(assert ; lim[x -> l79](f5 x) = l78
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l79 != x
                                     (and (not (= x l79))
                                          ; | x - l79 | < delta
                                          (< (ite (>= (- x l79) 0.0) (- x l79) (- (- x l79))) delta))
                                     ;
                                     ; | (f5 x) - l78 | < epsilon
                                     (< (ite (>= (- (f5 x) l78) 0.0) (- (f5 x) l78) (- (- (f5 x) l78))) epsilon)
            ))
          ))
        )))

; Axiom 79
(assert ; lim[x -> l80](f4 x) = l79
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l80 != x
                                     (and (not (= x l80))
                                          ; | x - l80 | < delta
                                          (< (ite (>= (- x l80) 0.0) (- x l80) (- (- x l80))) delta))
                                     ;
                                     ; | (f4 x) - l79 | < epsilon
                                     (< (ite (>= (- (f4 x) l79) 0.0) (- (f4 x) l79) (- (- (f4 x) l79))) epsilon)
            ))
          ))
        )))

; Axiom 80
(assert ; lim[x -> l81](f6 x) = l80
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l81 != x
                                     (and (not (= x l81))
                                          ; | x - l81 | < delta
                                          (< (ite (>= (- x l81) 0.0) (- x l81) (- (- x l81))) delta))
                                     ;
                                     ; | (f6 x) - l80 | < epsilon
                                     (< (ite (>= (- (f6 x) l80) 0.0) (- (f6 x) l80) (- (- (f6 x) l80))) epsilon)
            ))
          ))
        )))

; Axiom 81
(assert ; lim[x -> l82](f2 x) = l81
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l82 != x
                                     (and (not (= x l82))
                                          ; | x - l82 | < delta
                                          (< (ite (>= (- x l82) 0.0) (- x l82) (- (- x l82))) delta))
                                     ;
                                     ; | (f2 x) - l81 | < epsilon
                                     (< (ite (>= (- (f2 x) l81) 0.0) (- (f2 x) l81) (- (- (f2 x) l81))) epsilon)
            ))
          ))
        )))

; Axiom 82
(assert ; lim[x -> l83](f3 x) = l82
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l83 != x
                                     (and (not (= x l83))
                                          ; | x - l83 | < delta
                                          (< (ite (>= (- x l83) 0.0) (- x l83) (- (- x l83))) delta))
                                     ;
                                     ; | (f3 x) - l82 | < epsilon
                                     (< (ite (>= (- (f3 x) l82) 0.0) (- (f3 x) l82) (- (- (f3 x) l82))) epsilon)
            ))
          ))
        )))

; Axiom 83
(assert ; lim[x -> l84](f5 x) = l83
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l84 != x
                                     (and (not (= x l84))
                                          ; | x - l84 | < delta
                                          (< (ite (>= (- x l84) 0.0) (- x l84) (- (- x l84))) delta))
                                     ;
                                     ; | (f5 x) - l83 | < epsilon
                                     (< (ite (>= (- (f5 x) l83) 0.0) (- (f5 x) l83) (- (- (f5 x) l83))) epsilon)
            ))
          ))
        )))

; Axiom 84
(assert ; lim[x -> l85](f5 x) = l84
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l85 != x
                                     (and (not (= x l85))
                                          ; | x - l85 | < delta
                                          (< (ite (>= (- x l85) 0.0) (- x l85) (- (- x l85))) delta))
                                     ;
                                     ; | (f5 x) - l84 | < epsilon
                                     (< (ite (>= (- (f5 x) l84) 0.0) (- (f5 x) l84) (- (- (f5 x) l84))) epsilon)
            ))
          ))
        )))

; Axiom 85
(assert ; lim[x -> l86](f4 x) = l85
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l86 != x
                                     (and (not (= x l86))
                                          ; | x - l86 | < delta
                                          (< (ite (>= (- x l86) 0.0) (- x l86) (- (- x l86))) delta))
                                     ;
                                     ; | (f4 x) - l85 | < epsilon
                                     (< (ite (>= (- (f4 x) l85) 0.0) (- (f4 x) l85) (- (- (f4 x) l85))) epsilon)
            ))
          ))
        )))

; Axiom 86
(assert ; lim[x -> l87](f6 x) = l86
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l87 != x
                                     (and (not (= x l87))
                                          ; | x - l87 | < delta
                                          (< (ite (>= (- x l87) 0.0) (- x l87) (- (- x l87))) delta))
                                     ;
                                     ; | (f6 x) - l86 | < epsilon
                                     (< (ite (>= (- (f6 x) l86) 0.0) (- (f6 x) l86) (- (- (f6 x) l86))) epsilon)
            ))
          ))
        )))

; Axiom 87
(assert ; lim[x -> l88](f7 x) = l87
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l88 != x
                                     (and (not (= x l88))
                                          ; | x - l88 | < delta
                                          (< (ite (>= (- x l88) 0.0) (- x l88) (- (- x l88))) delta))
                                     ;
                                     ; | (f7 x) - l87 | < epsilon
                                     (< (ite (>= (- (f7 x) l87) 0.0) (- (f7 x) l87) (- (- (f7 x) l87))) epsilon)
            ))
          ))
        )))

; Axiom 88
(assert ; lim[x -> l89](f0 x) = l88
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l89 != x
                                     (and (not (= x l89))
                                          ; | x - l89 | < delta
                                          (< (ite (>= (- x l89) 0.0) (- x l89) (- (- x l89))) delta))
                                     ;
                                     ; | (f0 x) - l88 | < epsilon
                                     (< (ite (>= (- (f0 x) l88) 0.0) (- (f0 x) l88) (- (- (f0 x) l88))) epsilon)
            ))
          ))
        )))

; Axiom 89
(assert ; lim[x -> l90](f3 x) = l89
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l90 != x
                                     (and (not (= x l90))
                                          ; | x - l90 | < delta
                                          (< (ite (>= (- x l90) 0.0) (- x l90) (- (- x l90))) delta))
                                     ;
                                     ; | (f3 x) - l89 | < epsilon
                                     (< (ite (>= (- (f3 x) l89) 0.0) (- (f3 x) l89) (- (- (f3 x) l89))) epsilon)
            ))
          ))
        )))

; Axiom 90
(assert ; lim[x -> l91](f6 x) = l90
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l91 != x
                                     (and (not (= x l91))
                                          ; | x - l91 | < delta
                                          (< (ite (>= (- x l91) 0.0) (- x l91) (- (- x l91))) delta))
                                     ;
                                     ; | (f6 x) - l90 | < epsilon
                                     (< (ite (>= (- (f6 x) l90) 0.0) (- (f6 x) l90) (- (- (f6 x) l90))) epsilon)
            ))
          ))
        )))

; Axiom 91
(assert ; lim[x -> l92](f5 x) = l91
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l92 != x
                                     (and (not (= x l92))
                                          ; | x - l92 | < delta
                                          (< (ite (>= (- x l92) 0.0) (- x l92) (- (- x l92))) delta))
                                     ;
                                     ; | (f5 x) - l91 | < epsilon
                                     (< (ite (>= (- (f5 x) l91) 0.0) (- (f5 x) l91) (- (- (f5 x) l91))) epsilon)
            ))
          ))
        )))

; Axiom 92
(assert ; lim[x -> l93](f0 x) = l92
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l93 != x
                                     (and (not (= x l93))
                                          ; | x - l93 | < delta
                                          (< (ite (>= (- x l93) 0.0) (- x l93) (- (- x l93))) delta))
                                     ;
                                     ; | (f0 x) - l92 | < epsilon
                                     (< (ite (>= (- (f0 x) l92) 0.0) (- (f0 x) l92) (- (- (f0 x) l92))) epsilon)
            ))
          ))
        )))

; Axiom 93
(assert ; lim[x -> l94](f0 x) = l93
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l94 != x
                                     (and (not (= x l94))
                                          ; | x - l94 | < delta
                                          (< (ite (>= (- x l94) 0.0) (- x l94) (- (- x l94))) delta))
                                     ;
                                     ; | (f0 x) - l93 | < epsilon
                                     (< (ite (>= (- (f0 x) l93) 0.0) (- (f0 x) l93) (- (- (f0 x) l93))) epsilon)
            ))
          ))
        )))

; Axiom 94
(assert ; lim[x -> l95](f3 x) = l94
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l95 != x
                                     (and (not (= x l95))
                                          ; | x - l95 | < delta
                                          (< (ite (>= (- x l95) 0.0) (- x l95) (- (- x l95))) delta))
                                     ;
                                     ; | (f3 x) - l94 | < epsilon
                                     (< (ite (>= (- (f3 x) l94) 0.0) (- (f3 x) l94) (- (- (f3 x) l94))) epsilon)
            ))
          ))
        )))

; Axiom 95
(assert ; lim[x -> l96](f6 x) = l95
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l96 != x
                                     (and (not (= x l96))
                                          ; | x - l96 | < delta
                                          (< (ite (>= (- x l96) 0.0) (- x l96) (- (- x l96))) delta))
                                     ;
                                     ; | (f6 x) - l95 | < epsilon
                                     (< (ite (>= (- (f6 x) l95) 0.0) (- (f6 x) l95) (- (- (f6 x) l95))) epsilon)
            ))
          ))
        )))

; Axiom 96
(assert ; lim[x -> l97](f1 x) = l96
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l97 != x
                                     (and (not (= x l97))
                                          ; | x - l97 | < delta
                                          (< (ite (>= (- x l97) 0.0) (- x l97) (- (- x l97))) delta))
                                     ;
                                     ; | (f1 x) - l96 | < epsilon
                                     (< (ite (>= (- (f1 x) l96) 0.0) (- (f1 x) l96) (- (- (f1 x) l96))) epsilon)
            ))
          ))
        )))

; Axiom 97
(assert ; lim[x -> l98](f1 x) = l97
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l98 != x
                                     (and (not (= x l98))
                                          ; | x - l98 | < delta
                                          (< (ite (>= (- x l98) 0.0) (- x l98) (- (- x l98))) delta))
                                     ;
                                     ; | (f1 x) - l97 | < epsilon
                                     (< (ite (>= (- (f1 x) l97) 0.0) (- (f1 x) l97) (- (- (f1 x) l97))) epsilon)
            ))
          ))
        )))

; Axiom 98
(assert ; lim[x -> l99](f7 x) = l98
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l99 != x
                                     (and (not (= x l99))
                                          ; | x - l99 | < delta
                                          (< (ite (>= (- x l99) 0.0) (- x l99) (- (- x l99))) delta))
                                     ;
                                     ; | (f7 x) - l98 | < epsilon
                                     (< (ite (>= (- (f7 x) l98) 0.0) (- (f7 x) l98) (- (- (f7 x) l98))) epsilon)
            ))
          ))
        )))

; Axiom 99
(assert ; lim[x -> l100](f7 x) = l99
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l100 != x
                                     (and (not (= x l100))
                                          ; | x - l100 | < delta
                                          (< (ite (>= (- x l100) 0.0) (- x l100) (- (- x l100))) delta))
                                     ;
                                     ; | (f7 x) - l99 | < epsilon
                                     (< (ite (>= (- (f7 x) l99) 0.0) (- (f7 x) l99) (- (- (f7 x) l99))) epsilon)
            ))
          ))
        )))

; Axiom 100
(assert ; lim[x -> l101](f7 x) = l100
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l101 != x
                                     (and (not (= x l101))
                                          ; | x - l101 | < delta
                                          (< (ite (>= (- x l101) 0.0) (- x l101) (- (- x l101))) delta))
                                     ;
                                     ; | (f7 x) - l100 | < epsilon
                                     (< (ite (>= (- (f7 x) l100) 0.0) (- (f7 x) l100) (- (- (f7 x) l100))) epsilon)
            ))
          ))
        )))

; Axiom 101
(assert ; lim[x -> l102](f5 x) = l101
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l102 != x
                                     (and (not (= x l102))
                                          ; | x - l102 | < delta
                                          (< (ite (>= (- x l102) 0.0) (- x l102) (- (- x l102))) delta))
                                     ;
                                     ; | (f5 x) - l101 | < epsilon
                                     (< (ite (>= (- (f5 x) l101) 0.0) (- (f5 x) l101) (- (- (f5 x) l101))) epsilon)
            ))
          ))
        )))

; Axiom 102
(assert ; lim[x -> l103](f3 x) = l102
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l103 != x
                                     (and (not (= x l103))
                                          ; | x - l103 | < delta
                                          (< (ite (>= (- x l103) 0.0) (- x l103) (- (- x l103))) delta))
                                     ;
                                     ; | (f3 x) - l102 | < epsilon
                                     (< (ite (>= (- (f3 x) l102) 0.0) (- (f3 x) l102) (- (- (f3 x) l102))) epsilon)
            ))
          ))
        )))

; Axiom 103
(assert ; lim[x -> l104](f1 x) = l103
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l104 != x
                                     (and (not (= x l104))
                                          ; | x - l104 | < delta
                                          (< (ite (>= (- x l104) 0.0) (- x l104) (- (- x l104))) delta))
                                     ;
                                     ; | (f1 x) - l103 | < epsilon
                                     (< (ite (>= (- (f1 x) l103) 0.0) (- (f1 x) l103) (- (- (f1 x) l103))) epsilon)
            ))
          ))
        )))

; Axiom 104
(assert ; lim[x -> l105](f5 x) = l104
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l105 != x
                                     (and (not (= x l105))
                                          ; | x - l105 | < delta
                                          (< (ite (>= (- x l105) 0.0) (- x l105) (- (- x l105))) delta))
                                     ;
                                     ; | (f5 x) - l104 | < epsilon
                                     (< (ite (>= (- (f5 x) l104) 0.0) (- (f5 x) l104) (- (- (f5 x) l104))) epsilon)
            ))
          ))
        )))

; Axiom 105
(assert ; lim[x -> l106](f1 x) = l105
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l106 != x
                                     (and (not (= x l106))
                                          ; | x - l106 | < delta
                                          (< (ite (>= (- x l106) 0.0) (- x l106) (- (- x l106))) delta))
                                     ;
                                     ; | (f1 x) - l105 | < epsilon
                                     (< (ite (>= (- (f1 x) l105) 0.0) (- (f1 x) l105) (- (- (f1 x) l105))) epsilon)
            ))
          ))
        )))

; Axiom 106
(assert ; lim[x -> l107](f6 x) = l106
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l107 != x
                                     (and (not (= x l107))
                                          ; | x - l107 | < delta
                                          (< (ite (>= (- x l107) 0.0) (- x l107) (- (- x l107))) delta))
                                     ;
                                     ; | (f6 x) - l106 | < epsilon
                                     (< (ite (>= (- (f6 x) l106) 0.0) (- (f6 x) l106) (- (- (f6 x) l106))) epsilon)
            ))
          ))
        )))

; Axiom 107
(assert ; lim[x -> l108](f6 x) = l107
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l108 != x
                                     (and (not (= x l108))
                                          ; | x - l108 | < delta
                                          (< (ite (>= (- x l108) 0.0) (- x l108) (- (- x l108))) delta))
                                     ;
                                     ; | (f6 x) - l107 | < epsilon
                                     (< (ite (>= (- (f6 x) l107) 0.0) (- (f6 x) l107) (- (- (f6 x) l107))) epsilon)
            ))
          ))
        )))

; Axiom 108
(assert ; lim[x -> l109](f7 x) = l108
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l109 != x
                                     (and (not (= x l109))
                                          ; | x - l109 | < delta
                                          (< (ite (>= (- x l109) 0.0) (- x l109) (- (- x l109))) delta))
                                     ;
                                     ; | (f7 x) - l108 | < epsilon
                                     (< (ite (>= (- (f7 x) l108) 0.0) (- (f7 x) l108) (- (- (f7 x) l108))) epsilon)
            ))
          ))
        )))

; Axiom 109
(assert ; lim[x -> l110](f3 x) = l109
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l110 != x
                                     (and (not (= x l110))
                                          ; | x - l110 | < delta
                                          (< (ite (>= (- x l110) 0.0) (- x l110) (- (- x l110))) delta))
                                     ;
                                     ; | (f3 x) - l109 | < epsilon
                                     (< (ite (>= (- (f3 x) l109) 0.0) (- (f3 x) l109) (- (- (f3 x) l109))) epsilon)
            ))
          ))
        )))

; Axiom 110
(assert ; lim[x -> l111](f5 x) = l110
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l111 != x
                                     (and (not (= x l111))
                                          ; | x - l111 | < delta
                                          (< (ite (>= (- x l111) 0.0) (- x l111) (- (- x l111))) delta))
                                     ;
                                     ; | (f5 x) - l110 | < epsilon
                                     (< (ite (>= (- (f5 x) l110) 0.0) (- (f5 x) l110) (- (- (f5 x) l110))) epsilon)
            ))
          ))
        )))

; Axiom 111
(assert ; lim[x -> l112](f1 x) = l111
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l112 != x
                                     (and (not (= x l112))
                                          ; | x - l112 | < delta
                                          (< (ite (>= (- x l112) 0.0) (- x l112) (- (- x l112))) delta))
                                     ;
                                     ; | (f1 x) - l111 | < epsilon
                                     (< (ite (>= (- (f1 x) l111) 0.0) (- (f1 x) l111) (- (- (f1 x) l111))) epsilon)
            ))
          ))
        )))

; Axiom 112
(assert ; lim[x -> l113](f0 x) = l112
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l113 != x
                                     (and (not (= x l113))
                                          ; | x - l113 | < delta
                                          (< (ite (>= (- x l113) 0.0) (- x l113) (- (- x l113))) delta))
                                     ;
                                     ; | (f0 x) - l112 | < epsilon
                                     (< (ite (>= (- (f0 x) l112) 0.0) (- (f0 x) l112) (- (- (f0 x) l112))) epsilon)
            ))
          ))
        )))

; Axiom 113
(assert ; lim[x -> l114](f3 x) = l113
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l114 != x
                                     (and (not (= x l114))
                                          ; | x - l114 | < delta
                                          (< (ite (>= (- x l114) 0.0) (- x l114) (- (- x l114))) delta))
                                     ;
                                     ; | (f3 x) - l113 | < epsilon
                                     (< (ite (>= (- (f3 x) l113) 0.0) (- (f3 x) l113) (- (- (f3 x) l113))) epsilon)
            ))
          ))
        )))

; Axiom 114
(assert ; lim[x -> l115](f4 x) = l114
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l115 != x
                                     (and (not (= x l115))
                                          ; | x - l115 | < delta
                                          (< (ite (>= (- x l115) 0.0) (- x l115) (- (- x l115))) delta))
                                     ;
                                     ; | (f4 x) - l114 | < epsilon
                                     (< (ite (>= (- (f4 x) l114) 0.0) (- (f4 x) l114) (- (- (f4 x) l114))) epsilon)
            ))
          ))
        )))

; Axiom 115
(assert ; lim[x -> l116](f7 x) = l115
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l116 != x
                                     (and (not (= x l116))
                                          ; | x - l116 | < delta
                                          (< (ite (>= (- x l116) 0.0) (- x l116) (- (- x l116))) delta))
                                     ;
                                     ; | (f7 x) - l115 | < epsilon
                                     (< (ite (>= (- (f7 x) l115) 0.0) (- (f7 x) l115) (- (- (f7 x) l115))) epsilon)
            ))
          ))
        )))

; Axiom 116
(assert ; lim[x -> l117](f6 x) = l116
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l117 != x
                                     (and (not (= x l117))
                                          ; | x - l117 | < delta
                                          (< (ite (>= (- x l117) 0.0) (- x l117) (- (- x l117))) delta))
                                     ;
                                     ; | (f6 x) - l116 | < epsilon
                                     (< (ite (>= (- (f6 x) l116) 0.0) (- (f6 x) l116) (- (- (f6 x) l116))) epsilon)
            ))
          ))
        )))

; Axiom 117
(assert ; lim[x -> l118](f2 x) = l117
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l118 != x
                                     (and (not (= x l118))
                                          ; | x - l118 | < delta
                                          (< (ite (>= (- x l118) 0.0) (- x l118) (- (- x l118))) delta))
                                     ;
                                     ; | (f2 x) - l117 | < epsilon
                                     (< (ite (>= (- (f2 x) l117) 0.0) (- (f2 x) l117) (- (- (f2 x) l117))) epsilon)
            ))
          ))
        )))

; Axiom 118
(assert ; lim[x -> l119](f0 x) = l118
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l119 != x
                                     (and (not (= x l119))
                                          ; | x - l119 | < delta
                                          (< (ite (>= (- x l119) 0.0) (- x l119) (- (- x l119))) delta))
                                     ;
                                     ; | (f0 x) - l118 | < epsilon
                                     (< (ite (>= (- (f0 x) l118) 0.0) (- (f0 x) l118) (- (- (f0 x) l118))) epsilon)
            ))
          ))
        )))

; Axiom 119
(assert ; lim[x -> l120](f2 x) = l119
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l120 != x
                                     (and (not (= x l120))
                                          ; | x - l120 | < delta
                                          (< (ite (>= (- x l120) 0.0) (- x l120) (- (- x l120))) delta))
                                     ;
                                     ; | (f2 x) - l119 | < epsilon
                                     (< (ite (>= (- (f2 x) l119) 0.0) (- (f2 x) l119) (- (- (f2 x) l119))) epsilon)
            ))
          ))
        )))

; Axiom 120
(assert ; lim[x -> l121](f7 x) = l120
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l121 != x
                                     (and (not (= x l121))
                                          ; | x - l121 | < delta
                                          (< (ite (>= (- x l121) 0.0) (- x l121) (- (- x l121))) delta))
                                     ;
                                     ; | (f7 x) - l120 | < epsilon
                                     (< (ite (>= (- (f7 x) l120) 0.0) (- (f7 x) l120) (- (- (f7 x) l120))) epsilon)
            ))
          ))
        )))

; Axiom 121
(assert ; lim[x -> l122](f2 x) = l121
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l122 != x
                                     (and (not (= x l122))
                                          ; | x - l122 | < delta
                                          (< (ite (>= (- x l122) 0.0) (- x l122) (- (- x l122))) delta))
                                     ;
                                     ; | (f2 x) - l121 | < epsilon
                                     (< (ite (>= (- (f2 x) l121) 0.0) (- (f2 x) l121) (- (- (f2 x) l121))) epsilon)
            ))
          ))
        )))

; Axiom 122
(assert ; lim[x -> l123](f1 x) = l122
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l123 != x
                                     (and (not (= x l123))
                                          ; | x - l123 | < delta
                                          (< (ite (>= (- x l123) 0.0) (- x l123) (- (- x l123))) delta))
                                     ;
                                     ; | (f1 x) - l122 | < epsilon
                                     (< (ite (>= (- (f1 x) l122) 0.0) (- (f1 x) l122) (- (- (f1 x) l122))) epsilon)
            ))
          ))
        )))

; Axiom 123
(assert ; lim[x -> l124](f2 x) = l123
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l124 != x
                                     (and (not (= x l124))
                                          ; | x - l124 | < delta
                                          (< (ite (>= (- x l124) 0.0) (- x l124) (- (- x l124))) delta))
                                     ;
                                     ; | (f2 x) - l123 | < epsilon
                                     (< (ite (>= (- (f2 x) l123) 0.0) (- (f2 x) l123) (- (- (f2 x) l123))) epsilon)
            ))
          ))
        )))

; Axiom 124
(assert ; lim[x -> l125](f2 x) = l124
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l125 != x
                                     (and (not (= x l125))
                                          ; | x - l125 | < delta
                                          (< (ite (>= (- x l125) 0.0) (- x l125) (- (- x l125))) delta))
                                     ;
                                     ; | (f2 x) - l124 | < epsilon
                                     (< (ite (>= (- (f2 x) l124) 0.0) (- (f2 x) l124) (- (- (f2 x) l124))) epsilon)
            ))
          ))
        )))

; Axiom 125
(assert ; lim[x -> l126](f6 x) = l125
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l126 != x
                                     (and (not (= x l126))
                                          ; | x - l126 | < delta
                                          (< (ite (>= (- x l126) 0.0) (- x l126) (- (- x l126))) delta))
                                     ;
                                     ; | (f6 x) - l125 | < epsilon
                                     (< (ite (>= (- (f6 x) l125) 0.0) (- (f6 x) l125) (- (- (f6 x) l125))) epsilon)
            ))
          ))
        )))

; Axiom 126
(assert ; lim[x -> l127](f1 x) = l126
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l127 != x
                                     (and (not (= x l127))
                                          ; | x - l127 | < delta
                                          (< (ite (>= (- x l127) 0.0) (- x l127) (- (- x l127))) delta))
                                     ;
                                     ; | (f1 x) - l126 | < epsilon
                                     (< (ite (>= (- (f1 x) l126) 0.0) (- (f1 x) l126) (- (- (f1 x) l126))) epsilon)
            ))
          ))
        )))

; Axiom 127
(assert ; lim[x -> a](f5 x) = l127
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
                                     ; | (f5 x) - l127 | < epsilon
                                     (< (ite (>= (- (f5 x) l127) 0.0) (- (f5 x) l127) (- (- (f5 x) l127))) epsilon)
            ))
          ))
        )))


; Conclusion
(assert (not ; lim[x -> a](f7 (f5 (f3 (f1 (f2 (f7 (f3 (f5 (f4 (f3 (f1 (f0 (f7 (f3 (f1 (f1 (f7 (f3 (f7 (f0 (f4 (f2 (f7 (f4 (f5 (f0 (f2 (f1 (f4 (f2 (f3 (f1 (f7 (f2 (f0 (f5 (f1 (f3 (f1 (f6 (f2 (f5 (f1 (f6 (f0 (f6 (f7 (f4 (f0 (f5 (f0 (f5 (f2 (f5 (f7 (f0 (f5 (f7 (f5 (f0 (f1 (f4 (f6 (f2 (f0 (f2 (f3 (f2 (f5 (f1 (f6 (f6 (f7 (f2 (f2 (f3 (f0 (f1 (f5 (f4 (f6 (f2 (f3 (f5 (f5 (f4 (f6 (f7 (f0 (f3 (f6 (f5 (f0 (f0 (f3 (f6 (f1 (f1 (f7 (f7 (f7 (f5 (f3 (f1 (f5 (f1 (f6 (f6 (f7 (f3 (f5 (f1 (f0 (f3 (f4 (f7 (f6 (f2 (f0 (f2 (f7 (f2 (f1 (f2 (f2 (f6 (f1 (f5 x)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) = l
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
                                          ; | (f7 (f5 (f3 (f1 (f2 (f7 (f3 (f5 (f4 (f3 (f1 (f0 (f7 (f3 (f1 (f1 (f7 (f3 (f7 (f0 (f4 (f2 (f7 (f4 (f5 (f0 (f2 (f1 (f4 (f2 (f3 (f1 (f7 (f2 (f0 (f5 (f1 (f3 (f1 (f6 (f2 (f5 (f1 (f6 (f0 (f6 (f7 (f4 (f0 (f5 (f0 (f5 (f2 (f5 (f7 (f0 (f5 (f7 (f5 (f0 (f1 (f4 (f6 (f2 (f0 (f2 (f3 (f2 (f5 (f1 (f6 (f6 (f7 (f2 (f2 (f3 (f0 (f1 (f5 (f4 (f6 (f2 (f3 (f5 (f5 (f4 (f6 (f7 (f0 (f3 (f6 (f5 (f0 (f0 (f3 (f6 (f1 (f1 (f7 (f7 (f7 (f5 (f3 (f1 (f5 (f1 (f6 (f6 (f7 (f3 (f5 (f1 (f0 (f3 (f4 (f7 (f6 (f2 (f0 (f2 (f7 (f2 (f1 (f2 (f2 (f6 (f1 (f5 x)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) - l | < epsilon
                                          (< (ite (>= (- (f7 (f5 (f3 (f1 (f2 (f7 (f3 (f5 (f4 (f3 (f1 (f0 (f7 (f3 (f1 (f1 (f7 (f3 (f7 (f0 (f4 (f2 (f7 (f4 (f5 (f0 (f2 (f1 (f4 (f2 (f3 (f1 (f7 (f2 (f0 (f5 (f1 (f3 (f1 (f6 (f2 (f5 (f1 (f6 (f0 (f6 (f7 (f4 (f0 (f5 (f0 (f5 (f2 (f5 (f7 (f0 (f5 (f7 (f5 (f0 (f1 (f4 (f6 (f2 (f0 (f2 (f3 (f2 (f5 (f1 (f6 (f6 (f7 (f2 (f2 (f3 (f0 (f1 (f5 (f4 (f6 (f2 (f3 (f5 (f5 (f4 (f6 (f7 (f0 (f3 (f6 (f5 (f0 (f0 (f3 (f6 (f1 (f1 (f7 (f7 (f7 (f5 (f3 (f1 (f5 (f1 (f6 (f6 (f7 (f3 (f5 (f1 (f0 (f3 (f4 (f7 (f6 (f2 (f0 (f2 (f7 (f2 (f1 (f2 (f2 (f6 (f1 (f5 x)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) l) 0.0) (- (f7 (f5 (f3 (f1 (f2 (f7 (f3 (f5 (f4 (f3 (f1 (f0 (f7 (f3 (f1 (f1 (f7 (f3 (f7 (f0 (f4 (f2 (f7 (f4 (f5 (f0 (f2 (f1 (f4 (f2 (f3 (f1 (f7 (f2 (f0 (f5 (f1 (f3 (f1 (f6 (f2 (f5 (f1 (f6 (f0 (f6 (f7 (f4 (f0 (f5 (f0 (f5 (f2 (f5 (f7 (f0 (f5 (f7 (f5 (f0 (f1 (f4 (f6 (f2 (f0 (f2 (f3 (f2 (f5 (f1 (f6 (f6 (f7 (f2 (f2 (f3 (f0 (f1 (f5 (f4 (f6 (f2 (f3 (f5 (f5 (f4 (f6 (f7 (f0 (f3 (f6 (f5 (f0 (f0 (f3 (f6 (f1 (f1 (f7 (f7 (f7 (f5 (f3 (f1 (f5 (f1 (f6 (f6 (f7 (f3 (f5 (f1 (f0 (f3 (f4 (f7 (f6 (f2 (f0 (f2 (f7 (f2 (f1 (f2 (f2 (f6 (f1 (f5 x)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) l) (- (- (f7 (f5 (f3 (f1 (f2 (f7 (f3 (f5 (f4 (f3 (f1 (f0 (f7 (f3 (f1 (f1 (f7 (f3 (f7 (f0 (f4 (f2 (f7 (f4 (f5 (f0 (f2 (f1 (f4 (f2 (f3 (f1 (f7 (f2 (f0 (f5 (f1 (f3 (f1 (f6 (f2 (f5 (f1 (f6 (f0 (f6 (f7 (f4 (f0 (f5 (f0 (f5 (f2 (f5 (f7 (f0 (f5 (f7 (f5 (f0 (f1 (f4 (f6 (f2 (f0 (f2 (f3 (f2 (f5 (f1 (f6 (f6 (f7 (f2 (f2 (f3 (f0 (f1 (f5 (f4 (f6 (f2 (f3 (f5 (f5 (f4 (f6 (f7 (f0 (f3 (f6 (f5 (f0 (f0 (f3 (f6 (f1 (f1 (f7 (f7 (f7 (f5 (f3 (f1 (f5 (f1 (f6 (f6 (f7 (f3 (f5 (f1 (f0 (f3 (f4 (f7 (f6 (f2 (f0 (f2 (f7 (f2 (f1 (f2 (f2 (f6 (f1 (f5 x)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) l))) epsilon)
                 ))
               ))
             ))))

(check-sat)

