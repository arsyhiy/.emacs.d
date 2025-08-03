;; -*- coding: utf-8; lexical-binding: t -*-
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  (add-hook 'after-init-hook #'global-flycheck-mode)
  :hook (go-mode . flycheck-mode))

(provide 'arsyhiy-flycheck)

;;; arsyhiy-flycheck.el ends here
