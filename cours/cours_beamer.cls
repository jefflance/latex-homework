%%%
%%%
%%% Classe 	: calculmental.cls
%%% Version : 1.0
%%% Date 	: 08/12/14
%%% Auteur 	: Jeff LANCE
%%%
%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cours_beamer}[2014/12/08 Slides de cours, v1.0]


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
% \newcounter{ctrTime}
% \newcommand{\decompte}[1]{%
% 	\setcounter{ctrTime}{#1}
% 	\multido{\n=1+1}{#1}{%
% 		\only<\n>{%
% 			\begin{flushright}\alert{ Il reste \arabic{ctrTime} s. }\end{flushright}%
% 			\transduration{1}
% 		}
% 		\addtocounter{ctrTime}{-1}
% 	}
% }


\newcommand{\titre}[4]{%
	\title{#1}
	\subtitle{Cours}
	\date{#2}
	\author{#3}
	\institute{#4}
}


\newcommand{\debut}{%
	\begin{frame}
		\titlepage

		\transduration{3}
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
	\section{Sommaire}
	\begin{frame}
		\begin{center}{\Large Plan }\end{center}
		\tableofcontents
	\end{frame}
}
%--%


% Macros modifiées

% - %

\makeatother
%% MACROS : FIN
