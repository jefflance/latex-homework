%%%
%%%
%%% Classe : cours.cls
%%% Version : 1.0
%%% Date : 29/07/10
%%% Auteur : Jeff LANCE
%%%
%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cours}[2010/07/29 Document de cours, V1.0]



%-- classe de base
\LoadClass[a4paper, 12pt]{scrartcl}
%--%



%-- extensions
% PERSONNELLES
% commun: contient des définitions et extensions de base pour tout.
\RequirePackage{commun}
\RequirePackage{shortcuts}

% sortie
\RequirePackage[pdftex]{graphicx}
\RequirePackage{comment}

% mise en page
\RequirePackage{geometry}
\RequirePackage{scrlayer-scrpage}
\RequirePackage{mdframed}
\RequirePackage{titlesec}
\RequirePackage[amsmath, framed]{ntheorem}
%--%



%-- paramétrages
% metapost
\ifpdf
  \DeclareGraphicsRule{*}{mps}{*}{}
\fi

% tkz
\usetkzobj{all} % on charge tous les objets

% format de la page
\geometry{a4paper, hmargin=.7cm, vmargin=.7cm}

% titre
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
    innerleftmargin=5pt,innerrightmargin=5pt,%
    frametitlerule=true,%
    frametitlebackgroundcolor=white!0,innertopmargin=\topskip,%
    xcolor,%
}

% theorem
\theoremstyle{nonumberbreak}
\theorembodyfont{\normalfont}

\newtheorem{definition}{}
\newtheorem{theoreme}{}
\newtheorem{propriete}{}
\newtheorem{preuve}{}
\newtheorem{vocabulaire}{}
\newtheorem{remarque}{}
\newtheorem{exemple}{}
\newtheorem{exercice}{}
%--%



%% MACROS : DEBUT
\makeatletter

