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

(defun comment-line-toggle ()
 (interactive)
 (let ((start (line-beginning-position))
       (end (line-end-position)))
   (when (or (not transient-mark-mode) (region-active-p))
     (setq start (save-excursion
                   (goto-char (region-beginning))
                   (beginning-of-line)
                   (point))
           end (save-excursion
                 (goto-char (region-end))
                 (end-of-line)
                 (point))))
   (comment-or-uncomment-region start end)))
(global-set-key (kbd "C-M-;") 'comment-line-toggle)
(global-set-key (kbd "s-/") 'comment-line-toggle) ; mac shortcut
(global-set-key (kbd "C-x C-;") 'comment-region) ; this one let's YOU decide whether to (un)comment

;; Backups
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'base16-eighties t)
(set-frame-font (font-spec :family "Roboto Mono"
                           :size 14
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
