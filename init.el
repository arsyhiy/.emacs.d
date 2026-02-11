;; -*- coding: utf-8; lexical-binding: t -*-

;; Paths & packages

(add-to-list 'load-path "~/.emacs.d/lisp/features/")
(add-to-list 'load-path "~/.emacs.d/lisp/preferences/")
(add-to-list 'load-path "~/.emacs.d/lisp/ui/appearance")
(add-to-list 'load-path "~/.emacs.d/lisp/ui/themes/")
(add-to-list 'load-path "~/.emacs.d/lisp/mode/")
(add-to-list 'load-path "~/.emacs.d/lisp/settings")
(add-to-list 'load-path "~/.emacs.d/lisp/utils")
;; Features

;;(require 'arsyhiy-diff-hl)
;;(require 'arsyhiy-editing)
;;(require 'arsyhiy-evil)
;;(require 'arsyhiy-flycheck)
;;(require 'arsyhiy-general)
(require 'arsyhiy-gui)
(require 'arsyhiy-magit)
;;(require 'arsyhiy-modeline)
;;(require 'arsyhiy-orderless)
(require 'arsyhiy-performance)
;;(require 'arsyhiy-projectile)
;;(require 'arsyhiy-rainbow-delimiters)
;;(require 'arsyhiy-tree-sitter)
;;(require 'arsyhiy-treemacs)
(require 'arsyhiy-utils)
;;(require 'arsyhiy-which-key)
(require 'arsyhiy-completion)

;; setup

(require 'arsyhiy-dashboard)
(require 'arsyhiy-fonts)
;;(require 'arsyhiy-nerd-icons)

;;theme

(require 'arsyhiy-themes)

;; modes

;;(require 'arsyhiy-cc)
;;(require 'arsyhiy-go)
(require 'arsyhiy-lsp)
(require 'arsyhiy-org)
;;(require 'arsyhiy-minimodes)
;;(require 'arsyhiy-python)
;;(require 'arsyhiy-dap)
;; preferences

;; settings

(require 'defaults)

