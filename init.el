;; Package management
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
(package-initialize)

;; General Configuration
(tool-bar-mode -1)
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq visible-bell t)
(line-number-mode 1)
(column-number-mode 1)

;; Editing
(setq standard-indent 2)
(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; Backups
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
