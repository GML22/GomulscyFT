%-----------------------------------------------------------------------------
% Preambuła
%-----------------------------------------------------------------------------

% Definiujemy klasy
\ProvidesClass{Preambuła/Preambula}
\LoadClass[11pt, twoside]{mwbk}

% Definiujemy parametry klasy
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=Preambuła/Preambula.cls,
    prefix=preambula}

% Definiujemy marginesy
\DeclareStringOption[2.5cm]{left}
\DeclareStringOption[2.5cm]{right}
\DeclareStringOption[2.5cm]{top}
\DeclareStringOption[2.5cm]{bottom}
\DeclareStringOption[6mm]{bindingoffset}
\DeclareBoolOption[false]{nohyphenation}
\ProcessKeyvalOptions*

% Pobieramy odpowiednie pakiety
\RequirePackage{amsmath}    % Basic mathematical typesetting
\RequirePackage{amsthm}     % Theorems typesetting
\RequirePackage{array}      % Advanced table column formats
\RequirePackage[backend=biber, style=ieee, dashed=false]{biblatex}
\RequirePackage{csquotes}   % Quotation style
\RequirePackage{chngcntr}   % Per-section counters
\RequirePackage{enumitem}   % Itemize/enumrate
\RequirePackage{fancyhdr}   % Custom header/footer styles
\RequirePackage{graphicx}   % Enhanced images support
\RequirePackage{ifpdf}      % pdfTeX-specific options
\RequirePackage{listings}   % Code listings
\RequirePackage{longtable}  % Multi-page tables
\RequirePackage{multirow}   % Advanced table cells
\RequirePackage{setspace}   % Set space between lines
\RequirePackage{scrextend}  % Allows \addmargin environment
\RequirePackage{tocloft}    % Custom ToC/LoF/LoT
\RequirePackage{xurl}       % URL-sensitive line breaks
\RequirePackage{xkeyval}    % Keys and class parameters
\RequirePackage{xspace}     % Remove duplicated spaces
\RequirePackage{lscape}     % Pakiet do tabel na całą stronę
\RequirePackage{pdfpages} 
\RequirePackage{bbding}
\RequirePackage{subfig}
\RequirePackage{float}
\RequirePackage{titlesec}
\RequirePackage[labelfont=bf, textfont=bf]{caption}
\RequirePackage{xparse}
\RequirePackage{lettrine}
\RequirePackage{microtype} % Pakiet do lepszego zarządzania odległością słów
\RequirePackage{fontspec}
\RequirePackage{tikz}
\RequirePackage{imakeidx}
\RequirePackage{xstring}
\RequirePackage{etoolbox}

% Definiujemy czcionkę
\setmainfont{TeX Gyre Pagella}

% Ustawienia cudzysłowów
\let\oldquote\quote
\let\endoldquote\endquote
\RenewDocumentEnvironment{quote}{om}
  {\oldquote}
  {\par\nobreak\smallskip
   \small\hfill#2\IfValueT{#1}{~---~#1}\endoldquote 
   \addvspace{\bigskipamount}}

% Ustawiamy polskie cudzysłowy
\DeclareQuoteStyle[quotes]{polish}
  {\quotedblbase}
  {\textquotedblright}
  [0.05em]
  {\quotesinglbase}
  {\fixligatures\textquoteright}
\DeclareQuoteAlias[quotes]{polish}{polish}

% Zmiana formatowanie tytułów rozdziałów
\SetSectionFormatting[breakbefore,wholewidth]{chapter}
  {56pt}
  {\ifHeadingNumbered
    \rule{\textwidth}{2pt}
    \centering\normalfont\LARGE\filcenter\sffamily{
      \MakeUppercase{Rozdział \HeadingNumber}}
    \rule{\textwidth}{1pt}
    \centering\bfseries\LARGE\filcenter{\HeadingText}
    \vfill
  \else
    \normalfont\huge\bfseries\filright{\HeadingText}
  \fi
  }
  {24pt}

% Pakiety dodane przeze mnie
\newcommand{\upshapeI}[1]{\textrm{\upshape I}}
\RequirePackage[parfill]{parskip}
\RequirePackage[hang]{footmisc}
\RequirePackage{afterpage}
\RequirePackage{rotating}

