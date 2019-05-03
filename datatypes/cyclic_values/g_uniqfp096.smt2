(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T)))))
(assert (exists ((y10318 T) (y10319 T) (y10325 T) (y10326 T) (y10328 T) (y10310 T) (y10311 T) (y10312 T) (y10313 T) (y10314 T) (y10315 T) (y10316 T) (y10317 T) (y10323 T) (y10320 T) (y10322 T) (y10307 T) (y10306 T) (y10305 T) (y10304 T) (y10303 T) (y10302 T) (y10301 T) (y10324 T) (y10321 T) (y10327 T) (y10309 T) (y10308 T)) 
  (or 
    (and (= y10301 (f1 (f2 (f2 (f2 y10303))) (f1 (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) (= y10303 (f2 y10301)) (= y10302 (f1 y10304 (f1 (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) (= y10304 (f2 y10305)) (= y10305 (f2 y10306)) (= y10306 (f2 y10307)) (= y10307 (f2 y10302)) (distinct y10301 y10302)) 
    (and (= y10308 (f1 y10310 PLACEHOLDER)) (= y10310 (f1 y10311 (f2 PLACEHOLDER))) (= y10311 (f2 y10308)) (= y10309 (f1 y10312 PLACEHOLDER)) (= y10312 (f1 y10313 (f2 PLACEHOLDER))) (= y10313 (f2 y10309)) (distinct y10308 y10309)) 
    (and (= y10314 (f1 (f2 y10314) PLACEHOLDER)) (= y10315 (f1 y10316 PLACEHOLDER)) (= y10316 (f2 y10315)) (distinct y10314 y10315)) 
    (and (= y10317 (f2 y10319)) (= y10319 (f1 y10320 (f1 PLACEHOLDER PLACEHOLDER))) (= y10320 (f2 y10317)) (= y10318 (f2 y10321)) (= y10321 (f1 y10322 (f1 PLACEHOLDER PLACEHOLDER))) (= y10322 (f2 y10318)) (distinct y10317 y10318)) 
    (and (= y10323 (f2 y10325)) (= y10325 (f1 y10323 PLACEHOLDER)) (= y10324 (f2 y10326)) (= y10326 (f1 y10324 PLACEHOLDER)) (distinct y10323 y10324)) 
    (and (= y10327 (f2 y10327)) (= y10328 (f2 y10328)) (distinct y10327 y10328)))))
(check-sat)
