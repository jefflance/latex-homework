%%%
%%%
%%% Classe 	: cours_beamer.cls
%%% Version : 1.6
%%% Date 	: 08/12/14
%%% Auteur 	: Jeff LANCE
%%%
%%% Notes de versions
%%% 25/11/18: version 2.0
%%%           renommage de la classe et constitution en package.
%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jl-beamer}[2014/12/08 Beamer de cours, v2.0]



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% INIT
%
%

\LoadClassWithOptions{beamer}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% PACKAGES
%
%

%% Own packages.
%%
\RequirePackage{couleurs}
\RequirePackage{commun}
\RequirePackage{shortcuts}

%% Others.
%%
\RequirePackage{media9}
\RequirePackage{xkeyval}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\makeatletter



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% SETTINGS
%
%

%% Paths.
\graphicspath{{images/}}
\addmediapath{{videos/}}


%% Colors
%% Colors used in block and environments
%% I don't like the default flashy green and the blue so i redefined it
%% \colorlet{green}{green!40!gray}
%% \colorlet{blue}{airforceblue}

%% Colors of blocks like: definition, theorem, property, etc...
%%
\setbeamercolor*{definition}{fg=red,bg=blush!10!white}
\setbeamercolor*{theoreme}{fg=white,bg=red!90!white}
\setbeamercolor*{propriete}{fg=white,bg=brickred!90!white}
\setbeamercolor*{demonstration}{fg=hanblue,bg=airforceblue!10!white}
\setbeamercolor*{vocabulaire}{fg=hanblue,bg=airforceblue!10!white}
\setbeamercolor*{remarque}{fg=blush,bg=blush!10!white}
\setbeamercolor*{methode}{fg=black,bg=amber!75!white}
\setbeamercolor*{exemple}{fg=darkspringgreen,bg=green!10!white}
\setbeamercolor*{exercice}{fg=white,bg=airforceblue!90!white}
\setbeamercolor*{application}{fg=white,bg=airforceblue!90!white}

%% Colors of sections and subsections.
%%
\setbeamercolor*{sectioncolor}{fg=debianred}
\setbeamercolor*{subsectioncolor}{fg=lapislazuli}
\setbeamercolor*{subsubsectioncolor}{fg=coolgrey}

%% Define the possibility to make (dis)appear something in a beamer.
%%
\tikzset{
  invisible/.style={opacity=0},
  visible on/.style={alt=#1{}{invisible}},
  alt/.code args={<#1>#2#3}{%
    \alt<#1>{\pgfkeysalso{#2}}{\pgfkeysalso{#3}} % \pgfkeysalso doesn't change the path
  },
}

%% Resume numbering in lists.
%%
\newcounter{saveenumi}
\newcommand{\seti}{\setcounter{saveenumi}{\value{enumi}}}
\newcommand{\conti}{\setcounter{enumi}{\value{saveenumi}}}
\resetcounteronoverlays{saveenumi}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% DEFAULT BEAMER THEME OPTIONS
%
%

%% Theme.
%%
\usetheme{Madrid}
\useinnertheme{circles}
\useoutertheme{default}
\usefonttheme{professionalfonts}
\setbeamertemplate{footline}{}

%% Enumerate env.
%%
\setbeamerfont{enumerate items}{family=\rmfamily}
\setbeamercolor*{enumerate items}{fg=black}
\setbeamertemplate{enumerate items}{\textbf{\insertenumlabel}.}
\setbeamertemplate{enumerate subitem}{\textbf{\alph{enumii})}}

%% Items.
%%
\setbeamertemplate{itemize item}[circle]
\setbeamercolor*{itemize item}{fg=black}
\setbeamertemplate{itemize subitem}{\textendash}

%% Navigation.
%%
\setbeamertemplate{navigation symbols}{%
	\insertframenavigationsymbol
	\insertsectionnavigationsymbol
}

%% ToC.
%% Change vertical space between sections.
%%
\patchcmd{\beamer@sectionintoc}
{\vfill}
{\setlength{\itemsep}{10pt}\vskip\itemsep}
{}
{}

