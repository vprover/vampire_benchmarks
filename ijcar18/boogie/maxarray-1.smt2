(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-info :status unsat)
(set-option :AUTO_CONFIG false)
(set-option :pp.bv_literals false)
(set-option :MODEL.V2 true)
(set-option :smt.PHASE_SELECTION 0)
(set-option :smt.RESTART_STRATEGY 0)
(set-option :smt.RESTART_FACTOR |1.5|)
(set-option :smt.ARITH.RANDOM_INITIAL_VALUE true)
(set-option :smt.CASE_SPLIT 3)
(set-option :smt.DELAY_UNITS true)
(set-option :NNF.SK_HACK true)
(set-option :smt.MBQI false)
(set-option :smt.QI.EAGER_THRESHOLD 100)
(set-option :TYPE_CHECK true)
(set-option :smt.BV.REFLECT true)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-fun %lbl%+361 () Bool)
(declare-fun %lbl%@837 () Bool)
(declare-fun bad@0 () Bool)
(declare-fun x@1 () Int)
(declare-fun y@1 () Int)
(declare-fun n () Int)
(declare-fun %lbl%@858 () Bool)
(declare-fun m@0 () Int)
(declare-fun %lbl%@871 () Bool)
(declare-fun a () (Array Int Int))
(declare-fun %lbl%@905 () Bool)
(declare-fun %lbl%+224 () Bool)
(declare-fun y () Int)
(declare-fun x () Int)
(declare-fun y@0 () Int)
(declare-fun %lbl%+222 () Bool)
(declare-fun x@0 () Int)
(declare-fun %lbl%+213 () Bool)
(declare-fun bad () Bool)
(declare-fun %lbl%+211 () Bool)
(declare-fun %lbl%+365 () Bool)
(declare-fun m () Int)
(push 1)
(set-info :boogie-vc-id main)
(assert (not
(let ((GeneratedUnifiedExit_correct  (=> (! (and %lbl%+361 true) :lblpos +361) (and (! (or %lbl%@837  (or bad@0 (and (and (<= 0 x@1) (<= x@1 y@1)) (< y@1 n)))) :lblneg @837) (=> (or bad@0 (and (and (<= 0 x@1) (<= x@1 y@1)) (< y@1 n))) (and (! (or %lbl%@858  (or bad@0 (or (= m@0 x@1) (= m@0 y@1)))) :lblneg @858) (=> (or bad@0 (or (= m@0 x@1) (= m@0 y@1))) (and (! (or %lbl%@871  (or bad@0 (forall ((i Int) ) (!  (=> (and (<= 0 i) (< i x@1)) (<= (select a i) (select a m@0)))
 :qid |maxarray.19:26|
 :skolemid |2|
)))) :lblneg @871) (=> (or bad@0 (forall ((i@@0 Int) ) (!  (=> (and (<= 0 i@@0) (< i@@0 x@1)) (<= (select a i@@0) (select a m@0)))
 :qid |maxarray.19:26|
 :skolemid |2|
))) (! (or %lbl%@905  (or bad@0 (forall ((i@@1 Int) ) (!  (=> (and (< y@1 i@@1) (< i@@1 n)) (<= (select a i@@1) (select a m@0)))
 :qid |maxarray.20:26|
 :skolemid |3|
)))) :lblneg @905))))))))))
(let ((anon6_Else_correct  (=> (! (and %lbl%+224 true) :lblpos +224) (=> (< (select a y) (select a x)) (=> (and (and (= y@0 (- y 1)) (= y@1 y@0)) (and (= x@1 x) (= m@0 x))) GeneratedUnifiedExit_correct)))))
(let ((anon6_Then_correct  (=> (! (and %lbl%+222 true) :lblpos +222) (=> (<= (select a x) (select a y)) (=> (and (and (= x@0 (+ x 1)) (= y@1 y)) (and (= x@1 x@0) (= m@0 y))) GeneratedUnifiedExit_correct)))))
(let ((anon5_Else_correct  (=> (! (and %lbl%+213 true) :lblpos +213) (=> (not (= x y)) (=> (and (=> bad@0 bad) (=> bad bad@0)) (and anon6_Then_correct anon6_Else_correct))))))
(let ((anon5_Then_correct  (=> (! (and %lbl%+211 true) :lblpos +211) (=> (not (not (= x y))) (=> (and (=> bad@0 true) (=> true bad@0)) (and anon6_Then_correct anon6_Else_correct))))))
(let ((anon0_correct  (=> (! (and %lbl%+365 true) :lblpos +365) (=> (> n 0) (=> (and (and (and (and (<= 0 x) (<= x y)) (< y n)) (or (= m x) (= m y))) (and (forall ((i@@2 Int) ) (!  (=> (and (<= 0 i@@2) (< i@@2 x)) (<= (select a i@@2) (select a m)))
 :qid |maxarray.14:20|
 :skolemid |0|
)) (forall ((i@@3 Int) ) (!  (=> (and (< y i@@3) (< i@@3 n)) (<= (select a i@@3) (select a m)))
 :qid |maxarray.15:20|
 :skolemid |1|
)))) (and anon5_Then_correct anon5_Else_correct))))))
anon0_correct))))))
))
(get-info :name)
(check-sat)
(get-info :name)
(pop 1)
; Valid
