;;; org-utils.el --- convinient functions for org mode -*- lexical-binding: t; -*-

;;; Commentary:

;;; code:

(defun add-todo()
  "Add todo with deadline."
  (interactive)

  (let ((todo (read-string "TODO: "))
        (deadline (read-string "deadline: "))
        (file "~/NOTES/orgfiles/todo.org"))
    (with-current-buffer (find-file-noselect file)
      (goto-char (point-max))
      (insert "\n* TODO " todo) ;; exmaple * TODO do the thing godamit!
      (insert "\n DEADLINE: " "<" deadline ">") ;; example: DEADLINE: <2026-05-17>
      (save-buffer)))

 )

(provide 'org-utils.el)
;;; org-utils.el ends here
