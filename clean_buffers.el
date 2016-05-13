;;; package -- None
;;; Commentary:

;;; Code:
(defun clean-buffers() "Kills oll buffers except `scratch' and `Messages'"
       (interactive)
       (yes-or-no-p "Do you really want to clean all buffers? ")
       (let (buffer buffers)
         (setq buffers (buffer-list))
         (dotimes (i (length buffers))
           (setq buffer (pop buffers))
           (if (not (string-equal (buffer-name buffer) "*scratch*"))
               (kill-buffer buffer)
             (message "Not killing!")))))

(provide 'clean_buffers)
;;; clean_buffers.el ends here
