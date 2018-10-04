%%%
%%%
%%% Classe : cours_devoir.cls
%%% Version : 1.0
%%% Date : 03/10/18
%%% Auteur : Jeff LANCE
%%%
%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cours_devoir}[2018/10/03 Devoirs, V1.0]


%
%
% INIT
%
%
\LoadClassWithOptions{scrartcl}
%\LoadClass[a4paper, 12pt, DIV=24]{scrartcl}



%
%
% PACKAGES
%
%
% Others
\RequirePackage{xkeyval}

% Own packages. Those contains some global settings and definitions.
\RequirePackage{commun}
\RequirePackage{couleurs}
\RequirePackage{shortcuts}

% Output
\RequirePackage{comment}

% Layout
\RequirePackage{geometry}
\RequirePackage[footsepline, plainfootsepline]{scrlayer-scrpage}
\RequirePackage{titling}
\RequirePackage{titlesec}
\RequirePackage{pageslts}
\RequirePackage{enumitem}
\RequirePackage[]{hyperref}



\makeatletter



%
%
% OPTIONS
%
%

\DeclareOptionX{type}[ds]{%
  \def\type{#1}%
}

\ExecuteOptions{a4paper, DIV=24}
\ExecuteOptionsX{type}
\ProcessOptionsX



%
%
% FIXES
%
%

% Fix error from KOMA-Script scrartcl class.
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}



%
%
% SETTINGS
%
%

% metapost
\ifpdf
  \DeclareGraphicsRule{*}{mps}{*}{}
\fi

% tkz
\usetkzobj{all} % on charge tous les objets

% sizing of the page
\geometry{a4paper, includeheadfoot, hmargin=.7cm, vmargin=.5cm, head=14.5pt}

% title, header and footer
\ihead[]{}
\chead[]{}
\ohead[]{}
\ifoot[]{}
\cfoot[]{}
\ofoot[]{}

% KOMA-Script version (preferred)

\ifthenelse{ \equal{\type}{ds} }{
 	\cohead[\textbf{MATHÉMATIQUES}\\\textbf{Devoir surveillé}]{\textbf{MATHÉMATIQUES}\\\textbf{Devoir surveillé}}
  \lohead[NOM :\\Prénom :]{NOM :\\Prénom :}
  \rohead[Le \@date]{Le \@date}
  \cehead[]{}
  \lehead[]{}
  \rehead[]{}
}{
	\ifthenelse{ \equal{\type}{dm} }{
   	\cohead[\textbf{MATHÉMATIQUES}\\\textbf{Devoir maison}]{\textbf{MATHÉMATIQUES}\\\textbf{Devoir maison}}
    \lohead[NOM :\\Prénom :]{NOM :\\Prénom :}
    \rohead[Le \@date]{Le \@date}
    \cehead[]{}
    \lehead[]{}
    \rehead[]{}
	}{
  
	}
}

\cofoot*{}
\pagestyle{scrheadings}
\setkomafont{pagehead}{\normalfont}
\setkomafont{pagefoot}{\normalfont}

% paths
\graphicspath{{images/}}



%
%
% MACROS
%
%

% lists
\newlist{questions}{enumerate}{2}
\setlist[questions]{labelindent=0em, leftmargin=*, labelsep=0.5em}
\setlist[questions, 1]{label=\textbf{\arabic*.}}
\setlist[questions, 2]{label=\textbf{\alph*)}}

\newlist{questionsl}{enumerate*}{1}
\setlist*[questionsl]{label=\textbf{\alph*)}}

\setlist[enumerate, 1]{label=\textbf{\arabic*.}, leftmargin=*, labelsep=.5em}
\setlist[enumerate, 2]{label=\textbf{\alph*)}}

\setlist[description]{font=\sffamily\bfseries}

%
\NewDocumentCommand \turnpage{ }{
  \rofoot[\textit{Tourner la page, svp} \faHandORight]{\textit{Tourner la page, svp} \faHandORight}
}

\makeatother
