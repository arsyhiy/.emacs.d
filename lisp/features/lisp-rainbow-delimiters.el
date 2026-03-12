;; lisp-rainbow-delimiters.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 

;; packages

(use-package rainbow-delimiters
  :straight t
  :ensure t
  :defer t
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'lisp-rainbow-delimiters)
;; lisp-rainbow-delimiters.el ends here
