;;; Commentary:

(require 'package)
(add-to-list 'package-archives (cons "melpa" "http://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/evil")
(add-to-list 'load-path "~/.emacs.d/custom")
(let ((default-directory  "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(require 'use-package)

(require 'which-key)
(which-key-mode)

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :config
  (lsp-register-custom-settings
   `(("gopls.analyses" ,(mapcar (lambda (a) (cons a :json-false)) '(composites ST1003 ST1021 ST1016 SA5011 ST1020)))
     ))
  :hook ((go-mode . lsp-deferred)
         (js-mode . lsp)))

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :hook
  ((python-mode . (lambda ()
                         (require 'lsp-python-ms)
                         (lsp)))  ; or lsp-deferred
  (flycheck-mode . (lambda ()
                     (setq-local flycheck-checker 'python-pylint)))))

(require 'lsp-groovy)
(add-hook 'groovy-mode-hook #'lsp)
(add-hook 'js-mode-hook #'js2-minor-mode)

;;(groovy :variables
;;        groovy-backend 'lsp
;;        groovy-lsp-jar-path "/home/grayscale/.emacs.d/.cache/lsp/groovy-language-server-all.jar")

(setq evil-want-keybinding nil)
(setq evil-want-integration t)
;; VARS
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-revert-check-vc-info t)
 '(company-dabbrev-minimum-length 2)
 '(company-idle-delay 0)
 '(company-show-numbers t)
 '(company-tooltip-idle-delay 0.2)
 '(compilation-message-face 'default)
 '(counsel-mode t)
 '(custom-enabled-themes '(gruvbox-dark-medium))
 '(custom-safe-themes
   '("7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" "aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" "939ea070fb0141cd035608b2baabc4bd50d8ecc86af8528df9d41f4d83664c6a" "36c86cb6c648b9a15d849026c90bd6a4ae76e4d482f7bcd138dedd4707ff26a5" "c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "89127baa0733c28af281b48581df7875daf729dd8a6e99ece441f29bbb611087" "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "72dd32afad786385f5672843cea2db68e7f03b0f9b41cc011e8456bc28090b30" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default))
 '(display-line-numbers-type 'relative)
 '(display-line-numbers-width-start t)
 '(evil-collection-mode-list
   '(2048-game ag alchemist anaconda-mode apropos arc-mode auto-package-update bm bookmark
               (buff-menu "buff-menu")
               calc calendar cider cmake-mode comint compile consult
               (custom cus-edit)
               cus-theme dashboard daemons deadgrep debbugs debug devdocs dictionary diff-mode dired dired-sidebar disk-usage distel doc-view docker ebib edbi edebug ediff eglot explain-pause-mode elfeed elisp-mode elisp-refs elisp-slime-nav embark emms epa ert eshell eval-sexp-fu evil-mc eww finder flycheck flymake free-keys geiser ggtags git-timemachine gnus go-mode grep guix hackernews helm help helpful hg-histedit hungry-delete ibuffer image image-dired image+ imenu imenu-list
               (indent "indent")
               indium info ivy js2-mode leetcode lispy log-edit log-view lsp-ui-imenu lua-mode kotlin-mode macrostep man magit magit-todos monky mpdel mu4e mu4e-conversation neotree newsticker notmuch nov
               (occur replace)
               omnisharp org-present zmusic osx-dictionary outline p4
               (package-menu package)
               pass
               (pdf pdf-view)
               popup proced
               (process-menu simple)
               prodigy profiler python quickrun racer racket-describe realgud reftex restclient rg ripgrep rjsx-mode robe rtags ruby-mode scroll-lock sh-script shortdoc simple slime sly speedbar tab-bar tablist tabulated-list tar-mode
               (term term ansi-term multi-term)
               tetris thread tide timer-list transmission trashed typescript-mode vc-annotate vc-dir vc-git vdiff view vlf vterm w3m wdired wgrep which-key woman xref youtube-dl
               (ztree ztree-diff)
               xwidget))
 '(evil-commentary-mode t)
 '(evil-escape-excluded-major-modes '(treemacs-mode magit-mode))
 '(evil-escape-excluded-states '(visual))
 '(evil-escape-inhibit-functions '(evil-escape--is-magit-buffer))
 '(evil-undo-system 'undo-redo)
 '(fci-rule-color "#20240E")
 '(flycheck-check-syntax-automatically
   '(save idle-change idle-buffer-switch new-line mode-enabled))
 '(flycheck-checker-error-threshold 900)
 '(global-display-line-numbers-mode t)
 '(global-flycheck-mode t)
 '(gnus-select-method '(nnnil "news"))
 '(grep-command "grep -nHi -e ")
 '(highlight-changes-colors '("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   '(("#20240E" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#20240E" . 100)))
 '(ido-enable-flex-matching t)
 '(ivy-mode t)
 '(kill-whole-line t)
 '(lsp-go-codelens '((test . t) (generate . t)))
 '(lsp-go-codelenses '((test . t) (generate . t)))
 '(lsp-go-composites nil)
 '(lsp-groovy-classpath ["/usr/local/opt/groovy/libexec/lib /usr/share/groovy/lib"])
 '(lsp-python-ms-disabled ["undefined-variable"])
 '(lsp-python-ms-extra-paths ["/home/grayscale/git/infrastructure"])
 '(lsp-python-ms-python-executable-cmd "python3")
 '(magit-blame-echo-style 'headings)
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(general evil-collection evil-ex-fasd fasd lsp-docker groovy-imports gitlab which-key gradle-mode js2-mode lsp-python-ms treemacs-evil ripgrep tabbar lsp-java groovy-mode liquid-types json-mode lsp-ui ac-mozc ac-octave ac-php lsp-mode use-package auto-complete flycheck-golangci-lint go-mode modern-cpp-font-lock cpp-auto-include xah-lookup evil-surround flycheck challenger-deep-theme excorporate base16-theme gruvbox-theme color-theme-sanityinc-solarized dracula-theme evil-commentary rainbow-mode fish-mode diminish evil-escape ace-window avy dockerfile-mode yaml-mode magit lua-mode company smex counsel-tramp deadgrep swiper yascroll evil evil-tutor evil-goggles))
 '(paren-mode 'sexp t (paren))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#262626")
 '(scroll-bar-mode nil)
 '(select-enable-clipboard t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tabbar-mode nil nil (tabbar))
 '(tool-bar-mode nil)
 '(truncate-lines t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#262626" "#20240E" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
 '(whitespace-style '(face tabs spaces trailing newline empty))
 '(yascroll:delay-to-hide nil))

;; FACES
(add-to-list 'default-frame-alist '(font . "Fira Code 10"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line-buffer-id ((t nil)))
 '(powerline-evil-emacs-face ((t (:inherit powerline-evil-base-face :background "violet" :foreground "black"))))
 '(powerline-evil-insert-face ((t (:inherit powerline-evil-base-face :background "#FB4933"))))
 '(powerline-evil-normal-face ((t (:inherit powerline-evil-base-face :background "#b8bb26" :foreground "#000000"))))
 '(powerline-evil-visual-face ((t (:inherit powerline-evil-base-face :background "orange" :foreground "black"))))
 '(show-paren-match ((t (:background "#665c54" :foreground "#83a598" :weight normal))))
 '(show-paren-mismatch ((t (:background "#fb4933" :foreground "#665c54" :weight normal))))
 '(variable-pitch ((t nil))))

(set-frame-font "Fira Code 10" nil t)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-;") 'beginning-of-defun)
(global-set-key (kbd "C-'") 'end-of-defun)
;; (global-unset-key (kbd "M-o"))
;; (global-set-key (kbd "M-o") 'ace-window)
(global-set-key (kbd "M-o") 'other-window)
(global-unset-key (kbd "<f11>"))
(global-set-key (kbd "<f11>") #'ripgrep-regexp)
(global-unset-key (kbd "M-z"))
(global-set-key (kbd "M-z") 'fasd-find-file)
;;(global-set-key (kbd "<f12>") 'toggle-frame-fullscreen)

;; STUFF
(setq inhibit-startup-message t)
(setq frame-title-format "%b")
(setq ring-bell-function 'ignore)
(fset 'yes-or-no-p 'y-or-n-p)
(setq vc-follow-symlinks t)

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
(setq display-line-numbers-type 'relative)

(ivy-mode 1)
(counsel-mode 1)
(setq ivy-use-selectable-prompt t)
(setq ivy-re-builders-alist '((counsel-M-x . ivy--regex-fuzzy)
			      (t . ivy--regex-plus)))

(global-company-mode 1)
(global-whitespace-mode 1)
(global-flycheck-mode 1)
(electric-pair-mode 1)
(global-hl-line-mode 1)
(global-auto-revert-mode)
'(auto-save-mode nil)
(set-fringe-mode '(0 . nil))
(setq auto-save-default nil)

;; (font-lock-add-keywords 'c-mode
;;                         '(
;;                           ;;("\\(\\w+\\)\\s-*\("
;;                            ;;1 font-lock-warning-face)
;;                           ("RETURN_OK\\|FALSE\\|TRUE"
;;                            . font-lock-constant-face)
;;                           ("XM_END_ITERATE_CONST\\|XM_END_ITERATE\\|XL_END_ITERATE_CONST\\|XL_END_ITERATE"
;;                            . font-lock-variable-name-face))
;;                         t)
(setq c-default-style "linux" c-basic-offset 4)
(c-set-offset 'inline-open 0)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq backup-directory-alist `(("." . "~/.saves")))

(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; EVIL
(require 'evil)
(evil-mode 1)
(evil-collection-init)
(evil-goggles-mode 1)
(evil-escape-mode 1)
(evil-commentary-mode 1)
(global-evil-surround-mode 1)
(setq-default evil-escape-key-sequence "jj")
(setq-default evil-escape-delay 0.2)
(define-key evil-motion-state-map (kbd "g h") #'evil-avy-goto-word-1)
(define-key evil-motion-state-map (kbd "g b") #'evil-avy-goto-char-in-line)
(define-key evil-insert-state-map (kbd "M-e") #'end-of-line)
(evil-define-key '(normal visual) 'global (kbd "SPC z") 'fasd-find-file)
(evil-define-key '(normal visual) 'global (kbd "SPC m c") 'magit-commit)
(evil-define-key '(normal visual) 'global (kbd "SPC m p") 'magit-push)
(evil-define-key '(normal visual) 'global (kbd "SPC e") 'eval-buffer)
(evil-define-key '(normal visual) 'global (kbd "SPC r") 'revert-buffer)
(setq evil-emacs-state-cursor '("violet" box))
(setq evil-normal-state-cursor '("#b8bb26" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("#FB4933" bar))
(setq evil-replace-state-cursor '("#F92672" bar))
(setq evil-operator-state-cursor '("#F92672" hollow))
(eval-after-load 'evil-ex
  '(evil-ex-define-cmd "W[rite]" 'evil-write))
(defun awesomewm-change-border-color (color)
  "Change border color for window basing on evil state"
(start-process "" nil "awesome-client" (concat "client.focus.border_color = '" color "'"))
)

(use-package evil
  :after lsp-mode
  :config
  (evil-define-key '(normal visual) 'lsp-mode
    (kbd "SPC l") lsp-command-map)
  (evil-normalize-keymaps)
)

(add-hook 'evil-insert-state-entry-hook (lambda () (start-process "" nil "awesome-client" "client.focus.border_color = '#fb4933'") (set-mouse-color "#fb4933")))
(add-hook 'evil-normal-state-entry-hook (lambda () (start-process "" nil "awesome-client" "client.focus.border_color = '#fe8019'") (set-mouse-color "#b8bb26")))
(add-hook 'evil-visual-state-entry-hook (lambda () (start-process "" nil "awesome-client" "client.focus.border_color = '#ffa500'") (set-mouse-color "#ffa500")))

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
(diminish 'evil-escape-mode)
(diminish 'evil-commentary-mode)
(diminish 'flycheck-mode)
(diminish 'which-key-mode)
(diminish 'eldoc-mode)
(diminish 'evil-collection-unimpaired-mode)
(diminish 'company-mode "cmpn")

(blink-cursor-mode -1)
;;(require 'mu4e)
;;(setq mu4e-maildir "~/.mail/temera/")
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))

(defun read-lines (filePath)
  "Return a list of lines of a file at filePath."
  (with-temp-buffer
    (insert-file-contents filePath)
    (split-string (buffer-string) "\n" t)))

;;(message (read-lines "/home/grayscale/git/openvino-jenkins-library/deps.txt"))
;;(setq lsp-groovy-classpath (mapconcat 'identity (read-lines "/home/grayscale/git/openvino-jenkins-library/deps.txt") " "))
;;(setq lsp-groovy-classpath (vconcat (read-lines "/home/grayscale/git/openvino-jenkins-library/deps.txt")))

(global-fasd-mode 1)

(setq fasd-enable-initial-prompt nil
      fasd-completing-read-function #'ivy-completing-read)
(add-to-list 'ivy-sort-functions-alist (cons #'fasd-find-file nil))
(setq fasd-standard-search "-f")

(defun git-remote-status ()
  (interactive)
  (let* (;; get the branch we are on.
         (branch (s-trim
                  (shell-command-to-string
                   "git rev-parse --abbrev-ref HEAD")))
         ;; get the remote the branch points to.
         (remote (s-trim
                  (shell-command-to-string
                   (format "git config branch.%s.remote" branch))))
         (remote-branch (s-trim
                         (shell-command-to-string
                          "git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q HEAD)")))
         (commits (split-string
                   (s-trim
                    (shell-command-to-string
                     (format
                      "git rev-list --count --left-right HEAD...%s"
                      remote-branch)))))
         (local (nth 0 commits))
         (remotes (nth 1 commits)))
    (concat
     " "
     (format "↑%s|↓%s" local remotes)
     )))

(defun git-parse-status ()
  (interactive)
  (let ((U 0)   ; untracked files
        (M 0)   ; modified files
        (O 0)   ; other files
        (U-files "")
        (M-files "")
        (O-files ""))
    (dolist (line (split-string
                   (shell-command-to-string "git status --porcelain")
                   "\n"))
      (cond

       ;; ignore empty line at end
       ((string= "" line) nil)

       ((string-match "^\\?\\?" line)
        (setq U (+ 1 U))
        (setq U-files (concat U-files "\n" line)))

       ((string-match "^ M" line)
        (setq M (+ 1 M))
        (setq M-files (concat M-files "\n" line))
        )

       (t
        (setq O (+ 1 O))
        (setq O-files (concat O-files "\n" line)))))

    ;; construct propertized string
    (concat
     " "
     (if (> M 0) (format "+%d" M))
     (if (> U 0) (format "...%d" U))
     (if (> O 0) (format "|%d" O))
     )))


(advice-add #'vc-git-mode-line-string :filter-return #'my-replace-git-status)
(defun my-replace-git-status (tstr)
  (let* ((tstr (replace-regexp-in-string "^Git" "" tstr))
         (first-char (substring tstr 0 1))
         (rest-chars (substring tstr 1)))
    (setq tstr (concat tstr (git-remote-status)))
    (setq tstr (concat tstr (git-parse-status)))
    (cond
     ((string= ":" first-char) ;;; Modified
      (replace-regexp-in-string "^:" "⚡ " tstr))
     ((string= "-" first-char) ;; No change
      (replace-regexp-in-string "^-" "✔ " tstr))
     (t tstr)))
  )

;; (propertize
;;       (format "%s" branch)
;;       'face (list :foreground "magenta"))
