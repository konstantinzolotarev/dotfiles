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
(setq doom-font (font-spec :family "JetBrains Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "Monaco") ; inherits `doom-font''s :size
      doom-unicode-font (font-spec :family "JetBrains Mono" :size 14)
      doom-big-font (font-spec :family "JetBrains Mono" :size 19))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


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

;; Create a buffer-local hook to run elixir-format on save, only when we enable elixir-mode.
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

;; Treemacs additional bindings
(map! :g "<f8>" 'treemacs)

;; Navigation mappings
(map! :g "M-]" #'evil-window-next
      :g "M-[" #'evil-window-left)

(map! :n (kbd "TAB TAB") #'evil-append-line)

;; Make tab working as expected
(map! :i "TAB" #'tab-to-tab-stop)

;; Dash integration
(map! :ne "<f5>" 'dash-at-point-with-docset)
