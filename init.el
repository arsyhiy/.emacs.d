;; -*- coding: utf-8; lexical-binding: t -*-

;; later i need to move this somelse here...
;; use-package (require 'use-package-ensure) ;; Load use-package-always-ensure (setq use-package-always-ensure t) ;; Always ensures that a package is installed
(setq package-archives '(("melpa" . "https://melpa.org/packages/") ;; Sets default package repositories
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/"))) ;; For Eat Terminal

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; load
(add-to-list 'load-path "~/.emacs.d/arsyhiy/features/")
(add-to-list 'load-path "~/.emacs.d/arsyhiy/preferences/")
(add-to-list 'load-path "~/.emacs.d/arsyhiy/setup/")
(add-to-list 'load-path "~/.emacs.d/arsyhiy/theme/")




;; features

(require 'arsyhiy-evil)
;;(require 'arsyhiy-company)
(require 'arsyhiy-performance)
(require 'arsyhiy-utils)
(require 'arsyhiy-orderless)
(require 'arsyhiy-vertico)
(require 'arsyhiy-consult)
(require 'arsyhiy-which-key)
(require 'arsyhiy-rainbow-delimiters)
(require 'arsyhiy-flycheck)
(require 'arsyhiy-tree-sitter)
(require 'arsyhiy-python)
(require 'arsyhiy-cc-mode)
(require 'arsyhiy-go-mode)
(require 'arsyhiy-lsp-mode)
(require 'arsyhiy-org-mode)
(require 'arsyhiy-projectile)
(require 'arsyhiy-modeline)
(require 'arsyhiy-magit)
(require 'arsyhiy-diff-hl)
(require 'arsyhiy-treemacs)

;; setup
(require 'arsyhiy-interface)
(require 'arsyhiy-dashboard)
(require 'arsyhiy-nerd-icons)
(require 'arsyhiy-fonts)
(require 'arsyhiy-good-defaults)
(require 'arsyhiy-general)
(require 'arsyhiy-corfu)






;;theme
(require 'arsyhiy-theme)

