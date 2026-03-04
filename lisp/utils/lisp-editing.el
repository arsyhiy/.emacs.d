;;; lisp-editing.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 

(defun lisp-edit ()
)

(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(defun lisp-utf8 ()
	(set-default-coding-systems 'utf-8)
	(set-language-environment "UTF-8")
	(prefer-coding-system 'utf-8)
	(set-terminal-coding-system 'utf-8))

(lisp-utf8)
(lisp-edit)

(provide 'lisp-editing)
;;; lisp-editing.el ends here
