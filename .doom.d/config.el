;;; $$$$DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jake Moss"
      user-mail-address "jake.moss@uqconnect.edu.au")

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

;; (setq doom-font (font-spec :family "monospace" :size 14 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 15))

;; (setq doom-font (font-spec :family "Fira code" :size 14)
;;       doom-big-font (font-spec :family "Fira code" :size 16)
;;       doom-variable-pitch-font (font-spec :family "Overpass" :size 14)
;;       doom-unicode-font (font-spec :family "JuliaMono")
;;       doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light))

(setq doom-font (font-spec :family "JetBrains Mono" :size 14)
      doom-big-font (font-spec :family "JetBrains Mono" :size 16)
      doom-variable-pitch-font (font-spec :family "Overpass" :size 14)
      doom-unicode-font (font-spec :family "JuliaMono")
      doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-palenight)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


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
;; Use pdf-tools to open PDF files


;; PERSONAL CONFIG

(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 )

(setq undo-limit 80000000                           ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                         ; By default while in insert allchanges are one big blob. Be more granular
      auto-save-default t                           ; Nobody likes to loose work, Icertainly don't
      scroll-margin 2)                               ; It's nice to maintain a littlemargin↩→

(display-time-mode 1)                                ; Enable time in the mode-line

;; (unless (string-match-p "^Power N/A" (battery))     ; On laptops...
;;   (display-battery-mode 1))                          ; it's nice to know how much poweryou have

(defun what-we-do-every-night-pinky ()
  (put-text-property
   (point)
   (progn
     (mapc (lambda (line)
             (insert
              (+doom-dashboard--center
               +doom-dashboard--width
               (let ((extra (max 0 (- +doom-dashboard--width (length line)))))
                 (concat line (make-string extra 32))))
              " \n"))
           '("Are you pondering what I'm pondering, Pinky?"
             ""
             "                          ,,,        !/:. "
             "                         /::\\\".      !!::: "
             "                         :::::\\\".  ,\" \\:,:: "
             "                         ::::::\\ \". ,\",\"\\::. "
             "                         \\:::::\":\\ \"/\"\"v' :' "
             "                          !::::\\   !    \\ \\   __ "
             "                           \"::::\\  \\     ! \\.&&&&, "
             "                              ,\" __ \",  cd,&&&&&&' "
             "                              \\    \". \"\" / \\&&&\"                       _,--- "
             "                                \"\",__\\_        /                    _,:\"::::: "
             "                              _,\" ,\"\"  ,-,__,/\":,_                ,\",\"::::::: "
             "                           _,\"  ,\"     `''   ::::,\",__,,----,,__,\" /::::::::: "
             "                        ,\"   ,\".__,          \\:::,\"            \"  /:::\":::::/ "
             "                      ,\"  ,/\"::::::\\          >\"                 (_-\"/:::::: "
             "                     /  ,\"_!:::::::/,       ,\"              _,,--,  /::::::/ "
             "                   /   \"\" _,\"\\:::::::'     !              ,\"      ){:::::/ "
             "                  !    _,\"    \\ \"\",         \\,\"\"\"-,____,\"__,,,\"_,\" _/ "
             "                   \"\"t\"       \\\\   \\          \"-,_(*)&&&&(*),\" \\ .\" "
             "                    /          \\\",  !            ,   \\   ! -    ) "
             "                    !          \\  \"\"             !    !==!\"-,__,' "
             "                    !           \\                 \"\"\"_\"\"\"\"`, \", /\"_ "
             "                    \\       ,   .l                 /\" \"     \", \\! ,_/ "
             "                     ),     \\   / \\                \\/       ,, /! ! "
             "                   ,::\\      \\,\"   \\                !        \\/ ! ! "
             "               _,::::\" )     )\\  ,\"  ___            \\ -,_,  ,\"\",! ! "
             "        __,,,::::\"\"   ,\"   ,\":::,-:::--:\"           __\\_!__/_\"\"-,_! "
             "  ,,:::\"\"\"\"\"\"\"      ,:_,\"\"__...._\"\"\"::::\"\"       /:::::\" \"\":::::: "
             " (:._              l::::::::::::\\\\/               \"\"          \"\" "
             "   \"\"\"\"--,,,---              \"\"\"\" "
             ""
             "I think so Brain..."))
     (point))
   'face 'doom-dashboard-banner))

