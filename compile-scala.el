;;; package -- None
;;; Commentary: Compiles and executes scala file
;; How to: Execute the command `send-scala-to-term' in a .scala buffer
;; Dependencies: `multi-term'

;;; Code:

(require 'multi-term)

(defvar scala-file) ;; Avoids free variable warning

(defun send-scala-to-term()
  (interactive)
  (setq scala-file (buffer-file-name (current-buffer)))
  (multi-term-dedicated-open)
  (multi-term-dedicated-select)
  (sleep-for 1)
  (term-send-raw-string (concat "scala " scala-file "\n")))

(provide 'compile-scala)
;;; compile-scala.el ends here
