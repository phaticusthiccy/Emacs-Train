;; Phaticusthiccy Emacs-Train @2021 
;; All Right Reserved

(require 'calc-ext)

(defun calc-count-days (start-date end-date &optional absence-periods
                                   exclude-weekends?)
  "Return the number of days between START-DATE and END-DATE,
minus any days covered in one or more ABSENCE-PERIODS. Dates
should be entered a string such as \"YYYY, MM, DD\".
ABSENCE-PERIODS should be a given as a list of pairs like
\(\(START-ABSENCE-DATE END-ABSENCE-DATE\) ...\).
EXCLUDE-WEEKENDS? can be set to `t' to exclude weekend days from
the calculated number of days."
  (let ((date-sub-func (if exclude-weekends? #'calcFunc-bsub #'calcFunc-sub)))
    (defun eval-calc-date (calc-date-string)
      (calc-eval (concat "(date(" calc-date-string "))") 'raw))

    (defun eval-absence-periods (absence-periods)
      (mapcar (lambda (x)
                (list (eval-calc-date (car x))
                      (eval-calc-date (cadr x))))
              absence-periods))

    (defun calculate-absent-days (absences)
      (seq-reduce #'+
                  (mapcar (lambda (x)
                            (funcall date-sub-func (cadr x) (car x)))
                          absences)
                  0))

    (let* ((start (eval-calc-date start-date))
           (end (eval-calc-date end-date))
           (absences (eval-absence-periods absence-periods))
           (absent-days (calculate-absent-days absences)))
      (calc-eval "$ - $$" nil (funcall date-sub-func end start) absent-days))))

;; Days of presence in 2015
(calc-count-days "2015, 08, 14" "2015, 12, 25")
;; => 133 days

;; Days of presence in 2016
(calc-count-days "2016, 01, 05" "2016, 12, 31"
                  '(("2016, 10, 04" "2016, 10, 11")
                    ("2016, 12, 23" "2016, 12, 30")))
;; => 347 days

;; Days of presence in 2017
(calc-count-days "2017, 01, 01" "2017, 06, 10"
                 '(("2017, 03, 16" "2017, 04, 15")))
;; => 130 days

;; Days of work in 2015
(calc-count-days "2015, 08, 14" "2015, 12, 25" nil t)
;; => 95 days

;; Days of work in 2016
(calc-count-days "2016, 01, 05" "2016, 12, 31"
                  '(("2016, 10, 04" "2016, 10, 11")
                    ("2016, 12, 23" "2016, 12, 30")) t)
;; => 249
