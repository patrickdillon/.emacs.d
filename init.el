(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)


;; save all tempfiles in $TMPDIR/emacs$UID/                                                        
(defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))
(setq backup-directory-alist
      `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
      emacs-tmp-dir)

;; (global-linum-mode 1)

;; startup dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)

;;(set-frame-font "Inconsolata-14")
(set-frame-font "DejaVu Sans Mono-14")

;; Turn off syntax highlighting
(global-font-lock-mode 0)
;; Except for Org mode
(add-hook 'org-mode-hook 'font-lock-mode)

;; (add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
;;(add-to-list 'load-path "~/.emacs.d/elpa/")
;; (require 'cl)
;; (require 'powerline)
;;(require 'go-mode-load)
;; (powerline-default-theme)
(require 'git)

;;(setq powerline-arrow-shape 'arrow)   ;; the default

;; include column number in status bar
(setq column-number-mode t)

(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

(setq python-shell-interpreter "python3")

;; (setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo")

;; Remove all chrome, so to speak
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq frame-title-format "")


;; (setq rcirc-server-alist
;;              '(("irc-2.devel.redhat.com"
;; 		:channels ("#devel" "#bss" "#aos"))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (dashboard xterm-color doom-themes material-theme kaolin-themes yaml-mode tablist powerline magit leuven-theme let-alist go-projectile git ggtags geben-helm-projectile elfeed-org angular-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;;(load-theme 'kaolin-light t)
;;(load-theme 'material-light t)
(load-theme 'material t)
;;(load-theme 'doom-nord-light t)
;;(load-theme 'doom-opera-light t)
