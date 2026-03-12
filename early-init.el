;; -*- coding: utf-8; lexical-binding: t -*-

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 100000000
                  gc-cons-percentage 0.1)))

(setq straight-vc-git-default-clone-depth 10)

(setq package-enable-at-startup nil)
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

(defun load-env-from-zsh ()
  "Импортирует переменные окружения из интерактивной Zsh-сессии."
  (interactive)
  (let* ((shell "/bin/zsh") ; или другой путь, если у тебя zsh в другом месте
         (output (shell-command-to-string
                  (format "%s -i -c 'printenv'" shell))))
    (dolist (line (split-string output "\n" t))
      (when (string-match "\\`\\([^=]+\\)=\\(.*\\)\\'" line)
        (setenv (match-string 1 line) (match-string 2 line))))
    (when-let ((path (getenv "PATH")))
      (setq exec-path (split-string path path-separator)))
    (message "Zsh окружение загружено. gopls найден: %s"
             (executable-find "gopls"))))

(load-env-from-zsh)
