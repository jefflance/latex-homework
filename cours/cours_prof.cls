%%%
%%%
%%% Classe : cours_prof.cls
%%% Version : 1.0
%%% Date : 09/11/16
%%% Auteur : Jeff LANCE
%%%
%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cours_prof}[2016/11/09 Document de cours imprimable A4 pour prof ou élève, V1.0]



%-- classe de base
\LoadClass[a4paper, 12pt, DIV=24]{scrartcl}
%--%



%-- extensions
% PERSONNELLES
% commun: contient des définitions et extensions de base pour tout.
\RequirePackage{commun}
\RequirePackage{shortcuts}

% sortie
% \RequirePackage[pdftex]{graphicx}
\RequirePackage{comment}

% mise en page
\RequirePackage{geometry}
\RequirePackage{scrlayer-scrpage}
% \RequirePackage{mdframed}
\RequirePackage{titlesec}
\RequirePackage{pageslts}
%--%

\makeatletter

%-- paramétrages
% metapost
\ifpdf
  \DeclareGraphicsRule{*}{mps}{*}{}
\fi

% tkz
\usetkzobj{all} % on charge tous les objets

% format de la page
\geometry{a4paper, hmargin=.7cm, vmargin=2cm}

% titre, en-tête, pied de page
\cofoot*{\thepage\ /\ \pageref{LastPage}}
\pagestyle{scrheadings}
\setkomafont{title}{\Comic}

% (sub)sections
\titleformat{\section}[block]{\sffamily\bfseries\Large}{\thesection.}{.5em}{}[]
\titleformat{\subsection}[block]{\sffamily\bfseries\large\hspace{2em}}{\thesubsection)}{.5em}{}[]
\renewcommand \thesection{\Roman{section}}
\renewcommand \thesubsection{\arabic{subsection}}

% paths
\graphicspath{{images/}}

% mdframed
% Fix for package see : http://tex.stackexchange.com/questions/179790/mdframed-how-to-change-the-separator-between-the-label-and-the-title-of-a-non-n#179794
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
\mdfdefinestyle{frm}{%
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
\mdfdefinestyle{clr}{%
  linecolor=white,linewidth=0pt,%
  leftmargin=0,rightmargin=0,%
  innertopmargin=.5em,innerbottommargin=.5em,%
  innerleftmargin=.5em,innerrightmargin=.5em,%
  skipabove=0,skipbelow=0,%
  frametitlerule=false,%
  frametitlebackgroundcolor=white!0,%innertopmargin=\topskip,%
  xcolor,%
}
\mdfdefinestyle{cmpl}{%
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
\mdfdefinestyle{dash}{%
  linecolor=white,linewidth=1pt,%
  tikzsetting={draw=black,dashed,line width=1pt},%
  leftmargin=0,rightmargin=0,%
  innertopmargin=1em,innerbottommargin=1em,%
  innerleftmargin=.5em,innerrightmargin=.5em,%
  skipabove=0,skipbelow=0,%
  frametitlerule=false,%
  frametitlebackgroundcolor=white!0,%innertopmargin=\topskip,%
  nobreak=true,%
  xcolor,%
}
\mdfdefinestyle{qte}{%
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
              node[symbol] { \faFileTextO };
             },%
  secondextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
               node[symbol] { \faFileTextO };
              },%
  middleextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
               node[symbol] { \faFileTextO };
              },%
  singleextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
               node[symbol] { \faFileTextO };
              },%
}
\mdfdefinestyle{warn}{%
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

\mdtheorem[style=cmpl, theoremseparator={ -}, theoremspace={}, roundcorner=8pt]{déf}{Définition}
\mdtheorem[style=frm, theoremseparator={ -}, theoremspace={}, roundcorner=8pt]{défn}{Définition}
\mdtheorem[style=cmpl, theoremseparator={ -}, theoremspace={}, outerlinewidth=1pt, outerlinecolor=black]{thm}{Théorème}
\mdtheorem[style=frm, theoremseparator={ -}, theoremspace={}, outerlinewidth=1pt, outerlinecolor=black]{thmn}{Théorème}
\mdtheorem[style=cmpl, theoremseparator={ -}, theoremspace={}, outerlinewidth=1pt, outerlinecolor=black]{ppt}{Propriété}
\mdtheorem[style=frm, theoremseparator={ -}, theoremspace={}, outerlinewidth=1pt, outerlinecolor=black]{pptn}{Propriété}
\mdtheorem[style=frm, theoremseparator={ -}, theoremspace={}]{pre}{Preuve}
\mdtheorem[style=qte, theoremseparator={ -}, theoremspace={}]{voc}{Vocabulaire}
\mdtheorem[style=qte, frametitle=none, frametitleaboveskip=0em, frametitlebelowskip=0em]{qte}{}
\mdtheorem[style=warn, theoremseparator={ -}, theoremspace={}]{rmq}{Remarque}
\mdtheorem[style=dash, theoremseparator={ -}, theoremspace={}]{exe}{Exemple}
\mdtheorem[style=todo, theoremseparator={ -}, theoremspace={}]{exo}{Exercice}
\mdtheorem[style=todo, theoremseparator={ -}, theoremspace={}]{app}{Application}
\mdtheorem[style=todo, theoremseparator={ -}, theoremspace={}]{met}{Méthode}
%--%



% Fix error from KOMA-Script scrartcl class.
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}

%-- Macros personnelles
% debut
\NewDocumentCommand \debut { G{Titre} G{Sous-titre} } {%
  \title{#1}
  \subtitle{#2}
  \date{}
  \maketitle
}

% commandes
% \partie | \sspartie
% definie un titre pour une (sous)section
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

% % text ghosting
% \NewDocumentCommand \ghost { } {%
%     \color{white}
% }
%-- %


\makeatother
