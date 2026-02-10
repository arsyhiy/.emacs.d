;;; arsyhiy-go.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 
;;; NOTE: rewrie go config in more right way

;; packages

  (use-package go-mode
    :straight t
    :ensure t
		:defer t
    :hook ((go-mode . lsp-deferred)
           (before-save . gofmt-before-save))
    :config
    (setq tab-width 4)
    (setq indent-tabs-mode 1)
  ;; Optional: set $GOPATH and $GOROOT if not set globally
)
    (add-hook 'go-mode-hook 'lsp-deferred)

(provide 'arsyhiy-go)
;;; arsyhiy-go.el ends here
