(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T)))))
(assert (exists ((y4288 T) (y4289 T) (y4291 T) (y4290 T) (y4293 T) (y4292 T) (y4286 T) (y4287 T) (y4284 T) (y4285 T) (y4295 T) (y4294 T)) 
  (or 
    (and (= y4284 (f1 y4286)) (= y4286 (f1 y4287)) (= y4287 (f1 y4284)) (= y4285 (f1 (f1 (f1 y4285)))) (distinct y4284 y4285)) 
    (and (= y4288 (f1 y4290)) (= y4290 (f1 y4288)) (= y4289 (f1 y4291)) (= y4291 (f1 y4289)) (distinct y4288 y4289)) 
    (and (= y4292 (f1 (f1 (f1 (f1 (f1 y4292)))))) (= y4293 (f1 (f1 (f1 y4294)))) (= y4294 (f1 y4295)) (= y4295 (f1 y4293)) (distinct y4292 y4293)))))
(check-sat)
