;;; lisp-treesitter.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 

;; packages

(setq treesit-language-source-alist
      '((typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (tsx        "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript")
        (json       "https://github.com/tree-sitter/tree-sitter-json")
        (html       "https://github.com/tree-sitter/tree-sitter-html")
        (css        "https://github.com/tree-sitter/tree-sitter-css")
        (c          "https://github.com/tree-sitter/tree-sitter-c")
        (cpp        "https://github.com/tree-sitter/tree-sitter-cpp")))

(use-package treesit-auto
  :ensure t
  :init
  (setq treesit-auto-install t)
  :config
  (global-treesit-auto-mode))

(setq treesit-font-lock-level 4)
(setq treesit-extra-load-path nil)

(provide 'lisp-treesitter)
;;; lisp-treesitter.el ends here
