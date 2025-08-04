;;; arsyhiy-go.el --- mode for golang -*- coding: utf-8; lexical-binding: t -*-


;; rewrite this entiry file

  (use-package go-mode
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
