;;; lisp-magit.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 

(use-package magit
  :straight t
  :ensure t
  :defer t
  :commands magit-status)

(provide 'lisp-magit)
;;; lisp-magit.el ends here
