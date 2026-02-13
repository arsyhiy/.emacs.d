;; -*- coding: utf-8; lexical-binding: t -*-

;; Paths & packages

(add-to-list 'load-path "~/.emacs.d/lisp/features/")
(add-to-list 'load-path "~/.emacs.d/lisp/ui/appearance")
(add-to-list 'load-path "~/.emacs.d/lisp/ui/themes/")
(add-to-list 'load-path "~/.emacs.d/lisp/modes/")
(add-to-list 'load-path "~/.emacs.d/lisp/settings")
(add-to-list 'load-path "~/.emacs.d/lisp/utils")


;; ui

(require 'arsyhiy-themes)
(require 'arsyhiy-dashboard)	
(require 'arsyhiy-fonts)
(require 'arsyhiy-gui)


;; settings

(require 'defaults)
(require 'arsyhiy-performance)


;; utils

(require 'arsyhiy-utils)     
(require 'arsyhiy-editing)


;; features

(require 'arsyhiy-magit)   
(require 'arsyhiy-completion)	 
(require 'arsyhiy-orderless)
(require 'arsyhiy-diff-hl)             
(require 'arsyhiy-flycheck)
;;(require 'arsyhiy-general) rewrite this
(require 'arsyhiy-rainbow-delimiters)
(require 'arsyhiy-which-key)


;; modes

(require 'arsyhiy-lsp)	
(require 'arsyhiy-org)	
(require 'arsyhiy-minimodes) 
(require 'arsyhiy-python)
(require 'arsyhiy-cc)
(require 'arsyhiy-go)

