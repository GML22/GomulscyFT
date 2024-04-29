\ProvidesClass{Pakiety/thesis}
\LoadClass[11pt, twoside]{mwbk}

%-----------------------------------------------------------------------------
% Definiujemy parametry klasy
%-----------------------------------------------------------------------------
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=Pakiety/thesis.cls,
    prefix=thesis
}
\DeclareStringOption[2.5cm]{left}
\DeclareStringOption[2.5cm]{right}
\DeclareStringOption[2.5cm]{top}
\DeclareStringOption[2.5cm]{bottom}
\DeclareStringOption[6mm]{bindingoffset}
\DeclareBoolOption[false]{nohyphenation}
\ProcessKeyvalOptions*

%-----------------------------------------------------------------------------
% Pobieramy odpowiednie pakiety
%-----------------------------------------------------------------------------
\RequirePackage{amsmath}    % Basic mathematical typesetting
\RequirePackage{amsthm}     % Theorems typesetting
\RequirePackage{array}      % Advanced table column formats

% Bibliography in biber
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

% Zmiana czcionki
\RequirePackage{fontspec}
\setmainfont{TeX Gyre Pagella}

%-----------------------------------------------------------------------------
% Ustawienia pobranych pakietów
%-----------------------------------------------------------------------------

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
    %\addtocounter{page}{-1}%
    \newpage}

% Powoduje, że odstępy pomiędzy paragrafami są równe
\raggedbottom
\allowdisplaybreaks[1]

% Ustawienie marginesu dla przypisów
\setlength\footnotemargin{10pt}

% Ustawienie sekcji
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}

\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\setcounter{secnumdepth}{4} 
\urlstyle{rm}                                  

% Zmiana nazwy z "Listing" na "Kod źródłowy"
\renewcommand\lstlistingname{\large Kod źródłowy}
\renewcommand\lstlistlistingname{\large Kod źródłowy}

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

% Ustawienia marginesów
\RequirePackage[
    a4paper,
    left=\thesisleft,
    right=\thesisright,
    top=\thesistop,
    bottom=\thesisbottom,
    bindingoffset=\thesisbindingoffset
]{geometry}

% Turn off hyphenation
\ifthesisnohyphenation
    \tolerance=1
    \emergencystretch=\maxdimen
    \hyphenpenalty=10000
    \hbadness=10000
\fi

% Ustawienia spisu treści
\setlength{\cftbeforesecskip}{2pt}
\renewcommand{\cftsecfont}{\bf\normalsize}
\renewcommand{\cftsecpagefont}{\normalfont}
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

\fancypagestyle{plain}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\fancyfoot[LE,RO]{\thepage}
}

\fancypagestyle{headings}{
	\fancyhead{}
	\renewcommand{\headrulewidth}{1pt}
	\fancyheadoffset{0cm}
	\fancyhead[RO]{\nouppercase{\thesection.\hspace{8pt}\leftmark}}
	\fancyhead[LE]{\nouppercase{\thesection.\hspace{8pt}\leftmark}}
	\fancyfoot{}
	\fancyfoot[LE,RO]{\thepage}
}
\pagestyle{headings}

\renewcommand{\sectionmark}[1]{
	\markboth{#1}{#1}
}

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
\newcommand{\acronym}[2]{
    \par\noindent\hspace{0.4em}
    {\textbf{#1} -- #2}
}

% Spis załączników - makra
\newcommand{\nocontentsline}[3]{}
\newcommand{\tocless}[2]{%
    \bgroup\let\addcontentsline=\nocontentsline#1{#2}\egroup
}

\newcommand{\@appendixtitle}{
    \ifnum \pdf@strcmp{\@lang}{polish} = 0
        Załącznik
    \fi
    \ifnum \pdf@strcmp{\@lang}{english} = 0
        Appendix
    \fi
}

\let\standardappendix\appendix
\renewcommand\appendix[1]{%
    \tocless\section{\hspace*{1.5em} #1}
    \addcontentsline{app}{subsection}{\hspace*{-1.1em}\arabic{
        section}.\hspace*{0.5em} #1}
}

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