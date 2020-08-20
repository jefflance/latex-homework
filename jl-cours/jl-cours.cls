%%%
%%%
%%% Classe : jl-cours.cls
%%% Version : 1.0
%%% Date : 09/11/16
%%% Auteur : Jeff LANCE
%%%
%%% Notes de versions
%%% 25/11/18: version 2.0
%%%           renommage de la classe et constitution en package.
%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jl-cours}[2016/11/09 Document de cours en A4, V2.0]



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
\RequirePackage{algo}
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
\RequirePackage{chngcntr}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\makeatletter



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% OPTIONS
%
%

\DeclareOptionX{type}[crs]{%
  \def\type{#1}%
}

\ExecuteOptions{a4paper, DIV=24}
\ExecuteOptionsX{type}
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

%% metapost
%%
\ifpdf
  \DeclareGraphicsRule{*}{mps}{*}{}
\fi

%% tkz
%%
%\usetkzobj{all} % on charge tous les objets: useless since version 3.02 of tkz-euclide

%% sizing of the page
%%
\geometry{a4paper, includeheadfoot, hmargin=.7cm, vmargin=.5cm, head=14.5pt}

%% title, header and footer
%% KOMA-Script version (preferred)
%%
\ohead{}

\ifthenelse{ \equal{\type}{act} }{
	\IfNoValueTF{ \subtitle }{
%           \cohead[\@title]{\@title}
%           \rohead[Activité]{Activité}
	    \cohead[]{\@title}
	    \rohead[]{Activité}
	}{
%	    \cohead[\@title]{\@title}
%	    \rohead[Activité]{Activité - \@subtitle}
	    \cohead[]{\@title}
    \rohead[]{Activité - \@subtitle}
	}
}{
	\ifthenelse{ \equal{\type}{exe} }{
%		\cohead[\@title]{\@title}
%		\rohead[Exercices]{Exercices}
    \IfNoValueTF{ \subtitle }{
      \cohead[]{\@title}
      \rohead[]{Exercices}
    }{
      \cohead[]{\@title}
      \rohead[]{Exercices - \@subtitle}
    }
	}{
    \ifthenelse{ \equal{\type}{aut} }{
%      \cohead[\@title]{\@title}
%      \rohead[Rappels]{Rappels - \@subtitle}
      \cohead[]{\@title}
      \rohead[]{Rappels - \@subtitle}
    }{
      \ifthenelse{ \equal{\type}{none} }{
  %      \cohead[\@title]{\@title}
  %      \rohead[Rappels]{Rappels - \@subtitle}
        \cohead[]{\@title}
        \rohead[]{}
      }{
        \rohead[Cours]{Cours - \@title}
      }
    }
  }
}

\pagenumbering{arabic}
%\ofoot*{\pagemark}% pagenumber in the outer footer with scrheadings and plain style
%\ohead[]{\headmark}% headmark only with scrheadings

\cofoot[\thepage\ /\ \pageref{LastPage}]{\thepage\ /\ \pageref{LastPage}}
\cefoot[\thepage\ /\ \pageref{LastPage}]{\thepage\ /\ \pageref{LastPage}}

%\clearpairofpagestyles% removes the default page header and footer entries
\pagestyle{scrheadings}
\setkomafont{pagehead}{\normalfont\bfseries}
\setkomafont{pagefoot}{\normalfont}

%% sections
%%
\titleformat{\section}[block]
            {\sffamily\bfseries\Large}
            {\thesection.}{.5em}{}[]
\titleformat{\subsection}[block]
            {\sffamily\bfseries\large\hspace{2em}}
            {\thesubsection)}{.5em}{}[]
\titleformat{\subsubsection}[block]
            {\sffamily\bfseries\large\hspace{2em}}
            {\circled{\thesubsubsection}}{.5em}{}[]
\renewcommand \thesection{\Roman{section}}
\renewcommand \thesubsection{\arabic{subsection}}
\renewcommand \thesubsubsection{\alph{subsubsection}}

%% paths
%%
\graphicspath{{images/}}
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
% MDTHEOREM
%
%

\input{mdtheorem.tex}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% ENVIRONMENTS
%
%

\input{environments.tex}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% COMMANDS
%
%

%% classe
\NewDocumentCommand{\classe}{ G{2nde} }{
  \ifthenelse{ \equal{#1}{2nde} }{
    \lohead[2\up{nde}]{2\up{nde}}
  }{
    \ifthenelse{ \equal{#1}{1gen} }{
      \lohead[1\up{ère}]{1\up{ère}}
    }{
      \ifthenelse{ \equal{#1}{1stg} }{
        \lohead[1\up{ère}STMG]{1\up{ère}STMG}
      }{
        \ifthenelse{ \equal{#1}{tes} }{
          \lohead[T\up{ale}ES]{T\up{ale}ES}
        }{
          \lohead{}
        }
      }
    }
  }
}

%% pagesuivante
%%
\NewDocumentCommand{\pagesuivante}{}{
  \newpage
  \thispagestyle{plain}
  \lefoot*{}
}

%% titre
%%
\NewDocumentCommand \titre { G{Titre} G{Sous-titre} G{} G{} }{%
  \setlength{\droptitle}{-2cm}
  \title{\Jd #1}
  \subtitle{#2}
  \date{}
  \maketitle
}

%% \partie | \sspartie
%% Define a (sub)section title.
%%
\newcounter{partiecounter}
\newcounter{sspartiecounter}
\newcounter{ssspartiecounter}
%
\NewDocumentCommand \partie { G{Partie} } {%
    \def\cType{\Roman}
    \stepcounter{partiecounter}
    \setcounter{sspartiecounter}{0}
    \section{#1}
}
%
\NewDocumentCommand \sspartie { G{Sous-Partie} } {%
    \def\cType{\arabic}
    \stepcounter{sspartiecounter}
    \subsection{#1}
}
%
\NewDocumentCommand \ssspartie { G{Sous-sous-Partie} } {%
  \def\cType{\alph}
  \stepcounter{ssspartiecounter}
  \subsubsection{#1}
}

%% new lists definitions
%%
\newlist{questions}{enumerate}{2}
\setlist[questions]{labelindent=0em, leftmargin=*, labelsep=0.5em}
\setlist[questions, 1]{label=\textbf{\arabic*.}}
\setlist[questions, 2]{label=\textbf{\alph*)}}
%
\newlist{questionsl}{enumerate*}{1}
\setlist*[questionsl]{label=\textbf{\alph*)}}
%
\setlist[enumerate, 1]{label=\textbf{\arabic*.}, leftmargin=*, labelsep=.5em}
\setlist[enumerate, 2]{label=\textbf{\alph*)}}
%
\setlist[description]{font=\sffamily\bfseries}
% \NewTasks[counter-format={tsk[1].},label-format={\bfseries}]{questions}[*]

%% \displayturnpage
%% print a "Please, turn the page" at bottom right of the page.
%%
\NewDocumentCommand \displayturnpage{ }{
  \rofoot[\textit{Tourner la page, svp} \faHandORight]
    {\textit{Tourner la page, svp} \faHandORight}
}

%% \displaydirectives
%% print the main directives of the test.
%%
\NewDocumentCommand \displaydirectives{ }{
  \begin{center}
    \fbox{
      \parbox{.9\textwidth}{
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

%% \nonumbering
%% deactivate page numbering in footer
%%
\NewDocumentCommand \nonumbering{ }{
  \cefoot*{}
  \cofoot*{}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\makeatother
