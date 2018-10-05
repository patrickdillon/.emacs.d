(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq-default indent-tabs-mode nil)

(global-set-key (kbd "M-o") 'ace-window)
 
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
;;(require 'dashboard)
;;(dashboard-setup-startup-hook)

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
    (ace-window markdown-preview-eww markdown-preview-mode dashboard xterm-color doom-themes material-theme kaolin-themes yaml-mode tablist powerline magit leuven-theme let-alist go-projectile git ggtags geben-helm-projectile elfeed-org angular-mode))))
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


;; These functions remove ANSI escape characters from emacs shell
;; for example, the docker run command tries to rename the window
;; which results in a ^[] character in the output
(defun preamble-regexp-alternatives (regexps)
  "Return the alternation of a list of regexps."
  (mapconcat (lambda (regexp)
               (concat "\\(?:" regexp "\\)"))
             regexps "\\|"))

(defvar non-sgr-control-sequence-regexp nil
  "Regexp that matches non-SGR control sequences.")

(setq non-sgr-control-sequence-regexp
      (preamble-regexp-alternatives
       '(;; icon name escape sequences
         "\033\\][0-2];.*?\007"
         ;; non-SGR CSI escape sequences
         "\033\\[\\??[0-9;]*[^0-9;m]"
         ;; noop
         "\012\033\\[2K\033\\[1F"
         )))

(defun filter-non-sgr-control-sequences-in-region (begin end)
  (save-excursion
    (goto-char begin)
    (while (re-search-forward
            non-sgr-control-sequence-regexp end t)
      (replace-match ""))))

(defun filter-non-sgr-control-sequences-in-output (ignored)
  (let ((start-marker
         (or comint-last-output-start
             (point-min-marker)))
        (end-marker
         (process-mark
          (get-buffer-process (current-buffer)))))
    (filter-non-sgr-control-sequences-in-region
     start-marker
     end-marker)))

(add-hook 'comint-output-filter-functions
          'filter-non-sgr-control-sequences-in-output)
