;;; elips-arsyhiy.el --- mode for emacs lisp -*- lexical-binding: t; -*-
;; Author: arsyhiy
;; Package-Requires: ((emacs "30.1"))

;;; Commentary:

;;; Code:

(use-package emacs-lisp-mode
  :ensure nil
  :hook
  (emacs-lisp-mode . electric-pair-local-mode)
  (emacs-lisp-mode . show-paren-local-mode)
  (emacs-lisp-mode . eldoc-mode)
  (emacs-lisp-mode . prettify-symbols-mode)

  :custom
  (lisp-indent-offset 2)

  :bind
  (:map emacs-lisp-mode-map
        ("C-c C-e" . eval-last-sexp)
        ("C-c C-r" . eval-region)
        ("C-c C-b" . eval-buffer))

  :config
  (add-hook 'emacs-lisp-mode-hook
            (lambda ()
              (setq-local indent-tabs-mode nil)

              (add-hook 'before-save-hook
                        (lambda ()
                          (indent-region (point-min) (point-max)))
                        nil t))))

(provide 'elisp-arsyhiy)
;;; elisp-arsyhiy.el ends here
