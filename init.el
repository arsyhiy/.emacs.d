;;; -*- coding: utf-8; lexical-binding: t; -*-

;; adding all directories in lisp into load-path automatically
(let ((default-directory (expand-file-name "lisp/" user-emacs-directory)))
  (normal-top-level-add-subdirs-to-load-path))

;; ────── Ui ──────

(require 'fonts)              ; ui/fonts.el
(require 'themes)             ; ui/themes.el
(require 'dashboard)          ; ui/dashboard.el	
(require 'gui)                ; ui/gui.el
(require 'modeline)           ; ui/modeline.el
(require 'nerd-icons)         ; ui/nerd-icons.el
(require 'rainbow-delimiters) ; ui/rainbow-delimiters.el
(require 'hl-todo)            ; ui/hl-todo.el
(require 'diff-hl)            ; ui/diff-hl 

;; settings

(require 'lisp-defaults)
(require 'lisp-performance)

;; ────── Utils ──────

(require 'utils)     
(require 'editing)

;; features

(require 'lisp-magit)   
(require 'lisp-completion)	 
(require 'lisp-orderless)
(require 'lisp-flycheck)
(require 'lisp-general)
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

