;; -*- coding: utf-8; lexical-binding: t -*-

;; Paths & packages

(add-to-list 'load-path "~/.emacs.d/arsyhiy/features/")
(add-to-list 'load-path "~/.emacs.d/arsyhiy/preferences/")
(add-to-list 'load-path "~/.emacs.d/arsyhiy/setup/")
(add-to-list 'load-path "~/.emacs.d/arsyhiy/themes/")
(add-to-list 'load-path "~/.emacs.d/arsyhiy/mode/")

;; Features

(require 'arsyhiy-consult)
(require 'arsyhiy-corfu)
(require 'arsyhiy-diff-hl)
(require 'arsyhiy-editing)
(require 'arsyhiy-evil)
(require 'arsyhiy-flycheck)
(require 'arsyhiy-general)
(require 'arsyhiy-gui)
(require 'arsyhiy-magit)
(require 'arsyhiy-modeline)
(require 'arsyhiy-orderless)
(require 'arsyhiy-performance)
(require 'arsyhiy-projectile)
(require 'arsyhiy-rainbow-delimiters)
(require 'arsyhiy-tree-sitter)
(require 'arsyhiy-treemacs)
(require 'arsyhiy-utils)
(require 'arsyhiy-vertico)
(require 'arsyhiy-which-key)

;; setup

(require 'arsyhiy-dashboard)
(require 'arsyhiy-fonts)
(require 'arsyhiy-nerd-icons)

;;theme

(require 'arsyhiy-themes)

;; modes

(require 'arsyhiy-cc)
(require 'arsyhiy-go)
(require 'arsyhiy-lsp)
(require 'arsyhiy-org)
(require 'arsyhiy-minimodes)
(require 'arsyhiy-python)

;; preferences

(require 'arsyhiy-bars)
(require 'arsyhiy-bell)
(require 'arsyhiy-scratch)
