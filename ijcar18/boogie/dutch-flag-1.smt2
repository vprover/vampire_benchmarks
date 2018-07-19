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
(declare-fun %lbl%+511 () Bool)
(declare-fun %lbl%@1204 () Bool)
(declare-fun bad@0 () Bool)
(declare-fun low@1 () Int)
(declare-fun i@2 () Int)
(declare-fun high@1 () Int)
(declare-fun n () Int)
(declare-fun %lbl%@1235 () Bool)
(declare-fun a@4 () (Array Int Int))
(declare-fun pivot () Int)
(declare-fun %lbl%@1265 () Bool)
(declare-fun %lbl%@1294 () Bool)
(declare-fun %lbl%+313 () Bool)
(declare-fun a () (Array Int Int))
(declare-fun i () Int)
(declare-fun i@1 () Int)
(declare-fun high () Int)
(declare-fun low () Int)
(declare-fun %lbl%+311 () Bool)
(declare-fun t@1 () Int)
(declare-fun a@2 () (Array Int Int))
(declare-fun a@3 () (Array Int Int))
(declare-fun high@0 () Int)
(declare-fun %lbl%+309 () Bool)
(declare-fun %lbl%+299 () Bool)
(declare-fun t@0 () Int)
(declare-fun a@0 () (Array Int Int))
(declare-fun a@1 () (Array Int Int))
(declare-fun low@0 () Int)
(declare-fun i@0 () Int)
(declare-fun %lbl%+290 () Bool)
(declare-fun bad () Bool)
(declare-fun %lbl%+288 () Bool)
(declare-fun %lbl%+516 () Bool)
(push 1)
(set-info :boogie-vc-id main)
(assert (not
(let ((GeneratedUnifiedExit_correct  (=> (! (and %lbl%+511 true) :lblpos +511) (and (! (or %lbl%@1204  (or bad@0 (and (and (and (<= 0 low@1) (<= low@1 i@2)) (<= i@2 (+ high@1 1))) (< high@1 n)))) :lblneg @1204) (=> (or bad@0 (and (and (and (<= 0 low@1) (<= low@1 i@2)) (<= i@2 (+ high@1 1))) (< high@1 n))) (and (! (or %lbl%@1235  (or bad@0 (forall ((k Int) ) (!  (=> (and (<= 0 k) (< k low@1)) (< (select a@4 k) pivot))
 :qid |dutchfla.21:26|
 :skolemid |3|
)))) :lblneg @1235) (=> (or bad@0 (forall ((k@@0 Int) ) (!  (=> (and (<= 0 k@@0) (< k@@0 low@1)) (< (select a@4 k@@0) pivot))
 :qid |dutchfla.21:26|
 :skolemid |3|
))) (and (! (or %lbl%@1265  (or bad@0 (forall ((k@@1 Int) ) (!  (=> (and (<= low@1 k@@1) (< k@@1 i@2)) (= (select a@4 k@@1) pivot))
 :qid |dutchfla.22:26|
 :skolemid |4|
)))) :lblneg @1265) (=> (or bad@0 (forall ((k@@2 Int) ) (!  (=> (and (<= low@1 k@@2) (< k@@2 i@2)) (= (select a@4 k@@2) pivot))
 :qid |dutchfla.22:26|
 :skolemid |4|
))) (! (or %lbl%@1294  (or bad@0 (forall ((k@@3 Int) ) (!  (=> (and (< high@1 k@@3) (< k@@3 n)) (> (select a@4 k@@3) pivot))
 :qid |dutchfla.23:26|
 :skolemid |5|
)))) :lblneg @1294))))))))))
(let ((anon8_Else_correct  (=> (! (and %lbl%+313 true) :lblpos +313) (=> (and (>= pivot (select a i)) (= i@1 (+ i 1))) (=> (and (and (= i@2 i@1) (= a@4 a)) (and (= high@1 high) (= low@1 low))) GeneratedUnifiedExit_correct)))))
(let ((anon8_Then_correct  (=> (! (and %lbl%+311 true) :lblpos +311) (=> (> (select a i) pivot) (=> (and (and (and (= t@1 (select a i)) (= a@2 (store a i (select a high)))) (and (= a@3 (store a@2 high t@1)) (= high@0 (- high 1)))) (and (and (= i@2 i) (= a@4 a@3)) (and (= high@1 high@0) (= low@1 low)))) GeneratedUnifiedExit_correct)))))
(let ((anon7_Else_correct  (=> (! (and %lbl%+309 true) :lblpos +309) (=> (<= pivot (select a i)) (and anon8_Then_correct anon8_Else_correct)))))
(let ((anon7_Then_correct  (=> (! (and %lbl%+299 true) :lblpos +299) (=> (and (< (select a i) pivot) (= t@0 (select a low))) (=> (and (and (and (= a@0 (store a low (select a i))) (= a@1 (store a@0 i t@0))) (and (= low@0 (+ low 1)) (= i@0 (+ i 1)))) (and (and (= i@2 i@0) (= a@4 a@1)) (and (= high@1 high) (= low@1 low@0)))) GeneratedUnifiedExit_correct)))))
(let ((anon6_Else_correct  (=> (! (and %lbl%+290 true) :lblpos +290) (=> (<= i high) (=> (and (=> bad@0 bad) (=> bad bad@0)) (and anon7_Then_correct anon7_Else_correct))))))
(let ((anon6_Then_correct  (=> (! (and %lbl%+288 true) :lblpos +288) (=> (not (<= i high)) (=> (and (=> bad@0 true) (=> true bad@0)) (and anon7_Then_correct anon7_Else_correct))))))
(let ((anon0_correct  (=> (! (and %lbl%+516 true) :lblpos +516) (=> (>= n 0) (=> (and (and (and (and (and (<= 0 low) (<= low i)) (<= i (+ high 1))) (< high n)) (forall ((k@@4 Int) ) (!  (=> (and (<= 0 k@@4) (< k@@4 low)) (< (select a k@@4) pivot))
 :qid |dutchfla.16:20|
 :skolemid |0|
))) (and (forall ((k@@5 Int) ) (!  (=> (and (<= low k@@5) (< k@@5 i)) (= (select a k@@5) pivot))
 :qid |dutchfla.17:20|
 :skolemid |1|
)) (forall ((k@@6 Int) ) (!  (=> (and (< high k@@6) (< k@@6 n)) (> (select a k@@6) pivot))
 :qid |dutchfla.18:20|
 :skolemid |2|
)))) (and anon6_Then_correct anon6_Else_correct))))))
anon0_correct))))))))
))
(get-info :name)
(check-sat)
(get-info :name)
(pop 1)
; Valid
