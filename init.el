;; packages
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;; Save all tempfiles in $TMPDIR/emacs$UID/                                                        
    (defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))
    (setq backup-directory-alist
        `((".*" . ,emacs-tmp-dir)))
    (setq auto-save-file-name-transforms
        `((".*" ,emacs-tmp-dir t)))
    (setq auto-save-list-file-prefix
        emacs-tmp-dir)

(global-linum-mode 1)

;; Turn off syntax highlighting
;;(global-font-lock-mode 0)
;; Except for org-mode files
;; (setq auto-mode-alist 
;;       (append '((".*\\.org\\'" . font-lock-mode))
;; 	      auto-mode-alist))
 
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(load-theme 'leuven t)
;; (load-theme 'material-light t)
;;(load-theme 'material t)
;; (load-theme 'monokai)
;; (load-theme 'adwaita)

;; (load-theme 'zenburn)
;;(load-theme color-theme-sanityinc-tomorrow-day)
;;(load-theme 'ritchie t)
;;(load-theme 'greymatters)
;; (load-theme 'solarized-light)
;; (load-theme 'solarized-dark)
;; (load-theme 'sanityinc-tomorrow-day)
;;(load-theme 'sanityinc-tomorrow-night)
;; (setq solarized-distinct-fringe-background t)
;; (setq solarized-high-contrast-mode-line t)


(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
;;(add-to-list 'load-path "~/.emacs.d/elpa/")
(require 'cl)
(require 'powerline)
;;(require 'go-mode-load)
(powerline-default-theme)
(require 'git)


;;(setq powerline-arrow-shape 'arrow)   ;; the default


;; Disabling helm because of bug I experienced trying
;; to create a new file after deleting a file with same name
(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)


(setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo")

;; (pdf-tools-install)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq frame-title-format "")



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#eaeaea" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#424242"))
 '(custom-enabled-themes (quote (leuven)))
 '(custom-safe-themes
   (quote
    ("43c1a8090ed19ab3c0b1490ce412f78f157d69a29828aa977dae941b994b4147" "d5f17ae86464ef63c46ed4cb322703d91e8ed5e718bf5a7beb69dd63352b26b2" "5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "a49760e39bd7d7876c94ee4bf483760e064002830a63e24c2842a536c6a52756" "bcc6775934c9adf5f3bd1f428326ce0dcd34d743a92df48c128e6438b815b44f" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "4d80487632a0a5a72737a7fc690f1f30266668211b17ba836602a8da890c2118" "5cd0afd0ca01648e1fff95a7a7f8abec925bd654915153fb39ee8e72a8b56a1f" default)))
 '(fci-rule-color "#424242")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(global-font-lock-mode nil)
 '(hl-sexp-background-color "#efebe9")
 '(package-selected-packages
   (quote
    (magit leuven-theme material-theme noctilux-theme monokai-theme hc-zenburn-theme zenburn-theme color-theme-sanityinc-tomorrow helm-core sublime-themes solarized-theme powerline pdf-tools highlight-current-line helm greymatters-theme go-mode git elfeed-org auctex anti-zenburn-theme angular-mode)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#d54e53")
     (40 . "#e78c45")
     (60 . "#e7c547")
     (80 . "#b9ca4a")
     (100 . "#70c0b1")
     (120 . "#7aa6da")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "#e78c45")
     (200 . "#e7c547")
     (220 . "#b9ca4a")
     (240 . "#70c0b1")
     (260 . "#7aa6da")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "#e78c45")
     (340 . "#e7c547")
     (360 . "#b9ca4a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
