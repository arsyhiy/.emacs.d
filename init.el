;; -*- coding: utf-8; lexical-binding: t -*-

;; Paths & packages
(add-to-list 'load-path "~/.emacs.d/lisp/features/")
(add-to-list 'load-path "~/.emacs.d/lisp/ui/appearance")
(add-to-list 'load-path "~/.emacs.d/lisp/ui/themes/")
(add-to-list 'load-path "~/.emacs.d/lisp/modes/")
(add-to-list 'load-path "~/.emacs.d/lisp/settings")
(add-to-list 'load-path "~/.emacs.d/lisp/utils")

;; ui

(require 'lisp-themes)
(require 'lisp-dashboard)	
(require 'lisp-fonts)
(require 'lisp-gui)

;; settings

(require 'defaults)
(require 'lisp-performance)

;; utils

(require 'lisp-utils)     
(require 'lisp-editing)

;; features

(require 'lisp-magit)   
(require 'lisp-completion)	 
(require 'lisp-orderless)
(require 'lisp-diff-hl)             
(require 'lisp-flycheck)
;;(require 'lisp-general) rewrite this
(require 'lisp-rainbow-delimiters)
(require 'lisp-which-key)

;; modes

(require 'lisp-lsp)	
(require 'lisp-org)	
(require 'lisp-minimodes) 
(require 'lisp-python)
(require 'lisp-cc)
(require 'lisp-go)
