;; Package management
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))

(when (boundp 'package-pinned-packages)
 (setq package-pinned-packages
       '((cider . "melpa-stable")
         )))

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
(show-paren-mode t)
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
(load-theme 'base16-ocean t)
(set-frame-font (font-spec :family "Menlo"
                           :size 15
                           :antialias t
                           :weight 'light)
                 nil
                 t)

;; OS X customizations
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;; Buffer Selection
(global-set-key (kbd "C-x C-b") 'bs-show)

;; Helm
(require 'helm-config)
(setq helm-autoresize-mode t)
(setq helm-split-window-in-side-p t)

;; Projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)

;; Projectile + HELM
(require 'helm-projectile)
(helm-projectile-on)

;; control helm "popup" buffers
(setq shackle-rules '(("\\`\\*helm.*?\\*\\'" :regexp t :align t :size 0.3)))
(shackle-mode)

;; Javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

;; Clojure
(setq nrepl-log-messages nil)
(setq cider-repl-use-pretty-printing t)

;; (add-to-list 'load-path "~/.emacs.d/parinfer-mode/")
;; (require 'parinfer-mode)
;; (add-hook 'clojure-mode-hook 'parinfer-mode)

;; Custom configuration
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(exec-path
   (quote
    ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/local/bin" "/usr/local/Cellar/emacs/25.1/libexec/emacs/25.1/x86_64-apple-darwin16.0.0")))
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(package-selected-packages
   (quote
    (less-css-mode editorconfig base16-theme shader-mode shackle paredit js2-mode helm-projectile helm-ag flx-ido exec-path-from-shell clojure-mode-extra-font-locking ag ac-cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
