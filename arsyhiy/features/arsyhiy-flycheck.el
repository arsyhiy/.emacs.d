;;; arsyhiy-flycheck.el --- Flycheck configuration -*- lexical-binding: t; -*-

(use-package flycheck
  :straight t
  :custom
  (flycheck-check-syntax-automatically '(save mode-enabled))
  :hook
  (after-init . global-flycheck-mode))

(provide 'arsyhiy-flycheck)
;;; arsyhiy-flycheck.el ends here
