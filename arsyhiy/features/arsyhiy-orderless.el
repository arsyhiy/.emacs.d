;;; arsyhiy-modeline.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 
;;; NOTE: rewrie orderless config in more right way

;; packages

(use-package orderless
	:ensure t 
	:defer t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))
(provide 'arsyhiy-orderless)
;;; arsyhiy-orderless.el ends here
