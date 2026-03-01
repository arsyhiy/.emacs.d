
(use-package typescript-ts-mode
  :straight t
  :ensure nil
  :hook (typescript-ts-mode . eglot-ensure))

(use-package typescript-mode
  :straight t
  :mode ("\\.ts\\'" . typescript-mode)
  :init
  ;; на случай если :mode не сработает
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
  :config
  (setq typescript-indent-level 2))


(use-package web-mode
  :straight t
  :ensure t
  :mode "\\.tsx\\'"
  :config
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-quoting t)
  (setq web-mode-enable-auto-opening t)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2))

(provide 'lisp-javascript)
