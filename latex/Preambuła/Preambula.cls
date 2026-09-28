%-----------------------------------------------------------------------------
% Preambuła
%-----------------------------------------------------------------------------

% Definiujemy klasy
\ProvidesClass{Preambuła/Preambula}
\LoadClass[11pt, twoside]{mwbk}

% Definiujemy parametry klasy
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=Preambuła/Preambula.cls, prefix=preambula}

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
\RequirePackage[backend=biber, style=ieee, dashed=false,
  defernumbers=true]{biblatex}
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
\RequirePackage{microtype}
\RequirePackage{fontspec}
\RequirePackage{tikz}
\RequirePackage{imakeidx}
\RequirePackage{xstring}
\RequirePackage{etoolbox}
\RequirePackage{hyperref}
\RequirePackage[parfill]{parskip}
\RequirePackage[hang]{footmisc}
\RequirePackage{afterpage}
\RequirePackage{rotating}
\RequirePackage[a4paper, left=\preambulaleft, right=\preambularight,
  top=\preambulatop, bottom=\preambulabottom,
  bindingoffset=\preambulabindingoffset]{geometry}

% Ustawienia hiperlinków oraz metadanych dokumentu PDF
\hypersetup{
  colorlinks=true,
  citecolor=black,
  filecolor=black,
  linkcolor=black,
  urlcolor=black,
  pdftitle={Historia rodziny Gomulskich z Desna},
  pdfauthor={Mateusz Gomulski},
  pdfsubject={Historia i genealogia rodziny Gomulskich},
  pdfkeywords={Gomulscy, genealogia, historia rodziny, Desno, Karolina,
  Anielina, Wólka Mińska, Zamienie, Grzebowilk, Dziewule, Wnętrzne, Mysłów,
  Rudzienko, Mazowsze, Mińsk Mazowiecki, drzewo genealogiczne},
  pdflang={pl-PL},
  pdfdisplaydoctitle=true
}

% Usunięcie kropki po "nr"
\DefineBibliographyStrings{polish}{number = {nr},}

% Ustawienie parametrów tytułów rycin
\captionsetup[figure]{format=hang}

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

% Globalne ustawienia dla pakietu lettrine
\renewcommand{\LettrineTextFont}{\normalfont}
\setcounter{DefaultLines}{5}          
\renewcommand{\DefaultLhang}{0}       
\renewcommand{\DefaultSlope}{0pt}
\setlength{\DefaultNindent}{0pt}
\setlength{\DefaultFindent}{5pt}

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

% Ustalanie tolerancji odnośnie odległości słów
\tolerance=2000
\emergencystretch=3em
\hfuzz=0.2pt

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

% Ustawienie numeracji rysunków
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}

% Zwiększa szerokość boxu na numer ryciny
\setlength{\cftfignumwidth}{3em} 

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
    \fancyfoot{}
    \fancyfoot[LE,RO]{\thepage}
}
\pagestyle{headings}

\fancypagestyle{opening}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

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
  wrzesień 2026~r.}

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

% Ustawienie indeksów
\indexsetup{level={\chapter*}}

\renewcommand{\cftafterloftitle}{%
  \phantomsection
  \addcontentsline{toc}{chapter}{\listfigurename}}

