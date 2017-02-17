%%%
%%%
%%% Classe 	: cours_handout.cls
%%% Version : 1.0
%%% Date 	: 27/09/16
%%% Auteur 	: Jeff LANCE
%%%
%%% Classe qui génère un handout directement
%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cours_handout}[2016/09/27 Handout de cours, v1.0]



%-- definitions
\DeclareOption*{\PassOptionsToClass{\CurrentOption, handout}{cours_beamer}}
%--%

%-- options
% \ExecuteOptions{}
\ProcessOptions\relax
%--%

%-- classe de base
\LoadClass{cours_beamer}
%--%



%-- extensions
\RequirePackage{pgfpages}
%--%

\makeatletter

%-- paramètrages
\pgfpagesuselayout{2 on 1}[a4paper,border shrink=5mm]
%--%



%-- Macros personnelles
%--%


% Macros modifiées
% - %

\makeatother
