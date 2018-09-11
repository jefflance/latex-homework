%%%
%%%
%%% Classe : cours_paper.cls
%%% Version : 1.0
%%% Date : 09/11/16
%%% Auteur : Jeff LANCE
%%%
%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cours_paper}[2016/11/09 Document de cours en A4 pour
                           prof ou élève, V1.0]


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

\DeclareOptionX{type}[cours]{%
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

% Fix for mdframed package see :
% http://tex.stackexchange.com/questions/179790/mdframed-how-to-change-the-separator-between-the-label-and-the-title-of-a-non-n#179794
\DeclareDocumentCommand{\mdtheorem}{ O{} m o m o }%
 {\ifcsdef{#2}%
   {\mdf@PackageWarning{Environment #2 already exits\MessageBreak}}%
   {%
    \IfNoValueTF {#3}%
     {%#3 not given -- number relationship
      \IfNoValueTF {#5}%
        {%#3+#5 not given
        \@definecounter{#2}%
        \expandafter\xdef\csname the#2\endcsname{\@thmcounter{#2}}%
        \newenvironment{#2}[1][]{%
          \refstepcounter{#2}%
          \ifstrempty{##1}%
            {\let\@temptitle\relax}%
            {%
             \def\@temptitle{\mdf@theoremseparator%
                             \mdf@theoremspace%
                             \mdf@theoremtitlefont%
                             ##1}%
             \mdf@thm@caption{#2}{{#4}{\csname the#2\endcsname}{##1}}%
             }%
          \begin{mdframed}[#1,frametitle={\strut#4\ \csname the#2\endcsname%
                                          \@temptitle}]}%
          {\end{mdframed}}%
        \newenvironment{#2*}[1][]{%
          \ifstrempty{##1}{\let\@temptitle\relax}{\def\@temptitle{\mdf@theoremseparator\ ##1}}% <- the problem was here
          \begin{mdframed}[#1,frametitle={\strut#4\@temptitle}]}%
          {\end{mdframed}}%
        }%
        {%#5 given -- reset counter
        \@definecounter{#2}\@newctr{#2}[#5]%
        \expandafter\xdef\csname the#2\endcsname{\@thmcounter{#2}}%
        \expandafter\xdef\csname the#2\endcsname{%
               \expandafter\noexpand\csname the#5\endcsname \@thmcountersep%
                  \@thmcounter{#2}}%
        \newenvironment{#2}[1][]{%
          \refstepcounter{#2}%
          \ifstrempty{##1}%
            {\let\@temptitle\relax}%
            {%
             \def\@temptitle{\mdf@theoremseparator%
                             \mdf@theoremspace%
                             \mdf@theoremtitlefont%
                             ##1}%
             \mdf@thm@caption{#2}{{#4}{\csname the#2\endcsname}{##1}}%
             }
          \begin{mdframed}[#1,frametitle={\strut#4\ \csname the#2\endcsname%
                                          \@temptitle}]}%
          {\end{mdframed}}%
        \newenvironment{#2*}[1][]{%
          \ifstrempty{##1}%
            {\let\@temptitle\relax}%
            {%
             \def\@temptitle{\mdf@theoremseparator%
                             \mdf@theoremspace%
                             \mdf@theoremtitlefont%
                             ##1}%
             \mdf@thm@caption{#2}{{#4}{\csname the#2\endcsname}{##1}}%
             }%
          \begin{mdframed}[#1,frametitle={\strut#4\@temptitle}]}%
          {\end{mdframed}}%
        }%
     }%
     {%#3 given -- number relationship
        \global\@namedef{the#2}{\@nameuse{the#3}}%
        \newenvironment{#2}[1][]{%
          \refstepcounter{#3}%
          \ifstrempty{##1}%
            {\let\@temptitle\relax}%
            {%
             \def\@temptitle{\mdf@theoremseparator%
                             \mdf@theoremspace%
                             \mdf@theoremtitlefont%
                             ##1}%
             \mdf@thm@caption{#2}{{#4}{\csname the#2\endcsname}{##1}}%
             }
          \begin{mdframed}[#1,frametitle={\strut#4\ \csname the#2\endcsname%
                                          \@temptitle}]}%
          {\end{mdframed}}%
        \newenvironment{#2*}[1][]{%
          \ifstrempty{##1}{\let\@temptitle\relax}{\def\@temptitle{:\ ##1}}%
          \begin{mdframed}[#1,frametitle={\strut#4\@temptitle}]}%
          {\end{mdframed}}%
     }%
   }%
 }



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

% KOMA-Script version (preferred)
\ohead{}

\ifthenelse{ \equal{\type}{activity} }{
	\IfNoValueTF{ \subtitle }{
		\cohead[\@title]{\@title}
		\rohead[Activité]{Activité}
	}{
		\cohead[\@title]{\@title}
		\rohead[Activité]{Activité - \@subtitle}
	}
	
}{
	\ifthenelse{ \equal{\type}{exercise} }{
		\cohead[\@title]{\@title}
		\rohead[Exercices]{Exercices}
	}{
		\rohead[Cours]{Cours - \@title}
	}
}

\cofoot*{\thepage\ /\ \pageref{LastPage}}
\pagestyle{scrheadings}
\setkomafont{pagehead}{\normalfont\bfseries}
\setkomafont{pagefoot}{\normalfont}

%-------------------------------------
% fancyhdr version (need \RequirePackage{fancyhdr} and class article)
%\pagestyle{fancy}
%\fancyhf{}
%\rhead{Cours - \@title}
%\cfoot{\thepage\ /\ \pageref{LastPage}}
%\renewcommand{\headrulewidth}{0pt}
%\renewcommand{\footrulewidth}{.4pt}
%-------------------------------------

%---------------------------------------------------------------------
% (sub)sections
% \titleformat{\section}[block]{\sffamily\bfseries\Large}{\thesection.}{.5em}{}[]
% \titleformat{\subsection}[block]{\sffamily\bfseries\large\hspace{2em}}{\thesubsection)}{.5em}{}[]
% \renewcommand \thesection{\Roman{section}}
% \renewcommand \thesubsection{\arabic{subsection}}
%---------------------------------------------------------------------

% paths
\graphicspath{{images/}}



%
%
% MDFRAMED
%
%

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
% default: a standard square frame with thick border
\mdfdefinestyle{default}{%
  linecolor=black,linewidth=1pt,%
  leftmargin=0,rightmargin=0,%
  innertopmargin=1em,innerbottommargin=1em,%
  innerleftmargin=.5em,innerrightmargin=.5em,%
  skipabove=0,skipbelow=0,%
  frametitlerule=false,%
  frametitlebackgroundcolor=white!0,%innertopmargin=\topskip,%
  nobreak=true,%
  xcolor,%
}
% clear: a no-border frame
\mdfdefinestyle{clear}{%
  linecolor=white,linewidth=0pt,%
  leftmargin=0,rightmargin=0,%
  innertopmargin=.5em,innerbottommargin=.5em,%
  innerleftmargin=.5em,innerrightmargin=.5em,%
  skipabove=0,skipbelow=0,%
  frametitlerule=false,%
  frametitlebackgroundcolor=white!0,%innertopmargin=\topskip,%
  xcolor,%
}
% complete: a square frame with a pencil icon in upper left corner
\mdfdefinestyle{complete}{%
  linecolor=black,linewidth=1pt,%
  leftmargin=0,rightmargin=0,%
  innertopmargin=1em,innerbottommargin=1em,%
  innerleftmargin=1em,innerrightmargin=.5em,%
  skipabove=0,skipbelow=0,%
  frametitlerule=false,%
  frametitlebackgroundcolor=white!0,%innertopmargin=\topskip,%
  nobreak=true,%
  xcolor,%
  firstextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
              node[symbol] { \faPencil };
             },%
  secondextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
               node[symbol] { \faPencil };
              },%
  middleextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
               node[symbol] { \faPencil };
              },%
  singleextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
               node[symbol] { \faPencil };
              },%
}
% dashed: dashed square frame
\mdfdefinestyle{dotted}{%
  linecolor=white,linewidth=1pt,%
  tikzsetting={draw=black,dotted,line width=1pt},%
  leftmargin=0,rightmargin=0,%
  innertopmargin=1em,innerbottommargin=1em,%
  innerleftmargin=.5em,innerrightmargin=.5em,%
  skipabove=0,skipbelow=0,%
  frametitlerule=false,%
  frametitlebackgroundcolor=white!0,%innertopmargin=\topskip,%
  nobreak=false,%
  xcolor,%
}
% quote: frame with no borders but with a beginning quote at upper left and
%        an ending quote at lower right
\mdfdefinestyle{quote}{%
  linecolor=white,linewidth=1pt,%
  leftmargin=0,rightmargin=0,%
  innertopmargin=1em,innerbottommargin=1em,%
  innerleftmargin=1em,innerrightmargin=.5em,%
  skipabove=0,skipbelow=0,%
  frametitlerule=false,%
  frametitlebackgroundcolor=white!0,%innertopmargin=\topskip,%
  nobreak=true,%
  xcolor,%
  firstextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
              node[symbol] { \faQuoteLeft };
              \path let \p1=(P), \p2=(O) in ($(\x1,.4)+(0,\y2)$)
              node[symbol] { \faQuoteRight };
             },%
  secondextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
               node[symbol] { \faQuoteLeft };
               \path let \p1=(P), \p2=(O) in ($(\x1,.4)+(0,\y2)$)
               node[symbol] { \faQuoteRight };
              },%
  middleextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
               node[symbol] { \faQuoteLeft };
               \path let \p1=(P), \p2=(O) in ($(\x1,.4)+(0,\y2)$)
               node[symbol] { \faQuoteRight };
              },%
  singleextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
               node[symbol] { \faQuoteLeft };
               \path let \p1=(P), \p2=(O) in ($(\x1,.4)+(0,\y2)$)
               node[symbol] { \faQuoteRight };
              },%
}
% todo: a shadowed square frame with a file text icon at upper left
\mdfdefinestyle{todo}{%
  linecolor=white,linewidth=1pt,%
  tikzsetting={draw=black,line width=1pt},%
  leftmargin=0,rightmargin=0,%
  innertopmargin=1em,innerbottommargin=1em,%
  innerleftmargin=1em,innerrightmargin=.5em,%
  skipabove=0,skipbelow=0,%
  frametitlerule=false,%
  frametitlebackgroundcolor=white!0,%innertopmargin=\topskip,%
  nobreak=true,%
  xcolor,%
  % hidealllines=true, topline=true, bottomline=true,%
  shadow=true,%
  % backgroundcolor=gray!40,% FOR TEST ONLY
  firstextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
              node[symbol] { \faCogs };
             },%
  secondextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
               node[symbol] { \faCogs };
              },%
  middleextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
               node[symbol] { \faCogs };
              },%
  singleextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
               node[symbol] { \faCogs };
              },%
}
% tips: a shadowed square frame with a light bulb icon at upper left
\mdfdefinestyle{tips}{%
  linecolor=white,linewidth=1pt,%
  tikzsetting={draw=black,line width=1pt},%
  leftmargin=0,rightmargin=0,%
  innertopmargin=1em,innerbottommargin=1em,%
  innerleftmargin=1em,innerrightmargin=.5em,%
  skipabove=0,skipbelow=0,%
  frametitlerule=false,%
  frametitlebackgroundcolor=white!0,%innertopmargin=\topskip,%
  nobreak=true,%
  xcolor,%
  hidealllines=true, leftline=true, % topline=true, bottomline=true,%
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
% method: a shadowed square frame with cogs icon at upper left
\mdfdefinestyle{method}{%
  linecolor=white,linewidth=1pt,%
  tikzsetting={draw=black,line width=1pt},%
  leftmargin=0,rightmargin=0,%
  innertopmargin=1em,innerbottommargin=1em,%
  innerleftmargin=1em,innerrightmargin=.5em,%
  skipabove=0,skipbelow=0,%
  frametitlerule=false,%
  frametitlebackgroundcolor=white!0,%innertopmargin=\topskip,%
  nobreak=true,%
  xcolor,%
  hidealllines=true, leftline=true, % topline=true, bottomline=true,%
  % shadow=true,%
  % backgroundcolor=gray!40,% FOR TEST ONLY
  firstextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
              node[symbol] { \faBookmarkO };
             },%
  secondextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
               node[symbol] { \faBookmarkO };
              },%
  middleextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
               node[symbol] { \faBookmarkO };
              },%
  singleextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
               node[symbol] { \faBookmarkO };
              },%
}
% warn: frame with only left border and warning icon at upper left
\mdfdefinestyle{warning}{%
  linecolor=black,linewidth=1pt,%
  leftmargin=0,rightmargin=0,%
  innertopmargin=1em,innerbottommargin=1em,%
  innerleftmargin=1em,innerrightmargin=.5em,%
  skipabove=0,skipbelow=0,%
  frametitlerule=false,%
  frametitlebackgroundcolor=white!0,%innertopmargin=\topskip,%
  nobreak=true,%
  xcolor,%
  hidealllines=true, leftline=true,%
  firstextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
              node[symbol] { \faExclamationTriangle };
             },%
  secondextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
               node[symbol] { \faExclamationTriangle };
              },%
  middleextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
               node[symbol] { \faExclamationTriangle };
              },%
  singleextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
               node[symbol] { \faExclamationTriangle };
              },%
}

\mdtheorem[style=complete, theoremseparator={ -}, theoremspace={}, roundcorner=8pt]{déf}{Définition}
\mdtheorem[style=default, theoremseparator={ -}, theoremspace={}, roundcorner=8pt]{défn}{Définition}
\mdtheorem[style=complete, theoremseparator={ -}, theoremspace={}, outerlinewidth=1pt, outerlinecolor=black]{thm}{Théorème}
\mdtheorem[style=default, theoremseparator={ -}, theoremspace={}, outerlinewidth=1pt, outerlinecolor=black]{thmn}{Théorème}
\mdtheorem[style=complete, theoremseparator={ -}, theoremspace={}, outerlinewidth=1pt, outerlinecolor=black]{ppt}{Propriété}
\mdtheorem[style=default, theoremseparator={ -}, theoremspace={}, outerlinewidth=1pt, outerlinecolor=black]{pptn}{Propriété}
\mdtheorem[style=complete, theoremseparator={ -}, theoremspace={}]{pre}{Preuve}
\mdtheorem[style=default, theoremseparator={ -}, theoremspace={}]{pren}{Preuve}
\mdtheorem[style=complete, theoremseparator={ -}, theoremspace={}]{voc}{Vocabulaire}
\mdtheorem[style=default, theoremseparator={ -}, theoremspace={}]{vocn}{Vocabulaire}
\mdtheorem[style=quote, frametitle=none, frametitleaboveskip=0em, frametitlebelowskip=0em]{qte}{}
\mdtheorem[style=warning, theoremseparator={ -}, theoremspace={}]{rmq}{Remarque}
\mdtheorem[style=warning, theoremseparator={}, theoremspace={}]{rmqn}{}
\mdtheorem[style=dotted, theoremseparator={ -}, theoremspace={}]{exe}{Exemple}
\mdtheorem[style=dotted, theoremseparator={}, theoremspace={}]{exen}{}
\mdtheorem[style=todo, theoremseparator={ -}, theoremspace={}]{exo}{Exercice}
\mdtheorem[style=todo, theoremseparator={ -}, theoremspace={}]{app}{Application}
\mdtheorem[style=todo, theoremseparator={}, theoremspace={}]{appn}{}
\mdtheorem[style=method, theoremseparator={ -}, theoremspace={}]{met}{Méthode}



%
%
% MACROS
%
%

% Redirect all standard previously defined environments to their starred version
% as they don't display numbering.
\RenewDocumentEnvironment{déf}{ o } {%begin
  \IfNoValueTF {#1} {
    \begin{déf*}
  }{
    \begin{déf*}[#1]
  }
}{%end
  \end{déf*}
}

\RenewDocumentEnvironment{défn}{ o } {%begin
  \IfNoValueTF {#1} {
    \begin{défn*}
  }{
    \begin{défn*}[#1]
  }
}{%end
  \end{défn*}
}

\RenewDocumentEnvironment{thm}{ o } {%begin
  \IfNoValueTF {#1} {
    \begin{thm*}
  }{
    \begin{thm*}[#1]
  }
}{%end
  \end{thm*}
}

\RenewDocumentEnvironment{thmn}{ o } {%begin
  \IfNoValueTF {#1} {
    \begin{thmn*}
  }{
    \begin{thmn*}[#1]
  }
}{%end
  \end{thmn*}
}

\RenewDocumentEnvironment{ppt}{ o } {%begin
  \IfNoValueTF {#1} {
    \begin{ppt*}
  }{
    \begin{ppt*}[#1]
  }
}{%end
  \end{ppt*}
}

\RenewDocumentEnvironment{pptn}{ o } {%begin
  \IfNoValueTF {#1} {
    \begin{pptn*}
  }{
    \begin{pptn*}[#1]
  }
}{%end
  \end{pptn*}
}

\RenewDocumentEnvironment{pre}{ o } {%begin
  \IfNoValueTF {#1} {
    \begin{pre*}
  }{
    \begin{pre*}[#1]
  }
}{%end
  \end{pre*}
}

\RenewDocumentEnvironment{pren}{ o } {%begin
  \IfNoValueTF {#1} {
    \begin{pren*}
  }{
    \begin{pren*}[#1]
  }
}{%end
  \end{pren*}
}

\RenewDocumentEnvironment{exe}{ o } {%begin
  \IfNoValueTF {#1} {
    \begin{exe*}
  }{
    \begin{exe*}[#1]
  }
}{%end
  \end{exe*}
}

\RenewDocumentEnvironment{exen}{ o } {%begin
  \IfNoValueTF {#1} {
    \begin{exen*}
  }{
    \begin{exen*}[#1]
  }
}{%end
  \end{exen*}
}

\RenewDocumentEnvironment{qte}{ o } {%begin
  \IfNoValueTF {#1} {
    \begin{qte*}
  }{
    \begin{qte*}[#1]
  }
}{%end
  \end{qte*}
}

\RenewDocumentEnvironment{rmq}{ o } {%begin
  \IfNoValueTF {#1} {
    \begin{rmq*}
  }{
    \begin{rmq*}[#1]
  }
}{%end
  \end{rmq*}
}

\RenewDocumentEnvironment{rmqn}{ o } {%begin
  \IfNoValueTF {#1} {
    \begin{rmqn*}
  }{
    \begin{rmqn*}[#1]
  }
}{%end
  \end{rmqn*}
}

\RenewDocumentEnvironment{voc}{ o } {%begin
  \IfNoValueTF {#1} {
    \begin{voc*}
  }{
    \begin{voc*}[#1]
  }
}{%end
  \end{voc*}
}

\RenewDocumentEnvironment{vocn}{ o } {%begin
  \IfNoValueTF {#1} {
    \begin{vocn*}
  }{
    \begin{vocn*}[#1]
  }
}{%end
  \end{vocn*}
}

\RenewDocumentEnvironment{app}{ o } {%begin
  \IfNoValueTF {#1} {
    \begin{app*}
  }{
    \begin{app*}[#1]
  }
}{%end
  \end{app*}
}

\RenewDocumentEnvironment{appn}{ o } {%begin
  \IfNoValueTF {#1} {
    \begin{appn*}
  }{
    \begin{appn*}[#1]
  }
}{%end
  \end{appn*}
}

\RenewDocumentEnvironment{met}{ o } {%begin
  \IfNoValueTF {#1} {
    \begin{met*}
  }{
    \begin{met*}[#1]
  }
}{%end
  \end{met*}
}

% titre
\NewDocumentCommand \titre { G{Titre} G{Sous-titre} }{%
  \setlength{\droptitle}{-2cm}
	\title{#1}
  \subtitle{#2}
	\date{}
	\maketitle
}

% \partie | \sspartie
% Define a (sub)section title.
\titleformat{\section}[block]{\sffamily\bfseries\Large}{\thesection.}{.5em}{}[]
\titleformat{\subsection}[block]{\sffamily\bfseries\large\hspace{2em}}{\thesubsection)}{.5em}{}[]
\renewcommand \thesection{\Roman{section}}
\renewcommand \thesubsection{\arabic{subsection}}

\newcounter{partiecounter}
\newcounter{sspartiecounter}

\NewDocumentCommand \partie { G{Partie} } {%
    \def\cType{\Roman}
    \stepcounter{partiecounter}
    \setcounter{sspartiecounter}{0}
    \section{#1}
}
%
\NewDocumentCommand \sspartie { G{Sous-Partie} } {%
    \def\cType{\arabic}
    \stepcounter{sspartiecounter}
    \subsection{#1}
}

% lists
\newlist{questions}{enumerate}{2}
\setlist[questions]{labelindent=0em, leftmargin=*, labelsep=0.5em}
\setlist[questions, 1]{label=\textbf{\arabic*.}}
\setlist[questions, 2]{label=\textbf{\alph*)}}

\newlist{questinl}{enumerate*}{1}
\setlist*[questinl]{label=\textbf{\alph*)}}

\setlist[enumerate, 1]{label=\textbf{\arabic*.}, leftmargin=*, labelsep=.5em}
\setlist[enumerate, 2]{label=\textbf{\alph*)}}

\setlist[description]{font=\sffamily\bfseries}

% amsthm
\newtheoremstyle{exostyle} 
	{\topsep}% espace avant 
	{\topsep}% espace apres 
	{}% Police utilisee par le style de thm 
	{}% Indentation (vide = aucune, \parindent = indentation paragraphe) 
	{\bfseries}% Police du titre de thm 
	{}% Signe de ponctuation apres le titre du thm 
	{\newline}% Espace apres le titre du thm (\newline = linebreak)
	{\thmname{#1}\thmnumber{ #2}\thmnote{ - \normalfont{\textit{#3}}}} % composants du titre du thm : \thmname = nom, \thmnumber = numéro, \thmnote = sous-titre

\theoremstyle{exostyle}
\newtheorem{exercice}{Exercice}
%



\makeatother
