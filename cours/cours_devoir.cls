%%%
%%%
%%% Classe : cours_devoir.cls
%%% Version : 1.0
%%% Date : 01/04/17
%%% Auteur : Jeff LANCE
%%%
%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cours_devoir}[2016/11/09 Document de devoir, V1.0]




%-- PARENT CLASS
\LoadClass[a4paper, 11pt]{article}
%---------------




%-- PACKAGES CALLS
%%% PERSO %%%
\RequirePackage{commun}
\RequirePackage{shortcuts}
%%%%%%%%%%%%%

%%% AUTRES %%%
\RequirePackage{comment}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{environ}
%%%%%%%%%%%%%%
%-----------------

\makeatletter




%-- SETTINGS
%%% PATHS %%%
\graphicspath{{images/}}
%%%%%%%%%%%%%


%%% METAPOST %%%
\ifpdf
  \DeclareGraphicsRule{*}{mps}{*}{}
\fi
%%%%%%%%%%%%%%%%


%%% TikZ %%%
\usetkzobj{all} % on charge tous les objets
%%%%%%%%%%%%


%%% PAGE %%%
\geometry{a4paper, hmargin=.8cm, vmargin=2cm, centering, nofoot, headheight=1cm, layoutvoffset=.5cm}
%%%%%%%%%%%%


%%% TITRE, EN-TÊTE, PIED,... %%%
\thispagestyle{fancy}
\pagestyle{empty}
\fancyhead{}
\fancyfoot{}
\renewcommand{\headrulewidth}{0.0pt}
\renewcommand{\footrulewidth}{0.0pt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% SECTIONS %%%
\titlelabel{\textbf{\thetitle}}
\titleformat{\section}[runin]{\rmfamily\bfseries\large}{\thesection}{.5em}{}[\\]
\titleformat{\subsection}[runin]{\rmfamily\bfseries\normal}{\thesubsection)}{.5em}{}[\\]
%%%%%%%%%%%%%%%%


%%% LISTS %%%
\setlist[enumerate,1]{label=\textbf{\arabic*.},
  font=\sffamily,
  leftmargin=1.2em,
  noitemsep,resume}
\setlist[enumerate,2]{label=\textbf{\alph*)},
  font=\sffamily,
  leftmargin=1.2em,
  noitemsep
}
\setlist[enumerate,3]{label={\textcircled{\small\Alph*}},
  font=\sffamily,
  leftmargin=1.2em,
  noitemsep
}
%%%%%%%%%%%%%


%%% MDFRAMED %%%
% global options
\mdfsetup{
    frametitlealignment=\raggedright,%
    innerbottommargin=2em,%
}

% styles
\tikzset{
    symbol/.style={
        rectangle, draw=white,
        fill=white, scale=1,
        overlay
    }
}

% idea: a shadowed square frame with a light bulb icon at upper left
\mdfdefinestyle{tips}{%
  linecolor=white,linewidth=1pt,%
  tikzsetting={draw=black,dotted,line width=1pt},%
  leftmargin=0,rightmargin=0,%
  innertopmargin=0em,innerbottommargin=0.5em,%
  innerleftmargin=1em,innerrightmargin=.5em,%
  skipabove=0,skipbelow=0,%
  frametitlerule=false,%
  frametitlebackgroundcolor=white!0,%innertopmargin=\topskip,%
  frametitleaboveskip=0,frametitlebelowskip=0
  nobreak=true,%
  xcolor,%
  hidealllines=false, %leftline=true, % topline=true, bottomline=true,%
  % shadow=true,%
  % backgroundcolor=gray!40,% FOR TEST ONLY
  firstextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
              node[symbol] { \faLightbulbO };
             },%
  secondextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
               node[symbol] { \faLightbulbO };
              },%
  middleextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
               node[symbol] { \faLightbulbO };
              },%
  singleextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
               node[symbol] { \faLightbulbO };
              },%
}

\mdtheorem[style=tips, theoremseparator={}, theoremspace={}]{tips}{}

\RenewDocumentEnvironment{tips}{ o } {%begin
  \begin{tips*}
}{%end
  \end{tips*}
}
%%%%%%%%%%%%%%%%

%-----------




%-- OWN COMMANDS

%% \lHead{TEXT}
%% partie gauche du titre
%\NewDocumentCommand \lHead { g } {
%  \fancyhead[LO]{#1\\}
%  \fancyhead[LE]{}
%}
%
%% \cHead{TEXT}
%% partie centrale du titre
%\NewDocumentCommand \cHead { g } {
%  \fancyhead[CO]{\textbf{MATHÉMATIQUES}\\#1\\}
%  \fancyhead[CE]{}
%}
%
%% \rHead{TEXT}
%% partie droite du titre
%\NewDocumentCommand \rHead { g } {
%  \fancyhead[RO]{#1\\}
%  \fancyhead[RE]{}
%}

% \headrule
% affiche un trait de séparation netre le titre et le contenu du document
%\NewDocumentCommand \headrule { } {
%  \renewcommand{\headrulewidth}{1.0pt}
%}

%---------------




\makeatother
