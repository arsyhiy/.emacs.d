(use-package emacs
  :custom
  (when (>= emacs-major-version 29)
  (pixel-scroll-precision-mode 1))
  (show-help-function nil)    ; No help text
  (use-file-dialog nil)       ; No file dialog
  (use-dialog-box nil)        ; No dialog box
  (pop-up-windows nil)       ; No popup windows
  (menu-bar-mode nil)         ;; Disable the menu bar
  (tool-bar-mode nil)         ;; Disable the tool bar
  ;;(inhibit-startup-screen t)  ;; Disable welcome screen
  (scroll-bar-mode nil)                    ; No scroll bars
  (delete-selection-mode t)   ;; Select text and delete it by typing.
  (electric-indent-mode nil)  ;; Turn off the weird indenting that Emacs does by default.
  (electric-pair-mode t)      ;; Turns on automatic parens pairing
  (select-enable-clipboard t) ; Merge system's and Emacs' clipboard
  (blink-cursor-mode t)     ;; Don't blink cursor
  (global-auto-revert-mode t) ;; Automatically reload file and show changes if the file has changed

  ;;(dired-kill-when-opening-new-dired-buffer t) ;; Dired don't create new buffer
  ;;(recentf-mode t) ;; Enable recent file mode

  ;;(global-visual-line-mode t)           ;; Enable truncated lines
  ;;(display-line-numbers-type 'relative) ;; Relative line numbers
  (global-display-line-numbers-mode t)  ;; Display line numbers

  (mouse-wheel-progressive-speed t) ;; Disable progressive speed when scrolling
  (scroll-conservatively 10) ;; Smooth scrolling
  ;;(scroll-margin 8)

  (tab-width 2)
  (setq-default indent-tabs-mode nil)

  (make-backup-files nil) ;; Stop creating ~ backup files
  (auto-save-default nil) ;; Stop creating # auto save files
  :hook
  (prog-mode . (lambda () (hs-minor-mode t))) ;; Enable folding hide/show globally
  :config
  ;; Move customization variables to a separate file and load it, avoid filling up init.el with unnecessary variables
  (setq custom-file (locate-user-emacs-file "custom-vars.el"))
  (load custom-file 'noerror 'nomessage)
  :bind (
           ([escape] . keyboard-escape-quit) ;; Makes Escape quit prompts (Minibuffer Escape)
           )
  ;; Fix general.el leader key not working instantly in messages buffer with evil mode
  ;;:ghook ('after-init-hook
  ;;        (lambda (&rest _)
  ;;          (when-let ((messages-buffer (get-buffer "*Messages*")))
  ;;          (with-current-buffer messages-buffer
  ;;          (evil-normalize-keymaps))))
  ;;          nil nil t)
)

(provide 'arsyhiy-good-defaults)
