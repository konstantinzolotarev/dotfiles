;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Konstantin Zolotarev"
      user-mail-address "konstantin.zolotarev@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;;
;; (setq doom-font (font-spec :family "Monaco" :size 15)
;;       doom-variable-pitch-font (font-spec :family "Monaco") ; inherits `doom-font''s :size
;;       doom-unicode-font (font-spec :family "JetBrains Mono" :size 14)
;;       doom-big-font (font-spec :family "JetBrains Mono" :size 19))

(setq doom-font (font-spec :family "Monaco" :size 14)
      doom-big-font (font-spec :family "Monaco")
      doom-variable-pitch-font (font-spec :family "Monaco" :size 14)
      doom-serif-font (font-spec :family "JetBrains Mono" :size 19))

;; (setq doom-themes-enable-bold nil)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
(setq doom-theme 'my-one)

;; (setq doom-theme 'doom-dracula)
;; (load-theme 'atom-one-dark t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Line spacing adjustments
(setq-default line-spacing 1)

(when-let (dims (doom-store-get 'last-frame-size))
  (cl-destructuring-bind ((left . top) width height fullscreen) dims
    (setq initial-frame-alist
          (append initial-frame-alist
                  `((left . ,left)
                    (top . ,top)
                    (width . ,width)
                    (height . ,height)
                    (fullscreen . ,fullscreen))))))

(defun save-frame-dimensions ()
  (doom-store-put 'last-frame-size
                  (list (frame-position)
                        (frame-width)
                        (frame-height)
                        (frame-parameter nil 'fullscreen))))

(add-hook 'kill-emacs-hook #'save-frame-dimensions)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; (setq ivy-posframe-display-functions-alist
;;       '((counsel-git-grep . ivy-display-function-fallback)
;;         (counsel-grep . ivy-display-function-fallback)
;;         (counsel-rg . ivy-display-function-fallback)
;;         (swiper . ivy-display-function-fallback)
;;         (t . ivy-posframe-display-at-frame-top-center)))

;; Fix scrolling issues
(setq scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; Defining most often typo for VIM commands
(evil-ex-define-cmd "Bd[delete]" 'evil-delete-buffer)
(evil-ex-define-cmd "W[rite]" 'evil-write)
(evil-ex-define-cmd "Lw[rite]" 'evil-write)

;; Elixir commands, with all typos
(evil-ex-define-cmd "MF[ormat]" 'elixir-format)
(evil-ex-define-cmd "Mf[ormat]" 'elixir-format)
(evil-ex-define-cmd "mf[ormat]" 'elixir-format)
;; Aditional formating things
(evil-ex-define-cmd "MFf[ormat]" 'elixir-format)
(evil-ex-define-cmd "Mff[ormat]" 'elixir-format)
(evil-ex-define-cmd "mff[ormat]" 'elixir-format)
(evil-ex-define-cmd "mt[est]" 'mix-test)
(evil-ex-define-cmd "Mt[est]" 'mix-test)
(evil-ex-define-cmd "mtt[est current]" 'mix-test-current-test)
(evil-ex-define-cmd "Mtt[est current]" 'mix-test-current-test)
(evil-ex-define-cmd "Mtt[est current buffer]" 'mix-test-current-buffer)
(evil-ex-define-cmd "bd" 'kill-current-buffer)
;; Make workds like in VIM
;; (modify-syntax-entry ?_ "w")
(add-hook 'after-change-major-mode-hook
          (lambda ()
            (modify-syntax-entry ?_ "w")))

;; Create a buffer-local hook to run elixir-format on save, only when we enable elixir-mode.
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

;; Treemacs additional bindings
(map! :g "<f8>" 'treemacs)

;; Navigation mappings
(map! :g "s-]" #'evil-window-next
      :g "s-[" #'evil-window-left
      :g "M-]" #'evil-next-buffer
      :g "M-[" #'evil-prev-buffer)

;; Make tab working as expected
(map! :i "TAB" #'tab-to-tab-stop)

;; Dash integration
(map! :ne "<f5>" 'dash-at-point-with-docset)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#21242b" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
 '(custom-safe-themes
   (quote
    ("f7bcaeda8055d791ccd62e69da8af0351129e00d5e18a3b63bf77a3c16daa337" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" default)))
 '(fci-rule-color "#5B6268")
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(objed-cursor-color "#ff6c6b")
 '(pdf-view-midnight-colors (cons "#bbc2cf" "#282c34"))
 '(rustic-ansi-faces
   ["#282c34" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
 '(vc-annotate-background "#282c34")
 '(vc-annotate-color-map
   (list
    (cons 20 "#98be65")
    (cons 40 "#b4be6c")
    (cons 60 "#d0be73")
    (cons 80 "#ECBE7B")
    (cons 100 "#e6ab6a")
    (cons 120 "#e09859")
    (cons 140 "#da8548")
    (cons 160 "#d38079")
    (cons 180 "#cc7cab")
    (cons 200 "#c678dd")
    (cons 220 "#d974b7")
    (cons 240 "#ec7091")
    (cons 260 "#ff6c6b")
    (cons 280 "#cf6162")
    (cons 300 "#9f585a")
    (cons 320 "#6f4e52")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
