;;; org-license.el --- Add a license to your org files

;; Copyright (C) 2013 Free Software Foundation, Inc.

;; Author: David Arroyo Menéndez <davidam@es.gnu.org>
;; Keywords: licenses, creative commons
;; Homepage: http://orgmode.org
;;
;; This file is not part of GNU Emacs, yet.
;;
;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:

;; This file implements functions to add a license fast in org files.
;; Org-mode doesn't load this module by default - if this is not what
;; you want, configure the variable `org-modules'. Thanks to #emacs-es
;; irc channel for your support.

;;; Code:

;; 
;;
;; You can download the images from http://www.davidam/img/licenses.tar.gz
;;
;; TODO: create a function to test all combinations of licenses

(defvar org-license-images-directory "")

(defun org-license-cc-by (language)
  (interactive "MLanguage ( br | ca | de | en | es | eo | eu | fr | gl | it | pt ): " language)
  (cond ((equal language "br")
	 (setq org-license-cc-url "https://creativecommons.org/licenses/by-sa/3.0/br/deed.pt_BR")
	 (insert (concat "* Licença
Este texto é disponibilizado nos termos da licença [[" org-license-cc-url "][Atribuição 3.0 Brasil]]\n")))
	((equal language "ca")
	 (setq org-license-cc-url "https://creativecommons.org/licenses/by-sa/3.0/es/deed.ca")
	 (insert (concat "* Licència
El text està disponible sota la [[" org-license-cc-url "][Reconeixement 3.0 Espanya]]\n")))
	((equal language "de")
	 (setq org-license-cc-url "https://creativecommons.org/licenses/by-sa/3.0/de/deed.de")
	 (insert (concat "* Lizenz
Dieses Werk bzw. Inhalt steht unter einer [[" org-license-cc-url "][Lizenz Creative Commons Namensnennung 3.0 Deutschland]]\n")))
	((equal language "eo")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by/3.0/eo/deed.eo")
	 (insert (concat "* Licenco
Ĉi tiu verko estas disponebla laŭ la permesilo [[" org-license-cc-url "][Krea Komunaĵo Atribuite 3.0 Neadaptita]]\n")))
	 ((equal language "es")
	  (setq org-license-cc-url "http://creativecommons.org/licenses/by/3.0/es/deed.es")
	  (insert (concat "* Licencia
Este documento está bajo una [[" org-license-cc-url "][Licencia Creative Commons Atribución 3.0 España]]\n")))
	 ((equal language "eu")
	  (setq org-license-cc-url "http://creativecommons.org/licenses/by/3.0/es/deed.eu")
	  (insert (concat "* Licenzua
Testua [[" org-license-cc-url "][Aitortu 3.0 Espainia]] lizentziari jarraituz erabil daiteke\n")))
	 ((equal language "fr")
	  (setq org-license-cc-url "http://creativecommons.org/licenses/by/3.0/fr/deed.fr")
	  (insert (concat "* Licence
Ce(tte) œuvre est mise à disposition selon les termes de la [[" org-license-cc-url "][Licence Creative Commons Attribution 3.0 France]]\n")))
	 ((equal language "gl")
	  (setq org-license-cc-url "http://creativecommons.org/licenses/by/3.0/es/deed.gl")
	  (insert "* Licenza
Todo o texto está dispoñible baixo a [[http://creativecommons.org/licenses/by/3.0/es/deed.gl][licenza Creative Commons recoñecemento compartir igual 3.0]]\n"))
	 ((equal language "it")
	  (setq org-license-cc-url "http://creativecommons.org/licenses/by/3.0/it/deed.it")
	  (insert "* Licenza
Quest'opera e distribuita con Licenza [[http://creativecommons.org/licenses/by/3.0/it/deed.it][Licenza Creative Commons Attribuzione 3.0 Italia]]\n"))
	 ((equal language "pt")
	  (setq org-license-cc-url "http://creativecommons.org/licenses/by/3.0/pt/deed.pt")
	  (insert (concat "* Licença
Este texto é disponibilizado nos termos da licença [[" org-license-cc-url "][Atribuição 3.0 Portugal]]\n")))
	 (t (concat (insert "* License
This document is under a [[" org-license-cc-url "][Creative Commons Attribution 3.0]]\n"))))
  (if (string= "" org-license-images-directory)
      (insert (concat "\n[[" org-license-cc-url "][file:http://i.creativecommons.org/l/by/3.0/80x15.png]]\n"))
    (insert (concat "\n[[" org-license-cc-url "][file:" org-license-images-directory "/by/3.0/80x15.png]]\n"))))

(defun org-license-cc-by-sa (language)
  (interactive "MLanguage ( br | ca | de | en | es | eu | fr | it | pt ): " language)
  (cond ((equal language "br")
	 (setq org-license-cc-url "https://creativecommons.org/licenses/by-sa/3.0/br/deed.pt_BR")
	 (concat (insert "* Licença
Este texto é disponibilizado nos termos da licença [[" org-license-cc-url "][Atribuição Compartil ha Igual 3.0 Brasil]]\n")))
	((equal language "ca")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-sa/3.0/es/deed.ca")
	 (insert (concat "* Licència
El text està disponible sota la [[" org-license-cc-url "][Reconeixement-CompartirIgual 3.0 Espanya]]\n")))
	((equal language "de")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-sa/3.0/de/deed.de")
	 (insert (concat "* Lizenz
Dieses Werk bzw. Inhalt steht unter einer [[" org-license-cc-url "][Namensnennung - Weitergabe unter gleichen Bedingungen 3.0 Deutschland]]\n")))
	((equal language "es") 
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-sa/3.0/es/deed.es") 
	 (concat (insert "* Licencia
Este documento está bajo una [[" org-license-cc-url "][Licencia Creative Commons Atribución Compartir por Igual 3.0 España]]\n")))
	((equal language "eu")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-sa/3.0/es/deed.eu")
	 (concat (insert "* Licenzua
Testua [[" org-license-cc-url "][Aitortu-PartekatuBerdin 3.0 Espainia]] lizentziari jarraituz erabil daiteke\n")))
	((equal language "fr")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-sa/3.0/fr/deed.fr")
	 (concat (insert "* Licence
Ce(tte) œuvre est mise à disposition selon les termes de la [[" org-license-cc-url "][Licence Creative Commons Attribution - Partage dans les Mêmes Conditions 3.0 France]]\n")))
	((equal language "gl")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-sa/3.0/es/deed.gl")
	 (insert (concat "* Licenza
Todo o texto está dispoñible baixo a [[" org-license-cc-url "][licenza Creative Commons recoñecemento compartir igual 3.0]]\n.")))
	((equal language "it")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-sa/3.0/it/deed.it")
	 (insert (concat "* Licenza
Quest'opera e distribuita con Licenza [[" org-license-cc-url "][Licenza Creative Commons Attribuzione - Condividi allo stesso modo 3.0 Italia]]\n")))
	((equal language "pt")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-sa/3.0/pt/deed.pt")
	 (insert (concat "* Licença
Este texto é disponibilizado nos termos da licença [[" org-license-cc-url "][Atribuição-CompartilhaIgual 3.0 Portugal]]\n")))
	(t
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-sa/3.0/deed")
	 (insert (concat "* License
This document is under a [[" org-license-cc-url "][License Creative Commons Attribution-ShareAlike Unported 3.0]]\n"))))
  (if (string= "" org-license-images-directory)
      (insert (concat "\n[[" org-license-cc-url "][file:http://i.creativecommons.org/l/by-sa/3.0/80x15.png]]\n"))
    (insert (concat "\n[[" org-license-cc-url "][file:" org-license-images-directory "/by-sa/3.0/80x15.png]]\n"))))

(defun org-license-cc-by-nd (language)
  (interactive "MLanguage ( br | ca | de | en | es | eu | fr | it | pt ): " language)
  (cond ((equal language "br")
	 (setq org-license-cc-url "https://creativecommons.org/licenses/by-nd/3.0/br/deed.pt_BR")
	 (insert (concat "* Licença
Este texto é disponibilizado nos termos da licença [[" org-license-cc-url "][Atribuição Compartil ha Igual 3.0 Brasil]]\n")))
	((equal language "ca")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nd/3.0/es/deed.ca")
	 (insert (concat "* Licència
El text està disponible sota la [[" org-license-cc-url "][Reconeixement-SenseObraDerivada 3.0 Espanya]]\n")))
	((equal language "de")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nd/3.0/de/deed.de")
	 (insert (concat "* Lizenz
Dieses Werk bzw. Inhalt steht unter einer [[" org-license-cc-url "][Namensnennung-Keine Bearbeitung 3.0 Deutschland]]\n")))
	((equal language "es")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nd/3.0/es/deed.es") 
	 (insert (concat "* Licencia
Este documento está bajo una [[" org-license-cc-url "][Licencia Creative Commons Atribución-SinDerivadas 3.0]]\n")))
	((equal language "eu")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-sa/3.0/es/deed.eu")
	 (insert (concat "* Licenzua
Testua [[" org-license-cc-url "][Aitortu-LanEratorririkGabe 3.0 Espainia]] lizentziari jarraituz erabil daiteke\n")))
	((equal language "fr")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nd/3.0/fr/deed.fr")
	 (insert (concat "* Licence
Ce(tte) œuvre est mise à disposition selon les termes de la [[" org-license-cc-url "][Licence Creative Commons Attribution - Pas de Modification 3.0 France]]\n")))
	((equal language "gl")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nd/3.0/es/deed.gl")
	 (insert (concat "* Licenza
Todo o texto está dispoñible baixo a [[" org-license-cc-url "][licenza Creative Commons recoñecemento compartir igual 3.0]]\n.")))
	((equal language "it")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nd/3.0/it/deed.it")
	 (insert (concat "* Licenza
Quest'opera e distribuita con Licenza [[" org-license-cc-url "][Licenza Creative Commons Attribuzione - Non opere derivate 3.0 Italia]]\n")))
	((equal language "pt")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nd/3.0/pt/deed.pt")
	 (insert (concat "* Licença
Este texto é disponibilizado nos termos da licença [[" org-license-cc-url "][Atribuição Sem Derivados 3.0 Portugal]]\n")))
	(t
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nd/3.0/deed")
	 (insert (concat "* License
This document is under a [[" org-license-cc-url "][Creative Commons Reconocimiento Unported 3.0]]\n"))))
  (if (string= "" org-license-images-directory)
      (insert (concat "\n[[" org-license-cc-url "][file:http://i.creativecommons.org/l/by-nd/3.0/80x15.png]]\n"))
    (insert (concat "\n[[" org-license-cc-url "][file:" org-license-images-directory "/by-nd/3.0/80x15.png]]\n"))))


(defun org-license-cc-by-nc (language)
  (interactive "MLanguage ( br | ca | de | en | es | eu | fr | it | pt ): " language)
  (cond ((equal language "br")
	 (setq org-license-cc-url "https://creativecommons.org/licenses/by-nc/3.0/br/deed.pt_BR")
	 (insert (concat "* Licença
Este texto é disponibilizado nos termos da licença [[" org-license-cc-url "][Atribuição Não Comercial 3.0 Brasil]]\n")))
	((equal language "ca")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc/3.0/es/deed.ca")
	 (insert (concat "* Licència
El text està disponible sota la [[" org-license-cc-url "][Reconeixement-NoComercial 3.0 Espanya]]\n")))
	((equal language "de")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc/3.0/de/deed.de")
	 (insert (concat "* Lizenz
Dieses Werk bzw. Inhalt steht unter einer [[" org-license-cc-url "][Namensnennung-Nicht-kommerziell 3.0 Deutschland]]\n")))
	((equal language "es")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc/3.0/es/deed.es")
	 (insert (concat "* Licencia
Este documento está bajo una [[" org-license-cc-url "][Licencia Creative Commons Reconocimiento-NoComercial 3.0]]\n")))
	((equal language "eu")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc/3.0/es/deed.eu")
	 (insert "* Licenzua
Testua [[" org-license-cc-url "][Aitortu-EzKomertziala 3.0 Espainia]] lizentziari jarraituz erabil daiteke\n"))
	((equal language "fr")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc/3.0/fr/deed.fr")
	 (insert (concat "* Licence
Ce(tte) œuvre est mise à disposition selon les termes de la [[" org-license-cc-url "][Licence Creative Commons Attribution - Pas d'Utilisation Commerciale 3.0 France]]\n")))
	((equal language "gl")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc/3.0/es/deed.gl")
	 (insert (concat "* Licenza
Todo o texto está dispoñible baixo a [[" org-license-cc-url "][licenza Creative Commons recoñecemento compartir igual 3.0]]\n.")))
	((equal language "it")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc/3.0/it/deed.it")
	 (insert (concat "* Licenza
Quest'opera e distribuita con Licenza [[" org-license-cc-url "][Licenza Creative Commons Attribuzione - Non commerciale 3.0 Italia]]\n")))
	((equal language "pt")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc/3.0/pt/deed.pt")
	 (insert (concat "* Licença
Este texto é disponibilizado nos termos da licença [[" org-license-cc-url "][Atribuição Não Comercial 3.0 Portugal]]\n")))
	(t 
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc/3.0/deed")
	 (insert (concat "* License 
This document is under a [[" org-license-cc-url "][Creative Commons Attribution-NonCommercial 3.0 Unported]]"))))
  (if (string= "" org-license-images-directory)
      (insert (concat "\n[[" org-license-cc-url "][file:http://i.creativecommons.org/l/by-nc/3.0/80x15.png]]\n"))
    (insert (concat "\n[[" org-license-cc-url "][file:" org-license-images-directory "/by-nc/3.0/80x15.png]]\n"))))

(defun org-license-cc-by-nc-sa (language)
  (interactive "MLanguage ( br | ca | de | en | es | eu | fr | gl | it | pt ): " language)
  (cond ((equal language "br")
	 (setq org-license-cc-url "https://creativecommons.org/licenses/by-nc-sa/3.0/br/deed.pt_BR")
	 (insert (concat "* Licença
Este texto é disponibilizado nos termos da licença [[" org-license-cc-url "][Atribuição Não Comercial - Compartil ha Igual 3.0 Brasil]]\n")))
	((equal language "ca")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc-sa/3.0/es/deed.ca")
	 (insert (concat "* Licència
El text està disponible sota la [[" org-license-cc-url "][Reconeixement-NoComercial 3.0 Espanya]]\n")))
	((equal language "de")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc-sa/3.0/de/deed.de")
	 (insert (concat "* Lizenz
Dieses Werk bzw. Inhalt steht unter einer [[" org-license-cc-url "][Namensnennung - Weitergabe unter gleichen Bedingungen 3.0 Deutschland]]\n")))
	((equal language "es")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc-sa/3.0/es/deed.es") 
	 (insert (concat "* Licencia
Este documento está bajo una [[" org-license-cc-url "][Licencia Creative Commons Reconocimiento-NoComercial 3.0]]\n")))
	((equal language "eu")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc-sa/3.0/es/deed.eu")
	 (insert "* Licenzua
Testua [[" org-license-cc-url "][Aitortu-EzKomertziala-PartekatuBerdin 3.0 Espainia]] lizentziari jarraituz erabil daiteke\n"))
	((equal language "fr")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc-sa/3.0/fr/deed.fr")
	 (insert (concat "* Licence
Ce(tte) œuvre est mise à disposition selon les termes de la [[" org-license-cc-url "][Licence Creative Commons Attribution - Pas d’Utilisation Commerciale - Partage dans les Mêmes Conditions 3.0 France]]\n")))
	((equal language "gl")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc-sa/3.0/es/deed.gl")
	 (insert (concat "* Licenza
Todo o texto está dispoñible baixo a [[" org-license-cc-url "][licenza Creative Commons recoñecemento compartir igual 3.0]]\n.")))
	((equal language "it")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc-sa/3.0/it/deed.it")
	 (insert (concat "* Licenza
Quest'opera e distribuita con Licenza [[" org-license-cc-url "][Licenza Creative Commons Attribuzione - Non opere derivate 3.0 Italia]]\n")))
	((equal language "pt")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc/3.0/pt/deed.pt")
	 (insert (concat "* Licença
Este texto é disponibilizado nos termos da licença [[" org-license-cc-url "][Atribuição NãoComercial Compartil ha Igual 3.0 Portugal]]\n")))
	(t 
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc-sa/3.0/deed")
	 (insert (concat "* License
This document is under a [[" org-license-cc-url "][License Creative Commons
Reconocimiento-NoComercial 3.0 Unported]]\n"))))
  (if (string= "" org-license-images-directory)
      (insert (concat "\n[[" org-license-cc-url  "][file:http://i.creativecommons.org/l/by-nc-sa/3.0/80x15.png]]\n"))
    (insert (concat "\n[[" org-license-cc-url "][file:" org-license-images-directory "/by-nc-sa/3.0/80x15.png]]\n"))))

(defun org-license-cc-by-nc-nd (language)
  (interactive "MLanguage ( br | ca | de | en | es | eu | fr | gl | it | pt ): " language)
  (cond ((equal language "br")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc-nd/3.0/pt/deed.pt")
	 (insert (concat "* Licença
Este texto é disponibilizado nos termos da licença [[" org-license-cc-url "][Atribuição Não Comercial Sem Derivados 3.0 Brasil]]\n")))
	((equal language "ca")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc-nd/3.0/es/deed.ca")
	 (insert (concat "* Licència
El text està disponible sota la [[" org-license-cc-url "][Reconeixement-NoComercial-SenseObraDerivada 3.0 Espanya]]\n")))
	((equal language "de")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc-nd/3.0/de/deed.de")
	 (insert (concat "* Lizenz
Dieses Werk bzw. Inhalt steht unter einer [[" org-license-cc-url "][Namensnennung-NichtKommerziell-KeineBearbeitung 3.0 Deutschland]]\n")))
	((equal language "es")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc-nd/3.0/es/deed.es")
	 (insert (concat "* Licencia 
Este documento está bajo una [[" org-license-cc-url "][Licencia Creative Commons Reconocimiento-NoComercial-SinObraDerivada 3.0]]\n")))
	((equal language "eu")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc-nd/3.0/es/deed.eu")
	 (insert (concat "* Licenzua
Testua [[" org-license-cc-url "][Aitortu-LanEratorririkGabe 3.0 Espainia]] lizentziari jarraituz erabil daiteke\n")))
	((equal language "fr")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc-nd/3.0/fr/deed.fr")
	 (insert (concat "* Licence
Ce(tte) œuvre est mise à disposition selon les termes de la [[" org-license-cc-url "][Licence Creative Commons Attribution - Pas de Modification 3.0 France]]\n")))
	((equal language "gl")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc-nd/3.0/es/deed.gl")
	 (insert (concat "* Licenza
Todo o texto está dispoñible baixo a [[" org-license-cc-url "][licenza Creative Commons recoñecemento compartir igual 3.0]]\n.")))
	((equal language "it")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc-nd/3.0/it/deed.it")
	 (insert (concat "* Licenza
Quest'opera e distribuita con Licenza [[" org-license-cc-url "][Licenza Creative Commons Attribuzione - Non opere derivate 3.0 Italia]]\n")))
	((equal language "pt")
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc-nd/3.0/pt/deed.pt")
	 (insert (concat "* Licença
Este texto é disponibilizado nos termos da licença [[" org-license-cc-url "][Atribuição Não Comercial Sem Derivados 3.0 Portugal]]\n")))
	(t 
	 (setq org-license-cc-url "http://creativecommons.org/licenses/by-nc-nd/3.0/deed")
	 (insert (concat "* License
This document is under a [[" org-license-cc-url "][License Creative Commons
Reconocimiento-NoComercial-SinObraDerivada 3.0 Unported]]\n"))))
  (if (string= "" org-license-images-directory)
      (insert (concat "\n[[" org-license-cc-url "][file:http://i.creativecommons.org/l/by-nc-nd/3.0/80x15.png]]\n"))
    (insert (concat "\n[[" org-license-cc-url "][file:" org-license-images-directory "/by-nc-nd/3.0/80x15.png]]\n"))))

(defun org-license-gfdl (language)
  (interactive "MLanguage (es | en): " language)
  (cond ((equal language "es")
	 (insert "* Licencia
Copyright (C)  2013 " user-full-name
"\n    Se permite copiar, distribuir y/o modificar este documento
    bajo los términos de la GNU Free Documentation License, Version 1.3
    o cualquier versión publicada por la Free Software Foundation;
    sin Secciones Invariantes y sin Textos de Portada o Contraportada.
    Una copia de la licencia está incluida en [[https://www.gnu.org/copyleft/fdl.html][GNU Free Documentation License]].\n"))
	(t (insert (concat "* License
Copyright (C)  2013 " user-full-name
"\n    Permission is granted to copy, distribute and/or modify this document
    under the terms of the GNU Free Documentation License, Version 1.3
    or any later version published by the Free Software Foundation;
    with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
    A copy of the license is included in [[https://www.gnu.org/copyleft/fdl.html][GNU Free Documentation License]].\n"))))
  (if (string= "" org-license-images-directory)
      (insert "\n[[https://www.gnu.org/copyleft/fdl.html][file:https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/GFDL_Logo.svg/200px-GFDL_Logo.svg.png]]\n")
    (insert (concat "\n[[https://www.gnu.org/copyleft/fdl.html][file:" org-license-images-directory "/gfdl/gfdl.png]]\n"))))

(defun org-license-print-all ()
"Print all combinations of licenses and languages, it's useful to find bugs"
  (interactive)
  (org-license-gfdl "es")
  (org-license-gfdl "en")
  (org-license-cc-by "br")
  (org-license-cc-by "ca")
  (org-license-cc-by "de")
  (org-license-cc-by "es")
  (org-license-cc-by "en")
  (org-license-cc-by "eo")
  (org-license-cc-by "eu")
  (org-license-cc-by "fr")
  (org-license-cc-by "gl")
  (org-license-cc-by "it")
  (org-license-cc-by "pt")
  (org-license-cc-by-sa "br")
  (org-license-cc-by-sa "ca")
  (org-license-cc-by-sa "de")
  (org-license-cc-by-sa "es")
  (org-license-cc-by-sa "en")
;;  (org-license-cc-by-sa "eo")
  (org-license-cc-by-sa "eu")
  (org-license-cc-by-sa "fr")
  (org-license-cc-by-sa "gl")
  (org-license-cc-by-sa "it")
  (org-license-cc-by-sa "pt")
  (org-license-cc-by-nd "br")
  (org-license-cc-by-nd "ca")
  (org-license-cc-by-nd "de")
  (org-license-cc-by-nd "es")
  (org-license-cc-by-nd "en")
;;  (org-license-cc-by-nd "eo")
  (org-license-cc-by-nd "eu")
  (org-license-cc-by-nd "fr")
  (org-license-cc-by-nd "gl")
  (org-license-cc-by-nd "it")
  (org-license-cc-by-nd "pt")
  (org-license-cc-by-nc "br")
  (org-license-cc-by-nc "ca")
  (org-license-cc-by-nc "de")
  (org-license-cc-by-nc "es")
  (org-license-cc-by-nc "en")
;;  (org-license-cc-by-nc "eo")
  (org-license-cc-by-nc "eu")
  (org-license-cc-by-nc "fr")
  (org-license-cc-by-nc "gl")
  (org-license-cc-by-nc "it")
  (org-license-cc-by-nc "pt")
  (org-license-cc-by-nc-sa "br")
  (org-license-cc-by-nc-sa "ca")
  (org-license-cc-by-nc-sa "de")
  (org-license-cc-by-nc-sa "es")
  (org-license-cc-by-nc-sa "en")
;;  (org-license-cc-by-nc-sa "eo")
  (org-license-cc-by-nc-sa "eu")
  (org-license-cc-by-nc-sa "fr")
  (org-license-cc-by-nc-sa "gl")
  (org-license-cc-by-nc-sa "it")
  (org-license-cc-by-nc-sa "pt")
  (org-license-cc-by-nc-nd "br")
  (org-license-cc-by-nc-nd "ca")
  (org-license-cc-by-nc-nd "de")
  (org-license-cc-by-nc-nd "es")
  (org-license-cc-by-nc-nd "en")
;;  (org-license-cc-by-nc-nd "eo")
  (org-license-cc-by-nc-nd "eu")
  (org-license-cc-by-nc-nd "fr")
  (org-license-cc-by-nc-nd "gl")
  (org-license-cc-by-nc-nd "it")
  (org-license-cc-by-nc-nd "pt")
)
