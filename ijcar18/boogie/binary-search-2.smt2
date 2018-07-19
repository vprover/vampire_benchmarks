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
(declare-fun %lbl%+550 () Bool)
(declare-fun %lbl%@1312 () Bool)
(declare-fun bad@1 () Bool)
(declare-fun low@3 () Int)
(declare-fun high@3 () Int)
(declare-fun n () Int)
(declare-fun %lbl%@1337 () Bool)
(declare-fun i@1 () Int)
(declare-fun a () (Array Int Int))
(declare-fun e () Int)
(declare-fun %lbl%@1356 () Bool)
(declare-fun %lbl%@1387 () Bool)
(declare-fun %lbl%+351 () Bool)
(declare-fun mid@1 () Int)
(declare-fun high@2 () Int)
(declare-fun low@1 () Int)
(declare-fun i@0 () Int)
(declare-fun %lbl%+349 () Bool)
(declare-fun low@2 () Int)
(declare-fun high@1 () Int)
(declare-fun %lbl%+347 () Bool)
(declare-fun %lbl%+340 () Bool)
(declare-fun %lbl%+338 () Bool)
(declare-fun %lbl%+331 () Bool)
(declare-fun bad@0 () Bool)
(declare-fun %lbl%+329 () Bool)
(declare-fun %lbl%+321 () Bool)
(declare-fun mid@0 () Int)
(declare-fun high@0 () Int)
(declare-fun low () Int)
(declare-fun i () Int)
(declare-fun %lbl%+319 () Bool)
(declare-fun low@0 () Int)
(declare-fun high () Int)
(declare-fun %lbl%+317 () Bool)
(declare-fun %lbl%+310 () Bool)
(declare-fun %lbl%+308 () Bool)
(declare-fun %lbl%+301 () Bool)
(declare-fun bad () Bool)
(declare-fun %lbl%+299 () Bool)
(declare-fun %lbl%+555 () Bool)
(push 1)
(set-info :boogie-vc-id main)
(assert (not
(let ((GeneratedUnifiedExit_correct  (=> (! (and %lbl%+550 true) :lblpos +550) (and (! (or %lbl%@1312  (or bad@1 (and (and (<= 0 low@3) (<= low@3 (+ high@3 1))) (< high@3 n)))) :lblneg @1312) (=> (or bad@1 (and (and (<= 0 low@3) (<= low@3 (+ high@3 1))) (< high@3 n))) (and (! (or %lbl%@1337  (or bad@1 (=> (>= i@1 0) (= (select a i@1) e)))) :lblneg @1337) (=> (or bad@1 (=> (>= i@1 0) (= (select a i@1) e))) (and (! (or %lbl%@1356  (or bad@1 (forall ((k Int) ) (!  (=> (and (>= k 0) (< k low@3)) (< (select a k) e))
 :qid |binaryse.23:26|
 :skolemid |3|
)))) :lblneg @1356) (=> (or bad@1 (forall ((k@@0 Int) ) (!  (=> (and (>= k@@0 0) (< k@@0 low@3)) (< (select a k@@0) e))
 :qid |binaryse.23:26|
 :skolemid |3|
))) (! (or %lbl%@1387  (or bad@1 (forall ((k@@1 Int) ) (!  (=> (and (> k@@1 high@3) (< k@@1 n)) (> (select a k@@1) e))
 :qid |binaryse.24:26|
 :skolemid |4|
)))) :lblneg @1387))))))))))
(let ((anon19_Else_correct  (=> (! (and %lbl%+351 true) :lblpos +351) (=> (<= e (select a mid@1)) (=> (and (and (= high@2 (- mid@1 1)) (= high@3 high@2)) (and (= low@3 low@1) (= i@1 i@0))) GeneratedUnifiedExit_correct)))))
(let ((anon19_Then_correct  (=> (! (and %lbl%+349 true) :lblpos +349) (=> (< (select a mid@1) e) (=> (and (and (= low@2 (+ mid@1 1)) (= high@3 high@1)) (and (= low@3 low@2) (= i@1 i@0))) GeneratedUnifiedExit_correct)))))
(let ((anon18_Else_correct  (=> (! (and %lbl%+347 true) :lblpos +347) (=> (not (= (select a mid@1) e)) (and anon19_Then_correct anon19_Else_correct)))))
(let ((anon18_Then_correct  (=> (! (and %lbl%+340 true) :lblpos +340) (=> (and (and (= (select a mid@1) e) (= high@3 high@1)) (and (= low@3 low@1) (= i@1 mid@1))) GeneratedUnifiedExit_correct))))
(let ((anon9_correct  (=> (! (and %lbl%+338 true) :lblpos +338) (=> (= mid@1 (div (+ low@1 high@1) 2)) (and anon18_Then_correct anon18_Else_correct)))))
(let ((anon17_Else_correct  (=> (! (and %lbl%+331 true) :lblpos +331) (=> (and (and (<= low@1 high@1) (< i@0 0)) (and (=> bad@1 bad@0) (=> bad@0 bad@1))) anon9_correct))))
(let ((anon17_Then_correct  (=> (! (and %lbl%+329 true) :lblpos +329) (=> (not (and (<= low@1 high@1) (< i@0 0))) (=> (and (=> bad@1 true) (=> true bad@1)) anon9_correct)))))
(let ((anon16_Else_correct  (=> (! (and %lbl%+321 true) :lblpos +321) (=> (<= e (select a mid@0)) (=> (and (and (= high@0 (- mid@0 1)) (= high@1 high@0)) (and (= low@1 low) (= i@0 i))) (and anon17_Then_correct anon17_Else_correct))))))
(let ((anon16_Then_correct  (=> (! (and %lbl%+319 true) :lblpos +319) (=> (< (select a mid@0) e) (=> (and (and (= low@0 (+ mid@0 1)) (= high@1 high)) (and (= low@1 low@0) (= i@0 i))) (and anon17_Then_correct anon17_Else_correct))))))
(let ((anon15_Else_correct  (=> (! (and %lbl%+317 true) :lblpos +317) (=> (not (= (select a mid@0) e)) (and anon16_Then_correct anon16_Else_correct)))))
(let ((anon15_Then_correct  (=> (! (and %lbl%+310 true) :lblpos +310) (=> (and (and (= (select a mid@0) e) (= high@1 high)) (and (= low@1 low) (= i@0 mid@0))) (and anon17_Then_correct anon17_Else_correct)))))
(let ((anon2_correct  (=> (! (and %lbl%+308 true) :lblpos +308) (=> (= mid@0 (div (+ low high) 2)) (and anon15_Then_correct anon15_Else_correct)))))
(let ((anon14_Else_correct  (=> (! (and %lbl%+301 true) :lblpos +301) (=> (and (and (<= low high) (< i 0)) (and (=> bad@0 bad) (=> bad bad@0))) anon2_correct))))
(let ((anon14_Then_correct  (=> (! (and %lbl%+299 true) :lblpos +299) (=> (not (and (<= low high) (< i 0))) (=> (and (=> bad@0 true) (=> true bad@0)) anon2_correct)))))
(let ((anon0_correct  (=> (! (and %lbl%+555 true) :lblpos +555) (=> (and (> n 0) (forall ((j Int) (k@@2 Int) ) (!  (=> (and (and (<= 0 j) (<= j k@@2)) (< k@@2 n)) (<= (select a j) (select a k@@2)))
 :qid |binaryse.14:20|
 :skolemid |0|
))) (=> (and (and (and (and (<= 0 low) (<= low (+ high 1))) (< high n)) (=> (>= i 0) (= (select a i) e))) (and (forall ((k@@3 Int) ) (!  (=> (and (>= k@@3 0) (< k@@3 low)) (< (select a k@@3) e))
 :qid |binaryse.18:20|
 :skolemid |1|
)) (forall ((k@@4 Int) ) (!  (=> (and (> k@@4 high) (< k@@4 n)) (> (select a k@@4) e))
 :qid |binaryse.19:20|
 :skolemid |2|
)))) (and anon14_Then_correct anon14_Else_correct))))))
anon0_correct))))))))))))))))
))
(get-info :name)
(check-sat)
(get-info :name)
(pop 1)
; Valid
