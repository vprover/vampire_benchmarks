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
(declare-fun %lbl%+329 () Bool)
(declare-fun j@0 () Int)
(declare-fun j () Int)
(declare-fun %lbl%@1401 () Bool)
(declare-fun bad@0 () Bool)
(declare-fun i () Int)
(declare-fun n () Int)
(declare-fun %lbl%@1420 () Bool)
(declare-fun a@2 () (Array Int Int))
(declare-fun minValue@1 () Int)
(declare-fun %lbl%@1431 () Bool)
(declare-fun %lbl%@1464 () Bool)
(declare-fun %lbl%+327 () Bool)
(declare-fun minValue () Int)
(declare-fun a () (Array Int Int))
(declare-fun %lbl%+325 () Bool)
(declare-fun minValue@0 () Int)
(declare-fun t@0 () Int)
(declare-fun a@0 () (Array Int Int))
(declare-fun a@1 () (Array Int Int))
(declare-fun %lbl%+316 () Bool)
(declare-fun bad () Bool)
(declare-fun %lbl%+314 () Bool)
(declare-fun %lbl%+620 () Bool)
(declare-fun k () Int)
(push 1)
(set-info :boogie-vc-id main)
(assert (not
(let ((anon4_correct  (=> (! (and %lbl%+329 true) :lblpos +329) (=> (= j@0 (+ j 1)) (and (! (or %lbl%@1401  (or bad@0 (and (<= (+ i 1) j@0) (<= j@0 n)))) :lblneg @1401) (=> (or bad@0 (and (<= (+ i 1) j@0) (<= j@0 n))) (and (! (or %lbl%@1420  (or bad@0 (= (select a@2 i) minValue@1))) :lblneg @1420) (=> (or bad@0 (= (select a@2 i) minValue@1)) (and (! (or %lbl%@1431  (or bad@0 (forall ((w Int) ) (!  (=> (and (< i w) (< w j@0)) (<= (select a@2 i) (select a@2 w)))
 :qid |selectk1.26:26|
 :skolemid |4|
)))) :lblneg @1431) (=> (or bad@0 (forall ((w@@0 Int) ) (!  (=> (and (< i w@@0) (< w@@0 j@0)) (<= (select a@2 i) (select a@2 w@@0)))
 :qid |selectk1.26:26|
 :skolemid |4|
))) (! (or %lbl%@1464  (or bad@0 (forall ((v Int) (w@@1 Int) ) (!  (=> (and (and (and (<= 0 v) (< v i)) (<= i w@@1)) (< w@@1 n)) (<= (select a@2 v) (select a@2 w@@1)))
 :qid |selectk1.27:26|
 :skolemid |5|
)))) :lblneg @1464)))))))))))
(let ((anon6_Else_correct  (=> (! (and %lbl%+327 true) :lblpos +327) (=> (<= minValue (select a j)) (=> (and (= minValue@1 minValue) (= a@2 a)) anon4_correct)))))
(let ((anon6_Then_correct  (=> (! (and %lbl%+325 true) :lblpos +325) (=> (< (select a j) minValue) (=> (and (= minValue@0 (select a j)) (= t@0 (select a i))) (=> (and (and (= a@0 (store a i (select a j))) (= a@1 (store a@0 j t@0))) (and (= minValue@1 minValue@0) (= a@2 a@1))) anon4_correct))))))
(let ((anon5_Else_correct  (=> (! (and %lbl%+316 true) :lblpos +316) (=> (< j n) (=> (and (=> bad@0 bad) (=> bad bad@0)) (and anon6_Then_correct anon6_Else_correct))))))
(let ((anon5_Then_correct  (=> (! (and %lbl%+314 true) :lblpos +314) (=> (not (< j n)) (=> (and (=> bad@0 true) (=> true bad@0)) (and anon6_Then_correct anon6_Else_correct))))))
(let ((anon0_correct  (=> (! (and %lbl%+620 true) :lblpos +620) (=> (> n 0) (=> (and (<= 0 k) (< k n)) (=> (and (and (<= 0 i) (<= i (+ k 1))) (and (=> (> i 0) (forall ((v@@0 Int) ) (!  (=> (and (<= 0 v@@0) (< v@@0 (- i 1))) (<= (select a v@@0) (select a (- i 1))))
 :qid |selectk1.16:30|
 :skolemid |0|
))) (=> (> i 0) (forall ((w@@2 Int) ) (!  (=> (and (< (- i 1) w@@2) (< w@@2 n)) (<= (select a (- i 1)) (select a w@@2)))
 :qid |selectk1.17:30|
 :skolemid |1|
))))) (=> (and (and (and (<= (+ i 1) j) (<= j n)) (= (select a i) minValue)) (and (forall ((w@@3 Int) ) (!  (=> (and (< i w@@3) (< w@@3 j)) (<= (select a i) (select a w@@3)))
 :qid |selectk1.21:20|
 :skolemid |2|
)) (forall ((v@@1 Int) (w@@4 Int) ) (!  (=> (and (and (and (<= 0 v@@1) (< v@@1 i)) (<= i w@@4)) (< w@@4 n)) (<= (select a v@@1) (select a w@@4)))
 :qid |selectk1.22:20|
 :skolemid |3|
)))) (and anon5_Then_correct anon5_Else_correct))))))))
anon0_correct))))))
))
(get-info :name)
(check-sat)
(get-info :name)
(pop 1)
; Valid
