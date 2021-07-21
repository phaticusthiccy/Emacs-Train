;; Phaticusthiccy Emacs-Train @2021 
;; All Right Reserved

(setq x 0)

(while (< x 4)
  (print (format "number is %d" x))
  (setq x (1+ x)))

;; inserts Unicode chars 32 to 126
(let ((x 32))
  (while (< x 127)
    (insert-char x)
    (setq x (+ x 1))))
