;;; arsyhiy-consult.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 
;;; NOTE: rewrie consult config in more right way

;; packages

(use-package consult
	:ensure t
	:defer t
  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
    register-preview-function #'consult-register-format)

    ;; Optionally tweak the register preview window.
    ;; This adds thin lines, sorting and hides the mode line of the window.
    (advice-add #'register-preview :override #'consult-register-window)

    ;; Use Consult to select xref locations with preview
    (setq xref-show-xrefs-function #'consult-xref
      xref-show-definitions-function #'consult-xref)
    :config
    ;; Optionally configure preview. The default value
    ;; is 'any, such that any key triggers the preview.
    ;; (setq consult-preview-key 'any)

    ;; (setq consult-preview-key "M-.")
    ;; (setq consult-preview-key '("S-<down>" "S-<up>"))

    ;; For some commands and buffer sources it is useful to configure the
    ;; :preview-key on a per-command basis using the `consult-customize' macro.
    ;; (consult-customize
    ;; consult-theme :preview-key '(:debounce 0.2 any)
    ;; consult-ripgrep consult-git-grep consult-grep
    ;; consult-bookmark consult-recent-file consult-xref
    ;; consult--source-bookmark consult--source-file-register
    ;; consult--source-recent-file consult--source-project-recent-file
    ;; :preview-key "M-."
    ;; :preview-key '(:debounce 0.4 any))

    ;; By default `consult-project-function' uses `project-root' from project.el.
    ;; Optionally configure a different project root function.
    ;; 1. project.el (the default)
    ;; (setq consult-project-function #'consult--default-project--function)
    ;; 2. vc.el (vc-root-dir)
    ;; (setq consult-project-function (lambda (_) (vc-root-dir)))
    ;; 3. locate-dominating-file
    ;; (setq consult-project-function (lambda (_) (locate-dominating-file "." ".git")))
    ;; 4. projectile.el (projectile-project-root)
    (autoload 'projectile-project-root "projectile")
    (setq consult-project-function (lambda (_) (projectile-project-root)))
    ;; 5. No project support
    ;; (setq consult-project-function nil)
)

(provide 'arsyhiy-consult)

;;; arsyhiy-consult.el ends here
