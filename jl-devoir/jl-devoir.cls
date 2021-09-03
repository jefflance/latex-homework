%%%
%%%
%%% Classe : jl-devoir.cls
%%% Version : 1.0
%%% Date : 03/10/18
%%% Auteur : Jeff LANCE
%%%
%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jl-devoir}[2018/10/03 Classe pour les devoirs et tests, V1.0]



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% INIT
%
%

\LoadClassWithOptions{scrartcl}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% PACKAGES
%
%

%% Others
%%
\RequirePackage{xkeyval}

%% Own packages. Those contains some global settings and definitions.
%%
\RequirePackage{commun}
\RequirePackage{couleurs}
\RequirePackage{shortcuts}

%% Output
%%
\RequirePackage{comment}

%% Layout
%%
\RequirePackage{geometry}
\RequirePackage[footsepline, plainfootsepline]{scrlayer-scrpage}
\RequirePackage{titling}
\RequirePackage{titlesec}
\RequirePackage{pageslts}
\RequirePackage{enumitem}
\RequirePackage[]{hyperref}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\makeatletter



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% OPTIONS
%
%

\DeclareOptionX{type}[ds]{%
  \def\type{#1}%
}

\DeclareOptionX{size}[a4paper]{%
  \def\size{#1}%
}

\ExecuteOptions{DIV=24}
\ExecuteOptionsX{type}
\ExecuteOptionsX{size}
\ProcessOptionsX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% FIXES
%
%

\input{fixes.tex}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% SETTINGS
%
%

% metapost
\ifpdf
  \DeclareGraphicsRule{*}{mps}{*}{}
\fi

% sizing of the page, depending on the size parameter of the class
\ifthenelse{ \equal{\size}{a5} }{
  \geometry{
    a5paper,
    landscape,
    includeheadfoot,
    hmargin=.8cm,
    vmargin=.8cm,
    head=14.5pt}
}{
  \geometry{a4paper,
    includeheadfoot,
    hmargin=.8cm,
    vmargin=.8cm,
    head=14.5pt}
}

% title, header and footer
\ihead[]{}
\chead[]{}
\ohead[]{}
\ifoot[]{}
\cfoot[]{}
\ofoot[]{}

% KOMA-Script version (preferred)
\ifthenelse{ \equal{\type}{ds} }{
 	\cohead[\textbf{MATHÉMATIQUES}\\\textbf{\Jd Évaluation}]
    {\textbf{MATHÉMATIQUES}\\\textbf{\Jd Évaluation}}
  \lohead[NOM :\\Prénom :]{NOM :\\Prénom :}
  \rohead[Le \@date\\]{Le \@date\\}
  \cehead[]{}
  \lehead[]{}
  \rehead[]{}
}{
	\ifthenelse{ \equal{\type}{dm} }{
   	\cohead[\textbf{MATHÉMATIQUES}\\\textbf{Devoir maison}]
      {\textbf{MATHÉMATIQUES}\\\textbf{Devoir maison}}
    \lohead[NOM :\\Prénom :]{NOM :\\Prénom :}
    \rohead[\@date\\]{\@date\\}
    \cehead[]{}
    \lehead[]{}
    \rehead[]{}
	}{
    \ifthenelse{ \equal{\type}{int} }{
      \cohead[\textbf{MATHÉMATIQUES}\\\textbf{\Jd Interrogation}]
        {\textbf{MATHÉMATIQUES}\\\textbf{\Jd Interrogation}}
      \lohead[NOM :\\Prénom :]{NOM :\\Prénom :}
      \rohead[\@date\\]{\@date\\}
      \cehead[]{}
      \lehead[]{}
      \rehead[]{}
    }{
    % nothing
    }
	}
}

\cofoot*{}
\pagestyle{scrheadings}
\setkomafont{pagehead}{\normalfont}
\setkomafont{pagefoot}{\normalfont}

% paths
\graphicspath{{images/}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% COMMANDS
%
%

%% new lists definitions
%%
\newlist{questions}{enumerate}{2}
\setlist[questions]{labelindent=0em, leftmargin=*, labelsep=0.5em}
\setlist[questions, 1]{label=\textbf{\arabic*.}}
\setlist[questions, 2]{label=\textbf{\alph*)}}

\newlist{questionsl}{enumerate*}{1}
\setlist*[questionsl]{label=\textbf{\alph*)}}

\setlist[enumerate, 1]{label=\textbf{\arabic*.}, leftmargin=*, labelsep=.5em}
\setlist[enumerate, 2]{label=\textbf{\alph*)}}

\setlist[description]{font=\sffamily\bfseries}

%% \tournerlapage
%% print a "Please, turn the page" at bottom right of the page.
%%
\NewDocumentCommand \tournerlapage{ }{
  \rofoot[\textit{Tourner la page, svp} \faHandORight]
    {\textit{Tourner la page, svp} \faHandORight}
}

%% \consignes
%% print the main directives of the test.
%%
\NewDocumentCommand \consignes{ }{
  \begin{center}
    \fbox{
      \parbox{.97\linewidth}{
        \small
        \centering
        Le prêt de matériel et de documents personnels sont interdits.\\
        Le barème est donné à titre indicatif : il pourra être légèrement différent.\\
        Les exercices peuvent être traités dans n’importe quel ordre mais attention à bien reporter les numéros des questions.\\
        Il sera tenu compte dans la notation du soin apporté à la copie et de la clarté des raisonnements.\\
        Si présent, le symbole \faPencil\ indique que tout ou partie de l'exercice est à réaliser sur l’énoncé.\\
        Sauf mention contraire, toutes les questions sont à justifier rigoureusement.
      }
    }
  \end{center}

  \vspace{.2cm}
}

%% text customization
%%
\NewDocumentCommand \conclusion{ }{
  \underline{Conclusion :}
}

%% pagesuivante
%%
\NewDocumentCommand{\pagesuivante}{}{
  \newpage
  \thispagestyle{plain}
  \lefoot*{}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% AMSTHM
%
%

\input{amsthm.tex}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\makeatother
