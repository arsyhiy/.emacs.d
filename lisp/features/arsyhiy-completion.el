;;; arsyhiy-completion.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: convenience, completion, corfu, vertico, consult

;; Commentary:

;; no comment

;; Code 
;;; NOTE: rewrie completion config in more right way

;; packages

(use-package corfu
  :straight t
	:ensure t
	:defer t
  ;; Optional customizations
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  (corfu-auto-prefix 2)          ;; Minimum length of prefix for auto completion.
  (corfu-popupinfo-mode t)       ;; Enable popup information
  (corfu-popupinfo-delay 0.5)    ;; Lower popupinfo delay to 0.5 seconds from 2 seconds
  (corfu-separator ?\s)          ;; Orderless field separator, Use M-SPC to enter separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin
     (completion-ignore-case t)
  ;; Enable indentation+completion using the TAB key.
  ;;`completion-at-point' is often bound to M-TAB.
  (tab-always-indent 'complete)
  (corfu-preview-current nil) ;; Don't insert completion without confirmation
  ;; Recommended: Enable Corfu globally.  This is recommended since Dabbrev can
  ;; be used globally (M-/).  See also the customization variable
  ;; `global-corfu-modes' to exclude certain modes.
  :init
  (global-corfu-mode))

  (use-package nerd-icons-corfu
  :straight t
		:ensure t
		:defer t 
    :after corfu
    :init (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))



(use-package vertico
  :straight t
	:ensure t
	:defer t 
  :init
  (vertico-mode))

  (savehist-mode) ;; Enables save history mode

  (use-package marginalia

    :straight t
  
		:ensure t 
		:defer t
    :after vertico
    :init
    (marginalia-mode))

  (use-package nerd-icons-completion
    :straight t
		:defer t
		:ensure t
    :after marginalia
    :config
    (nerd-icons-completion-mode)
    :hook
    ('marginalia-mode-hook . 'nerd-icons-completion-marginalia-setup))


(use-package consult

    :straight t
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


(provide 'arsyhiy-completion)
;;; arsyhiy-consult.el ends here
