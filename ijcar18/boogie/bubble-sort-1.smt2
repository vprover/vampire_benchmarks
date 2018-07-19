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
(declare-fun %lbl%+349 () Bool)
(declare-fun i@0 () Int)
(declare-fun i () Int)
(declare-fun %lbl%@1450 () Bool)
(declare-fun bad@0 () Bool)
(declare-fun sortedUntil () Int)
(declare-fun n () Int)
(declare-fun %lbl%@1465 () Bool)
(declare-fun a@2 () (Array Int Int))
(declare-fun %lbl%@1515 () Bool)
(declare-fun %lbl%@1547 () Bool)
(declare-fun %lbl%+347 () Bool)
(declare-fun a () (Array Int Int))
(declare-fun %lbl%+345 () Bool)
(declare-fun t@0 () Int)
(declare-fun a@0 () (Array Int Int))
(declare-fun a@1 () (Array Int Int))
(declare-fun %lbl%+336 () Bool)
(declare-fun bad () Bool)
(declare-fun %lbl%+334 () Bool)
(declare-fun %lbl%+640 () Bool)
(push 1)
(set-info :boogie-vc-id main)
(assert (not
(let ((anon4_correct  (=> (! (and %lbl%+349 true) :lblpos +349) (=> (= i@0 (- i 1)) (and (! (or %lbl%@1450  (or bad@0 (and (<= sortedUntil i@0) (< i@0 n)))) :lblneg @1450) (=> (or bad@0 (and (<= sortedUntil i@0) (< i@0 n))) (and (! (or %lbl%@1465  (or bad@0 (forall ((j Int) (k Int) ) (!  (=> (and (and (and (<= 0 j) (< j sortedUntil)) (<= sortedUntil k)) (< k n)) (<= (select a@2 j) (select a@2 k)))
 :qid |bubbleso.18:26|
 :skolemid |5|
)))) :lblneg @1465) (=> (or bad@0 (forall ((j@@0 Int) (k@@0 Int) ) (!  (=> (and (and (and (<= 0 j@@0) (< j@@0 sortedUntil)) (<= sortedUntil k@@0)) (< k@@0 n)) (<= (select a@2 j@@0) (select a@2 k@@0)))
 :qid |bubbleso.18:26|
 :skolemid |5|
))) (and (! (or %lbl%@1515  (or bad@0 (forall ((j@@1 Int) ) (!  (=> (and (<= i@0 j@@1) (< j@@1 n)) (<= (select a@2 i@0) (select a@2 j@@1)))
 :qid |bubbleso.19:26|
 :skolemid |6|
)))) :lblneg @1515) (=> (or bad@0 (forall ((j@@2 Int) ) (!  (=> (and (<= i@0 j@@2) (< j@@2 n)) (<= (select a@2 i@0) (select a@2 j@@2)))
 :qid |bubbleso.19:26|
 :skolemid |6|
))) (! (or %lbl%@1547  (or bad@0 (forall ((j@@3 Int) (k@@1 Int) ) (!  (=> (and (and (<= 0 j@@3) (< j@@3 k@@1)) (< k@@1 sortedUntil)) (<= (select a@2 j@@3) (select a@2 k@@1)))
 :qid |bubbleso.20:26|
 :skolemid |7|
)))) :lblneg @1547)))))))))))
(let ((anon6_Else_correct  (=> (! (and %lbl%+347 true) :lblpos +347) (=> (and (< (select a (- i 1)) (select a i)) (= a@2 a)) anon4_correct))))
(let ((anon6_Then_correct  (=> (! (and %lbl%+345 true) :lblpos +345) (=> (<= (select a i) (select a (- i 1))) (=> (and (and (= t@0 (select a i)) (= a@0 (store a i (select a (- i 1))))) (and (= a@1 (store a@0 (- i 1) t@0)) (= a@2 a@1))) anon4_correct)))))
(let ((anon5_Else_correct  (=> (! (and %lbl%+336 true) :lblpos +336) (=> (> i sortedUntil) (=> (and (=> bad@0 bad) (=> bad bad@0)) (and anon6_Then_correct anon6_Else_correct))))))
(let ((anon5_Then_correct  (=> (! (and %lbl%+334 true) :lblpos +334) (=> (not (> i sortedUntil)) (=> (and (=> bad@0 true) (=> true bad@0)) (and anon6_Then_correct anon6_Else_correct))))))
(let ((anon0_correct  (=> (! (and %lbl%+640 true) :lblpos +640) (=> (>= n 0) (=> (and (and (<= 0 sortedUntil) (<= sortedUntil n)) (and (forall ((j@@4 Int) (k@@2 Int) ) (!  (=> (and (and (and (<= 0 j@@4) (< j@@4 sortedUntil)) (<= sortedUntil k@@2)) (< k@@2 n)) (<= (select a j@@4) (select a k@@2)))
 :qid |bubbleso.10:20|
 :skolemid |0|
)) (forall ((j@@5 Int) (k@@3 Int) ) (!  (=> (and (and (<= 0 j@@5) (< j@@5 k@@3)) (< k@@3 sortedUntil)) (<= (select a j@@5) (select a k@@3)))
 :qid |bubbleso.11:20|
 :skolemid |1|
)))) (=> (and (and (and (<= sortedUntil i) (< i n)) (forall ((j@@6 Int) (k@@4 Int) ) (!  (=> (and (and (and (<= 0 j@@6) (< j@@6 sortedUntil)) (<= sortedUntil k@@4)) (< k@@4 n)) (<= (select a j@@6) (select a k@@4)))
 :qid |bubbleso.13:20|
 :skolemid |2|
))) (and (forall ((j@@7 Int) ) (!  (=> (and (<= i j@@7) (< j@@7 n)) (<= (select a i) (select a j@@7)))
 :qid |bubbleso.14:20|
 :skolemid |3|
)) (forall ((j@@8 Int) (k@@5 Int) ) (!  (=> (and (and (<= 0 j@@8) (< j@@8 k@@5)) (< k@@5 sortedUntil)) (<= (select a j@@8) (select a k@@5)))
 :qid |bubbleso.15:20|
 :skolemid |4|
)))) (and anon5_Then_correct anon5_Else_correct)))))))
anon0_correct))))))
))
(get-info :name)
(check-sat)
(get-info :name)
(pop 1)
; Valid