%-- Macros personnelles
% debut
\NewDocumentCommand \debut { G{Titre} G{Sous-titre} } {%
  \title{#1}
  \subtitle{#2}
  \date{}
  \maketitle
}

% Vtextvisiblespace[largeur]
\newcommand\Vtextvisiblespace[1][.3em]{%
	\mbox{\kern.06em\vrule height.3ex}%
	\vbox{\hrule width#1}%
	\hbox{\vrule height.3ex}%
}

% \partie | \sspartie
% definie un titre pour une (sous)section
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

% Fix error from KOMA-Script scrartcl class.
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}

% environnements
% definition de divers environnements personnels : definition, theoreme, exemple,
% exercice (avec numerotation), remarque, methode.
\NewDocumentEnvironment{déf}{ s g }{%begin
	\IfBooleanTF #1
	{
		\IfNoValueTF {#2} {
            \begin{mdframed}[style=framed]
    			\begin{definition}
		}{
            \begin{mdframed}[style=framed,frametitle={#2}]
                \begin{definition}
		}
	}{
		\IfNoValueTF {#2} {
            \begin{mdframed}[style=framed,frametitle={Définition},theoremseparator={-}]
                \begin{definition}
		}{
            \begin{mdframed}[style=framed,frametitle={Définition - #2},theoremseparator={-}]
                \begin{definition}
		}
	}
}{%end
    		\end{definition}
        \end{mdframed}
}




% % entete{dst|dm|int}{numero}{classe}{date}
% \newcommand{\entete}[4] {
%   % le contenu varie en fonction des arguments
%   \ifthenelse{ \equal{#1}{dst} }
%   {
%     \fancypagestyle{dst}{ %
%     \lhead{#3\\NOM :\\Prénom :}
%     \chead{\textbf{MATHÉMATIQUES}\\Devoir Sur Table n\textsuperscript{o}#2\\}
%     \rhead{le : #4\\~~\\}}
%     \thispagestyle{dst}
%   }
%   {
%     \ifthenelse{ \equal{#1}{dm} }
%     {
%       \fancypagestyle{dm}{ %
%       \lhead{#3\\NOM :\\Prénom :}
%       \chead{\textbf{MATHÉMATIQUES}\\Devoir Maison n\textsuperscript{o}#2\\}
%       \rhead{À rendre le : #4\\~~\\}}
%       \thispagestyle{dm}
%     }
%     {
%       \ifthenelse{ \equal{#1}{int} }
%       {
%         \fancypagestyle{int}{ %
%         \lhead{#3\\NOM :\\Prénom :}
%         \chead{\textbf{MATHÉMATIQUES}\\Interrogation n\textsuperscript{o}#2\\}
%         \rhead{le : #4\\~~\\}}
%         \thispagestyle{int}
%       }
%       {
%         \ifthenelse{ \equal{#1}{crs} }
%         {
%           \fancypagestyle{crs}{ %
%           \lhead{#4}
%           \chead{\textbf{#2}}
%           \rhead{Cours}}
%           \thispagestyle{crs}
%         }
%         {
%           \ifthenelse{ \equal{#1}{act} }
%           {
%             \fancypagestyle{act}{ %
%             \lhead{#4}
%             \chead{\textbf{#2}}
%             \@ifmtarg{#3}{ \rhead{Activité} }{ \rhead{Activité - #3} }}
%             \thispagestyle{act}
%           }
%           {
%             \ifthenelse{ \equal{#1}{exo} }
%             {
%               \fancypagestyle{exo}{ %
%               \lhead{#4}
%               \chead{\textbf{#2}}
%               \@ifmtarg{#3}{\rhead{Exercices}}{\rhead{Exercices - #3}}}
%               \thispagestyle{exo}
%             }
%           }
%         }
%       }
%     }
%   }
% }
%
%
% % exercice<[type]>
% %
% % type = 1	-> \arabic
% % type = a	-> \alph
% % type = A	-> \Alph
% % type = i	-> \roman
% % type = I	-> \Roman
% % \arabic par défaut
% \newcounter{exercicecounter}
% \newcommand{\exercice}[1][1] {
% \ifthenelse{ \equal{#1}{i} }
% 	{
% 		\def\cType{\roman}
% 	}
% 	{
% 		\ifthenelse{ \equal{#1}{I} }
% 		{
% 			\def\cType{\Roman}
% 		}
% 		{
% 			\ifthenelse{ \equal{#1}{a} }
% 			{
% 				\def\cType{\alph}
% 			}
% 			{
% 				\ifthenelse{ \equal{#1}{A} }
% 				{
% 					\def\cType{\Alph}
% 				}
% 				{
% 					\def\cType{\arabic}
% 				}
% 			}
% 		}
% 	}
%   \stepcounter{exercicecounter}
%   \textbf{Exercice \cType{exercicecounter}\ }
% }
%
%
% % questions<[type]>
% %
% % type = 1	-> \arabic
% % type = a	-> \alph
% % type = A	-> \Alph
% % type = i	-> \roman
% % type = I	-> \Roman
% % \arabic par défaut
% \newcounter{cours_questionscounter}
% \newcommand{\questionsseparator}{.}
% \newenvironment{questions}[1][1] {
%     \ifthenelse{ \equal{#1}{i} }
%     {
%         \def\cType{\roman}
%         \renewcommand{\questionsseparator}{)}
%     }
%     {
%         \ifthenelse{ \equal{#1}{I} }
%         {
%             \def\cType{\Roman}
%             \renewcommand{\questionsseparator}{.}
%         }
%         {
%             \ifthenelse{ \equal{#1}{a} }
%             {
%                 \def\cType{\alph}
%                 \renewcommand{\questionsseparator}{)}
%             }
%             {
%                 \ifthenelse{ \equal{#1}{A} }
%                 {
%                     \def\cType{\Alph}
%                     \renewcommand{\questionsseparator}{.}
%                 }
%                 {
%                     \def\cType{\arabic}
%                     \renewcommand{\questionsseparator}{.}
%                 }
%             }
%         }
%     }
%     \begin{list}{\textbf{\cType{cours_questionscounter}\questionsseparator}}{
%                  \usecounter{cours_questionscounter}
%                  \itemindent=0em
%                  \itemsep=8pt \leftmargin=0,54cm}
%     } {
%     \end{list}
% }
% \newcommand{\bq}{\begin{questions}}
% \newcommand{\eq}{\end{questions}}
%
%
% % setAngle{nom}{valeur}
% \newcommand{\setAngle}[2] {
%   $\widehat{#1} = #2 \textsuperscript{o}$
% }
%
%
%  % triUn{nom}{long1}{long2}{long3}
% \newcommand{\triUn}[4] {
% 	\StrLen{#1}[\lNom]
% 	\ifthenelse{ \equal{\lNom}{3} }
% 	{
% 		\StrChar{#1}{1}[\sA]
% 		\StrChar{#1}{2}[\sB]
% 		\StrChar{#1}{3}[\sC]
%
% 		\begin{tikzpicture}
% 			\tkzDefPoint(0,0){\sA}
% 			\tkzDefPoint(#2,0){\sB}
% 			\tkzDrawCircle[R,color=white](\sA,#3 cm)
% 			\tkzDrawCircle[R,color=white](\sB,#4 cm)
% 			\tkzInterCC[R](\sA,#3 cm)(\sB,#4 cm)
% 			\tkzGetPoints{\sC}{Z}
% 			\tkzDrawPolygon(\sA,\sB,\sC)
%
% 			\tkzLabelSegment(\sA,\sB){$#2$ cm}
% 			\tkzLabelSegment(\sA,\sC){$#3$ cm}
% 			\tkzLabelSegment(\sB,\sC){$#4$ cm}
%
% 			\tkzLabelPoint[left](\sA){$\sA$}
% 			\tkzLabelPoint[right](\sB){$\sB$}
% 			\tkzLabelPoint[above](\sC){$\sC$}
% 		\end{tikzpicture}
% 	}
% }
%
%
%  % triDeux{nom}{long1}{long2}{angle}
% \newcommand{\triDeux}[4] {
% 	\StrLen{#1}[\lNom]
% 	\ifthenelse{ \equal{\lNom}{3} }
% 	{
% 		\StrChar{#1}{1}[\sA]
% 		\StrChar{#1}{2}[\sB]
% 		\StrChar{#1}{3}[\sC]
%
% 		\def\nAngle{#4}
%
% 		\begin{tikzpicture}
% 			\tkzDefPoint(0,0){\sA}
% 			\tkzDefPoint(#2,0){\sB}
% 			\tkzDrawSegment(\sA,\sB)
%
% 			\tkzDefPointBy[rotation=center {\sA} angle {#4}](\sB)
% 			\tkzGetPoint{Z}
% 			\tkzDefPointBy[homothety=center {\sA} ratio {#3/#2}](Z)
% 			\tkzGetPoint{\sC}
%
% 			\tkzDrawSegment(\sA,\sC)
% 			\tkzDrawSegment(\sB,\sC)
%
% 			\tkzLabelPoint[left](\sA){$\sA$}
% 			\tkzLabelPoint[right](\sB){$\sB$}
% 			\tkzLabelPoint[above](\sC){$\sC$}
% 		\end{tikzpicture}
% 	}
% }
%
%
%  % triTrois{nom}{long}{angle1}{angle2}
% \newcommand{\triTrois}[4] {
% 	\StrLen{#1}[\lNom]
% 	\ifthenelse{ \equal{\lNom}{3} }
% 	{
% 		\StrChar{#1}{1}[\sA]
% 		\StrChar{#1}{2}[\sB]
% 		\StrChar{#1}{3}[\sC]
%
% 		\def\nAngle{#4}
%
% 		\begin{tikzpicture}
% 			\tkzDefPoint(0,0){\sA}
% 			\tkzDefPoint(#2,0){\sB}
% 			\tkzDrawSegment(\sA,\sB)
%
% 			\tkzDefPointBy[rotation=center {\sA} angle {#3}](\sB)
% 			\tkzGetPoint{Y}
% 			\tkzDefPointBy[rotation=center {\sB} angle {-#4}](\sA)
% 			\tkzGetPoint{Z}
%
% 			\tkzInterLL(\sA,Y)(\sB,Z)
% 			\tkzGetPoint{\sC}
%
% 			\tkzDrawSegment(\sA,\sC)
% 			\tkzDrawSegment(\sB,\sC)
%
% 			\tkzLabelPoint[left](\sA){$\sA$}
% 			\tkzLabelPoint[right](\sB){$\sB$}
% 			\tkzLabelPoint[above](\sC){$\sC$}
% 		\end{tikzpicture}
% 	}
% }
% %--%



% %-- Macros modifiées
% % on n'affiche pas le numéro de page
% \renewcommand{\thepage}{}
%
% % numérotation des sections
% \renewcommand{\thesection}{\Roman{section}.}
%
% \renewcommand{\thesubsection}{\arabic{section})}
% %--%

\makeatother
%% MACROS : FIN
