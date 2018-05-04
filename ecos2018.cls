%
% ---------------------------------------------------------------------------
%   filename:      ecos2018.cls
%   version:       1.0
%   date:          10-1-2017
%   ported by:     César Torres Cuadra
%   address:       CIRCE
%   e-mail:        ctorresc@unizar.es
%   description:   This is a LaTeX2e style file for the ECOS 2018
%                  proceedings.
%   usage:         \documentclass[options]{ecos2017}
% ---------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ecos2018}[2017/01/10 v1.0]
\LoadClass[a4paper,twoside,12pt]{article}

% Base Packages
\RequirePackage[fleqn]{amsmath}
\usepackage[pdftex,colorlinks=true,urlcolor=blue,citecolor=blue,%
linkcolor=blue,pdfstartview=FitH]{hyperref}
\pdfcompresslevel=9
\RequirePackage{graphicx}
\RequirePackage[utf8x]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[textheight=257mm,
	textwidth=170mm,
	top=20mm,
	left=20mm,
	nohead,
	footskip=10mm]{geometry}
\RequirePackage[neverdecrease]{paralist}
\RequirePackage[justification=raggedright,singlelinecheck=false,labelsep=period,labelfont=sl,textfont=sl]{caption}
\RequirePackage{txfonts}
\RequirePackage{mathtools,amssymb,amsfonts,array,appendix,bm,booktabs,cleveref,courier,eurosym,fancyhdr,float,ifthen,multirow,tabularx,tabulary,paralist,url,verbatim,subcaption,setspace,textcomp}
\captionsetup[subfigure]{justification=centering}
\captionsetup[subtable]{justification=centering}
%Parameters and lenghts
\parindent 0pt
\parskip 6pt plus 1pt minus 0pt
%Redefine values
\renewcommand\figurename{Fig.}
\renewcommand\tablename{Table}
\renewcommand\appendixname{Appendix}
\renewcommand\refname{References}
\renewcommand\abstractname{Abstract}
%Sections definitions
\renewcommand\@seccntformat[1]{{\csname the#1\endcsname}\hspace{0.3em}}
\renewcommand{\thesection}{\arabic{section}.}
\renewcommand{\section}{\@startsection {section}{1}{0pt}
                        {\baselineskip}
                        {0.1\baselineskip}
                        {\fontsize{16}{16pt}\selectfont\sffamily\bfseries}}
\renewcommand{\thesubsection}{\thesection\arabic{subsection}}
\renewcommand{\subsection}{\@startsection {subsection}{1}{0pt}
                        {1.2\baselineskip}
                        {0.1\baselineskip}
                        {\fontsize{13}{13pt}\selectfont\sffamily\bfseries}}
\renewcommand{\thesubsubsection}{\thesubsection\arabic{subsubsection}}
\renewcommand{\subsubsection}{\@startsection {subsubsection}{1}{0pt}
	{0.01\baselineskip}
	{0.01\baselineskip}
	{\fontsize{11}{11pt}\selectfont\sffamily\bfseries}}
%\pagestyle{empty}		
\pagestyle{plain}	
\setcounter{secnumdepth}{2}
\clubpenalty 10000
\widowpenalty 10000
\hfuzz1pt
\tolerance 1000
\predisplaypenalty 100
%\sloppy
\setlength{\emergencystretch}{12pt}
%\renewcommand{\baselinestretch}{0.95}
%Title
\renewcommand\maketitle{\par
  \begingroup
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{empty}
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty

  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \vspace*{-20mm}
  \begin{flushright}
  \includegraphics{header.pdf}
  \end{flushright} 
  \vspace*{6pt}
  \begin{center}
    {\fontsize{18}{18pt}\selectfont\sffamily\bfseries\@title \par}%%
    \vspace{18pt}%
    {\normalsize \rmfamily\bfseries \itshape \@author\par}
  \end{center}
}

% Define environments
\newenvironment{address}
{\begin{center} \fontsize{10}{10pt} \rmfamily \itshape}
{\medskip \end{center}}

\renewenvironment{abstract}
{\parskip0pt\normalsize
\sffamily\bfseries\abstractname: \par\medskip
\mdseries\footnotesize}
{\bigskip}

\newenvironment{keywords}
{\parskip0pt\normalsize
\sffamily\bfseries Keywords:\par\medskip
\mdseries\footnotesize
{\medskip}}

\renewcommand\appendix{\par
  \section*{Appendix}
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \renewcommand\thesection{\@Alph\c@section}}

\newcommand\apendice{\par
  \appendix
  \gdef\thesection{\@Alph\c@section.}
  \setcounter{equation}{0}
  \renewcommand*{\theequation}{\thesection\arabic{equation}}
}

% Alternative Nomenclature environment
\newenvironment{nomenclatura}[2][3em]{%
	\subsubsection*{#2}
	\newcommand\entry[2]{\item[##1] ##2}
	\begin{list}{}
		{\renewcommand*{\makelabel}[1]{\hspace{\labelsep}\raggedleft ##1}
			\setlength{\labelwidth}{#1}
			\setlength{\leftmargin}{\labelwidth}
			\setlength{\parsep}{0pt}
			\setlength{\itemsep}{0pt}
			\sloppy}}
	{\end{list}}


%% Redefine the itemize with square bullets and less space
%% http://www.gutenberg.eu.org/pub/GUTenberg/publicationsPS/17-goossens.ps.gz
\newenvironment{elist}%
{ \begin{list}%
    {\tiny \raisebox{0.5ex}{$\blacksquare$}}%
    {\setlength{\itemindent}{0pt}%  --> space between bullet and margin
    \setlength{\topsep}{0pt}%  --> space between the item paragrapn and the previous text
    \setlength{\labelsep}{5pt}%  --> space between bullet and text's start
    \setlength{\leftmargin}{10pt}%  --> space between the text and the left margin (except for the first line)
    \setlength{\labelwidth}{5pt}% --> size of the box containing the bullet.
    \setlength{\listparindent}{0pt}% --> paragraphs indents
    \setlength{\itemindent}{0pt}% --> space between the margin and the bullet
    \setlength{\itemsep}{0pt}% --> vertical space between items (plus \parsep)
    \setlength{\parsep}{1pt}
    }}%
{ \end{list} }

% Author/address correspondence macro
\newcommand{\refauth}[1]{\kern-1pt\textsuperscript{#1}}
%\newcommand{\refauth}[1]{\kern-1pt \raisebox{0.5em}{\footnotesize\it #1\vphantom{b}}}
\newcommand{\refaddr}[1]{\textsuperscript{#1}\kern-0.5pt}
%\newcommand{\refaddr}[1]{\raisebox{0.5em}{\footnotesize\it\vphantom{b}#1 \kern-3pt }}
% Column types
\newcolumntype{W}{@{}>{\raggedright\arraybackslash}X@{}}
\newcolumntype{Y}{@{}>{\raggedleft\arraybackslash}X@{}}
\newcolumntype{Z}{@{}>{\centering\arraybackslash}X@{}}
\newcolumntype{U}{>{\centering\arraybackslash}p{1cm}}
\newcolumntype{V}{>{\centering\arraybackslash}p{1.15cm}}
\newcolumntype{A}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{B}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{D}[1]{>{\raggedleft\arraybackslash}p{#1}}
\newcolumntype{T}{>{\centering\arraybackslash$}m{0.9cm}<{$}}
%User commands
\newcommand{\vm}[1]{\ensuremath{\mathbf{#1}}}
\newcommand{\ems}[3][\phantom{\ast}]{\ensuremath{{#2}_{#3}^\mathrm{#1}}}
\newcommand{\vms}[3][\phantom{\ast}]{\ensuremath{\mathbf{#2}_{#3}^\mathrm{#1}}}
\newcommand{\tvm}[1]{\ensuremath{\prescript{\smash{\mathrm{t}}}{}{\mathbf{#1}}}}
\newcommand{\tvma}[1]{\ensuremath{\mathbf{#1}^{T}}}
\newcommand{\mdiag}[1]{\ensuremath{\mathbf{#1}_\mathrm{D}}}
\newcommand{\minv}[1]{\ensuremath{\mathbf{#1}^{-1}}}
\newcommand{\mdinv}[1]{\ensuremath{\mathbf{#1}_{\mathrm{D}}^{-1}}}
\newcommand{\dvm}[1]{\ensuremath{\Delta \mathbf{#1}}}
\newcommand{\dt}{\ensuremath{\Delta t}}
\newcommand{\bvm}[1]{\ensuremath{\tilde{\mathbf{#1}}}}
\newcommand{\mbr}[1]{\ensuremath{\langle \textbf{#1} \rangle}}
\newcommand{\tmbr}[1]{\ensuremath{{}^{\mathrm{t}}\langle \textbf{#1} \rangle}}
\newcommand{\mbrc}[1]{\ensuremath{\langle \textbf{#1}^{\ast} \rangle}}
\newcommand{\mopsc}[1]{\ensuremath{\left\langle {\textbf{#1}^\ast } \right|}}
\newcommand{\mops}[1]{\ensuremath{\left\langle {\textbf{#1} } \right|}}
\newcommand{\mopsr}[1]{\ensuremath{\left\langle \tilde{\textbf{#1}} \right|}}
\newcommand{\mopscr}[1]{\ensuremath{\left\langle \tilde{\textbf{#1}}^\ast \right|}}
\newcommand{\mopd}[1]{\ensuremath{\left| {\textbf{#1} } \right\rangle}}
\newcommand{\vdiag}[1]{\ensuremath{\hat{\vm{#1}}}}
\newcommand{\vdinv}[1]{\ensuremath{\hat{\mathbf{#1}}^{-1}}}
\newcommand{\mbt}[1]{\ensuremath{\left[ \textbf{#1} \right]}}
\newcommand{\tm}{\ensuremath{\prescript{\smash{\mathsf{t}}}{}{\mskip-1mu}}}
\endinput