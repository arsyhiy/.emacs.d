;;; arsyhiy-tree-sitter.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 
;;; NOTE: rewrie tree-sitter config in more right way

(straight-use-package 'tree-sitter)
(straight-use-package 'tree-sitter-langs)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(provide 'arsyhiy-tree-sitter)
;;; arsyhiy-tree-sitter.el ends here
