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
\RequirePackage{mdframed}
\RequirePackage{titlesec}
\RequirePackage{pageslts}
%--%



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
\mdfsetup{
    frametitlealignment=\raggedright,%
    innerbottommargin=2em,%
}

\mdfdefinestyle{framed}{%
    linecolor=black,linewidth=1pt,%
    leftmargin=0,rightmargin=0,%
    innertopmargin=1em,innerbottommargin=1em,%
    innerleftmargin=5pt,innerrightmargin=5pt,%
    skipabove=0,skipbelow=0,%
    frametitlerule=false,%
    frametitlebackgroundcolor=white!0,%innertopmargin=\topskip,%
    nobreak=true,%
    xcolor,%
}
\mdfdefinestyle{dash_framed}{%
    linecolor=white,linewidth=1pt,%
    tikzsetting={draw=black,dashed,line width=1pt},%
    leftmargin=0,rightmargin=0,%
    innertopmargin=1em,innerbottommargin=1em,%
    innerleftmargin=5pt,innerrightmargin=5pt,%
    skipabove=0,skipbelow=0,%
    frametitlerule=false,%
    frametitlebackgroundcolor=white!0,%innertopmargin=\topskip,%
    nobreak=true,%
    xcolor,%
}
\mdfdefinestyle{no_framed}{%
	linecolor=white,linewidth=0pt,%
	leftmargin=0,rightmargin=0,%
	innertopmargin=0,innerbottommargin=0,%
	innerleftmargin=5pt,innerrightmargin=5pt,%
	skipabove=0,skipbelow=0,%
	frametitlerule=false,%
	frametitlebackgroundcolor=white!0,%innertopmargin=\topskip,%
	xcolor,%
}
\mdfdefinestyle{nothing}{%
	linecolor=white,linewidth=0pt,%
	leftmargin=0,rightmargin=0,%
	innertopmargin=0,innerbottommargin=0,%
	innerleftmargin=5pt,innerrightmargin=5pt,%
	skipabove=0,skipbelow=0,%
  frametitle=none,%
	frametitlerule=false,%
	frametitlebackgroundcolor=white!0,%innertopmargin=\topskip,%
	xcolor,%
}


\tikzset{
    symbol/.style={
        rectangle, draw=white,
        fill=white, scale=1,
        overlay
    }
}
\mdfdefinestyle{complete}{%
    linecolor=black,linewidth=1pt,%
    leftmargin=0,rightmargin=0,%
    innertopmargin=1em,innerbottommargin=1em,%
    innerleftmargin=1em,innerrightmargin=5pt,%
    skipabove=0,skipbelow=0,%
    frametitlerule=false,%
    frametitlebackgroundcolor=white!0,%innertopmargin=\topskip,%
    nobreak=true,%
    xcolor,%
    firstextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
                node[symbol] { \faicon{\faPencil} };},%
    secondextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
                node[symbol] { \faicon{\faPencil} };},%
    middleextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
                node[symbol] { \faicon{\faPencil} };},%
    singleextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
                node[symbol] { \faicon{\faPencil} };},%
}
\mdfdefinestyle{doit}{%
    linecolor=white,linewidth=1pt,%
    tikzsetting={draw=black,dashed,line width=1pt},%
    leftmargin=0,rightmargin=0,%
    innertopmargin=1em,innerbottommargin=1em,%
    innerleftmargin=1em,innerrightmargin=5pt,%
    skipabove=0,skipbelow=0,%
    frametitlerule=false,%
    frametitlebackgroundcolor=white!0,%innertopmargin=\topskip,%
    nobreak=true,%
    xcolor,%
    firstextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
                node[symbol] { \faicon{\faFileTextO} };},%
    secondextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
                node[symbol] { \faicon{\faFileTextO} };},%
    middleextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
                node[symbol] { \faicon{\faFileTextO} };},%
    singleextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
                node[symbol] { \faicon{\faFileTextO} };},%
}
\mdfdefinestyle{quote}{%
    linecolor=white,linewidth=1pt,%
    leftmargin=0,rightmargin=0,%
    innertopmargin=1em,innerbottommargin=1em,%
    innerleftmargin=1em,innerrightmargin=5pt,%
    skipabove=0,skipbelow=0,%
    frametitlerule=false,%
    frametitlebackgroundcolor=white!0,%innertopmargin=\topskip,%
    nobreak=true,%
    xcolor,%
    firstextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
                node[symbol] { \faicon{\faQuoteLeft} };},%
    secondextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
                node[symbol] { \faicon{\faQuoteLeft} };},%
    middleextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
                node[symbol] { \faicon{\faQuoteLeft} };},%
    singleextra={\path let \p1=(P), \p2=(O) in ($(\x2,-.4)+1.0*(0,\y1)$)
                node[symbol] { \faicon{\faQuoteLeft} };},%
}

\mdtheorem[style=complete, theoremseparator={ - }]{déf}{Définition}
\mdtheorem[style=framed, theoremseparator={ - }]{thm}{Théorème}
\mdtheorem[style=framed]{ppt}{Propriété}
\mdtheorem[style=framed]{pre}{Preuve}
\mdtheorem[style=no_framed]{voc}{Vocabulaire}
\mdtheorem[style=no_framed]{rmq}{Remarque}
\mdtheorem[style=framed]{exe}{Exemple}
\mdtheorem[style=doit]{exo}{Exercice}
\mdtheorem[style=doit]{app}{Application}
\mdtheorem[style=doit, theoremseparator={ - }]{met}{Méthode}
%--%



%% MACROS : DEBUT
\makeatletter

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

% text ghosting
\NewDocumentCommand \ghost { } {%
    \color{white}
}
%-- %

\makeatother
%% MACROS : FIN
