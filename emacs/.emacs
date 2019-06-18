;; MELPA
(require 'package)
(add-to-list 'package-archives (cons "melpa" "http://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/evil")
(let ((default-directory  "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'monokai t)

;; VARS
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(counsel-mode t)
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("72dd32afad786385f5672843cea2db68e7f03b0f9b41cc011e8456bc28090b30" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default)))
 '(display-line-numbers-type (quote relative))
 '(display-line-numbers-width-start t)
 '(evil-escape-excluded-states (quote (visual)))
 '(global-display-line-numbers-mode t)
 '(grep-command "grep -nHi -e ")
 '(ido-enable-flex-matching t)
 '(ivy-mode t)
 '(kill-whole-line t)
 '(magit-blame-echo-style (quote headings))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (rainbow-mode fish-mode diminish evil-escape ace-window avy dockerfile-mode yaml-mode magit lua-mode company smex counsel-tramp deadgrep swiper yascroll evil evil-tutor evil-goggles)))
 '(paren-mode (quote sexp) t (paren))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(truncate-lines t)
 '(whitespace-style (quote (face tabs spaces trailing newline empty)))
 '(yascroll:delay-to-hide nil))

;; FACES
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Misc Tamsyn" :foundry "Misc" :slant normal :weight normal :height 120 :width normal))))
 '(font-lock-warning-face ((t (:foreground "#ffffff" :weight bold :underline nil))))
 '(ivy-current-match ((t (:inherit bold :background "#454555"))))
 '(line-number ((t (:inherit (shadow default) :background "#303030"))))
 '(line-number-current-line ((t (:inherit line-number :background "#333333" :weight semi-bold))))
 '(mode-line ((t (:background "#49483E" :foreground "#F8F8F0" :box nil))))
 '(mode-line-inactive ((t (:background "#303125" :foreground "#75715E" :box nil))))
 '(powerline-active2 ((t (:background "#64645E"))))
 '(powerline-evil-emacs-face ((t (:inherit powerline-evil-base-face :background "violet" :foreground "black"))))
 '(powerline-evil-insert-face ((t (:inherit powerline-evil-base-face :background "#F92672"))))
 '(powerline-evil-normal-face ((t (:inherit powerline-evil-base-face :background "#66D9EF" :foreground "#000000"))))
 '(powerline-evil-visual-face ((t (:inherit powerline-evil-base-face :background "orange" :foreground "black")))))

(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-;") 'beginning-of-defun)
(global-set-key (kbd "C-'") 'end-of-defun)
(global-unset-key (kbd "M-o"))
(global-set-key (kbd "M-o") 'ace-window)
(global-unset-key (kbd "<f11>"))
(global-set-key (kbd "<f11>") #'deadgrep)
;;(global-set-key (kbd "<f12>") 'toggle-frame-fullscreen)

;; STUFF
(setq inhibit-startup-message t)
(setq frame-title-format "%b")
(fset 'yes-or-no-p 'y-or-n-p)

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
(setq display-line-numbers-type 'relative)

;;(ido-mode 1)
;;(setq ido-create-new-buffer 'always)

(ivy-mode 1)
(counsel-mode 1)
(setq ivy-use-selectable-prompt t)
(setq ivy-re-builders-alist '((counsel-M-x . ivy--regex-fuzzy)
			      (t . ivy--regex-plus)))

(company-mode 1)
(electric-pair-mode 1)
;;(global-hl-line-mode 1)
(blink-cursor-mode nil)
'(auto-save-mode nil)
(set-fringe-mode '(0 . nil))
(setq auto-save-default nil)

(font-lock-add-keywords 'c-mode
                        '(
                          ("\\(\\w+\\)\\s-*\("
                           1 font-lock-warning-face)
                          ("RETURN_OK\\|FALSE\\|TRUE"
                           . font-lock-constant-face)
                          ("XM_END_ITERATE_CONST\\|XM_END_ITERATE\\|XL_END_ITERATE_CONST\\|XL_END_ITERATE"
                           . font-lock-variable-name-face))
                        t)
(setq c-default-style "linux" c-basic-offset 4)
(setq backup-directory-alist `(("." . "~/.saves")))

(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; EVIL
(require 'evil)
(evil-mode 1)
(evil-goggles-mode 1)
(evil-escape-mode 1)
(setq-default evil-escape-key-sequence "kk")
(setq-default evil-escape-delay 0.2)
(define-key evil-motion-state-map (kbd "g h") #'evil-avy-goto-word-1)
(define-key evil-motion-state-map (kbd "g c") #'evil-avy-goto-char-2)
;; POWERLINE
(require 'powerline-evil)
(require 'powerline)
(powerline-default-theme)
(setq powerline-default-separator nil)
(setq powerline-display-buffer-size nil)
(setq powerline-display-mule-info nil) 
(setq powerline-evil-tag-style 'verbose)
;; TRAMP
(require 'tramp)
(setq tramp-default-method "ssh")

;;DIMINISH
(require 'diminish)
(diminish 'undo-tree-mode)
(diminish 'counsel-mode)
(diminish 'ivy-mode)
(diminish 'evil-goggles-mode)
(diminish 'company-mode "cmpn")

