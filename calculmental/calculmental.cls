%%%
%%%
%%% Classe 	: calculmental.cls
%%% Version : 1.0
%%% Date 	: 08/12/14
%%% Auteur 	: Jeff LANCE
%%%
%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{calculmental}[2014/12/08 Classe de diaporama de calcul mental, v1.0]


%-- classe de base
\LoadClassWithOptions{beamer}
%--%



%-- extensions
% perso
\RequirePackage{couleurs}
\RequirePackage{commun}
\RequirePackage{shortcuts}
%--%



%-- definitions
% maincolor
% 	option de classe
%	  couleur générale du beamer
\def\maincolor{lapislazuli}%
\define@key{calculmental.cls}{maincolor}[lapislazuli]{%
  \def\maincolor{#1}%
}
%--%


%-- options
\ExecuteOptionsX{maincolor}
\ProcessOptionsX
%--%



%
% \toggletrue{calculmental}
%



%-- paramètrages
\graphicspath{{images/}}

\usetheme{Madrid}
\useinnertheme{circles}
\useoutertheme{default}
\usefonttheme{professionalfonts}
\usecolortheme[named=\maincolor]{structure}
\setbeamerfont{enumerate item}{family=\sffamily}

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
\defbeamertemplate{section in toc}{bullets}{%
	\leavevmode
	\parbox[t]{1em}{\textbullet\hfill}%
	\parbox[t]{\dimexpr\textwidth-1em\relax}{\inserttocsubsection}\par
}
%--%



%% MACROS : DEBUT
\makeatletter

%-- Macros personnelles
\newcounter{decomptecounter}
\newcommand{\decompte}[1]{%
	\setcounter{decomptecounter}{#1}
	\multido{\n=1+1}{#1}{%
		\only<\n>{%
			\begin{flushright}\alert{ Il reste \arabic{decomptecounter} s. }\end{flushright}%
			\transduration{1}
		}
		\addtocounter{decomptecounter}{-1}
	}
}


% \titre{TITRE}{SOUS-TITRE}{ANNÉE}{LIEU}
% defini le titre du document
\newcommand{\titre}[5]{%
	\title{#1}
	\subtitle{#2}
	\date{#3}
	\author{#4}
	\institute{#5}
}


\NewDocumentCommand \debut { s O{c} }{%
	\begin{frame}[plain]
		\titlepage
		\transduration{3}
  \end{frame}

  \addtocounter{framenumber}{-1}

	\begin{frame}
    \IfValueT{#2}{
      \ifthenelse{ \equal{#2}{a} }{
        \centering
        Petite séance d'automatismes.\\~\\
        \transduration{2}
      }{
        \ifthenelse{ \equal{#2}{c} }{
      		\centering
      		Voici un rapide calcul mental pour tester votre compréhension du cours.\\~\\
      		\begin{itemize}[<+-|alert@+>]
      			\item Vous répondrez sur la feuille qui vous a été distribuée.
      			\item Le temps pour répondre à chaque question vous est indiqué au début de chacune d'elle.
      			\item Un compte à rebours apparaîtra en bas à droite vous indiquant le temps restant pour répondre.
            \IfBooleanTF #1 {
        			\item Même si cette activité est appelée << calcul mental >>, vous avez le droit à la calculatrice !
            }{
              \item C'est un calcul mental, la calculatrice n'est donc pas autorisée.
            }
      		\end{itemize}

      		\only<5->{Bonne chance !}

      		\only<3>{
      			\decompte{30}
            \transduration{4}
      		}
        }{

        }
      }
    }
	\end{frame}
}


%\newcounter{cjeff}
%\NewDocumentEnvironment{jeff}{ G{60} }{ % begin
%		%\stepcounter{cqcm}
%		%\section{Question \usecounter{cqcm}\ }
%		%\begin{frame}
%		%	\centering
%		%	Question \usecounter{cqcm}\transduration{3}
%		%\end{frame}
%    \begin{frame}[fragile]
%		\centering
%		\begin{beamerboxesrounded}{Q\usecounter{cjeff}.\ }
%	}{ % end
%		\end{beamerboxesrounded} %
%		\decompte{#1} %
%		\end{frame} %
%}


\newcommand{\fin}{%
	\begin{frame}
		\centering
		C'est fini !\transduration{3}
	\end{frame}


	\section*{Index}
	\begin{frame}
		\begin{center}{\Large Index des questions}\end{center}
		\tableofcontents
	\end{frame}
}
%--%



%-- Macros modifiées
%--%

\makeatother
%% MACROS : FIN
