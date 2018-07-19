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
(declare-fun %lbl%+423 () Bool)
(declare-fun %lbl%@980 () Bool)
(declare-fun bad@0 () Bool)
(declare-fun i@1 () Int)
(declare-fun n () Int)
(declare-fun %lbl%@995 () Bool)
(declare-fun d@1 () Int)
(declare-fun occs@1 () (Array Int Bool))
(declare-fun a () (Array Int Int))
(declare-fun %lbl%@1013 () Bool)
(declare-fun %lbl%@1043 () Bool)
(declare-fun %lbl%+250 () Bool)
(declare-fun occs () (Array Int Bool))
(declare-fun i () Int)
(declare-fun d@0 () Int)
(declare-fun %lbl%+248 () Bool)
(declare-fun occs@0 () (Array Int Bool))
(declare-fun i@0 () Int)
(declare-fun d () Int)
(declare-fun %lbl%+240 () Bool)
(declare-fun bad () Bool)
(declare-fun %lbl%+238 () Bool)
(declare-fun %lbl%+427 () Bool)
(push 1)
(set-info :boogie-vc-id main)
(assert (not
(let ((GeneratedUnifiedExit_correct  (=> (! (and %lbl%+423 true) :lblpos +423) (and (! (or %lbl%@980  (or bad@0 (and (<= 0 i@1) (<= i@1 n)))) :lblneg @980) (=> (or bad@0 (and (<= 0 i@1) (<= i@1 n))) (and (! (or %lbl%@995  (or bad@0 (=> (>= d@1 0) (select occs@1 (select a i@1))))) :lblneg @995) (=> (or bad@0 (=> (>= d@1 0) (select occs@1 (select a i@1)))) (and (! (or %lbl%@1013  (or bad@0 (forall ((k Int) ) (!  (=> (and (<= 0 k) (< k i@1)) (select occs@1 (select a k)))
 :qid |onedupli.19:26|
 :skolemid |3|
)))) :lblneg @1013) (=> (or bad@0 (forall ((k@@0 Int) ) (!  (=> (and (<= 0 k@@0) (< k@@0 i@1)) (select occs@1 (select a k@@0)))
 :qid |onedupli.19:26|
 :skolemid |3|
))) (! (or %lbl%@1043  (or bad@0 (forall ((j Int) (k@@1 Int) ) (!  (=> (and (and (<= 0 j) (< j k@@1)) (< k@@1 i@1)) (not (= (select a j) (select a k@@1))))
 :qid |onedupli.20:26|
 :skolemid |4|
)))) :lblneg @1043))))))))))
(let ((anon6_Else_correct  (=> (! (and %lbl%+250 true) :lblpos +250) (=> (select occs (select a i)) (=> (and (and (= d@0 (select a i)) (= d@1 d@0)) (and (= occs@1 occs) (= i@1 i))) GeneratedUnifiedExit_correct)))))
(let ((anon6_Then_correct  (=> (! (and %lbl%+248 true) :lblpos +248) (=> (and (not (select occs (select a i))) (= occs@0 (store occs (select a i) true))) (=> (and (and (= i@0 (+ i 1)) (= d@1 d)) (and (= occs@1 occs@0) (= i@1 i@0))) GeneratedUnifiedExit_correct)))))
(let ((anon5_Else_correct  (=> (! (and %lbl%+240 true) :lblpos +240) (=> (and (and (< i n) (< d 0)) (and (=> bad@0 bad) (=> bad bad@0))) (and anon6_Then_correct anon6_Else_correct)))))
(let ((anon5_Then_correct  (=> (! (and %lbl%+238 true) :lblpos +238) (=> (not (and (< i n) (< d 0))) (=> (and (=> bad@0 true) (=> true bad@0)) (and anon6_Then_correct anon6_Else_correct))))))
(let ((anon0_correct  (=> (! (and %lbl%+427 true) :lblpos +427) (=> (and (> n 0) (forall ((i@@0 Int) ) (!  (=> (and (<= 0 i@@0) (< i@@0 n)) (>= (select a i@@0) 0))
 :qid |onedupli.11:20|
 :skolemid |0|
))) (=> (and (and (and (<= 0 i) (<= i n)) (=> (>= d 0) (select occs (select a i)))) (and (forall ((k@@2 Int) ) (!  (=> (and (<= 0 k@@2) (< k@@2 i)) (select occs (select a k@@2)))
 :qid |onedupli.14:20|
 :skolemid |1|
)) (forall ((j@@0 Int) (k@@3 Int) ) (!  (=> (and (and (<= 0 j@@0) (< j@@0 k@@3)) (< k@@3 i)) (not (= (select a j@@0) (select a k@@3))))
 :qid |onedupli.15:20|
 :skolemid |2|
)))) (and anon5_Then_correct anon5_Else_correct))))))
anon0_correct))))))
))
(get-info :name)
(check-sat)
(get-info :name)
(pop 1)
; Valid
