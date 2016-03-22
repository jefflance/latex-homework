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
\LoadClass{beamer}
%-- %


%-- extensions
% perso
\RequirePackage{couleurs}
\RequirePackage{commun}
%-- %


%-- definitions
%-- %


%-- paramètrages
\usetheme{Madrid}
\usefonttheme{serif}
\setbeamerfont{enumerate item}{family=\sffamily}

\setbeamertemplate{navigation symbols}{%
	\insertframenavigationsymbol
	\insertsectionnavigationsymbol
}
%-- %


%% MACROS : DEBUT
\makeatletter

%-- Macros personnelles
\newcounter{ctrTime}
\newcommand{\decompte}[1]{%
	\setcounter{ctrTime}{#1}
	\multido{\n=1+1}{#1}{%
		\only<\n>{%
			\begin{flushright}\alert{ Il reste \arabic{ctrTime} s. }\end{flushright}%
			\transduration{1}
		}
		\addtocounter{ctrTime}{-1}
	}
}


\newcommand{\titre}[4]{%
	\title{#1}
	\subtitle{Calcul Mental}
	\date{#2}
	\author{#3}
	\institute{#4}
}


\newcommand{\debut}{%
	\begin{frame}
		\titlepage

		\transduration{3}
	\end{frame}

	\begin{frame}
		\centering
		Voici un rapide calcul mental pour tester votre compréhension du cours.\\~\\
		\begin{itemize}[<+-|alert@+>]
			\item Vous répondrez sur la feuille qui vous a été distribuée.
			\item Vous avez 60 secondes pour répondre à chaque question.
			\item Un compte à rebours apparaîtra en bas à droite vous indiquant le temps restant pour répondre.
			\item C'est un calcul mental, la calculatrice n'est donc pas autorisée.
		\end{itemize}

		\only<5->{Bonne chance !}

		\only<3>{
			\decompte{30}
		}
		\transduration{4}
	\end{frame}
}


\newcounter{ctrQuest}
\NewDocumentEnvironment{questions}{O{60}}{ % begin
	\stepcounter{ctrQuest}
	\section{Question \usecounter{ctrQuest}}
	\begin{frame}
		\centering
		Question \usecounter{ctrQuest}\transduration{3}
	\end{frame}
	\begin{frame}
	\centering
	\begin{beamerboxesrounded}{Q\usecounter{ctrQuest}.}
} { % end
	\end{beamerboxesrounded} %
	\decompte{#1} %
	\end{frame} %
}


\newcommand{\fin}{%
	\begin{frame}
		\centering
		C'est fini !\transduration{3}
	\end{frame}


	\section{Index}
	\begin{frame}
		\begin{center}{\Large Index des questions}\end{center}
		\tableofcontents
	\end{frame}
}
%--%


% Macros modifiées

% - %

\makeatother
%% MACROS : FIN
