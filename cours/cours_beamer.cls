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
% titre
\newcommand{\titre}[4]{%
	\title{#1}
	\subtitle{Cours}
	\date{#2}
	\author{#3}
	\institute{#4}
}

% debut - fin
\newcommand{\debut}{%
	\begin{frame}
		\titlepage
		\transduration{3}
	\end{frame}
}

\newcommand{\fin}{%
	\section{Sommaire}
	\begin{frame}
		\begin{center}{\Large Plan }\end{center}
		\tableofcontents
	\end{frame}
}

% blocks
% \newenvironment<>{def}[1]{%begin
% 	\setbeamercolor{block title}{fg=white,bg=blue!75!black}%
% 	\begin{block}{#1}}{\end{block}
% }
%
% \newenvironment<>{thm}[1]{%begin
% 	\setbeamercolor{block title}{fg=white,bg=blue!75!black}%
% 	\begin{block}#2[#1]}{\end{block}
% }
%
% \newenvironment<>{rmq}[1]{%begin
% 	\setbeamercolor{block title}{fg=white,bg=red!75!black}%
% 	\begin{block}#2[#1]}{\end{block}
% }
%
% \newenvironment<>{exp}[1]{%begin
% 	\setbeamercolor{block title}{fg=white,bg=green!75!black}%
% 	\begin{block}#2[#1]}{\end{block}
% }
%--%


% Macros modifiées

% - %

\makeatother
%% MACROS : FIN
