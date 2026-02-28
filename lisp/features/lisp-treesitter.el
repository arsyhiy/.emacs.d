(use-package treesit-auto
  :straight t
  :ensure t
  :config
  (treesit-auto-add-to-auto-mode-alist)
  (global-treesit-auto-mode))


(provide 'lisp-treesitter)
