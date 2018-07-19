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
(declare-fun %lbl%+452 () Bool)
(declare-fun %lbl%@1058 () Bool)
(declare-fun bad@0 () Bool)
(declare-fun low@1 () Int)
(declare-fun high@1 () Int)
(declare-fun n () Int)
(declare-fun %lbl%@1083 () Bool)
(declare-fun i@0 () Int)
(declare-fun a () (Array Int Int))
(declare-fun e () Int)
(declare-fun %lbl%@1102 () Bool)
(declare-fun %lbl%@1133 () Bool)
(declare-fun %lbl%+275 () Bool)
(declare-fun mid@0 () Int)
(declare-fun high@0 () Int)
(declare-fun low () Int)
(declare-fun i () Int)
(declare-fun %lbl%+273 () Bool)
(declare-fun low@0 () Int)
(declare-fun high () Int)
(declare-fun %lbl%+271 () Bool)
(declare-fun %lbl%+264 () Bool)
(declare-fun %lbl%+262 () Bool)
(declare-fun %lbl%+255 () Bool)
(declare-fun bad () Bool)
(declare-fun %lbl%+253 () Bool)
(declare-fun %lbl%+457 () Bool)
(push 1)
(set-info :boogie-vc-id main)
(assert (not
(let ((GeneratedUnifiedExit_correct  (=> (! (and %lbl%+452 true) :lblpos +452) (and (! (or %lbl%@1058  (or bad@0 (and (and (<= 0 low@1) (<= low@1 (+ high@1 1))) (< high@1 n)))) :lblneg @1058) (=> (or bad@0 (and (and (<= 0 low@1) (<= low@1 (+ high@1 1))) (< high@1 n))) (and (! (or %lbl%@1083  (or bad@0 (=> (>= i@0 0) (= (select a i@0) e)))) :lblneg @1083) (=> (or bad@0 (=> (>= i@0 0) (= (select a i@0) e))) (and (! (or %lbl%@1102  (or bad@0 (forall ((k Int) ) (!  (=> (and (>= k 0) (< k low@1)) (< (select a k) e))
 :qid |binaryse.23:26|
 :skolemid |3|
)))) :lblneg @1102) (=> (or bad@0 (forall ((k@@0 Int) ) (!  (=> (and (>= k@@0 0) (< k@@0 low@1)) (< (select a k@@0) e))
 :qid |binaryse.23:26|
 :skolemid |3|
))) (! (or %lbl%@1133  (or bad@0 (forall ((k@@1 Int) ) (!  (=> (and (> k@@1 high@1) (< k@@1 n)) (> (select a k@@1) e))
 :qid |binaryse.24:26|
 :skolemid |4|
)))) :lblneg @1133))))))))))
(let ((anon9_Else_correct  (=> (! (and %lbl%+275 true) :lblpos +275) (=> (<= e (select a mid@0)) (=> (and (and (= high@0 (- mid@0 1)) (= high@1 high@0)) (and (= low@1 low) (= i@0 i))) GeneratedUnifiedExit_correct)))))
(let ((anon9_Then_correct  (=> (! (and %lbl%+273 true) :lblpos +273) (=> (< (select a mid@0) e) (=> (and (and (= low@0 (+ mid@0 1)) (= high@1 high)) (and (= low@1 low@0) (= i@0 i))) GeneratedUnifiedExit_correct)))))
(let ((anon8_Else_correct  (=> (! (and %lbl%+271 true) :lblpos +271) (=> (not (= (select a mid@0) e)) (and anon9_Then_correct anon9_Else_correct)))))
(let ((anon8_Then_correct  (=> (! (and %lbl%+264 true) :lblpos +264) (=> (and (and (= (select a mid@0) e) (= high@1 high)) (and (= low@1 low) (= i@0 mid@0))) GeneratedUnifiedExit_correct))))
(let ((anon2_correct  (=> (! (and %lbl%+262 true) :lblpos +262) (=> (= mid@0 (div (+ low high) 2)) (and anon8_Then_correct anon8_Else_correct)))))
(let ((anon7_Else_correct  (=> (! (and %lbl%+255 true) :lblpos +255) (=> (and (and (<= low high) (< i 0)) (and (=> bad@0 bad) (=> bad bad@0))) anon2_correct))))
(let ((anon7_Then_correct  (=> (! (and %lbl%+253 true) :lblpos +253) (=> (not (and (<= low high) (< i 0))) (=> (and (=> bad@0 true) (=> true bad@0)) anon2_correct)))))
(let ((anon0_correct  (=> (! (and %lbl%+457 true) :lblpos +457) (=> (and (> n 0) (forall ((j Int) (k@@2 Int) ) (!  (=> (and (and (<= 0 j) (<= j k@@2)) (< k@@2 n)) (<= (select a j) (select a k@@2)))
 :qid |binaryse.14:20|
 :skolemid |0|
))) (=> (and (and (and (and (<= 0 low) (<= low (+ high 1))) (< high n)) (=> (>= i 0) (= (select a i) e))) (and (forall ((k@@3 Int) ) (!  (=> (and (>= k@@3 0) (< k@@3 low)) (< (select a k@@3) e))
 :qid |binaryse.18:20|
 :skolemid |1|
)) (forall ((k@@4 Int) ) (!  (=> (and (> k@@4 high) (< k@@4 n)) (> (select a k@@4) e))
 :qid |binaryse.19:20|
 :skolemid |2|
)))) (and anon7_Then_correct anon7_Else_correct))))))
anon0_correct)))))))))
))
(get-info :name)
(check-sat)
(get-info :name)
(pop 1)
; Valid
