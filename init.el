;;; -*- coding: utf-8; lexical-binding: t; -*-

;; adding all directories in lisp into load-path automatically
(let ((default-directory (expand-file-name "lisp/" user-emacs-directory)))
  (normal-top-level-add-subdirs-to-load-path))

;; ────── Ui ──────

(require 'fonts)  ; ui/fonts.el
(require 'themes) ; ui/themes.el
(require 'dashboard)	
(require 'gui)
(require 'modeline)
 

;; settings

(require 'lisp-defaults)
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
(require 'lisp-general)
(require 'lisp-rainbow-delimiters)
(require 'lisp-which-key)
(require 'lisp-evil)
(require 'lisp-treemacs)
(require 'lisp-terminal)

;; modes

(require 'lisp-lsp)	
(require 'lisp-org)	
(require 'lisp-minimodes) 
(require 'lisp-python)
(require 'lisp-cc)
(require 'lisp-go)
(require 'lisp-javascript)
(require 'lisp-minimal)
(require 'lisp-web)

