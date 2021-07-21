;; Phaticusthiccy Emacs-Train @2021 
;; All Right Reserved

;; all the following are false. They all evaluate to nil
(if nil "yes" "no") ;  "no"
(if () "yes" "no") ;  "no"
(if '() "yes" "no") ;  "no"
(if (list) "yes" "no") ;  "no", because (list) eval to a empty list, same as ()

;; nil = false
;; t = true
