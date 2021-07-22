;; Phaticusthiccy Emacs-Train @2021 
;; All Right Reserved

(replace-regexp-in-string "Thiccy" "Phaticusthiccy" "Hi, I Am Thiccy")
;;; ("Hi I Am Phaticusthiccy")

(require 'dired)
(dired-replace-in-string "x" "17" "I Am x Years Old.")
;;; ("I Am 17 Years Old.")

;; First argument can be a RegExp ;; foo+ / foo?(.*) / foo$ etc.
