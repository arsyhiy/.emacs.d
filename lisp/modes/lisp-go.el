;;; lisp-go.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 

;; packages

(use-package go-mode
  :defer 
  :straight t
  :ensure t
  :defer t
  :hook ((go-mode . lsp-deferred)
         (before-save . gofmt-before-save))
  :config
  (setq tab-width 4)
  (setq indent-tabs-mode 1))

(add-hook 'go-mode-hook 'lsp-deferred)

(provide 'lisp-go)
;;; lisp-go.el ends here