%% Change the list symbol.
%%
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
\defbeamertemplate{subsection in toc}{subsections numbered arabic}{%
	\leavevmode\leftskip=1.5em%
	{\bfseries
		\MakeUppercase{\inserttocsubsectionnumber)}\ %
		\inserttocsubsection\par
	}
}
\defbeamertemplate{subsubsection in toc}{subsubsections numbered alph}{%
	\leavevmode\leftskip=1.5em%
	{\bfseries
		\circled{\inserttocsubsubsectionnumber)}\ %
		\inserttocsubsubsection\par
	}
}

\setbeamertemplate{section in toc}[sections numbered roman]
\setbeamercolor{section in toc}{parent=sectioncolor}
\setbeamertemplate{subsection in toc}[subsections numbered arabic]
\setbeamercolor{subsection in toc}{parent=subsectioncolor}
\setbeamertemplate{subsubsection in toc}[subsubsections numbered alph]
\setbeamercolor{subsubsection in toc}{parent=subsubsectioncolor}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% MDFRAMED
%
%

\input{mdframed.tex}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% COMMANDS
%
%

%% titre
%%
\newcommand{\titre}[4]{%
	\title{#1}
	\subtitle{#2}
	\date{#3}
	\author{Cours}
	\institute{#4}
}

%% debut
%% print start slide.
%%
\newcommand{\debut}{%
  \begin{frame}[plain]
	\titlepage
  \end{frame}
  \addtocounter{framenumber}{-1}
}

%% debut
%% print end slide.
%%
\newcommand{\fin}{%
	\section*{Plan}
	\begin{frame}
		\begin{center}{\Large Plan }\end{center}
		\tableofcontents
	\end{frame}
}

%% partie
%% Define a slide with the section title.
%%
\newcounter{partiecounter}

\NewDocumentCommand \partie { G{Partie} } {%
  	\usebeamercolor{sectioncolor}
	\def\cType{\Roman}
	\stepcounter{partiecounter}
	\setcounter{sspartiecounter}{0}
	\section{#1}
	\begin{frame}
		\begin{center}
			\begin{mdframed}[style=partie]
				\centering \textcolor{sectioncolor.fg}{\textbf{ \cType{partiecounter}. #1}}
			\end{mdframed}
		\end{center}
	\end{frame}
}

%% sspartie
%% Define a slide with the subsection title.
%%
\newcounter{sspartiecounter}

\NewDocumentCommand \sspartie { G{Sous-Partie} } {%
 	\usebeamercolor{subsectioncolor}
	\def\cType{\arabic}
	\stepcounter{sspartiecounter}
	\subsection{#1}
	\begin{frame}
		\begin{center}
			\begin{mdframed}[style=sspartie]
				\centering \textcolor{subsectioncolor.fg}{\textbf{ \cType{sspartiecounter}) #1}}
			\end{mdframed}
		\end{center}
	\end{frame}
}

%% ssspartie
%% Define a slide with the subsection title.
%%
\newcounter{ssspartiecounter}

\NewDocumentCommand \ssspartie { G{Sous-Sous-Partie} } {%
 	\usebeamercolor{subsubsectioncolor}
	\def\cType{\alph}
	\stepcounter{ssspartiecounter}
	% \subsubsection{#1}
	\begin{frame}
		\begin{center}
			\begin{mdframed}[style=ssspartie]
				\centering \textcolor{subsubsectioncolor.fg}{
                                \textbf{ \circled{\cType{ssspartiecounter}} #1}}
			\end{mdframed}
		\end{center}
	\end{frame}
}

%% ftitre
%% Define the frametitle of sections and subsections.
%%
\NewDocumentCommand \ftitre { }{%
	\ifnum \value{partiecounter}>0
		\frametitle{\textbf{\Roman{partiecounter}. \insertsection}}
	\fi
	\ifnum \value{sspartiecounter}>0
		\framesubtitle{\textbf{\arabic{sspartiecounter}) \insertsubsection}}
	\fi
}

%% includemovie
%% Icludes a video in a frame.
%%
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

% %% frame
% %% Redefine frame environment to include the ftitre command.
% %%
% \RenewDocumentEnvironment{frame}{ }{
%   \begin{frame}
%     \ifthenelse{\equal{\framenumber}{\string 0}}
%       {}
%       {\ftitre}
% }{
%   \end{frame}
% }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% ENVIRONMENTS
%
%

\input{environments.tex}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\makeatother
