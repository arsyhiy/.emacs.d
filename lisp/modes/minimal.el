;;; minimal-vi-mode.el --- Disable LSP and UI noise -*- lexical-binding: t; -*-

(defvar minimal-vi-mode-map (make-sparse-keymap)
  "Keymap for `minimal-vi-mode'.")

(define-minor-mode minimal-vi-mode
  "Minimal mode: disables LSP and related UI features."
  :init-value nil
  :lighter " VI"
  :keymap minimal-vi-mode-map
  (if minimal-vi-mode
      (minimal-vi--enable)
    (minimal-vi--disable)))

(defun minimal-vi--enable ()
  "Disable LSP-related features."
  (when (bound-and-true-p lsp-mode)
    (lsp-disconnect))
  (when (fboundp 'lsp-mode)
    (lsp-mode -1))
  (when (fboundp 'eldoc-mode)
    (eldoc-mode -1))
  (when (fboundp 'flycheck-mode)
    (flycheck-mode -1))
  (when (fboundp 'company-mode)
    (company-mode -1))
  (setq-local mode-line-format nil))

(defun minimal-vi--disable ()
  "Restore minimal-vi changes (does not auto-enable LSP)."
  (setq-local mode-line-format (default-value 'mode-line-format)))

(provide 'minimal)
;;; minimal-vi-mode.el ends here
