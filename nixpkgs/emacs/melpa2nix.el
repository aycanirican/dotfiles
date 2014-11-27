(require 'package)
(package-initialize)

(require 'package-build)

(setq package-build-working-dir (expand-file-name ".")
      package-build-archive-dir (expand-file-name ".")
      melpa2nix-archive-file    (getenv "melpa2nixArchiveFile"))

(defun melpa2nix-install-package ()
  (if (not noninteractive)
      (error "`melpa2nix-install-package' is to be used only with -batch"))
  (pcase command-line-args-left
    (`(,elpa)
     (progn (setq package-user-dir elpa)
            (package-install-file
             (pb/read-from-file melpa2nix-archive-file))))))

(defun melpa2nix-build-package ()
  (if (not noninteractive)
      (error "`melpa2nix-build-package' is to be used only with -batch"))
  (pcase command-line-args-left
    (`(,package ,version . ,files)
     (melpa2nix-package-build-archive package version files))))

(defun melpa2nix-package-build-archive (name version files)
  "Build a package archive for package NAME."
  (pb/message "\n;;; %s\n" name)
  (let* ((start-time (current-time))
         (archive-entry (package-build-package name
                                               version
                                               files
                                               "."
                                               package-build-archive-dir)))
    
    (pb/dump (pb/archive-file-name archive-entry) melpa2nix-archive-file)
    
    (pb/message "Built in %.3fs, finished at %s"
                (time-to-seconds (time-since start-time))
                (current-time-string))))