% Usuwamy podkategorię bibliografii ze spisu treści
\defbibheading{subbibliography}[\refname]{%
  \tocless{\section*}{#1}}

  % Nie dziel pojedynczych pozycji bibliograficznych między strony
\appto{\bibsetup}{%
  \interlinepenalty=10000\relax
}

% Indeks osób
\makeindex[name=osoby, title={Indeks osób}, columns=1, options=-s
"Preambuła/indeks_osob_style.ist"]

% Indeks miejscowości
\makeindex[name=miejsca, title={Indeks miejscowości urodzenia},
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
    \index[miejsca]{\kluczsortmiejsc @\protect\normalsize\textbf{#6}\protect\nopagebreak!\kluczsortnazw, #3@#4\IfValueT{#1}{ (z d. #1)}\IfValueT{#2}{, $1^{\circ}$ v. #2}, #3 (ur. #5)}%
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

% Data dostępu: miesiąc w mianowniku i rok, bez dnia.
 \renewbibmacro*{url+urldate}{%
  \iffieldundef{url}
    {}
    {\usebibmacro{url}%
     \setunit{\addcomma\addspace}%
     \printtext{dostęp zdalny: \miesiacrokdwa}}}

% Nazwy rozdziałów w spisie rycin
\newcommand{\rozdzialwspisierycin}[1]{%
  \addtocontents{lof}{%
    \protect\par
    \protect\addvspace{12pt}%
    \protect\noindent
    {\protect\bfseries #1\protect\par}%
    \protect\nopagebreak
    \protect\addvspace{4pt}%
  }%
}

\makeatletter
\patchcmd{\blx@bbx@online}
  {\printtext[parens]{\usebibmacro{date}}}
  {\iffieldundef{year}
     {}
     {\printtext[parens]{\usebibmacro{date}}}}
  {}
  {\PackageWarning{Preambula}{Nie udalo sie poprawic daty online}}
\makeatother


% Definicja obiektów potrzebnych do stworzenia drzewa
\definecolor{rod}{HTML}{8B151B}
\definecolor{tusz}{HTML}{252421}
\definecolor{papier}{HTML}{FFFFFF}

\newcommand{\Osoba}[8]{%
  \node[osoba, draw=#7, font=\fontsize{10}{10.5}\selectfont#8]
    (#1) at (#2,#3) {#4\\[3pt]#5};
  \node[miejsce, draw=#7, fill=#7, anchor=north]
    (#1-miejsce) at (#1.south) {#6};
}

\newcommand{\Malzenstwo}[5]{%
  % Dwie pętle z widocznym przeplotem w środku węzła.
  \coordinate (wezel-#1-#2) at ($(#1.east)!.5!(#2.west)$);
  \draw[malzenstwo, draw=#5]
    (#1.east) -- ++(.1,0)
    |- ($(wezel-#1-#2)+(-.48,0)$);

  \draw[malzenstwo, draw=#5]
    ($(wezel-#1-#2)+(.48,0)$)
    -| ($(#2.west)+(-.1,0)$) -- (#2.west);
  \begin{scope}[shift={(wezel-#1-#2)}]
    \draw[sznur, draw=#5]
      (-.48,0)
      .. controls (-.48,.32) and (-.26,.32) .. (0,0)
      .. controls (.26,-.32) and (.48,-.32) .. (.48,0)
      .. controls (.48,.32) and (.26,.32) .. (0,0)
      .. controls (-.26,-.32) and (-.48,-.32) .. cycle;
    \draw[sznur, draw=#5, preaction={draw=white,line width=5pt}]
      (-.14,.15) .. controls (-.05,.06) and (.05,-.06) .. (.14,-.15);
    \node[opis, anchor=south, text=#5] at (0,.36) {#3};
    \node[opis, fill=white, anchor=north, text=#5]
      (rok-#1-#2) at (0,-.36) {#4};
  \end{scope}
}

% Wspólna legenda drzew genealogicznych
\newcommand{\LegendaDrzewa}{%
  \begin{tikzpicture}[
    x=1cm, y=1cm,
    draw=tusz,
    text=tusz,
    line width=.5pt,
    font=\fontsize{8}{9.5}\selectfont,
    every node/.style={inner sep=0pt},
    obja/.style={anchor=west, align=left}
  ]

  % Obramowanie i tytuł
  \draw (0,0) rectangle (13.7,-3.15);
  \node[font=\fontsize{8}{9.5}\selectfont\bfseries]
    at (6.85,-.35) {OBJAŚNIENIA OZNACZEŃ DRZEWA GENEALOGICZNEGO};

  % Podział na trzy części
  \draw[tusz!25] (4.8,-.7) -- (4.8,-2.9);
  \draw[tusz!25] (9.6,-.7) -- (9.6,-2.9);

  % 1. Przykładowe pole osoby
  \draw (.3,-.85) rectangle (2.15,-2.15);
  \node[align=center] at (1.225,-1.3)
    {Imię\\Nazwisko};
  \node at (1.225,-1.92) {1800--1872};

  \filldraw[fill=tusz, draw=tusz, line width=.5pt]
  (.3,-2.15) rectangle (2.15,-2.6);
  \node[text=white] at (1.225,-2.375) {Miejscowość};

  \draw (2.2,-1.92) -- (2.45,-1.92);
  \node[obja, text width=2cm] at (2.55,-1.92)
    {Lata życia};

  \draw (2.2,-2.375) -- (2.45,-2.375);
  \node[obja, text width=2cm] at (2.55,-2.48)
    {Miejsce\\urodzenia};

  % 2. Małżeństwo — symbol zgodny z drzewami
  \begin{scope}[shift={(5.8,-1.43)}]
    \node[anchor=south] at (0,.4) {Miejsce ślubu};
    \node[anchor=north] at (0,-.4) {Rok ślubu};

    \draw[double, double distance=1pt, line width=.4pt]
      (-.7,0) -- (-.48,0);
    \draw[double, double distance=1pt, line width=.4pt]
      (.48,0) -- (.7,0);

    \draw[
      double=white,
      double distance=1.2pt,
      line width=.55pt,
      line cap=round,
      line join=round
    ]
      (-.48,0)
      .. controls (-.48,.32) and (-.26,.32) .. (0,0)
      .. controls (.26,-.32) and (.48,-.32) .. (.48,0)
      .. controls (.48,.32) and (.26,.32) .. (0,0)
      .. controls (-.26,-.32) and (-.48,-.32) .. cycle;

    \draw[
      double=white,
      double distance=1.2pt,
      line width=.55pt,
      preaction={draw=white,line width=4pt}
    ]
      (-.14,.15)
      .. controls (-.05,.06) and (.05,-.06) .. (.14,-.15);
  \end{scope}

  \node[obja] at (6.8,-1.43) {Małżeństwo};

  % Potomstwo
  \draw (5.8,-2.2) -- (5.8,-2.45);
  \draw (5.4,-2.75) -- (5.4,-2.45)
    -- (6.2,-2.45) -- (6.2,-2.75);
  \node[obja] at (6.8,-2.48) {Potomstwo};

  % 3. Wyróżnienia i brak danych
  \fill[rod] (9.95,-.9) rectangle (10.3,-1.25);
  \node[obja, font=\fontsize{8}{9.5}\selectfont\bfseries]
    at (10.5,-1.08) {Linia rodzinna\\autora książki};

  \node[font=\fontsize{14}{15}\selectfont]
    at (10.125,-1.9) {?};
  \node[obja] at (10.5,-1.9) {Dane nieustalone};

  \end{tikzpicture}%
}