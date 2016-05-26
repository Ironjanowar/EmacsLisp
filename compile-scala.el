;;; compile-scala -- Do stuff with your scala files
;;; Commentary:
;; Compiles and executes scala file
;; How to: Execute the command `send-scala-to-term' in a .scala buffer
;; Dependencies: `multi-term'

;;; Code:

(require 'multi-term)
(require 'hydra)

(defun string-ends-with (string suffix)
  "Return t if STRING ends with SUFFIX ."
  (and (string-match (rx-to-string `(: ,suffix eos) t)
                     string)
       t))

(defun send-scala-to-term()
  (interactive)
  (let ((scala-file (buffer-file-name (current-buffer))))
    (if (string-ends-with scala-file ".scala")
        (progn
          (multi-term-dedicated-open)
          (multi-term-dedicated-select)
          (sleep-for 1)
          (term-send-raw-string (concat "scala " scala-file "\n")))
      (message "Not a Scala file"))))

(defun open-scala-REPL()
  (interactive)
  (multi-term-dedicated-open)
  (multi-term-dedicated-select)
  (sleep-for 1)
  (term-send-raw-string "scala\n"))

(if (lookup-key (current-global-map) "\C-c\C-s")
    (message "You may bind 'send-scala-to-term' yourself")
  (global-set-key
   (kbd "C-c C-s")
   (defhydra hydra-window(:color green
                                 :columns 2
                                 :exit t)
     "Scala options"
     
     ("o" open-scala-REPL "Open Scala REPL")
     ("c" send-scala-to-term "Compile current Scala file in terminal")
     ("q" nil "Cancel"))))

(provide 'compile-scala)
;;; compile-scala.el ends here
