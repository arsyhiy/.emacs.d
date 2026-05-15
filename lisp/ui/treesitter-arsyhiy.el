;;; treesitter-arsyhiy.el --- treesitter support -*- lexical-binding: t; -*-

(use-package treesit-auto
  :ensure t
  :straight t
  :custom
  (treesit-auto-install t)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode t))

;; временный хак в будущем удалить его
(setq treesit-language-source-alist
      '((c   "https://github.com/tree-sitter/tree-sitter-c" "v0.23.2")
        (cpp "https://github.com/tree-sitter/tree-sitter-cpp" "v0.23.2")))
(provide 'treesitter-arsyhiy)
;;; treesitter-arsyhiy.el ends here
