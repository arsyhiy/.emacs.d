;;; arsyhiy-rainbow-delimiters.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 
;;; NOTE: rewrie rainbow-delimiters config in more right way

;; packages

(use-package rainbow-delimiters
    :straight t
	:ensure t
	:defer t
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'arsyhiy-rainbow-delimiters)

;;; arsyhiy-rainbow-delimiters.el ends here
