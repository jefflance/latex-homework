%%%
%%%
%%% Classe 	: cours_beamer.cls
%%% Version : 1.6
%%% Date 	: 08/12/14
%%% Auteur 	: Jeff LANCE
%%%
%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cours_beamer}[2014/12/08 Beamer de cours, v1.6]




%-- PARENT CLASS
% inutile de passer l'option [utf8] puisque chargee dans commun.sty
\LoadClassWithOptions{beamer}
%---------------




%-- PACKAGES CALLS
% perso
\RequirePackage{couleurs}
\RequirePackage{commun}
\RequirePackage{shortcuts}
% autres
\RequirePackage{media9}
\RequirePackage{xkeyval}
%-----------------

\makeatletter




%-- DEF OPTIONS
% sectioncolor / subsectioncolor
% 	option de classe
%	  couleurs générales du beamer
%
%   "classical" way
%   \def\sectioncolor{red}%
%   \define@key{cours_beamer.cls}{section}[red]{%
%     \def\sectioncolor{#1}%
%   }
%
%   \def\subsectioncolor{blue}%
%   \define@key{cours_beamer.cls}{subsectioncolor}[blue]{%
%     \def\subsectioncolor{#1}%
%   }

% \DeclareOptionX{sectioncolor}[debianred]{%
%   \def\sectioncolor{#1}%
% }
% \DeclareOptionX{subsectioncolor}[lapislazuli]{%
%   \def\subsectioncolor{#1}%
% }

% \ExecuteOptionsX{sectioncolor, subsectioncolor}
% \ProcessOptionsX
%--------------




%-- SETTINGS
\graphicspath{{images/}}
\addmediapath{{videos/}}


%%% COLORS USED IN BLOCKS %%%
% Colors used in block and environments
% I don't like the default flashy green and the blue so i redefined it
\colorlet{green}{green!40!gray}
\colorlet{blue}{airforceblue}

\colorlet{definition}{red}
\colorlet{theorem}{red}
\colorlet{property}{red}
\colorlet{proof}{violet}
\colorlet{vocabulary}{blue}
\colorlet{remark}{red}
\colorlet{method}{orange}
\colorlet{example}{green}
\colorlet{exercise}{blue}
\colorlet{application}{blue}

\colorlet{sectioncolor}{\sectioncolor}
\colorlet{subsectioncolor}{\subsectioncolor}

%%% DEFAULT BEAMER THEME OPTIONS %%%
\usetheme{Madrid}
\useinnertheme{circles}
\useoutertheme{default}
\usefonttheme{professionalfonts}
\setbeamertemplate{footline}{}
%%%%%%%%%%%%%%%%%%%%


%%% ENUMERATE %%%
\setbeamerfont{enumerate item}{family=\rmfamily}
\setbeamercolor*{enumerate item}{fg=black}
\setbeamertemplate{enumerate item}{\textbf{\insertenumlabel.}}
%%%%%%%%%%%%%%%%%


%%% ITEMIZE %%%
\setbeamertemplate{itemize item}[circle]
\setbeamercolor*{itemize item}{fg=black}
\setbeamertemplate{itemize subitem}{\textendash}
%%%%%%%%%%%%%%%


%%% NAVIGATION %%%
\setbeamertemplate{navigation symbols}{%
	\insertframenavigationsymbol
	\insertsectionnavigationsymbol
}
%%%%%%%%%%%%%%%%%%


%%% ToC %%%
% change l'espace vertical entre les sections
\patchcmd{\beamer@sectionintoc}
{\vfill}
{\setlength{\itemsep}{10pt}\vskip\itemsep}
{}
{}
% change le symbole pour lister
\defbeamertemplate{subsection in toc}{bullets}{%
	\leavevmode
	\parbox[t]{1em}{\textbullet\hfill}%
	\parbox[t]{\dimexpr\textwidth-1em\relax}{\inserttocsubsection}\par
}
\defbeamertemplate{section in toc}{sections numbered roman}{%
	\leavevmode%
	{\bfseries
		\MakeUppercase{\romannumeral\inserttocsectionnumber}.\ %
		\inserttocsection\par
	}
}
\setbeamertemplate{section in toc}[sections numbered roman]
\setbeamercolor{section in toc}{fg=sectioncolor}
\setbeamertemplate{subsection in toc}[bullets]
\setbeamercolor{subsection in toc}{fg=subsectioncolor}
%%%%%%%%%%%


%%% MDFRAMED %%%
\pgfdeclarehorizontalshading{partiebkg}{100bp}{
	color(0bp)=(white!40);color(100bp)=(black!0)
}
%
\pgfdeclarehorizontalshading{sspartiebkg}{100bp}{
	color(0bp)=(white!40);color(100bp)=(black!0)
}
\mdfdefinestyle{partie}{
	outerlinewidth=1em, outerlinecolor=white,%
	% leftmargin=-1em, rightmargin=-1em,%
	middlelinewidth=1.2pt, linecolor={sectioncolor},roundcorner=5pt,%
	apptotikzsetting={
		\tikzset{
			mdfbackground/.append style={
				shading=partiebkg
			}
		}
	}
}
%
\mdfdefinestyle{sspartie}{
	outerlinewidth=1em, outerlinecolor=white,%
	% leftmargin=-1em, rightmargin=-1em,%
	middlelinewidth=1.2pt, linecolor=subsectioncolor,roundcorner=5pt,%
	apptotikzsetting={
		\tikzset{
			mdfbackground/.append style={
				shading=partiebkg
			}
		}
	}
}
%%%%%%%%%%%%%%%%
%-----------




%-- OWN COMMANDS

% \titre{TITRE}{ANNÉE}{AUTEUR}{LIEU}
% defini le titre du document
\newcommand{\titre}[4]{%
	\title{#1}
	\subtitle{#2}
	\date{#3}
	\author{Cours}
	\institute{#4}
}

% \debut et \fin
% renvoie les slides d'intro et de cloture du document
\newcommand{\debut}{%
	\begin{frame}
		\titlepage
	\end{frame}
}

\newcommand{\fin}{%
	\section*{Plan}
	\begin{frame}
		\begin{center}{\Large Plan }\end{center}
		\tableofcontents
	\end{frame}
}

% \partie{TITRE} et \sspartie{TITRE}
% definie un slide de titre pour une (sous)section
\newcounter{partiecounter}
\newcounter{sspartiecounter}

\NewDocumentCommand \partie { G{Partie} } {%
	\def\cType{\Roman}
	\stepcounter{partiecounter}
	\setcounter{sspartiecounter}{0}
	\section{#1}
	\begin{frame}
		\begin{center}
			\begin{mdframed}[style=partie]
				\centering \textcolor{sectioncolor}{\textbf{ \cType{partiecounter}. #1}}
			\end{mdframed}
		\end{center}
	\end{frame}
}

\NewDocumentCommand \sspartie { G{Sous-Partie} } {%
	\def\cType{\arabic}
	\stepcounter{sspartiecounter}
	\subsection{#1}
	\begin{frame}
		\begin{center}
			\begin{mdframed}[style=sspartie]
				\centering \textcolor{subsectioncolor}{\textbf{ \cType{sspartiecounter}) #1}}
			\end{mdframed}
		\end{center}
	\end{frame}
}

% \ftitre
% definie le titre des frames de section et de sous-section en fonction
% des (sous)sections actuellement definies
\NewDocumentCommand \ftitre { }{%
	\ifnum \value{partiecounter}>0
		\frametitle{\textbf{\Roman{partiecounter}. \insertsection}}
	\fi
	\ifnum \value{sspartiecounter}>0
		\framesubtitle{\textbf{\arabic{sspartiecounter}) \insertsubsection}}
	\fi
}


%%% BLOCKS %%%
% definition de divers blocks personnels : definition, theoreme, exemple,
% exercice (avec numerotation), remarque, method.

% Auxiliary command to set color of certain element of beamer
\NewDocumentCommand \setbeamercolorto { g }{%
  	\setbeamercolor*{block title}{fg=#1,bg=#1!10!white}
  	\setbeamercolor*{enumerate item}{fg=#1}
    \setbeamercolor*{enumerate subitem}{fg=#1}
    \setbeamercolor*{enumerate subsubitem}{fg=#1}
	\setbeamercolor*{itemize item}{fg=#1}
    \setbeamercolor*{itemize subitem}{fg=#1}
    \setbeamercolor*{itemize subsubitem}{fg=#1}
	\setbeamercolor*{item}{fg=#1}
}

% déf(*)(TITRE)
\NewDocumentEnvironment{déf}{ s g }{%begin
	\setbeamercolorto{definition}
	\IfBooleanTF #1
	{
		\IfNoValueTF {#2} {
			\begin{block} {}
		}{
			\begin{block} {#2}
		}
	}{
		\IfNoValueTF {#2} {
			\begin{block} {Définition}
		}{
			\begin{block} {Définition - #2}
		}
	}
}{%end
		\end{block}
}

% thm(TITRE)
\NewDocumentEnvironment{thm}{ g }{%begin
	\setbeamercolorto{theorem}
	\IfNoValueTF {#1} {
		\begin{block} {Théorème}
	}{
		\begin{block} {Théorème - #1}
	}
}{%end
	\end{block}
}

% ppt(*)(TITRE)
\NewDocumentEnvironment{ppt}{ s g }{%begin
	\setbeamercolorto{property}
	\IfBooleanTF #1
	{
		\IfNoValueTF {#2} {
			\begin{block} {}
		}{
			\begin{block} {#2}
		}
	}{
		\IfNoValueTF {#2} {
			\begin{block} {Propriété}
		}{
			\begin{block} {Propriété - #2}
		}
	}
}{%end
		\end{block}
}

% pre(TITRE)
\NewDocumentEnvironment{pre}{ g }{%begin
	\setbeamercolorto{proof}
	\IfNoValueTF {#1} {
		\begin{block} {Preuve}
	}{
		\begin{block} {#1}
	}
}{%end
	\end{block}
}

% voc(TITRE)
\NewDocumentEnvironment{voc}{ g }{%begin
	\setbeamercolorto{vocabulary}
	\IfNoValueTF {#1} {
		\begin{block} {Vocabulaire}
	}{
		\begin{block} {#1}
	}
}{%end
	\end{block}
}

% rmq(TITRE)
\NewDocumentEnvironment{rmq}{ G{Remarque} }{%begin
	\setbeamercolorto{remark}
	\begin{block} {\faExclamationTriangle \hspace{.125em} #1}
}{%end
	\end{block}
}

% met<0|i|I|a|A|1>(TITRE)
\newcounter{methodecounter}
\NewDocumentEnvironment{met} { O{0} g }{%begin
	\setbeamercolorto{method}
	\ifthenelse{ \NOT \equal{#1}{0} }{
		\ifthenelse{ \equal{#1}{i} }
		{
			\def\cType{\roman}
		}
		{
			\ifthenelse{ \equal{#1}{I} }
			{
				\def\cType{\Roman}
			}
			{
				\ifthenelse{ \equal{#1}{a} }
				{
					\def\cType{\alph}
				}
				{
					\ifthenelse{ \equal{#1}{A} }
					{
						\def\cType{\Alph}
					}
					{
						\def\cType{\arabic}
					}
				}
			}
		}
		\stepcounter{methodecounter}
		\IfNoValueTF {#2} {
			\begin{block}{\faCogs \hspace{.125em} Méthode \cType{methodecounter}\ }
		}{
			\begin{block}{\faCogs \hspace{.125em} Méthode \cType{methodecounter}\ - #2}
		}
	}{
		\IfNoValueTF {#2} {
			\begin{block}{\faCogs \hspace{.125em} Méthode\ }
		}{
			\begin{block}{\faCogs \hspace{.125em} Méthode\ - #2}
		}
	}
}{%end
	\end{block}
}

% exe(TITRE)
\NewDocumentEnvironment{exe}{ G{Exemple} }{%begin
	\setbeamercolorto{example}
	\begin{block} {\faLightbulbO \hspace{.125em} #1}
}{%end
	\end{block}
}

% exo<0|i|I|a|A|1>(TITRE)
\newcounter{exercicecounter}
\NewDocumentEnvironment{exo} { O{0} G{Exercice} }{%begin
	\setbeamercolorto{exercise}
	\ifthenelse{ \NOT \equal{#1}{0} }{
		\ifthenelse{ \equal{#1}{i} }
			{
				\def\cType{\roman}
			}
			{
				\ifthenelse{ \equal{#1}{I} }
				{
					\def\cType{\Roman}
				}
				{
					\ifthenelse{ \equal{#1}{a} }
					{
						\def\cType{\alph}
					}
					{
						\ifthenelse{ \equal{#1}{A} }
						{
							\def\cType{\Alph}
						}
						{
							\def\cType{\arabic}
						}
					}
				}
			}
		\stepcounter{exercicecounter}
		\begin{block}{#2 \cType{exercicecounter}\ }
	}{
		\begin{block}{#2\ }
	}
}{%end
	\end{block}
}

% app<0|i|I|a|A|1>(TITRE)
\newcounter{applicationcounter}
\NewDocumentEnvironment{app} { O{0} G{Application} }{%begin
	\setbeamercolorto{application}
	\ifthenelse{ \NOT \equal{#1}{0} }{
		\ifthenelse{ \equal{#1}{i} }
			{
				\def\cType{\roman}
			}
			{
				\ifthenelse{ \equal{#1}{I} }
				{
					\def\cType{\Roman}
				}
				{
					\ifthenelse{ \equal{#1}{a} }
					{
						\def\cType{\alph}
					}
					{
						\ifthenelse{ \equal{#1}{A} }
						{
							\def\cType{\Alph}
						}
						{
							\def\cType{\arabic}
						}
					}
				}
			}
		\stepcounter{applicationcounter}
		\begin{block}{\faFileTextO \hspace{.125em} #2 \cType{applicationcounter}\ }
	}{
		\begin{block}{\faFileTextO \hspace{.125em} #2\ }
	}
}{%end
	\end{block}
}
%%%%%%%%%%%%%%


%%% TiKZ %%%
% Define the possibility to make (dis)appear something in a beamer.
\tikzset{
  invisible/.style={opacity=0},
  visible on/.style={alt=#1{}{invisible}},
  alt/.code args={<#1>#2#3}{%
    \alt<#1>{\pgfkeysalso{#2}}{\pgfkeysalso{#3}} % \pgfkeysalso doesn't change the path
  },
}
%%%%%%%%%%%%


%%% AUTRES %%%
% \includemovie
% permet d'inclure une video dans une frame
\newcommand{\includemovie}[3]{%
	\includemedia[%
		width=#1,height=#2,%
		activate=pagevisible,%
		deactivate=pageclose,%
		addresource=#3,%
		flashvars={%
			source=#3 % same path as in addresource!
			&autoPlay=false % default: false; if =true, automatically starts playback after activation (see option ‘activation)’
			&loop=false % if loop=true, media is played in a loop
			&controlBarAutoHideTimeout=0 %  time span before auto-hide
		}%
	]{}{VPlayer.swf}%
}
%%%%%%%%%%%%%%


%%% Continue numbering in lists %%%
\newcounter{saveenumi}
\newcommand{\seti}{\setcounter{saveenumi}{\value{enumi}}}
\newcommand{\conti}{\setcounter{enumi}{\value{saveenumi}}}
\resetcounteronoverlays{saveenumi}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%---------------




\makeatother
