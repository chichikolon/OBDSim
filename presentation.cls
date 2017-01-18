% Erstellt von Ulrich Klauck, überarbeitet von Dominik Bergen

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{presentation}[2016/05/31 Präsentationstemplate]
\DeclareOption* {\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\ProcessOptions
\pdfminorversion=4
\LoadClass{beamer}

% Zeichensatz, Rechtschreibung, Anführungszeichen
\RequirePackage{ucs} 							% Erweiterte UTF-8-Enkodierung
\RequirePackage[ansinew, utf8x]{inputenc} 		% Direkte Eingabe von Sonderzeichen
\RequirePackage[T1]{fontenc} 					% Laden bestimmter Schrifttypen
\RequirePackage[ngerman]{babel} 				% Silbentrennung nach neuer deutscher Rechtschreibung
\RequirePackage[babel,german=quotes]{csquotes} 	% Deutsche Anführungszeichen
\RequirePackage{lmodern}
\RequirePackage{gensymb}
\RequirePackage{newunicodechar}
\newunicodechar{°}{\degree}

% Serifenlose Schrift
\renewcommand*\familydefault{\sfdefault}

% Diverses
\RequirePackage{xspace}
\RequirePackage{boxedminipage}
\RequirePackage{lscape}
\RequirePackage{marvosym}
\RequirePackage{rotating}
\RequirePackage{textcomp}

% Mathematik
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amstext}
\RequirePackage{mathtools}
\RequirePackage{trfsigns} 
\RequirePackage{nicefrac}
\RequirePackage{siunitx}

\newcommand{\field}[1]{\mathbb{#1}}
\newcommand{\C}{\field{C}}
\newcommand{\R}{\field{R}}

% Grafik
\RequirePackage{pgf}
\RequirePackage{graphics}
\RequirePackage{graphicx}
\RequirePackage{pdflscape}
\RequirePackage{pgffor}
\RequirePackage{pgfplots}
\RequirePackage{subfigure}
\RequirePackage{tikz}

% Tabellen
\RequirePackage{longtable}      % Seitenübergreifende Tabellen
\RequirePackage{tabularx}
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{booktabs}		% Hochwertige horizontale Linien in Tabellen
\RequirePackage{array}          % Gestaltung aufwändiger Tabellen
\RequirePackage{colortbl}       % Farbige Tabellen

% Zitate, Inhaltsverzeichnis, Index
\RequirePackage{cite}
\RequirePackage{makeidx}
\RequirePackage{tocbasic}

% Algorithmen und Quellcode
\RequirePackage[formats]{listings}
\RequirePackage{algpseudocode}
\RequirePackage{struktex}
\RequirePackage{filecontents}
\RequirePackage{forloop}
\RequirePackage{ifthen}
\RequirePackage{cancel}

% Programmiersprachen
\lstloadlanguages {
	[ISO]C++, [ANSI]C++, R, Java, Python
}

\lstset {
	inputencoding=utf8x,
	extendedchars=\true,
	numbers=left,
	tabsize=2,
	captionpos=b,
	breaklines=true,
	breakatwhitespace=true,
	xleftmargin=4ex,
	xrightmargin=0ex,
	showtabs=false,
	showspaces=false,
	showstringspaces=false,
	basicstyle=\ttfamily\color{black}\scriptsize,
	keywordstyle=\ttfamily\color{blue},
	stringstyle=\ttfamily\color{green},
	commentstyle=\ttfamily\color{orange},
	numberstyle=\ttfamily\color{gray},
	identifierstyle=\ttfamily\color{black},
	morekeywords={},
	literate=
		{Ö}{{\"O}}1 
		{Ä}{{\"A}}1 
		{Ü}{{\"U}}1 
		{ß}{{\ss}}2 
		{ü}{{\"u}}1 
		{ä}{{\"a}}1 
		{ö}{{\"o}}1
}

\lstdefinelanguage{R} {
	morekeywords=[1]{\<<-},
	sensitive=false,
	morecomment=[l]{\#},
	morecomment=[s]{/*}{*/},
	morestring=[b]",
}[keywords,comments,strings]

\lstdefinelanguage{CSS} {
	morekeywords={color,display},
	sensitive=false,
	morecomment=[l]{//},
	morecomment=[s]{/*}{*/},
	morestring=[b]",
}

\lstdefinelanguage{C} {
	sensitive=false,
	morecomment=[l]{//},
	morecomment=[s]{/*}{*/},
	morestring=[b]"
}

% Frametitles
\addtobeamertemplate{frametitle}{} {
	\begin{tikzpicture}[remember picture,overlay]
		\node[anchor=north east] at (current page.north east) {
			\includegraphics[height=6mm]{images/htw-aalen.pdf}
		};
	\end{tikzpicture}
}

\addtobeamertemplate{frametitle} {
	\ifx\insertsectionhead\empty
		{}
	\else
		\frametitle{\insertsectionhead}\framesubtitle{\insertsubsectionhead}
	\fi
 }{}

\makeatletter
	\CheckCommand*\beamer@checkframetitle { \@ifnextchar\bgroup\beamer@inlineframetitle{} }
	\renewcommand*\beamer@checkframetitle { \global\let\beamer@frametitle\relax\@ifnextchar\bgroup\beamer@inlineframetitle{} }
\makeatother

% Darstellungsmodi
\mode<presentation> {
	\useoutertheme{default}
	\usecolortheme{seahorse}
	\setbeamercovered{invisible}
	\setbeamertemplate{footline}[page number]
	\setbeamertemplate{navigation symbols}{}
}

% Sprachwahl
\selectlanguage{ngerman}

% Befehle
\newcommand{\newframe}[1] {
	\begin{frame}[allowframebreaks,fragile]
		#1
	\end{frame}
}

\newcommand{\referenz}[1] {
	\begin{tiny}
		#1
	\end{tiny}
}

\newcommand{\LComment}[1]{
	$\blacktriangleright\,$\textit{#1}
}

\newcommand{\SComment}[1]{
	\State{$\blacktriangleright\,$\textit{#1}}
}

\algrenewcommand{\algorithmiccomment}[1]{
	\hfill$\blacktriangleright\,$ #1
}

\renewcommand{\em}[1] {
	\usebeamercolor[fg]{block title} #1
}

\renewcommand{\emph}[1] {
	\usebeamercolor[fg]{block title} #1
}

\setlength{\parskip}{1ex}
\setcounter{tocdepth}{2}