% Pusta strona - makro
\newcommand\blankpage{%
    \null
    \thispagestyle{empty}%
    \newpage}

% Powoduje, że odstępy pomiędzy paragrafami są równe
\raggedbottom
\allowdisplaybreaks[1]

% Ustawienie marginesu dla przypisów
\setlength\footnotemargin{10pt}

% Ustawienia ramek dla obrazków
\setlength{\fboxrule}{5pt} % grubość ramki
\setlength{\fboxsep}{0pt}  % odstęp między obrazkiem a ramką

% Ustawienie sekcji
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}

% Ustawienia numeracji sekcji do poziomu 4
\setcounter{secnumdepth}{4}

% Ustawienia pakietu listings
\urlstyle{rm}                                  

% Zmiana nazwy z "Listing" na "Kod źródłowy"
\renewcommand\lstlistingname{\large Kod źródłowy}
\renewcommand\lstlistlistingname{\large Kod źródłowy}

% Ustawienia lettrine
\renewcommand{\LettrineTextFont}{\normalfont}

% Ustawienie interlinii 1.15 w tekście i 1 w trybie matematycznym
\setstretch{1.2}
\AtBeginEnvironment{equation}{\leavevmode\singlespace\setstretch{0.9}}
\AfterEndEnvironment{equation}{\endsinglespace\setstretch{1.2}\vskip0.1
\baselineskip\noindent\ignorespaces}
\AtBeginEnvironment{equation*}{\leavevmode\singlespace\setstretch{0.9}}
\AfterEndEnvironment{equation*}{\endsinglespace\setstretch{1.2}\vskip0.1
\baselineskip\noindent\ignorespaces}
\counterwithin{figure}{section}
\counterwithin{table}{section}

% Ustawienia hyperlinków
\RequirePackage{hyperref}
\hypersetup{
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=black,
    pdfauthor=author
}

% Ustalanie tolerancji odnośnie odległości słów
\tolerance=2000
\emergencystretch=3em
\hfuzz=0.2pt

% Ustawienia marginesów
\RequirePackage[
    a4paper,
    left=\preambulaleft,
    right=\preambularight,
    top=\preambulatop,
    bottom=\preambulabottom,
    bindingoffset=\preambulabindingoffset
]{geometry}

% Turn off hyphenation
\ifpreambulanohyphenation
    \tolerance=1
    \emergencystretch=\maxdimen
    \hyphenpenalty=10000
    \hbadness=10000
\fi

% Ustawienia spisu treści
\setlength{\cftbeforesecskip}{2pt}
\renewcommand{\cftchapfont}{\bf\normalsize} % Pogrubienie nazw rozdziałów
\renewcommand{\cftsecfont}{\normalsize}    % Normalna czcionka dla sekcji
\renewcommand{\cftsecpagefont}{\normalfont} % Normalna czcionka dla numerów stron sekcji
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftsecdotsep}{\cftdotsep}

% Ustawienia listy wykresów
\renewcommand*\l@figure{\@dottedtocline{1}{0.5em}{2.25em}}
\newcommand{\listoffigurestoc}{
    \listoffigures
    \addcontentsline{toc}{section}{\listfigurename}
}

% Ustawienia listy tabel
\renewcommand*\l@table{\@dottedtocline{1}{0.5em}{2.25em}}
\newcommand{\listoftablestoc}{
    \listoftables
    \addcontentsline{toc}{section}{\listtablename}
}

% Ustawienia nagłówka i stopki
\SetSectionFormatting{section}{0.5cm}{\FormatHangHeading{\Large}}{0.5cm}
\let\oldsection\section
\renewcommand{\section}{
	\thispagestyle{plain}
	\oldsection
}

% Ustawienia stylu strony
\fancypagestyle{plain}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\fancyfoot[LE,RO]{\thepage}
}

% Ustawienia stylu nagłówków
\fancypagestyle{headings}{
    \fancyhead{} % Usuń nagłówki
    \renewcommand{\headrulewidth}{1pt} % Linia w nagłówku
    \fancyheadoffset{0cm}
    \fancyhead[LE]{\nouppercase{\hfill\leftmark}} % Nazwa rozdziału na stronach parzystych
    \fancyhead[RO]{\nouppercase{\leftmark}} % Nazwa sekcji na stronach nieparzystych
    \fancyfoot{} % Usuń stopki
    \fancyfoot[LO]{\thepage} % Numer strony na dole z lewej (nieparzyste)
    \fancyfoot[RE]{\thepage} % Numer strony na dole z prawej (parzyste)
}
\pagestyle{headings}

