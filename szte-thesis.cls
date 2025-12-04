\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{szte-thesis}[2025/03/09 SZTE szakdolgozat/diplomamunka/TDK]

% ==================================================
% === 1. ALAP OSZTÁLY ÉS OLDALBEÁLLÍTÁS ===
% ==================================================
\LoadClass[a4paper,12pt,oneside]{report}

\RequirePackage[
inner=2.5cm,
outer=2.5cm,
top=2.5cm,
bottom=2.5cm,
bindingoffset=1cm
]{geometry}

% ==================================================
% === 2. NYELV, KÓDOLÁS, BETŰK ===
% ==================================================
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[magyar]{babel}
\RequirePackage{lmodern}

% ==================================================
% === 3. MATEMATIKA ===
% ==================================================
\RequirePackage{amsmath,amssymb,amsthm}

% ==================================================
% === 4. ÁLTALÁNOS CSOMAGOK ===
% ==================================================
\RequirePackage{needspace}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{ifthen}
\RequirePackage{comment}
\RequirePackage{setspace}
\RequirePackage{hyperref}
\RequirePackage{csquotes}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{todonotes}
\RequirePackage{caption}
\setlength{\marginparwidth}{2cm}

% --- Matematika ábrákhoz szükséges csomagok ---
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}
\usetikzlibrary{arrows.meta,positioning}

\RequirePackage[backend=biber,style=ieee,sorting=none]{biblatex}

% ==================================================
% === 5. SORTÁVOLSÁG, TARTALOMJEGYZÉK ===
% ==================================================
\onehalfspacing
\setcounter{tocdepth}{3}
\renewcommand*{\bibfont}{\small}

\hypersetup{
	colorlinks=true,
	linkcolor=blue,
	urlcolor=blue,
	citecolor=blue
}

% ==================================================
% === 6. FEJEZETFORMÁTUM ===
% ==================================================
\titleformat{\chapter}{\normalfont\bfseries\Large}{\thechapter.}{1em}{}
\titleformat{\section}{\normalfont\bfseries\large}{\thesection}{0.8em}{}
\titleformat{\subsection}{\normalfont\bfseries\normalsize}{\thesubsection}{0.8em}{}

\setlength{\parindent}{1.25cm}
\setlength{\parskip}{0pt}

% ==================================================
% === 7. OLDALFEJ ===
% ==================================================
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[R]{\thepage}
\renewcommand{\headrulewidth}{0pt}

% ==================================================
% === 8. CAPTION MINDIG ALUL ===
% ==================================================
\captionsetup{
	position=bottom,
	tableposition=bottom,
	justification=centering,
	font=small,
	labelfont=bf
}

\makeatletter

