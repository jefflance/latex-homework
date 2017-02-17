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



%-- classe de base
% inutile de passer l'option [utf8] puisque chargee dans commun.sty
\LoadClassWithOptions{beamer}
%--%



%-- extensions
% perso
\RequirePackage{couleurs}
\RequirePackage{commun}
\RequirePackage{shortcuts}
% autres
\RequirePackage{media9}
\RequirePackage{xkeyval}
%--%



%-- definitions
% firstcolor
% 	option de classe
%	  couleur générale du beamer
%
%   "classical" way
%   \def\firstcolor{lapislazuli}%
%   \define@key{cours_beamer.cls}{firstcolor}[lapislazuli]{%
%     \def\firstcolor{#1}%
%   }
%
%   \def\secondcolor{-\firstcolor}%
%   \define@key{cours_beamer.cls}{secondcolor}[-\firstcolor]{%
%     \def\secondcolor{#1}%
%   }
%--%
\DeclareOptionX{firstcolor}[lapislazuli]{%
  \def\firstcolor{#1}%
}
\DeclareOptionX{secondcolor}[-\firstcolor]{%
  \def\secondcolor{#1}%
}



%-- options
\ExecuteOptionsX{firstcolor, secondcolor}
\ProcessOptionsX
%--%



%-- paramètrages
\graphicspath{{images/}}
\addmediapath{{videos/}}

% theme beamer
\usetheme{Madrid}
\useinnertheme{circles}
\useoutertheme{default}
\usefonttheme{professionalfonts}
\usecolortheme[named=\firstcolor]{structure}
\setbeamertemplate{footline}{}

% enumerate
\setbeamerfont{enumerate item}{family=\rmfamily}
\setbeamercolor{enumerate item}{fg=black}
\setbeamertemplate{enumerate item}{\textbf{\insertenumlabel.}}

% itemize
\setbeamertemplate{itemize item}[circle]
\setbeamercolor{itemize item}{fg=black}
\setbeamertemplate{itemize subitem}{\textendash}

% navigation
\setbeamertemplate{navigation symbols}{%
	\insertframenavigationsymbol
	\insertsectionnavigationsymbol
}

% ToC
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
\setbeamercolor{section in toc}{fg=\secondcolor}
\setbeamertemplate{subsection in toc}[bullets]
\setbeamercolor{subsection in toc}{fg=\firstcolor}

% mdframed
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
	middlelinewidth=1.2pt, linecolor={\secondcolor},roundcorner=5pt,%
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
	middlelinewidth=1.2pt, linecolor=\firstcolor,roundcorner=5pt,%
	apptotikzsetting={
		\tikzset{
			mdfbackground/.append style={
				shading=partiebkg
			}
		}
	}
}
%--%


%% MACROS : DEBUT
\makeatletter

%-- Macros personnelles
% \titre{TITRE}{ANNÉE}{AUTEUR}{LIEU}
% defini le titre du document
\newcommand{\titre}[4]{%
	\title{#1}
	\subtitle{#2}
	\date{#3}
	\author{Cours}
	\institute{#4}
}


% \debut | \fin
% renvoie les slides d'intro et de cloture du document
\newcommand{\debut}{%
	\begin{frame}
		\titlepage
	\end{frame}
}
%
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
				\centering \textcolor{\secondcolor}{\textbf{ \cType{partiecounter}. #1}}
			\end{mdframed}
		\end{center}
	\end{frame}
}
%
\NewDocumentCommand \sspartie { G{Sous-Partie} } {%
	\def\cType{\arabic}
	\stepcounter{sspartiecounter}
	\subsection{#1}
	\begin{frame}
		\begin{center}
			\begin{mdframed}[style=sspartie]
				\centering \textcolor{\firstcolor}{\textbf{ \cType{sspartiecounter}) #1}}
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


% blocks
% definition de divers blocks personnels : definition, theoreme, exemple,
% exercice (avec numerotation), remarque, methode.
%
% déf(*)(TITRE)
\NewDocumentEnvironment{déf}{ s g }{%begin
	\setbeamercolor{block title}{fg=red,bg=blush!10!white}
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
%
% thm(TITRE)
\NewDocumentEnvironment{thm}{ g }{%begin
	\setbeamercolor{block title}{fg=white,bg=red!90!white}
	\IfNoValueTF {#1} {
		\begin{block} {Théorème}
	}{
		\begin{block} {Théorème - #1}
	}
}{%end
	\end{block}
}
%
% ppt(*)(TITRE)
\NewDocumentEnvironment{ppt}{ s g }{%begin
	\setbeamercolor{block title}{fg=white,bg=brickred!90!white}
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
%
% pre(TITRE)
\NewDocumentEnvironment{pre}{ g }{%begin
	\setbeamercolor{block title}{fg=hanblue,bg=airforceblue!10!white}
	\IfNoValueTF {#1} {
		\begin{block} {Preuve}
	}{
		\begin{block} {#1}
	}
}{%end
	\end{block}
}
%
% rmq(TITRE)
\NewDocumentEnvironment{rmq}{ G{Remarque} }{%begin
	\setbeamercolor{block title}{fg=blush,bg=blush!10!white}%fg=white,bg=cerisepink!80!white}%
	\begin{block} {\faExclamationTriangle \hspace{.125em} #1}
}{%end
	\end{block}
}
%
% met<0|i|I|a|A|1>(TITRE)
\newcounter{methodecounter}
\NewDocumentEnvironment{met} { O{0} g }{%begin
	\setbeamercolor{block title}{fg=black,bg=amber!75!white}%
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
			\begin{block}{Méthode \cType{methodecounter}\ }
		}{
			\begin{block}{Méthode \cType{methodecounter}\ - #2}
		}
	}{
		\IfNoValueTF {#2} {
			\begin{block}{Méthode\ }
		}{
			\begin{block}{Méthode\ - #2}
		}
	}
}{%end
	\end{block}
}
%
% exe(TITRE)
\NewDocumentEnvironment{exe}{ G{Exemple} }{%begin
	\setbeamercolor{block title}{fg=darkspringgreen,bg=green!10!white}%
	\begin{block} {#1}
}{%end
	\end{block}
}
%
% exo<0|i|I|a|A|1>(TITRE)
\newcounter{exercicecounter}
\NewDocumentEnvironment{exo} { O{0} G{Exercice} }{%begin
	\setbeamercolor{block title}{fg=white,bg=airforceblue!90!white}%
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
%
% app<0|i|I|a|A|1>(TITRE)
\newcounter{applicationcounter}
\NewDocumentEnvironment{app} { O{0} G{Application} }{%begin
  \setbeamercolor{block title}{fg=white,bg=airforceblue!90!white}%
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
%--%


% Macros modifiées
% - %

\makeatother
%% MACROS : FIN
