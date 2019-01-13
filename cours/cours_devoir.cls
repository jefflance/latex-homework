%%%
%%%
%%% Classe : cours_devoir.cls
%%% Version : 1.0
%%% Date : 03/10/18
%%% Auteur : Jeff LANCE
%%%
%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cours_devoir}[2018/10/03 Devoirs, V1.0]


%
%
% INIT
%
%
\LoadClassWithOptions{scrartcl}
%\LoadClass[a4paper, 12pt, DIV=24]{scrartcl}



%
%
% PACKAGES
%
%
% Others
\RequirePackage{xkeyval}

% Own packages. Those contains some global settings and definitions.
\RequirePackage{commun}
\RequirePackage{couleurs}
\RequirePackage{shortcuts}

% Output
\RequirePackage{comment}

% Layout
\RequirePackage{geometry}
\RequirePackage[footsepline, plainfootsepline]{scrlayer-scrpage}
\RequirePackage{titling}
\RequirePackage{titlesec}
\RequirePackage{pageslts}
\RequirePackage{enumitem}
\RequirePackage[]{hyperref}



\makeatletter



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



%
%
% FIXES
%
%

% Fix error from KOMA-Script scrartcl class.
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}



%
%
% SETTINGS
%
%

% metapost
\ifpdf
  \DeclareGraphicsRule{*}{mps}{*}{}
\fi

% tkz
\usetkzobj{all} % loading all tkz objects

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
 	\cohead[\textbf{MATHÉMATIQUES}\\\textbf{Devoir surveillé}]
    {\textbf{MATHÉMATIQUES}\\\textbf{Devoir surveillé}}
  \lohead[NOM :\\Prénom :]{NOM :\\Prénom :}
  \rohead[Le \@date]{Le \@date}
  \cehead[]{}
  \lehead[]{}
  \rehead[]{}
}{
	\ifthenelse{ \equal{\type}{dm} }{
   	\cohead[\textbf{MATHÉMATIQUES}\\\textbf{Devoir maison}]
      {\textbf{MATHÉMATIQUES}\\\textbf{Devoir maison}}
    \lohead[NOM :\\Prénom :]{NOM :\\Prénom :}
    \rohead[\@date]{\@date}
    \cehead[]{}
    \lehead[]{}
    \rehead[]{}
	}{
    \ifthenelse{ \equal{\type}{int} }{
      \cohead[\textbf{MATHÉMATIQUES}\\\textbf{Interrogation}]
        {\textbf{MATHÉMATIQUES}\\\textbf{Interrogation}}
      \lohead[NOM :\\Prénom :]{NOM :\\Prénom :}
      \rohead[\@date]{\@date}
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



%
%
% MACROS
%
%

% new lists definitions
\newlist{questions}{enumerate}{2}
\setlist[questions]{labelindent=0em, leftmargin=*, labelsep=0.5em}
\setlist[questions, 1]{label=\textbf{\arabic*.}}
\setlist[questions, 2]{label=\textbf{\alph*)}}

\newlist{questionsl}{enumerate*}{1}
\setlist*[questionsl]{label=\textbf{\alph*)}}

\setlist[enumerate, 1]{label=\textbf{\arabic*.}, leftmargin=*, labelsep=.5em}
\setlist[enumerate, 2]{label=\textbf{\alph*)}}

\setlist[description]{font=\sffamily\bfseries}


% print a "Please, turn the page" at bottom right of the page
\NewDocumentCommand \printturnpage{ }{
  \rofoot[\textit{Tourner la page, svp} \faHandORight]
    {\textit{Tourner la page, svp} \faHandORight}
}


% print the main directives of the test
\NewDocumentCommand \devprintdirectives{ }{
  \begin{center}
    \fbox{
      \parbox{.9\textwidth}{
        \centering
        Le prêt de matériel et de documents personnels sont interdits.\\
        Le barème est donné à titre indicatif : il pourra être légèrement différent.\\
        Les exercices peuvent être traités dans n’importe quel ordre mais attention à bien reporter les numéros des questions.\\
        Il sera tenu compte dans la notation du soin apporté à la copie et de la clarté des raisonnements.\\
        Si présent, le symbole \faPencil\ indique que tout ou partie de l'exercice est à réaliser sur l’énoncé.
      }
    }
  \end{center}
  
  \vspace{.2cm}
}

% amsthm style for exercises
\newtheoremstyle{exostyle1}
{\topsep}% espace avant
{\topsep}% espace apres
{}% Police utilisee par le style de thm
{}% Indentation (vide = aucune, \parindent = indentation paragraphe)
{\bfseries}% Police du titre de thm
{}% Signe de ponctuation apres le titre du thm
{\newline}% Espace apres le titre du thm (\newline = linebreak)
{%
  \if\relax\detokenize{#3}\relax
  % no optional argument
  \else
  \makebox[0pt][l]{\hspace{.9\textwidth}\normalfont\itshape#3}%
  \fi
  \thmname{#1}\thmnumber{ #2}%
}

\newtheoremstyle{exostyle2}
{\topsep}% espace avant
{\topsep}% espace apres
{}% Police utilisee par le style de thm
{}% Indentation (vide = aucune, \parindent = indentation paragraphe)
{\bfseries}% Police du titre de thm
{}% Signe de ponctuation apres le titre du thm
{\newline}% Espace apres le titre du thm (\newline = linebreak)
{%
  \if\relax\detokenize{#3}\relax
  % no optional argument
  \else
  \makebox[0pt][l]{\hspace{.9\textwidth}\normalfont\itshape#3}%
  \fi
  \thmname{#1 }%
}

\theoremstyle{exostyle1}
\newtheorem{exercice}{Exercice}
\newtheorem{exercice*}[exercice]{\faPencil \ Exercice}

\theoremstyle{exostyle2}
\newtheorem{exercice**}{Exercice}

% amsthm proofs customization
\newenvironment{solution}
  {\begin{proof}[\textbf{Solution}]}
  {\end{proof}}

%
%
% TODO: Replace amsthm exercices with xsim
%
%
%\usepackage{xsim}
%
%\DeclareExerciseTranslations{exercise}{
%  Fallback = exercise,
%  English  = exercise,
%  French   = exercice
%}
%
%\DeclareExerciseType{exercice}{
%  exercise-env = exercice ,
%  solution-env = answer ,
%  exercise-name = Exercice ,
%  solution-name = Solution ,
%  exercise-template = exercice ,
%  solution-template = exercice
%}
%
%\DeclareExerciseEnvironmentTemplate{exercice}{%
%  \subsection*
%  {%
%    \XSIMmixedcase{\GetExerciseName}\nobreakspace
%    \GetExerciseProperty{counter}%
%    \IfInsideSolutionF
%    {%
%      \GetExercisePropertyT{subtitle}
%      { {\normalfont\itshape\PropertyValue}}%
%    }%
%  }
%  \GetExercisePropertyT{points}
%  {%
%    \hspace{.9\textwidth}\\
%    {%
%      \IfInsideSolutionF{\rule{1.2cm}{1pt}\slash}%
%      \printgoal{\PropertyValue}
%      \GetExercisePropertyT{bonus-points}{~(+\printgoal{\PropertyValue})}%
%      ~\XSIMtranslate {point-abbr}%
%    }%
%  }%
%}
%{}

% text customization
\NewDocumentCommand \devprintconc{ }{
  \underline{Conclusion :}
}


\makeatother
