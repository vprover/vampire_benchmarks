(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T)))))
(assert (exists ((y12244 T) (y12245 T) (y12246 T) (y12247 T) (y12257 T) (y12256 T) (y12255 T) (y12252 T) (y12259 T) (y12254 T) (y12251 T) (y12268 T) (y12249 T) (y12258 T) (y12250 T) (y12262 T) (y12260 T) (y12261 T) (y12267 T) (y12264 T)) (forall ((x12272 T) (x12273 T) (x12271 T) (x12276 T) (x12277 T) (x12274 T) (x12275 T) (x12278 T)) 
  (or 
    (and (= y12244 (f2 y12245)) (= y12245 (f2 y12246)) (= y12246 (f2 y12247)) (= y12247 (f2 y12244))) 
    (and (= x12273 (f1 (f1 x12273 x12276 x12276) y12249 x12276)) (= y12249 (f2 y12250)) (= y12250 (f3 y12251)) (= y12251 (f1 y12252 x12276 x12276)) (= y12252 (f3 x12273))) 
    (and (= x12277 (f2 y12254)) (= y12254 (f1 x12277 x12277 x12276))) 
    (and (= y12255 (f2 y12256)) (= y12256 (f3 y12257)) (= y12257 (f1 y12258 (f3 x12276) (f3 x12276))) (= y12258 (f3 y12255))) 
    (and (= y12259 (f1 y12260 x12276 (f2 x12276))) (= y12260 x12275) (= y12261 (f2 y12259))) 
    (and (= y12262 (f3 x12271)) (= x12271 (f2 y12264)) (= y12264 (f3 y12262))) (= x12274 (f1 x12274 x12274 x12276)) (= x12278 x12272) 
    (and (= y12267 (f2 y12268)) (= y12268 (f3 y12267)))))))
(check-sat)