% ==================================================
% === 9. MAGYAR DÁTUM ===
% ==================================================
\newcommand{\twodigits}[1]{\ifnum#1<10 0\fi\number#1}
\newcommand{\todayhu}{\number\year.\twodigits{\month}.\twodigits{\day}.}

% ==================================================
% === 10. KAPCSOLÓK ===
% ==================================================
\newboolean{showfigures}\setboolean{showfigures}{true}
\newboolean{showtables}\setboolean{showtables}{true}
\newboolean{showcode}\setboolean{showcode}{true}
\newboolean{showtodos}\setboolean{showtodos}{true}
% Matematikai ábrák külön kapcsolója
\newboolean{showmathfigures}\setboolean{showmathfigures}{true}

% --- Titkos dolgozat kapcsoló
\newboolean{confidential}
\setboolean{confidential}{false}

\newcommand{\setconfidential}[1]{%
	\ifthenelse{\equal{#1}{true}}%
	{\setboolean{confidential}{true}}%
	{\setboolean{confidential}{false}}%
}

% ==================================================
% === 11. FOKOZAT ===
% ==================================================
\def\degreeTitle{BSc szakdolgozat}
\def\degreeType{bsc}

\newcommand{\setdegree}[1]{%
	\def\degreeType{#1}%
	\ifthenelse{\equal{#1}{bsc}}{\def\degreeTitle{BSc szakdolgozat}}{}%
	\ifthenelse{\equal{#1}{msc}}{\def\degreeTitle{MSc diplomamunka}}{}%
	\ifthenelse{\equal{#1}{tdk}}{\def\degreeTitle{TDK dolgozat}}{}%
}

% ==================================================
% === 12. METAADATOK ===
% ==================================================
\def\@university{Szegedi Tudományegyetem}
\def\@faculty{Természettudományi és Informatikai Kar}
\def\@institute{Informatikai Intézet}

\def\@programname{}
\def\@specialization{}
\def\@neptun{}

% 1. témavezető
\def\@supervisor{}
\def\@supervisortitle{}
\def\@supervisordepartment{}

% 2. témavezető (opcionális)
\def\@secondsupervisor{}
\def\@secondsupervisortitle{}
\def\@secondsupervisordepartment{}

% Konzulens (opcionális)
\def\@consultant{}
\def\@consultantworkplace{}
\def\@consultantposition{}

\def\@city{Szeged}
\def\@year{\the\year}
\def\@thesislogo{img/szte_logo}

\newcommand{\faculty}[1]{\def\@faculty{#1}}
\newcommand{\institute}[1]{\def\@institute{#1}}

% A régi \department most az 1. témavezető tanszékére mutat
\newcommand{\department}[1]{\def\@supervisordepartment{#1}}

\newcommand{\program}[1]{\def\@programname{#1}}
\newcommand{\specialization}[1]{\def\@specialization{#1}}
\newcommand{\neptun}[1]{\def\@neptun{#1}}

\newcommand{\supervisor}[1]{\def\@supervisor{#1}}
\newcommand{\supervisortitle}[1]{\def\@supervisortitle{#1}}
\newcommand{\supervisordepartment}[1]{\def\@supervisordepartment{#1}}

\newcommand{\secondsupervisor}[1]{\def\@secondsupervisor{#1}}
\newcommand{\secondsupervisortitle}[1]{\def\@secondsupervisortitle{#1}}
\newcommand{\secondsupervisordepartment}[1]{\def\@secondsupervisordepartment{#1}}

\newcommand{\consultant}[1]{\def\@consultant{#1}}
\newcommand{\consultantworkplace}[1]{\def\@consultantworkplace{#1}}
\newcommand{\consultantposition}[1]{\def\@consultantposition{#1}}

\newcommand{\city}[1]{\def\@city{#1}}
\newcommand{\thesisyear}[1]{\def\@year{#1}}
\newcommand{\thesislogo}[1]{\def\@thesislogo{#1}}

\newcommand{\computedprogram}{%
	\ifthenelse{\equal{\degreeType}{bsc}}{\@programname\ BSc}{}%
	\ifthenelse{\equal{\degreeType}{msc}}{\@programname\ MSc}{}%
	\ifthenelse{\equal{\degreeType}{tdk}}{\@programname}{}%
}

% ==================================================
% === 13. TODO ===
% ==================================================
\newcommand{\todoi}[1]{%
	\ifthenelse{\boolean{showtodos}}%
	{\todo[inline,color=red!60]{\textbf{TODO:}~#1}}%
	{}%
}

% ==================================================
% === 14. KÓD (SYNTAX HIGHLIGHT + IMPORT) ===
% ==================================================
\RequirePackage{listings}
\RequirePackage{listingsutf8}

\lstset{
	inputencoding=utf8,
}

\definecolor{codebg}{RGB}{248,248,248}
\definecolor{codecomment}{RGB}{0,128,0}
\definecolor{codekeyword}{RGB}{0,0,180}
\definecolor{codestring}{RGB}{163,21,21}
\definecolor{codenumber}{RGB}{120,120,120}

\lstdefinestyle{generalcode}{
	backgroundcolor=\color{codebg},
	basicstyle=\ttfamily\small,
	keywordstyle=\color{codekeyword}\bfseries,
	commentstyle=\color{codecomment}\itshape,
	stringstyle=\color{codestring},
	numbers=left,
	numberstyle=\tiny\color{codenumber},
	stepnumber=1,
	numbersep=8pt,
	breaklines=true,
	breakatwhitespace=true,
	frame=single,
	captionpos=b,
	keepspaces=true,
	columns=fullflexible,
	aboveskip=0.5\baselineskip,
	belowskip=0.5\baselineskip
}

% --- Kapcsolható kódkörnyezet (belső kód) ---
\lstnewenvironment{codeblock}[2][]{%
	\ifthenelse{\boolean{showcode}}{%
		\Needspace{4\baselineskip}% ne a lap leges alján kezdődjön
		\lstset{style=generalcode,language=#2,#1}%
	}{%
		\comment
	}%
}{%
	\ifthenelse{\boolean{showcode}}{}{%
		\endcomment
	}%
}

% --- Külső fájlból kód importja ---
\newcommand{\inputcode}[3][]{%
	\ifthenelse{\boolean{showcode}}{%
		\Needspace{4\baselineskip}%
		\lstinputlisting[
		style=generalcode,
		language=#2,
		caption={#1}
		]{#3}%
	}{}%
}

% ==================================================
% === 15. KAPCSOLHATÓ ÁBRA ÉS TÁBLÁZAT ===
% ==================================================
\newenvironment{safefigure}
{%
	\ifthenelse{\boolean{showfigures}}{%
		\Needspace{4\baselineskip}%
		\begin{figure}[ht]
		}{%
			\comment
		}%
	}%
	{%
		\ifthenelse{\boolean{showfigures}}{\end{figure}}{\endcomment}%
}

\newenvironment{safetable}
{%
	\ifthenelse{\boolean{showtables}}{%
		\Needspace{4\baselineskip}%
		\begin{table}[ht]
		}{%
			\comment
		}%
	}%
	{%
		\ifthenelse{\boolean{showtables}}{\end{table}}{\endcomment}%
}

% --- Matematikai ábra külön kapcsolóval ---
\newenvironment{safemathfigure}
{%
	\ifthenelse{\boolean{showmathfigures}}{%
		\Needspace{4\baselineskip}%
		\begin{figure}[ht]
		}{%
			\comment
		}%
	}%
	{%
		\ifthenelse{\boolean{showmathfigures}}{\end{figure}}{\endcomment}%
}

% ==================================================
% === 16. FEDLAP ===
% ==================================================
\newcommand{\makecover}{%
	\thispagestyle{empty}
	
	% Felső rész: logo + egyetem / kar / intézet + dolgozat típusa + cím
	\begin{center}
		\includegraphics[width=0.25\textwidth]{\@thesislogo}\\[1cm]
		{\Large \@university}\\
		{\large \@faculty}\\
		{\large \@institute}\\[1cm]
		{\Large \degreeTitle}\\[0.5cm]
		{\huge\bfseries \@title}
	\end{center}
	
	\vfill
	
	% Bal: hallgató
	\noindent
	\begin{minipage}[t]{0.48\textwidth}
		\raggedright
		{\large\bfseries \@author}\\[0.4em]
		\small
		%		\@neptun\\
		\computedprogram\\
	\end{minipage}
	\hfill
	% Jobb: témavezető(k) + konzulens
	\begin{minipage}[t]{0.48\textwidth}
		\raggedleft
		\textit{Témavezető(k):}\\[0.2em]
		% 1. témavezető
		\ifx\@supervisor\@empty\else
		{\normalsize\bfseries \@supervisor}\\
		\@supervisortitle\\
		\ifx\@supervisordepartment\@empty\else
		\@supervisordepartment{}~Tanszék\\
		\fi
		\vspace{0.4em}
		\fi
		% 2. témavezető (opcionális)
		\ifx\@secondsupervisor\@empty\else
		{\normalsize\bfseries \@secondsupervisor}\\
		\@secondsupervisortitle\\
		\ifx\@secondsupervisordepartment\@empty\else
		\@secondsupervisordepartment{}~Tanszék\\
		\fi
		\vspace{0.4em}
		\fi
		% Konzulens (opcionális)		
		\ifx\@consultant\@empty\else
		\vspace{0.4em}
		\textit{Konzulens:}\\[0.2em]
		{\normalsize\bfseries \@consultant}\\
		\ifx\@consultantposition\@empty\else
		\@consultantposition\\
		\fi
		\ifx\@consultantworkplace\@empty\else
		\@consultantworkplace\\
		\fi
		\fi
	\end{minipage}
	
	\vfill
	
	% Alsó rész: város, év
	\begin{center}
		{\@city, \@year}
	\end{center}
	
	\clearpage
}

% ==================================================
% === 17. NYILATKOZAT ===
% ==================================================
\newcommand{\printdeclaration}{%
	\chapter*{Nyilatkozat}
	
	\ifthenelse{\boolean{confidential}}{%
		Alulírott \@author{} \computedprogram{} szakos hallgató, kijelentem, hogy
		a dolgozatomat a Szegedi Tudományegyetem, Informatikai Intézet
		\ifx\@supervisordepartment\@empty\else\@supervisordepartment{} Tanszékén\fi
		készítettem, \computedprogram{} diploma megszerzése érdekében.
		
		Kijelentem, hogy a dolgozatot más szakon korábban nem védtem meg, saját munkám
		eredménye, és csak a hivatkozott forrásokat (szakirodalom, eszközök, stb.)
		használtam fel. Tudomásul veszem, hogy szakdolgozatomat / diplomamunkámat
		a TVSZ 4. sz. mellékletében leírtak szerint kezelik.
	}{%
		Alulírott \@author{} \computedprogram{} szakos hallgató, kijelentem, hogy
		a dolgozatomat a Szegedi Tudományegyetem, Informatikai Intézet
		\ifx\@supervisordepartment\@empty\else\@supervisordepartment{} Tanszékén\fi
		készítettem, \computedprogram{} diploma megszerzése érdekében.
		
		Kijelentem, hogy a dolgozatot más szakon korábban nem védtem meg, saját munkám
		eredménye, és csak a hivatkozott forrásokat (szakirodalom, eszközök, stb.)
		használtam fel. Tudomásul veszem, hogy szakdolgozatomat / diplomamunkámat
		a Szegedi Tudományegyetem Diplomamunka Repozitóriumában tárolja.
	}
	
	\bigskip
	\noindent \@city,~\todayhu
	
	\bigskip
	\noindent\rule{6cm}{0.4pt}\\
	\@author
	\clearpage
}

\makeatother