% Przywrócenie oznaczania rozdziałów w nagłówkach
\renewcommand{\chaptermark}[1]{\markboth{#1}{#1}}
\renewcommand{\sectionmark}[1]{\markright{#1}}

% Ustawienia domyślnej listy
\setlist[itemize,1]{topsep=2pt,label=\large$\bullet$, leftmargin=28pt}
\setlist[itemize,2]{topsep=2pt,leftmargin=18pt}
\setlist[itemize,3]{topsep=2pt,leftmargin=18pt}
\setlist[enumerate,1]{topsep=2pt,leftmargin=24pt}
\setlist[enumerate,2]{topsep=2pt,leftmargin=16pt}
\setlist[enumerate,3]{topsep=2pt,leftmargin=16pt}

% Wybór języka pracy
\newcommand{\langpol}{
    \newcommand{\@lang}{polish}
    \usepackage[polish]{babel}

	\newtheorem{theorem}{Twierdzenie}
	\newtheorem{lemma}{Lemat}
	\newtheorem{corollary}{Wniosek}
	\newtheorem{definition}{Definicja}
	\newtheorem{axiom}{Aksjomat}
	\newtheorem{assumption}{Założenie}

	\AtBeginDocument{
		\renewcommand{\listfigurename}{Spis rycin}
		\renewcommand{\listtablename}{Spis tabel}
		\renewcommand{\tablename}{Tabela}
		\renewcommand{\figurename}{Ryc.}
	}
}

% Skrót (akronim) - makro
\newcommand{\acronymlist}{
    \ifnum \pdf@strcmp{\@lang}{polish} = 0
        \chapter*{Wykaz symboli i skrótów}
    \fi
    \ifnum \pdf@strcmp{\@lang}{english} = 0
        \chapter*{List of Symbols and Abbreviations}
    \fi
}

% Akronim - makro
\newcommand{\acronym}[2]{
    \par\noindent\hspace{0.4em}
    {\textbf{#1} -- #2}
}

% Spis załączników - makra
\newcommand{\nocontentsline}[3]{}
\newcommand{\tocless}[2]{%
    \bgroup\let\addcontentsline=\nocontentsline#1{#2}\egroup
}

% Definicja tytułu załącznika w zależności od języka
\newcommand{\@appendixtitle}{
    \ifnum \pdf@strcmp{\@lang}{polish} = 0
        Załącznik
    \fi
    \ifnum \pdf@strcmp{\@lang}{english} = 0
        Appendix
    \fi
}

% Definicja załącznika w spisie treści
\let\standardappendix\appendix
\renewcommand\appendix[1]{%
    \tocless\section{\hspace*{1.5em} #1}
    \addcontentsline{app}{subsection}{\hspace*{-1.1em}\arabic{
        section}.\hspace*{0.5em} #1}
}

% Spis załączników w spisie treści - makro
\newcommand\listofappendicestoc{
    \ifnum \pdf@strcmp{\@lang}{polish} = 0
        \section*{Spis załączników}\@starttoc{app}
    \fi
    \ifnum \pdf@strcmp{\@lang}{english} = 0
        \section*{List of Appendices}\@starttoc{app}
    \fi

    \standardappendix
    \renewcommand{\thesection}{\@appendixtitle~\arabic{section}}
}
\setcounter{tocdepth}{1}

% Makro do wyswietlania bieżącego roku
\newcommand{\biezacyrok}{\number\year\space~r.}

% Makro do wyświetlania bieżącego miesiąca i roku
\newcommand{\miesiacrok}{%
  \ifcase\month
  \or Styczeń\or Luty\or Marzec\or Kwiecień\or Maj\or Czerwiec%
  \or Lipiec\or Sierpień\or Wrzesień\or Październik\or Listopad\or Grudzień%
  \fi\space\number\year}

% Makro do wyświetlania bieżącego miesiąca i roku 2
\newcommand{\miesiacrokdwa}{%
  \ifcase\month
  \or styczeń\or luty\or marzec\or kwiecień\or maj\or czerwiec%
  \or lipiec\or sierpień\or wrzesień\or październik\or listopad\or grudzień%
  \fi\space\number\year\space~r.}

% Makro do dużego pogrubionego tekstu
\newcommand{\BigBold}[1]{\par\bigskip\noindent\textbf{\Large #1}\par\smallskip}

% Definiujemy cytaty
\newenvironment{centeredquote}
  {\vspace*{0.5cm}\begin{center}\begin{minipage}{0.75\linewidth}\begin{quote}{ }}
  {\end{quote}\end{minipage}\end{center}}

% Ustawienie interlinii w tabelach
\renewcommand{\arraystretch}{1.5}
\setlength{\arrayrulewidth}{1.5pt}

% Ustawienia diagramów tikz
\usetikzlibrary{arrows.meta, positioning, calc}

% Indeks osób
\makeindex[name=osoby, title={Indeks osób}, columns=1, options=-s
"Preambuła/indeks_osob_style.ist"]

% Indeks miejscowości
\makeindex[name=miejsca, title={Indeks miejscowości},
columns=1, options=-s "Preambuła/indeks_miejscowosci_style.ist"]

% Definicja makra do indeksowania osób i miejscowości:
% #1 - z d. (opcjonalny)
% #2 - 1 v. (opcjonalny)
% #3 - Imię (obowiązkowy)
% #4 - Nazwisko wyświetlane (obowiązkowy)
% #5 - Rok urodzenia (obowiązkowy)
% #6 - Miejsce urodzenia wyświetlane (obowiązkowy)
% #7 - Klucz sortowania nazwiska (opcjonalny - w [ ] na końcu)
% #8 - Klucz sortowania miejscowości (opcjonalny - w [ ] na samym końcu)
\NewDocumentCommand{\indeksosoby}{o o m m m m o o}{%
    \IfNoValueTF{#7}{\protected@edef\kluczsortnazw{#4}}{\protected@edef\kluczsortnazw{#7}}%
    \IfNoValueTF{#8}{\protected@edef\kluczsortmiejsc{#6}}{\protected@edef\kluczsortmiejsc{#8}}%
    %
    % Ochrona przed łamaniem strony po nazwisku (w indeksie osób)
    \index[osoby]{\kluczsortnazw @\protect\normalsize\textbf{#4}\protect\nopagebreak!#3\IfValueT{#1}{, z d. #1}\IfValueT{#2}{, $1^{\circ}$ v. #2}, ur. #5, #6}%
    %
    % Ochrona przed łamaniem strony po miejscowości (w indeksie miejsc)
    \index[miejsca]{\kluczsortmiejsc @\protect\normalsize\textbf{#6}\protect\nopagebreak!#4\IfValueT{#1}{(z d. #1)}\IfValueT{#2}{, $1^{\circ}$ v. #2}, #3 (ur. #5)}%
}

% Nowe polecenie dla samej flagi Polski
\DeclareRobustCommand{\flagaPL}{%
  \begin{tikzpicture}[
    x=1em/10, y=1em/10,          % Identyczne skalowanie jak w znaku AK
    baseline=(bottom)
  ]
    % 1. Dopasowanie do pełnej wysokości linijki tekstu
    \path (0,-2) coordinate (bottom) (0,8) coordinate (top);
    
    % 2. Tło - Prostokątna flaga Polski (proporcje ok. 8:5)
    \begin{scope}
      \clip[rounded corners=0.1em] (-8, -2) rectangle (8, 8);
      \fill[white] (-8, 3) rectangle (8, 8);
      \fill[red!85!black] (-8, -2) rectangle (8, 3);
    \end{scope}
    \draw[gray!60, line width=0.03em, rounded corners=0.1em] (-8, -2) rectangle (8, 8);
  \end{tikzpicture}%
}

% Bezpieczne zastępstwo tekstowe dla indeksów/zakładek (wyświetli tekst "PL")
\pdfstringdefDisableCommands{%
  \def\flagaPL{(PL)}%
}

% Wyłącznienie przedroska 'adr.' w bibliografii
\DeclareFieldFormat{url}{\url{#1}}