(setq +doom-dashboard-ascii-banner-fn #'what-we-do-every-night-pinky)


;; spc spc for M-x
(map! :leader :n "SPC" #'execute-extended-command)



(setq +latex-viewers '(pdf-tools evince zathura okular skim sumatrapdf))

;; latex
(after! latex
  (add-hook 'pdf-view-mode-hook
            (lambda ()
              (display-line-numbers-mode -1)))

  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (setq-local company-idle-delay 0.8)
              ))

  (setq TeX-save-query nil
        TeX-show-compilation t
        TeX-command-extra-options "-shell-escape")

  (setq LaTeX-electric-left-right-brace t)
  (add-hook 'LaTeX-mode-hook #'turn-off-smartparens-mode)

  ;; Update PDF buffers after successful LaTeX runs
  (add-hook 'TeX-after-compilation-finished-functions
            #'TeX-revert-document-buffer)

  (defvar latex-nofill-env '("equation"
                             "equation*"
                             "align"
                             "align*"
                             "tabular"
                             "tikzpicture")
    "List of environment names in which `auto-fill-mode' will be inhibited.")

  (defun latex//autofill ()
    "Check whether the pointer is currently inside one of the
environments described in `latex-nofill-env' and if so, inhibits
the automatic filling of the current paragraph."
    (let ((do-auto-fill t)
          (current-environment "")
          (level 0))
      (while (and do-auto-fill (not (string= current-environment "document")))
        (setq level (1+ level)
              current-environment (LaTeX-current-environment level)
              do-auto-fill (not (member current-environment latex-nofill-env))))
      (when do-auto-fill
        (do-auto-fill))))

  (defun latex/auto-fill-mode ()
    "Toggle auto-fill-mode using the custom auto-fill function."
    (interactive)
    (auto-fill-mode)
    (setq auto-fill-function 'latex//autofill))

  ;; pretiefy mode
  (setq prettify-symbols-unprettify-at-point 'right-edge)
  )

(after! evil-snipe
  (setq evil-snipe-spillover-scope 'visible))


(after! tex
  (defvar tec/tex-last-delim-char nil
    "Last open delim expanded in a tex document")
  (defvar tec/tex-delim-dot-second t
    "When the `tec/tex-last-delim-char' is . a second character (this) is prompted for")
  (defun tec/get-open-delim-char ()
    "Exclusivly read next char to tec/tex-last-delim-char"
    (setq tec/tex-delim-dot-second nil)
    (setq tec/tex-last-delim-char (read-char-exclusive "Opening deliminator, recognises: 9 ( [ { < | ."))
    (when (eql ?. tec/tex-last-delim-char)
      (setq tec/tex-delim-dot-second (read-char-exclusive "Other deliminator, recognises: 0 9 (  ) [ ] { } < > |"))))
  (defun tec/tex-open-delim-from-char (&optional open-char)
    "Find the associated opening delim as string"
    (unless open-char (setq open-char (if (eql ?. tec/tex-last-delim-char)
                                          tec/tex-delim-dot-second
                                        tec/tex-last-delim-char)))
    (pcase open-char
      (?\( "(")
      (?9  "(")
      (?\[ "[")
      (?\{ "\\{")
      (?<  "<")
      (?|  (if tec/tex-delim-dot-second "." "|"))
      (_   ".")))
  (defun tec/tex-close-delim-from-char (&optional open-char)
    "Find the associated closing delim as string"
    (if tec/tex-delim-dot-second
        (pcase tec/tex-delim-dot-second
          (?\) ")")
          (?0  ")")
          (?\] "]")
          (?\} "\\}")
          (?\> ">")
          (?|  "|")
          (_   "."))
      (pcase (or open-char tec/tex-last-delim-char)
        (?\( ")")
        (?9  ")")
        (?\[ "]")
        (?\{ "\\}")
        (?<  ">")
        (?\) ")")
        (?0  ")")
        (?\] "]")
        (?\} "\\}")
        (?\> ">")
        (?|  "|")
        (_   "."))))
  (defun tec/tex-next-char-smart-close-delim (&optional open-char)
    (and (bound-and-true-p smartparens-mode)
         (eql (char-after) (pcase (or open-char tec/tex-last-delim-char)
                             (?\( ?\))
                             (?\[ ?\])
                             (?{ ?})
                             (?< ?>)))))
  (defun tec/tex-delim-yas-expand (&optional open-char)
    (yas-expand-snippet (yas-lookup-snippet "_deliminators" 'latex-mode) (point) (+ (point) (if (tec/tex-next-char-smart-close-delim open-char) 2 1)))))



(after! flyspell
  (define-key flyspell-mode-map (kbd "C-;") 'flyspell-correct-wrapper)
  (setq flyspell-lazy-idle-seconds 2)
  )


(after! flycheck
  (setq flycheck-check-syntax-automatically '(mode-enabled save idle-change))
  ;; (setq flycheck-flake8rc "~/.config/flake8")

  ;; (add-hook 'lsp-after-initialize-hook
  ;;           (lambda ()
  ;;             (flycheck-add-next-checker 'lsp '(warning . python-flake8))))
  )

(after! python
  (map! :map python-mode-map
        :n "C-c C-c" #'python-shell-send-buffer)
  )

(after! lsp-mode
  ;; (setq! lsp-enable-links nil)

  (require 'dap-lldb)

  (defun debugging-mode ()
    (interactive)
    (dap-mode t)
    (dap-ui-mode t)
    (dap-tooltip-mode)

    (dap-ui-controls-mode 1)
    (dap-ui-sessions)
    (dap-ui-locals)
    (dap-ui-breakpoints)
    (dap-ui-repl)
    )

  (defun stop-debugging-mode ()
    (interactive)
    (dap-delete-all-sessions)
    (dap-mode 0)
    (dap-ui-mode 0)
    (dap-ui-controls-mode 0)
    (delete-other-windows) ;; hide all the dap UI. I might want to delete the buffers as well.
    )

  )

(after! lsp-ui
  (setq lsp-ui-doc-delay 2)
  ;; (setq lsp-ui-doc-position 'top)
  (setq lsp-ui-doc-show-with-mouse t)
  )

;; dap mode hydra
(add-hook 'dap-stopped-hook
          (lambda (arg) (call-interactively #'dap-hydra)))


;; Preview buffer after split
(setq evil-vsplit-window-right t
      evil-split-window-below t)

(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (+ibuffer/open-for-current-workspace))

(after! ivy-posframe
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
  (ivy-posframe-mode 1)
  )

;; Company mode
(after! company
  (setq company-idle-delay 0.8
        company-minimum-prefix-length 3)
  ;; (setq company-show-numbers t)
  )

;; (after! company-posframe
;;   (company-posframe-mode 1)
;;   )

;; (after! company-box
;;   (setq company-box-doc-enable nil)
;;   (define-key! company-active-map "M-h" #'company-box-doc-manually))

(after! elcord
  ;; Discord integration
  (elcord-mode)
  (setq elcord-use-major-mode-as-main-icon t)
  )


;; matlab-mode
(after! matlab-mode
  (setq matlab-indent-function-body t)
  )


;; expand region
(map! :nv "C-SPC" nil
      :nv "C-SPC" #'er/expand-region
      :nv "C-S-SPC" #'er/contract-region)


;; window managment
(map! "M-<tab>" (lambda ()
                  (interactive)
                  (flip-window)))

(defun flip-window ()
  (interactive)
  (let ((win  (get-mru-window 'visible t t)))
    (if win
        (progn
          (select-frame-set-input-focus (window-frame win))
          (select-window win))
      (mode-line-other-buffer))))

;; (map!
;;  :after auto-yasnippet
;;  :map evil-normal-state-map
;;  "C-<tab>" nil)

(setq yas-triggers-in-field t)


(map! "C-<tab>" #'+workspace/other)

;; vterm
(after! vterm
  (define-key vterm-mode-map (kbd "C-g") #'vterm--self-insert))


(after! evil
  ;; change inside quotes
  (require 'evil-textobj-anyblock)
  (evil-define-text-object my-evil-textobj-anyblock-inner-quote
    (count &optional beg end type)
    "Select the closest outer quote."
    (let ((evil-textobj-anyblock-blocks
           '(("'" . "'")
             ("\"" . "\"")
             ("`" . "`")
             ("“" . "”"))))
      (evil-textobj-anyblock--make-textobj beg end type count nil)))

  (evil-define-text-object my-evil-textobj-anyblock-a-quote
    (count &optional beg end type)
    "Select the closest outer quote."
    (let ((evil-textobj-anyblock-blocks
           '(("'" . "'")
             ("\"" . "\"")
             ("`" . "`")
             ("“" . "”"))))
      (evil-textobj-anyblock--make-textobj beg end type count t)))

  (define-key evil-inner-text-objects-map "q" 'my-evil-textobj-anyblock-inner-quote)
  (define-key evil-outer-text-objects-map "q" 'my-evil-textobj-anyblock-a-quote)

  (map! "<backtab>" 'up-list)
  )

;; multicursor ignored commands

(after! evil-mc
  (add-to-list
   'evil-mc-custom-known-commands
   '(ess-smart-comma . ((:default . evil-mc-execute-default-call)))))

;; define function to shutdown emacs server instance
(defun server-shutdown ()
  "Save buffers, Quit, and Shutdown (kill) server"
  (interactive)
  (save-some-buffers)
  (kill-emacs)
  )

(defun server-shutdown-save-all ()
  "Save buffers, Quit, and Shutdown (kill) server"
  (interactive)
  (save-some-buffers t)
  (kill-emacs)
  )

;; smartparens
(after! smartparens
  (sp-local-pair 'org-mode "\\[" "\\]" :trigger "\\[")

  ;; disable '' auto pairing in electric-pair-mode for matlab-mode (' is transpose operator)
  (sp-local-pair 'matlab-mode "'" nil :actions nil)
  (sp-local-pair
   '(org-mode)
   "<<" ">>"
   :actions '(insert))
  )



;; org

(after! org
  ;; org-latex-compilers = ("pdflatex" "xelatex" "lualatex"), which are the possible values for %latex
  (setq org-latex-pdf-process '("latexmk -f -pdf -%latex -shell-escape -interaction=nonstopmode -output-directory=%o %f"))


  (setq-local company-idle-delay nil)


  ;; (setq org-deadline-warning-days 30)
  (setq org-src-window-setup 'split-window-below)
  ;; (setq org-preview-latex-default-process 'dvisvgm)

  ;; fix color handling in org-preview-latex-fragment
  ;; (let ((dvipng--plist (alist-get 'dvipng org-preview-latex-process-alist)))
  ;;   (plist-put dvipng--plist :use-xcolor t)
  ;;   (plist-put dvipng--plist :image-converter '("dvipng -D %D -T tight -o %O %f")))

  (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.0))
  ;; (setq org-format-latex-options (plist-put org-format-latex-options :background 'auto))

  (defun my/org-agenda-list-exclude-tags-advice (orig-fn &rest args)
    "Exclude selected tags from `org-agenda-list'.
Intended as :around advice for `org-agenda-list'."
    (let ((org-agenda-tag-filter-preset '("-Timesheet")))
      (apply orig-fn args)))

  (advice-add #'org-agenda-list :around #'my/org-agenda-list-exclude-tags-advice)


  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states)   ; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

  ;; (defun org-summary-todo (n-done n-not-done)
  ;;   "Switch entry to DONE when all subentries are done, to TODO otherwise."
  ;;   (let ( ; (org-log-done org-log-states)   ; turn off logging
  ;;         (total (org-entry-get (point) "TODO-total" 'inherit)))
  ;;     (if (and (not (equal nil total)) (not (equal "" total)))
  ;;         (org-todo (if (>= n-done (string-to-number total)) "DONE" "TODO"))
  ;;       (org-todo (if (= n-not-done 0) "DONE" "TODO"))
  ;;       )
  ;;     )
  ;;   )



  (add-hook! 'org-after-todo-statistics-hook 'org-summary-todo)

  (add-hook! 'org-mode-hook 'org-appear-mode)

  )



; https://tecosaur.github.io/emacs-config/config.html#pretty-code-blocks

(use-package! engrave-faces-latex
  :after ox-latex)

;; (defvar org-latex-universal-preamble "
;; \\usepackage[main,include]{embedall}
;; \\IfFileExists{./\\jobname.org}{\\embedfile[desc=The original file]{\\jobname.org}}{}


;; "
;;   "Preamble to be included in every export.")

;; (defvar org-latex-conditional-preambles
;;   `((t . org-latex-universal-preamble)
;;     ("\\[\\[file:.*\\.svg\\]\\]" . "\\usepackage{svg}"))
;;   "Snippets which are conditionally included in the preamble of a LaTeX export.

;; Alist where when the car results in a non-nil value, the cdr is inserted in
;; the preamble.  The car may be a:
;; - string, which is used as a regex search in the buffer
;; - symbol, the value of which used
;; - function, the result of the function is used

;; The cdr may be a:
;; - string, which is inserted without processing
;; - symbol, the value of which is inserted
;; - function, the result of which is inserted")

;; (defadvice! org-latex-header-smart-preamble (orig-fn tpl def-pkg pkg snippets-p &optional extra)
;;   "Dynamically insert preamble content based on `org-latex-conditional-preambles'."
;;   :around #'org-splice-latex-header
;;   (let ((header (funcall orig-fn tpl def-pkg pkg snippets-p extra)))
;;     (if snippets-p header
;;       (concat header
;;               (mapconcat (lambda (term-preamble)
;;                            (when (pcase (car term-preamble)
;;                                    ((pred stringp) (save-excursion
;;                                                        (goto-char (point-min))
;;                                                        (search-forward-regexp (car term-preamble) nil t)))
;;                                    ((pred functionp) (funcall (car term-preamble)))
;;                                    ((pred symbolp) (symbol-value (car term-preamble)))
;;                                    (_ (user-error "org-latex-conditional-preambles key %s unable to be used" (car term-preamble))))
;;                              (pcase (cdr term-preamble)
;;                                ((pred stringp) (cdr term-preamble))
;;                                ((pred functionp) (funcall (cdr term-preamble)))
;;                                ((pred symbolp) (symbol-value (cdr term-preamble)))
;;                                (_ (user-error "org-latex-conditional-preambles value %s unable to be used" (cdr term-preamble))))))
;;                          org-latex-conditional-preambles
;;                          "\n")))))

;;  (setq org-latex-listings 'engraved) ; NOTE non-standard value

;;  (defadvice! org-latex-src-block-engraved (orig-fn src-block contents info)
;;    "Like `org-latex-src-block', but supporting an engraved backend"
;;    :around #'org-latex-src-block
;;    (if (eq 'engraved (plist-get info :latex-listings))
;;        (org-latex-scr-block--engraved src-block contents info)
;;      (funcall orig-fn src-block contents info)))

;;  (defadvice! org-latex-inline-src-block-engraved (orig-fn inline-src-block contents info)
;;    "Like `org-latex-inline-src-block', but supporting an engraved backend"
;;    :around #'org-latex-inline-src-block
;;    (if (eq 'engraved (plist-get info :latex-listings))
;;        (org-latex-inline-scr-block--engraved inline-src-block contents info)
;;      (funcall orig-fn src-block contents info)))

;;  (setq org-latex-engraved-code-preamble "
;; \\usepackage{fvextra}
;; \\fvset{
;;   commandchars=\\\\\\{\\},
;;   highlightcolor=white!95!black!80!blue,
;;   breaklines=true,
;;   breaksymbol=\\color{white!60!black}\\tiny\\ensuremath{\\hookrightarrow}}
;; \\renewcommand\\theFancyVerbLine{\\footnotesize\\color{black!40!white}\\arabic{FancyVerbLine}}

;; \\definecolor{codebackground}{HTML}{f7f7f7}
;; \\definecolor{codeborder}{HTML}{f0f0f0}

;; % TODO have code boxes keep line vertical alignment
;; \\usepackage[breakable,xparse]{tcolorbox}
;; \\DeclareTColorBox[]{Code}{o}%
;; {colback=codebackground, colframe=codeborder,
;;   fontupper=\\footnotesize,
;;   colupper=EFD,
;;   IfNoValueTF={#1}%
;;   {boxsep=2pt, arc=2.5pt, outer arc=2.5pt,
;;     boxrule=0.5pt, left=2pt}%
;;   {boxsep=2.5pt, arc=0pt, outer arc=0pt,
;;     boxrule=0pt, leftrule=1.5pt, left=0.5pt},
;;   right=2pt, top=1pt, bottom=0.5pt,
;;   breakable}
;; ")

;;  (add-to-list 'org-latex-conditional-preambles '("#\\+BEGIN_SRC\\|#\\+begin_src" . org-latex-engraved-code-preamble) t)
;;  (add-to-list 'org-latex-conditional-preambles '("#\\+BEGIN_SRC\\|#\\+begin_src" . engrave-faces-latex-gen-preamble) t)

;;  (defun org-latex-scr-block--engraved (src-block contents info)
;;    (let* ((lang (org-element-property :language src-block))
;;           (attributes (org-export-read-attribute :attr_latex src-block))
;;           (float (plist-get attributes :float))
;;           (num-start (org-export-get-loc src-block info))
;;           (retain-labels (org-element-property :retain-labels src-block))
;;           (caption (org-element-property :caption src-block))
;;           (caption-above-p (org-latex--caption-above-p src-block info))
;;           (caption-str (org-latex--caption/label-string src-block info))
;;           (placement (or (org-unbracket-string "[" "]" (plist-get attributes :placement))
;;                          (plist-get info :latex-default-figure-position)))
;;           (float-env
;;            (cond
;;             ((string= "multicolumn" float)
;;              (format "\\begin{listing*}[%s]\n%s%%s\n%s\\end{listing*}"
;;                      placement
;;                      (if caption-above-p caption-str "")
;;                      (if caption-above-p "" caption-str)))
;;             (caption
;;              (format "\\begin{listing}[%s]\n%s%%s\n%s\\end{listing}"
;;                      placement
;;                      (if caption-above-p caption-str "")
;;                      (if caption-above-p "" caption-str)))
;;             ((string= "t" float)
;;              (concat (format "\\begin{listing}[%s]\n"
;;                              placement)
;;                      "%s\n\\end{listing}"))
;;             (t "%s")))
;;           (options (plist-get info :latex-minted-options))
;;           (content-buffer
;;            (with-temp-buffer
;;              (insert
;;               (let* ((code-info (org-export-unravel-code src-block))
;;                      (max-width
;;                       (apply 'max
;;                              (mapcar 'length
;;                                      (org-split-string (car code-info)
;;                                                        "\n")))))
;;                 (org-export-format-code
;;                  (car code-info)
;;                  (lambda (loc _num ref)
;;                    (concat
;;                     loc
;;                     (when ref
;;                       ;; Ensure references are flushed to the right,
;;                       ;; separated with 6 spaces from the widest line
;;                       ;; of code.
;;                       (concat (make-string (+ (- max-width (length loc)) 6)
;;                                            ?\s)
;;                               (format "(%s)" ref)))))
;;                  nil (and retain-labels (cdr code-info)))))
;;              (funcall (org-src-get-lang-mode lang))
;;              (engrave-faces-latex-buffer)))
;;           (content
;;            (with-current-buffer content-buffer
;;              (buffer-string)))
;;           (body
;;            (format
;;             "\\begin{Code}\n\\begin{Verbatim}[%s]\n%s\\end{Verbatim}\n\\end{Code}"
;;             ;; Options.
;;             (concat
;;              (org-latex--make-option-string
;;               (if (or (not num-start) (assoc "linenos" options))
;;                   options
;;                 (append
;;                  `(("linenos")
;;                    ("firstnumber" ,(number-to-string (1+ num-start))))
;;                  options)))
;;              (let ((local-options (plist-get attributes :options)))
;;                (and local-options (concat "," local-options))))
;;             content)))
;;      (kill-buffer content-buffer)
;;      ;; Return value.
;;      (format float-env body)))

;;  (defun org-latex-inline-scr-block--engraved (inline-src-block _contents info)
;;    (let ((options (org-latex--make-option-string
;;                    (plist-get info :latex-minted-options)))
;;          code-buffer code)
;;      (setq code-buffer
;;            (with-temp-buffer
;;              (insert (org-element-property :value inline-src-block))
;;              (funcall (org-src-get-lang-mode
;;                        (org-element-property :language inline-src-block)))
;;              (engrave-faces-latex-buffer)))
;;      (setq code (with-current-buffer code-buffer
;;                   (buffer-string)))
;;      (kill-buffer code-buffer)
;;      (format "\\Verb%s{%s}"
;;              (if (string= options "") ""
;;                (format "[%s]" options))
;;              code)))


;; (after! org
;;  (add-to-list 'org-latex-packages-alist '("" "minted"))
;;  (setq org-latex-listings 'minted)
;;  (setq org-src-fontify-natively t)
;;  )




(defun sync-with-dropbox ()
  "Sync folders with Dropbox"
  (interactive)
  (set-process-sentinel (start-process "Rclone & RcloneSyncV2 Uni and Org files" nil "/home/jake/scripts/dropboxsync.sh") #'output-message-sentinel)
  )

(defun output-message-sentinel (process msg)
  (when (memq (process-status process) '(exit signal))
    (message (concat (process-name process) " - " msg))))


(use-package! org-ol-tree
  :commands (org-ol-tree/display-sections)
  :init
  (map! :map org-mode-map
        :localleader
        (:prefix ("s" . "tree/subtree")
         "o" #'org-ol-tree
         )))

;; (after! org-ol-tree
;; (set-popup-rule! "\*OrgOutlineTree:.*\*" :quit nil)
;; )

(use-package! org-fragtog
  :after org)

(use-package! org-appear
:hook (org-mode . org-appear-mode)
:config
(setq org-appear-autoemphasis t
        org-appear-autosubmarkers t
        org-appear-autolinks nil)
;; for proper first-time setup, `org-appear--set-elements'
;; needs to be run after other hooks have acted.
(run-at-time nil nil #'org-appear--set-elements))
(defun locally-defer-font-lock ()
"Set jit-lock defer and stealth, when buffer is over a certain size."
(when (> (buffer-size) 50000)
(setq-local jit-lock-defer-time 0.05
                jit-lock-stealth-time 1)))

(use-package! org-ref
  :after org
  :config
  (setq org-ref-completion-library 'org-ref-ivy-cite)
  )













































(after! org
;; org-latex-compilers = ("pdflatex" "xelatex" "lualatex"), which are the possible values for %latex
  (setq org-latex-pdf-process '("latexmk -f -pdf -%latex -shell-escape -interaction=nonstopmode -output-directory=%o %f"))
  (defun +org-export-latex-fancy-item-checkboxes (text backend info)
    (when (org-export-derived-backend-p backend 'latex)
      (replace-regexp-in-string
       "\\\\item\\[{$\\\\\\(\\w+\\)$}\\]"
       (lambda (fullmatch)
         (concat "\\\\item[" (pcase (substring fullmatch 9 -3) ; content of capture group
                               ("square"   "\\\\checkboxUnchecked")
                               ("boxminus" "\\\\checkboxTransitive")
                               ("boxtimes" "\\\\checkboxChecked")
                               (_ (substring fullmatch 9 -3))) "]"))
       text)))

  (add-to-list 'org-export-filter-item-functions
               '+org-export-latex-fancy-item-checkboxes)

  (defvar org-latex-embed-files-preamble "
  \\usepackage[main,include]{embedall}
  \\IfFileExists{./\\jobname.org}{\\embedfile[desc=The original file]{\\jobname.org}}{}
  "
    "Preamble that embeds files within the pdf.")

  (defvar org-latex-box-preamble "
  % args = #1 Name, #2 Colour, #3 Ding, #4 Label
  \\newcommand{\\defsimplebox}[4]{%
    \\definecolor{#1}{HTML}{#2}
    \\newenvironment{#1}[1][]
    {%
      \\textcolor{#1}{#3} \\textcolor{#1}{\\textbf{\\def\\temp{##1}\\ifx\\temp\\empty#4\\else##1\\fi}}%
      \\vspace{-0.8\\baselineskip}
      \\begin{addmargin}[1em]{1em}
    }{%
      \\end{addmargin}
      \\vspace{-0.5\\baselineskip}
    }%
  }
  "
    "Preamble that provides a macro for custom boxes.")
  (defun org-babel-tangle-files ()
    "All files that may be tangled to.
  Uses a stripped-down version of `org-babel-tangle'"
    (let (files)
      (save-excursion
        (mapc ;; map over all languages
         (lambda (by-lang)
           (let* ((lang (car by-lang))
                  (specs (cdr by-lang))
                  (ext (or (cdr (assoc lang org-babel-tangle-lang-exts)) lang)))
             (mapc
              (lambda (spec)
                (let ((get-spec (lambda (name) (cdr (assoc name (nth 4 spec))))))
                  (let* ((tangle (funcall get-spec :tangle))
                         (base-name (cond
                                     ((string= "yes" tangle)
                                      (file-name-sans-extension
                                       (nth 1 spec)))
                                     ((string= "no" tangle) nil)
                                     ((> (length tangle) 0) tangle)))
                         (file-name (when base-name
                                      ;; decide if we want to add ext to base-name
                                      (if (and ext (string= "yes" tangle))
                                          (concat base-name "." ext) base-name))))
                    (push file-name files))))
              specs)))
         (org-babel-tangle-collect-blocks)))
      (delq nil (cl-delete-duplicates files :test #'string=))))
  (defun org-latex-embed-tangled-files ()
    "Return a string that uses embedfile to embed all tangled files."
    (mapconcat
     (lambda (tangle-file)
       (format "\\IfFileExists{%1$s}{\\embedfile[desc=A tangled file]{%1$s}}{}"
               (->> tangle-file
                    (replace-regexp-in-string "\\\\" "\\\\\\\\")
                    (replace-regexp-in-string "~" "\\\\string~"))))
     (org-babel-tangle-files)
     "\n"))
  (defvar org-latex-embed-files t
    "Embed the source .org, .tex, and any tangled files.")
  (defvar org-latex-italic-quotes t
    "Make \"quote\" environments italic.")
  (defvar org-latex-par-sep t
    "Vertically seperate paragraphs, and remove indentation.")

  (defvar org-latex-conditional-features
    '(("\\[\\[\\(?:file\\|https?\\):\\(?:[^]]\\|\\\\\\]\\)+?\\.\\(?:eps\\|pdf\\|png\\|jpeg\\|jpg\\|jbig2\\)\\]\\]" . image)
      ("\\[\\[\\(?:file\\|https?\\):\\(?:[^]]+?\\|\\\\\\]\\)\\.svg\\]\\]" . svg)
      ("^[ \t]*|" . table)
      ("[;\\\\]?\\b[A-Z][A-Z]+s?[^A-Za-z]" . acronym)
      ("\\+[^ ].*[^ ]\\+\\|_[^ ].*[^ ]_\\|\\\\uu?line\\|\\\\uwave\\|\\\\sout\\|\\\\xout\\|\\\\dashuline\\|\\dotuline\\|\\markoverwith" . underline)
      (":float wrap" . float-wrap)
      (":float sideways" . rotate)
      ((and org-latex-italic-quotes "^[ \t]*#\\+begin_quote\\|\\\\begin{quote}") . italic-quotes)
      (org-latex-par-sep . par-sep)
      ((org-latex-embed-tangled-files) . embed-files)
      ((and org-latex-embed-files "^[ \t]*#\\+begin_src\\|^[ \t]*#\\+BEGIN_SRC") . embed-tangled)
      ("^[ \t]*#\\+begin_warning\\|\\\\begin{warning}" . box-warning)
      ("^[ \t]*#\\+begin_info\\|\\\\begin{info}"       . box-info)
      ("^[ \t]*#\\+begin_success\\|\\\\begin{success}" . box-success)
      ("^[ \t]*#\\+begin_error\\|\\\\begin{error}"     . box-error))
    "Org feature tests and associated LaTeX feature flags.

  Alist where the car is a test for the presense of the feature,
  and the cdr is either a single feature symbol or list of feature symbols.

  When a string, it is used as a regex search in the buffer.
  The feature is registered as present when there is a match.

  The car can also be a
  - symbol, the value of which is fetched
  - function, which is called with info as an argument
  - list, which is `eval'uated

  If the symbol, function, or list produces a string: that is used as a regex
  search in the buffer. Otherwise any non-nil return value will indicate the
  existance of the feature.")
  (defvar org-latex-feature-implementations
    '((image         :snippet "\\usepackage{graphicx}" :order 2)
      (svg           :snippet "\\usepackage{svg}" :order 2)
      (table         :snippet "\\usepackage{longtable}\n\\usepackage{booktabs}" :order 2)
      (underline     :snippet "\\usepackage[normalem]{ulem}" :order 0.5)
      (float-wrap    :snippet "\\usepackage{wrapfig}" :order 2)
      (rotate        :snippet "\\usepackage{rotating}" :order 2)
      (embed-files   :snippet org-latex-embed-files-preamble :order -2)
      (embed-tangled :requires embed-files :snippet (concat (org-latex-embed-tangled-files) "\n") :order -1)
      (acronym       :snippet "\\newcommand{\\acr}[1]{\\protect\\textls*[110]{\\scshape #1}}\n\\newcommand{\\acrs}{\\protect\\scalebox{.91}[.84]{\\hspace{0.15ex}s}}" :order 0.4)
      (italic-quotes :snippet "\\renewcommand{\\quote}{\\list{}{\\rightmargin\\leftmargin}\\item\\relax\\em}\n" :order 0.5)
      (par-sep       :snippet "\\setlength{\\parindent}{0pt}\n" :order 0.5)
      (.pifont       :snippet "\\usepackage{pifont}")
      (.fancy-box    :requires .pifont    :snippet org-latex-box-preamble :order 3.9)
      (box-warning   :requires .fancy-box :snippet "\\defsimplebox{warning}{e66100}{\\ding{68}}{Warning}" :order 4)
      (box-info      :requires .fancy-box :snippet "\\defsimplebox{info}{3584e4}{\\ding{68}}{Information}" :order 4)
      (box-success   :requires .fancy-box :snippet "\\defsimplebox{success}{26a269}{\\ding{68}}{\\vspace{-\\baselineskip}}" :order 4)
      (box-error     :requires .fancy-box :snippet "\\defsimplebox{error}{c01c28}{\\ding{68}}{Important}" :order 4))
    "LaTeX features and details required to implement them.

  List where the car is the feature symbol, and the rest forms a plist with the
  following keys:
  - :snippet, which may be either
    - a string which should be included in the preamble
    - a symbol, the value of which is included in the preamble
    - a function, which is evaluated with the list of feature flags as its
      single argument. The result of which is included in the preamble
    - a list, which is passed to `eval', with a list of feature flags available
      as \"features\"

  - :requires, a feature or list of features that must be available
  - :when, a feature or list of features that when all available should cause this
      to be automatically enabled.
  - :prevents, a feature or list of features that should be masked
  - :order, for when ordering is important. Lower values appear first.
      The default is 0.

  Features that start with ! will be eagerly loaded, i.e. without being detected.")
  (defun org-latex-detect-features (&optional buffer info)
    "List features from `org-latex-conditional-features' detected in BUFFER."
    (let ((case-fold-search nil))
      (with-current-buffer (or buffer (current-buffer))
        (delete-dups
         (mapcan (lambda (construct-feature)
                   (when (let ((out (pcase (car construct-feature)
                                      ((pred stringp) (car construct-feature))
                                      ((pred functionp) (funcall (car construct-feature) info))
                                      ((pred listp) (eval (car construct-feature)))
                                      ((pred symbolp) (symbol-value (car construct-feature)))
                                      (_ (user-error "org-latex-conditional-features key %s unable to be used" (car construct-feature))))))
                           (if (stringp out)
                               (save-excursion
                                 (goto-char (point-min))
                                 (re-search-forward out nil t))
                             out))
                     (if (listp (cdr construct-feature)) (cdr construct-feature) (list (cdr construct-feature)))))
                 org-latex-conditional-features)))))
  (defun org-latex-expand-features (features)
    "For each feature in FEATURES process :requires, :when, and :prevents keywords and sort according to :order."
    (dolist (feature features)
      (unless (assoc feature org-latex-feature-implementations)
        (error "Feature %s not provided in org-latex-feature-implementations" feature)))
    (setq current features)
    (while current
      (when-let ((requirements (plist-get (cdr (assq (car current) org-latex-feature-implementations)) :requires)))
        (setcdr current (if (listp requirements)
                            (append requirements (cdr current))
                          (cons requirements (cdr current)))))
      (setq current (cdr current)))
    (dolist (potential-feature
             (append features (delq nil (mapcar (lambda (feat)
                                                  (when (plist-get (cdr feat) :eager)
                                                    (car feat)))
                                                org-latex-feature-implementations))))
      (when-let ((prerequisites (plist-get (cdr (assoc potential-feature org-latex-feature-implementations)) :when)))
        (setf features (if (if (listp prerequisites)
                               (cl-every (lambda (preq) (memq preq features)) prerequisites)
                             (memq prerequisites features))
                           (append (list potential-feature) features)
                         (delq potential-feature features)))))
    (dolist (feature features)
      (when-let ((prevents (plist-get (cdr (assoc feature org-latex-feature-implementations)) :prevents)))
        (setf features (cl-set-difference features (if (listp prevents) prevents (list prevents))))))
    (sort (delete-dups features)
          (lambda (feat1 feat2)
            (if (< (or (plist-get (cdr (assoc feat1 org-latex-feature-implementations)) :order) 1)
                   (or (plist-get (cdr (assoc feat2 org-latex-feature-implementations)) :order) 1))
                t nil))))
  (defun org-latex-generate-features-preamble (features)
    "Generate the LaTeX preamble content required to provide FEATURES.
  This is done according to `org-latex-feature-implementations'"
    (let ((expanded-features (org-latex-expand-features features)))
      (concat
       (format "\n%% features: %s\n" expanded-features)
       (mapconcat (lambda (feature)
                    (when-let ((snippet (plist-get (cdr (assoc feature org-latex-feature-implementations)) :snippet)))
                      (concat
                       (pcase snippet
                         ((pred stringp) snippet)
                         ((pred functionp) (funcall snippet features))
                         ((pred listp) (eval `(let ((features ',features)) (,@snippet))))
                         ((pred symbolp) (symbol-value snippet))
                         (_ (user-error "org-latex-feature-implementations :snippet value %s unable to be used" snippet)))
                       "\n")))
                  expanded-features
                  "")
       "% end features\n")))
  (defvar info--tmp nil)

  (defadvice! org-latex-save-info (info &optional t_ s_)
    :before #'org-latex-make-preamble
    (setq info--tmp info))

  (defadvice! org-splice-latex-header-and-generated-preamble-a (orig-fn tpl def-pkg pkg snippets-p &optional extra)
    "Dynamically insert preamble content based on `org-latex-conditional-preambles'."
    :around #'org-splice-latex-header
    (let ((header (funcall orig-fn tpl def-pkg pkg snippets-p extra)))
      (if snippets-p header
        (concat header
                (org-latex-generate-features-preamble (org-latex-detect-features nil info--tmp))
                "\n"))))
  (setq org-latex-default-packages-alist
        '(("AUTO" "inputenc" t ("pdflatex"))
          ("T1" "fontenc" t ("pdflatex"))
          ("" "xcolor" nil) ; Generally useful
          ("" "hyperref" nil)))

  (setq org-latex-listings 'engraved) ; NOTE non-standard value
  (defadvice! org-latex-src-block-engraved (orig-fn src-block contents info)
    "Like `org-latex-src-block', but supporting an engraved backend"
    :around #'org-latex-src-block
    (if (eq 'engraved (plist-get info :latex-listings))
        (org-latex-scr-block--engraved src-block contents info)
      (funcall orig-fn src-block contents info)))

  (defadvice! org-latex-inline-src-block-engraved (orig-fn inline-src-block contents info)
    "Like `org-latex-inline-src-block', but supporting an engraved backend"
    :around #'org-latex-inline-src-block
    (if (eq 'engraved (plist-get info :latex-listings))
        (org-latex-inline-scr-block--engraved inline-src-block contents info)
      (funcall orig-fn src-block contents info)))

  (defvar-local org-export-has-code-p nil)

  (defadvice! org-export-expect-no-code (&rest _)
    :before #'org-export-as
    (setq org-export-has-code-p nil))

  (defadvice! org-export-register-code (&rest _)
    :after #'org-latex-src-block-engraved
    :after #'org-latex-inline-src-block-engraved
    (setq org-export-has-code-p t))

  (setq org-latex-engraved-code-preamble "
  \\usepackage{fvextra}
  \\fvset{
    commandchars=\\\\\\{\\},
    highlightcolor=white!95!black!80!blue,
    breaklines=true,
    breaksymbol=\\color{white!60!black}\\tiny\\ensuremath{\\hookrightarrow}}
  \\renewcommand\\theFancyVerbLine{\\footnotesize\\color{black!40!white}\\arabic{FancyVerbLine}}

  \\definecolor{codebackground}{HTML}{f7f7f7}
  \\definecolor{codeborder}{HTML}{f0f0f0}

  % TODO have code boxes keep line vertical alignment
  \\usepackage[breakable,xparse]{tcolorbox}
  \\DeclareTColorBox[]{Code}{o}%
  {colback=codebackground, colframe=codeborder,
    fontupper=\\footnotesize,
    colupper=EFD,
    IfNoValueTF={#1}%
    {boxsep=2pt, arc=2.5pt, outer arc=2.5pt,
      boxrule=0.5pt, left=2pt}%
    {boxsep=2.5pt, arc=0pt, outer arc=0pt,
      boxrule=0pt, leftrule=1.5pt, left=0.5pt},
    right=2pt, top=1pt, bottom=0.5pt,
    breakable}
  ")

  (add-to-list 'org-latex-conditional-features '((and org-export-has-code-p "^[ \t]*#\\+begin_src\\|^[ \t]*#\\+BEGIN_SRC\\|src_[A-Za-z]") . engraved-code) t)
  (add-to-list 'org-latex-conditional-features '("^[ \t]*#\\+begin_example\\|^[ \t]*#\\+BEGIN_EXAMPLE" . engraved-code-setup) t)
  (add-to-list 'org-latex-feature-implementations '(engraved-code :requires engraved-code-setup :snippet (engrave-faces-latex-gen-preamble) :order 99) t)
  (add-to-list 'org-latex-feature-implementations '(engraved-code-setup :snippet org-latex-engraved-code-preamble :order 98) t)

  (defun org-latex-scr-block--engraved (src-block contents info)
    (let* ((lang (org-element-property :language src-block))
           (attributes (org-export-read-attribute :attr_latex src-block))
           (float (plist-get attributes :float))
           (num-start (org-export-get-loc src-block info))
           (retain-labels (org-element-property :retain-labels src-block))
           (caption (org-element-property :caption src-block))
           (caption-above-p (org-latex--caption-above-p src-block info))
           (caption-str (org-latex--caption/label-string src-block info))
           (placement (or (org-unbracket-string "[" "]" (plist-get attributes :placement))
                          (plist-get info :latex-default-figure-position)))
           (float-env
            (cond
             ((string= "multicolumn" float)
              (format "\\begin{listing*}[%s]\n%s%%s\n%s\\end{listing*}"
                      placement
                      (if caption-above-p caption-str "")
                      (if caption-above-p "" caption-str)))
             (caption
              (format "\\begin{listing}[%s]\n%s%%s\n%s\\end{listing}"
                      placement
                      (if caption-above-p caption-str "")
                      (if caption-above-p "" caption-str)))
             ((string= "t" float)
              (concat (format "\\begin{listing}[%s]\n"
                              placement)
                      "%s\n\\end{listing}"))
             (t "%s")))
           (options (plist-get info :latex-minted-options))
           (content-buffer
            (with-temp-buffer
              (insert
               (let* ((code-info (org-export-unravel-code src-block))
                      (max-width
                       (apply 'max
                              (mapcar 'length
                                      (org-split-string (car code-info)
                                                        "\n")))))
                 (org-export-format-code
                  (car code-info)
                  (lambda (loc _num ref)
                    (concat
                     loc
                     (when ref
                       ;; Ensure references are flushed to the right,
                       ;; separated with 6 spaces from the widest line
                       ;; of code.
                       (concat (make-string (+ (- max-width (length loc)) 6)
                                            ?\s)
                               (format "(%s)" ref)))))
                  nil (and retain-labels (cdr code-info)))))
              (funcall (org-src-get-lang-mode lang))
              (engrave-faces-latex-buffer)))
           (content
            (with-current-buffer content-buffer
              (buffer-string)))
           (body
            (format
             "\\begin{Code}\n\\begin{Verbatim}[%s]\n%s\\end{Verbatim}\n\\end{Code}"
             ;; Options.
             (concat
              (org-latex--make-option-string
               (if (or (not num-start) (assoc "linenos" options))
                   options
                 (append
                  `(("linenos")
                    ("firstnumber" ,(number-to-string (1+ num-start))))
                  options)))
              (let ((local-options (plist-get attributes :options)))
                (and local-options (concat "," local-options))))
             content)))
      (kill-buffer content-buffer)
      ;; Return value.
      (format float-env body)))

  (defun org-latex-inline-scr-block--engraved (inline-src-block _contents info)
    (let ((options (org-latex--make-option-string
                    (plist-get info :latex-minted-options)))
          code-buffer code)
      (setq code-buffer
            (with-temp-buffer
              (insert (org-element-property :value inline-src-block))
              (funcall (org-src-get-lang-mode
                        (org-element-property :language inline-src-block)))
              (engrave-faces-latex-buffer)))
      (setq code (with-current-buffer code-buffer
                   (buffer-string)))
      (kill-buffer code-buffer)
      (format "\\Verb%s{%s}"
              (if (string= options "") ""
                (format "[%s]" options))
              code)))
  (defadvice! org-latex-example-block-engraved (orig-fn example-block contents info)
    "Like `org-latex-example-block', but supporting an engraved backend"
    :around #'org-latex-example-block
    (let ((output-block (funcall orig-fn example-block contents info)))
      (if (eq 'engraved (plist-get info :latex-listings))
          (format "\\begin{Code}[alt]\n%s\n\\end{Code}" output-block)
        output-block)))

  (add-to-list 'org-latex-feature-implementations '(.custom-font-no-mono :eager t :prevents custom-font :order 0 :snippet (org-latex-fontset :serif :sans)) t)

  (defvar org-latex-extra-special-string-regexps
    '(("->" . "\\\\textrightarrow{}")
      ("<-" . "\\\\textleftarrow{}")))

  (defun org-latex-convert-extra-special-strings (string)
    "Convert special characters in STRING to LaTeX."
    (dolist (a org-latex-extra-special-string-regexps string)
      (let ((re (car a))
            (rpl (cdr a)))
        (setq string (replace-regexp-in-string re rpl string t)))))

  (defadvice! org-latex-plain-text-extra-special-a (orig-fn text info)
    "Make `org-latex-plain-text' handle some extra special strings."
    :around #'org-latex-plain-text
    (let ((output (funcall orig-fn text info)))
      (when (plist-get info :with-special-strings)
        (setq output (org-latex-convert-extra-special-strings output)))
      output))

  (setq org-latex-text-markup-alist
        '((bold . "\\textbf{%s}")
          (code . protectedtexttt)
          (italic . "\\emph{%s}")
          (strike-through . "\\sout{%s}")
          (underline . "\\uline{%s}")
          (verbatim . verb)))
  (defadvice! no-auto-mode-alist (orig-fn &rest args)
    "Wrap ORIG-FN in a let-binding that sets `auto-mode-alist' to nil."
    :around #'org-export-to-file
    (let ((auto-mode-alist nil))
      (apply orig-fn args)))
  (setq org-required-latex-packages
        '("adjustbox" "arev" "amsmath" "booktabs" "cancel" "capt-of" "caption" "embedall" "fourier" "fvextra" "gillius" "graphicx" "hyperref" "mathalpha" "mathtools" "microtype" "pdfx" "pifont" "preview" "siunitx" "soul" "subcaption" "svg" "tcolorbox" "xcolor" "xparse" "Alegreya" "biolinum" "FiraMono" "FiraSans" "kpfonts" "libertine" "newpxmath" "newpxtext" "newtxmath" "newtxtext" "newtxsf" "noto" "plex-mono" "plex-sans" "plex-serif" "sourcecodepro" "sourcesanspro" "sourceserifpro"))
  ;; Detected missing LaTeX packages: siunitx
  (defun check-for-latex-packages
      (packages)
    (delq nil
        (mapcar
         (lambda
           (package)
           (unless
               (= 0
                  (shell-command
                   (format "kpsewhich %s.sty" package)))
             package))
         packages)))
  (defun +org-warn-about-missing-latex-packages
      (&rest _)
    (message "Checking for missing LaTeX packages...")
    (sleep-for 0.4)
    (if-let
        (missing-pkgs
         (check-for-latex-packages org-required-latex-packages))
        (message "%s You are missing the following LaTeX packages: %s."
               (propertize "Warning!" 'face
                           '(bold warning))
               (mapconcat
                (lambda
                  (pkg)
                  (propertize pkg 'face 'font-lock-variable-name-face))
                missing-pkgs ", "))
      (message "%s You have all the required LaTeX packages. Run %s to make this message go away."
             (propertize "Success!" 'face
                         '(bold success))
             (propertize "doom sync" 'face 'font-lock-keyword-face))
      (advice-remove 'org-latex-export-to-pdf #'+org-warn-about-missing-latex-packages))
    (sleep-for 1))
  (advice-add 'org-latex-export-to-pdf :before #'+org-warn-about-missing-latex-packages)
)
