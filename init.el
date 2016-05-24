;; Package management
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
(package-initialize)

;; General Configuration
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq-default
  inhibit-startup-screen t
  visible-bell t
  ring-bell-function (lambda () (message "*beep*")))
(column-number-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)

;; Editing
(delete-selection-mode 1)
(setq standard-indent 2)
(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; Backups
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'base16-eighties t)
(set-frame-font (font-spec :family "Roboto Mono"
                           :size 15
                           :antialias t
                           :weight 'light)
                 nil
                 t)

;; Javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(custom-set-variables
 '(js2-basic-offset 2))
