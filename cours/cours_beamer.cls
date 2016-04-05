%%%
%%%
%%% Classe 	: cours_beamer.cls
%%% Version : 1.0
%%% Date 	: 08/12/14
%%% Auteur 	: Jeff LANCE
%%%
%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cours_beamer}[2014/12/08 Slides de cours, v1.0]


%-- classe de base
% inutile de passer l'option [utf8] puisque chargee dans commun.sty
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
\graphicspath{{images/}}

\usetheme{Madrid}
\useinnertheme{circles}
\useoutertheme{default}
\usefonttheme{serif}
\setbeamerfont{enumerate item}{family=\rmfamily}
\setbeamertemplate{enumerate item}{\textbf{\insertenumlabel.}}

\setbeamertemplate{navigation symbols}{%
	\insertframenavigationsymbol
	\insertsectionnavigationsymbol
}

% \setbeamertemplate{headline}{} % pour supprimer l'entête
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
\newenvironment<>{déf}[1][]{%begin
	\setbeamercolor{block title}{fg=crimson,bg=pink!95!white}%
	\begin{block}{Définition}{#1}}{\end{block}
}
%
\newenvironment<>{thm}[1][]{%begin
	\setbeamercolor{block title}{fg=white,bg=cerisepink!95!white}%
	\begin{block}{Théorème}{#1}}{\end{block}
}
%
\newenvironment<>{rmq}[1][]{%begin
	\setbeamercolor{block title}{fg=white,bg=red!75!black}%
	\begin{block}#1}{\end{block}
}
%
\newenvironment<>{exp}[1][]{%begin
	\setbeamercolor{block title}{fg=white,bg=green!75!black}%
	\begin{block}#1}{\end{block}
}
%
\newcounter{exercicecounter}
\newenvironment<>{exo}[1][]{%begin
	\setbeamercolor{block title}{fg=white,bg=blue!75!black}%
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
	\begin{block}{Exercice \cType{exercicecounter}\ }}{\end{block}
}



%--%


% Macros modifiées

% - %

\makeatother
%% MACROS : FIN
