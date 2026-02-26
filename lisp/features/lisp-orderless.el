;;; lisp-orderless.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 

;; packages

(use-package orderless
  :defer t 
  :straight t
  :ensure t 
  :defer t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(provide 'lisp-orderless)
;;; lisp-orderless.el ends here
