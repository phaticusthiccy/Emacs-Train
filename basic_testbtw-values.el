;; Phaticusthiccy Emacs-Train @2021 
;; All Right Reserved

;; test if two values have the same datatype and value.

(equal 3 3) ;  t
(equal 3.0 3.0) ;  t

(equal 3 3.0) ;  nil. Because datatype doesn't match.

;; test equality of lists
(equal '(3 4 5) '(3 4 5))  ;  t
(equal '(3 4 5) '(3 4 "5")) ;  nil

;; test equality of strings
(equal "e" "e") ;  t

;; test equality of symbols
(equal 'abc 'abc) ;  t
