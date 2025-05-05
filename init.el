;; The default is 800 kilobytes. Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
;; Increase the amount of data which Emacs reads from the process
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(setq
 globals--leader-key   "<SPC>"                    ; Leader prefix key used for most bindings
 )

(global-set-key (kbd "RET") 'newline-and-indent)

;;(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; (start/hello)

(setq-default
  inhibit-startup-screen t               ; Disable start-up screen
  inhibit-startup-message t              ; Disable startup message
  inhibit-startup-echo-area-message t)    ; Disable initial echo message

(defun open-config-file ()
  (interactive)
  (find-file (expand-file-name "config.org" user-emacs-directory)))

(defun start/org-babel-tangle-config ()
  "Automatically tangle our Emacs.org config file when we save it. Credit to Emacs From Scratch for this one!"
  (when (string-equal (file-name-directory (buffer-file-name))
                      (expand-file-name user-emacs-directory))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'start/org-babel-tangle-config)))

(set-default-coding-systems 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)

(use-package emacs
  :bind
  ("C-+" . text-scale-increase)
  ("C--" . text-scale-decrease)
  ("<C-wheel-up>" . text-scale-increase)
  ("<C-wheel-down>" . text-scale-decrease))

;;(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'use-package-ensure) ;; Load use-package-always-ensure
(setq use-package-always-ensure t) ;; Always ensures that a package is installed
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

(use-package corfu
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
    :after corfu
    :init (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package vertico
  :init
  (vertico-mode))

  (savehist-mode) ;; Enables save history mode

  (use-package marginalia
    :after vertico
    :init
    (marginalia-mode))

  (use-package nerd-icons-completion
    :after marginalia
    :config
    (nerd-icons-completion-mode)
    :hook
    ('marginalia-mode-hook . 'nerd-icons-completion-marginalia-setup))

(use-package consult
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

(use-package which-key
  :init
  (which-key-mode 1)
  :diminish
  :custom
  (which-key-side-window-location 'bottom)
  (which-key-sort-order #'which-key-key-order-alpha) ;; Same as default, except single characters are sorted alphabetically
  (which-key-sort-uppercase-first nil)
  (which-key-add-column-padding 1) ;; Number of spaces to add to the left of each column
  (which-key-min-display-lines 6)  ;; Increase the minimum lines to display, because the default is only 1
  (which-key-idle-delay 0.8)       ;; Set the time delay (in seconds) for the which-key popup to appear
  (which-key-max-description-length 25)
  (which-key-allow-imprecise-window-fit nil)) ;; Fixes which-key window slipping out in Emacs Daemon

(use-package evil
  :init ;; Execute code Before a package is loaded
  (evil-mode)
  :config ;; Execute code After a package is loaded
  :custom ;; Customization of package custom variables
  (evil-want-keybinding nil)    ;; Disable evil bindings in other modes (It's not consistent and not good)
  (evil-want-C-u-scroll t)      ;; Set C-u to scroll up
  (evil-want-C-i-jump nil)      ;; Disables C-i jump
  (evil-undo-system 'undo-redo) ;; C-r to redo
  (org-return-follows-link t)   ;; Sets RETURN key in org-mode to follow links
  ;; Unmap keys in 'evil-maps. If not done, org-return-follows-link will not work
  :bind (:map evil-motion-state-map
              ("SPC" . nil)
              ("RET" . nil)
              ("TAB" . nil)))
(use-package evil-collection
  :after evil
  :config
  ;; Setting where to use evil-collection
  (setq evil-collection-mode-list '(dired ibuffer magit corfu vertico consult))
  (evil-collection-init))

(mapc (lambda (mode)
        (evil-set-initial-state mode 'emacs)) '(elfeed-show-mode
                                                elfeed-search-mode
                                                forge-pullreq-list-mode
                                                forge-topic-list-mode
                                                dired-mode
                                                dashboard-mode
                                                tide-references-mode
                                                image-dired-mode
                                                image-dired-thumbnail-mode
                                                eww-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package company
  :straight
  :defer 2
  :diminish
  :custom
  (company-begin-commands '(self-insert-command))

  ;; This is one of the values (together with company-idle-delay),
  ;; based on which Company auto-stars looking up completion candidates. 
  ;; This option configures how many characters have to be typed in by a user before candidates start to be collected and displayed.
  ;; An often choice nowadays is to configure this option to a lower number than the default value of 3. 
  (company-minimum-prefix-length 1)

  ;; This is the second of the options that configure Company’s auto-start behavior (together with company-minimum-prefix-length).
  ;; The value of this option defines how fast Company is going to react to the typed input,
  ;; such that setting company-idle-delay to 0 makes Company react immediately, nil disables auto-starting,
  ;; and a larger value postpones completion auto-start for that number of seconds. For an even fancier setup,
  ;; set this option value to a predicate function, as shown in the following example: 
  (company-idle-delay 0)

  (company-show-numbers t)

  ;; This option allows to specify in which major modes company-mode can be enabled by (global-company-mode).
  ;; The default value of t enables Company in all major modes.
  ;; Setting company-global-modes to nil equal in action to toggling off global-company-mode.
  ;; Providing a list of major modes results in having company-mode enabled in the listed modes only.
  (global-company-mode t)
                
  ;; An annotation is a string that carries additional information about a candidate; such as a data type, function arguments,
  ;; or whatever a backend appoints to be a valuable piece of information about a candidate. By default,
  ;; the annotations are shown right beside the candidates. Setting the option value to t aligns annotations to the right side of the tooltip 
  (company-tooltip-align-annotations t)           

  ;; Controls the maximum number of the candidates shown simultaneously in the tooltip (the default value is 10).
  ;; When the number of the available candidates is larger than this option’s value, Company paginates the results. 
  (company-tooltip-limit 4)    
)

(use-package company-box
  :after company
  :diminish
  :hook (company-mode . company-box-mode))

(use-package flycheck
 :ensure t
 :init (global-flycheck-mode)
(add-hook 'after-init-hook #'global-flycheck-mode))

(use-package general
  :config
  (general-evil-setup)
  ;; Set up 'SPC' as the leader key
  (general-create-definer start/leader-keys
    :states '(normal insert visual motion emacs)
    :keymaps 'override
    :prefix "SPC"           ;; Set leader key
    :global-prefix "C-SPC") ;; Set global leader key

    (start/leader-keys
      "." '(find-file :wk "Find file")
      "TAB" '(comment-line :wk "Comment lines")
      "p" '(projectile-command-map :wk "Projectile command map"))

    (start/leader-keys
      "f" '(:ignore t :wk "Find")
      "f c" '((lambda () (interactive) (find-file "~/.config/emacs/config.org")) :wk "Edit emacs config")
      "f r" '(consult-recent-file :wk "Recent files")
      "f f" '(consult-fd :wk "Fd search for files")
      "f g" '(consult-ripgrep :wk "Ripgrep search in files")
      "f l" '(consult-line :wk "Find line")
      "f i" '(consult-imenu :wk "Imenu buffer locations"))

    (start/leader-keys
      "b" '(:ignore t :wk "Buffer Bookmarks")
      "b b" '(consult-buffer :wk "Switch buffer")
      "b k" '(kill-this-buffer :wk "Kill this buffer")
       
      "b i" '(ibuffer :wk "Ibuffer")
      "b n" '(next-buffer :wk "Next buffer")
      "b p" '(previous-buffer :wk "Previous buffer")
      "b r" '(revert-buffer :wk "Reload buffer")
      "b j" '(consult-bookmark :wk "Bookmark jump"))

    (start/leader-keys
      "d" '(:ignore t :wk "Dired")
      "d v" '(dired :wk "Open dired")
      "d j" '(dired-jump :wk "Dired jump to current"))

    (start/leader-keys
      "g" '(:ignore t :wk "Git")
      "g g" '(magit-status :wk "Magit status"))
     
    (start/leader-keys
      "e" '(treemacs :wk "treemacs"))

    (start/leader-keys
      "h" '(:ignore t :wk "Help") ;; To get more help use C-h commands (describe variable, function, etc.)
      "h q" '(save-buffers-kill-emacs :wk "Quit Emacs and Daemon")
      "h r" '((lambda () (interactive)
              (load-file "~/.config/emacs/init.el"))
              :wk "Reload Emacs config"))

    (start/leader-keys
      "s" '(:ignore t :wk "Show")
      "s e" '(eat :wk "Eat terminal"))

    (start/leader-keys
      "t" '(:ignore t :wk "Toggle")
      "t t" '(visual-line-mode :wk "Toggle truncated lines (wrap)")
      "t l" '(display-line-numbers-mode :wk "Toggle line numbers")))

(setq-default use-short-answers t                     ; Replace yes/no prompts with y/n
  confirm-nonexistent-file-or-buffer nil) ; Ok to visit non existent files

(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(use-package pyvenv)

(require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (package-initialize)

  (setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp
    projectile hydra flycheck company avy which-key helm-xref dap-mode))

  (when (cl-find-if-not #'package-installed-p package-selected-packages)
    (package-refresh-contents)
    (mapc #'package-install package-selected-packages))

  ;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details
  (helm-mode)
  (require 'helm-xref)
  (define-key global-map [remap find-file] #'helm-find-files)
  (define-key global-map [remap execute-extended-command] #'helm-M-x)
  (define-key global-map [remap switch-to-buffer] #'helm-mini)

  (which-key-mode)
  (add-hook 'c-mode-hook 'lsp)
  (add-hook 'c++-mode-hook 'lsp)
  (add-hook 'python-mode-hook 'lsp)
  (add-hook 'js-mode-hook 'lsp)

  (setq gc-cons-threshold (* 100 1024 1024)
        Read-process-output-max (* 1024 1024)
        treemacs-space-between-root-nodes nil
        company-idle-delay 0.0
        company-minimum-prefix-length 1
        lsp-idle-delay 0.1)  ;; clangd is fast

  (with-eval-after-load 'lsp-mode
    (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
    (require 'dap-cpptools)
    (yas-global-mode))

(use-package lsp-ui
  :ensure
  :commands lsp-ui-mode
  :custom
  ;;(display-time-mode t) ;;showing time on modeline
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-sideline-update-mode t))

(use-package org
  :ensure nil
  :custom
  (org-edit-src-content-indentation 4) ;; Set src block automatic indent to 4 instead of 2.

  :hook
  (org-mode . org-indent-mode) ;; Indent text
  ;; The following prevents <> from auto-pairing when electric-pair-mode is on.
  ;; Otherwise, org-tempo is broken when you try to <s TAB...
  ;;(org-mode . (lambda ()
  ;;              (setq-local electric-pair-inhibit-predicate
  ;;                          `(lambda (c)
  ;;                             (if (char-equal c ?<) t (,electric-pair-inhibit-predicate c))))))
  )

(use-package toc-org
  :commands toc-org-enable
  :hook (org-mode . toc-org-mode))

(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode))

(use-package org-tempo
  :ensure nil
  :after org)

(use-package projectile
  :init
  (projectile-mode)
  :custom
  (projectile-run-use-comint-mode t) ;; Interactive run dialog when running projects inside emacs (like giving input)
  (projectile-switch-project-action #'projectile-dired) ;; Open dired when switching to a project
  (projectile-project-search-path '("~/projects/" "~/work/" ("~/github" . 1)))) ;; . 1 means only search the first subdirectory level for projects
;; Use Bookmarks for smaller, not standard projects

(use-package yasnippet-snippets
  :hook (prog-mode . yas-minor-mode))

(use-package dashboard
  :straight
  :demand t
  :init
  (add-hook 'dashboard-mode-hook (lambda () (setq show-trailing-whitespace nil)))
  :custom
  (dashboard-center-content t)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-set-navigator t)
  (dashboard-item-names '(("Recent Files:"               . "Recent files:")
                          ("Agenda for today:"           . "Today's agenda:")
                          ("Agenda for the coming week:" . "Agenda:")))
  (dashboard-item-shortcuts '((recents   . "r")
                              (bookmarks . "m")
   				  (projects  . "p")
    													(agenda    . "a")
    													(registers . "e")))
    
  (dashboard-startupify-list '(dashboard-insert-banner  																		
                               dashboard-insert-newline
                               ;;dashboard-insert-banner-title
                               ;;dashboard-insert-newline
                               dashboard-insert-navigator
                               dashboard-insert-newline
                               dashboard-insert-init-info
                               dashboard-insert-items
                               ;;dashboard-insert-newline
                               ;;dashboard-insert-footer
    ))

  (dashboard-display-icons-p t)     ; display icons on both GUI and terminal
  (dashboard-icon-type 'nerd-icons) ; use `nerd-icons' package
  (dashboard-icon-file-height 1.75)
  (dashboard-icon-file-v-adjust -0.125)
  (dashboard-heading-icon-height 1.75)
  (dashboard-heading-icon-v-adjust -0.125) 

  :config
  (dashboard-setup-startup-hook))

(use-package nerd-icons
  :if (display-graphic-p))

(use-package nerd-icons-dired
  :hook (dired-mode . (lambda () (nerd-icons-dired-mode t))))

(use-package nerd-icons-ibuffer
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

(set-face-attribute 'default nil                                                     
  :font "JetBrainsMonoNL NF-12.0:bold" ;; Set your favorite type of font or download JetBrains Mono
  :height 160
  :weight 'medium)
  ;; This sets the default font on all graphical frames created after restarting Emacs.
  ;; Does the same thing as 'set-face-attribute default' above, but emacsclient fonts
  ;; are not right unless I also add this method of setting the default font.

  (add-to-list 'default-frame-alist '(font . "JetBrainsMonoNL NF-12.0:bold")) ;; Set your favorite font
  (setq-default line-spacing 0.12)

(if (window-system)
  (set-frame-height (selected-frame)  45)
  (set-frame-weight (selected-frame) 80))

(setq-default visible-bell nil             ; No visual bell      
              ring-bell-function 'ignore)  ; No bell

(setq-default mouse-yank-at-point t) ; Yank at point rather than pointer
(mouse-avoidance-mode 'exile)        ; Avoid collision of mouse with point

(setq save-place-file (expand-file-name "saveplace" user-emacs-directory)
      save-place-forget-unreadable-files t)

(save-place-mode 1)

(setq-default scroll-conservatively 101       ; Avoid recentering when scrolling far
              scroll-margin 2                 ; Add a margin when scrolling vertically
              recenter-positions '(5 bottom)) ; Set re-centering positions

(use-package doom-modeline
  :straight t
  :init (doom-modeline-mode)
  :custom

  ;; Whether display icons in the mode-line.
  ;; While using the server mode in GUI, should set the value explicitly. 
  (doom-modeline-major-mode-icon t)
     
  ;; Whether display the colorful icon for `major-mode'.
  ;; It respects `nerd-icons-color-icons'.
  (doom-modeline-major-mode-color-icon t)
 
  ;; Whether display the lsp icon. It respects option `doom-modeline-icon'.
  (doom-modeline-lsp-icon t)

  ;; Whether display the modern icons for modals.
  (doom-modeline-modal-modern-icon nil)

  ;; How tall the mode-line should be. It's only respected in GUI.
  ;; If the actual char height is larger, it respects the actual height.
  (doom-modeline-height 40)
   
  ;; Whether display the time icon. It respects option `doom-modeline-icon'.
  (doom-modeline-time-icon t)

  ;; Whether display the live icons of time.
  ;; It respects option `doom-modeline-icon' and option `doom-modeline-time-icon'.
  (doom-modeline-time-live-icon t)

  ;; Whether display the buffer encoding.
  (doom-modeline-buffer-encoding t)

  ;; Whether display the indentation information.
  (doom-modeline-indent-info t)

  ;; The maximum displayed length of the branch name of version control.
  (doom-modeline-vcs-max-length 50)

  ;; The function to display the branch name.
 (doom-modeline-vcs-display-function #'doom-modeline-vcs-name)     
)

(use-package ef-themes
  :config
  (load-theme 'ef-elea-light t ))

(use-package magit
  :commands magit-status)

(use-package diff-hl
  :hook ((dired-mode         . diff-hl-dired-mode-unless-remote)
  (magit-pre-refresh  . diff-hl-magit-pre-refresh)
  (magit-post-refresh . diff-hl-magit-post-refresh))
  :init (global-diff-hl-mode))

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay        0.5
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-window          t
          treemacs-eldoc-display                   'simple
          treemacs-file-event-delay                2000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0.2
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               t
          treemacs-expand-after-init               t
          treemacs-find-workspace-method           'find-for-file-or-pick-first
          treemacs-git-command-pipe                ""
          treemacs-goto-tag-strategy               'refetch-index
          treemacs-header-scroll-indicators        '(nil . "^^^^^^")
          treemacs-hide-dot-git-directory          t
          treemacs-indentation                     2
          treemacs-indentation-string              " "
          treemacs-is-never-other-window           nil
          treemacs-max-git-entries                 5000
          treemacs-missing-project-action          'ask
          treemacs-move-files-by-mouse-dragging    t
          treemacs-move-forward-on-expand          nil
          treemacs-no-png-images                   nil
          treemacs-no-delete-other-windows         t
          treemacs-project-follow-cleanup          nil
          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                        'left
          treemacs-read-string-input               'from-child-frame
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-file-follow      nil
          treemacs-recenter-after-tag-follow       nil
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
          treemacs-project-follow-into-home        nil
          treemacs-show-cursor                     nil
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                1.5
          treemacs-text-scale                      nil
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-wide-toggle-width               70
          treemacs-width                           35
          treemacs-width-increment                 1
          treemacs-width-is-initially-locked       t
          treemacs-workspace-switch-cleanup        nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (when treemacs-python-executable
      (treemacs-git-commit-diff-mode t))

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

 

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
  :after (treemacs persp-mode) ;;or perspective vs. persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

(use-package treemacs-tab-bar ;;treemacs-tab-bar if you use tab-bar-mode
  :after (treemacs)
  :ensure t
  :config (treemacs-set-scope-type 'Tabs))

(treemacs-start-on-boot)

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
  :ghook ('after-init-hook
          (lambda (&rest _)
            (when-let ((messages-buffer (get-buffer "*Messages*")))
            (with-current-buffer messages-buffer
            (evil-normalize-keymaps))))
            nil nil t)
)
