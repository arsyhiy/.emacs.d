;; -*- coding: utf-8; lexical-binding: t -*-

(straight-use-package 'tree-sitter)
(straight-use-package 'tree-sitter-langs)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)


(provide 'arsyhiy-tree-sitter)
;;; arsyhiy-tree-sitter.el ends here
