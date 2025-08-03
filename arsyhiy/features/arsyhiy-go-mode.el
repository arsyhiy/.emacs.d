;; -*- coding: utf-8; lexical-binding: t -*-
(use-package go-mode
  :ensure t
  :hook ((go-mode . lsp-deferred)
         (before-save . gofmt-before-save))
  :config
  (setq tab-width 4)
  (setq indent-tabs-mode 1)
  ;; Optional: set $GOPATH and $GOROOT if not set globally
)

(provide 'arsyhiy-go-mode)

;;; arsyhiy-go-mode.el ends here
