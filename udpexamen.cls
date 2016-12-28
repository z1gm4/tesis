%
% Get the latest version and more at
% http://weblogs.udp.cl/carlos.fernandez/archivos/udptexmf.zip
%
% guide:      udpexamen.pdf
%
% template:   udpexamen.tex (for examen and test)
%
% Carlos Fernandez, January 1, 2006.
% cfernandezj@gmail.com
%
% All names defined that includes an @ are internal
%
% =====================================================================
% Identification
% ---------------------------------------------------------------------
                                           %
\NeedsTeXFormat{LaTeX2e}[1995/12/01]       % We need LaTeX2e or better
                                           %
\ProvidesClass{udpexamen}                  %
  [2006/02/09 v1.0 LaTeX2e udp examen and test class]
                                           %
% =====================================================================
% Preliminary declarations
% ---------------------------------------------------------------------
                                           %
\RequirePackage{udpbase}                   % base UDP package
                                           %
\RequirePackage{ifthen}                    % we need ifthenelse
% \newboolean are false by default         %
                                           %
\newcommand{\udp@ptsize}{11pt}             %
                                           %
% ---------------------------------------------------------------------
% Definition of Counters                   %
                                           %
\newcounter{problemnumber}                 %
\newcounter{optionnumber}                  %
                                           %
\newcounter{totalscore}                    %
\newcounter{problemscore}                  %
                                           %
% ---------------------------------------------------------------------
                                           %
\newcommand{\udp@raggedright}{             %
  \let\\\@centercr\@rightskip\z@ plus .1\hsize % .5em % original = .1\hsize
  \rightskip\@rightskip\leftskip\z@skip    %
}                                          %
                                           %
% ---------------------------------------------------------------------
                                           %
\newcommand{\udp@papersize}                %
  {letter}                                 %
                                           %
\newcommand{\udp@asignatura}               %
  {--asignatura--}                         %
                                           %
\newcommand{\udp@testtype}                 %
  {--tipo de prueba--}                     %
                                           %
\newcommand{\udp@date}                     %
  {--\today--}                             %
                                           %
% =====================================================================
% Options for the class
% ---------------------------------------------------------------------
                                           %
\DeclareOption{letter}{                    %
  \renewcommand{\udp@papersize}            %
    {\CurrentOption}                       %
}                                          %
                                           %
\DeclareOption{legal}{                     %
  \renewcommand{\udp@papersize}            %
    {\CurrentOption}                       %
}                                          %
                                           %
\DeclareOption*{                           % unknown options
  \ClassError{udpexamen}{                  %
    Unknown option [\CurrentOption].       %
  }{                                       %
    Delete option [\CurrentOption].        %
  }                                        %
}                                          %
                                           %
% =====================================================================
% Process options
% ---------------------------------------------------------------------
                                           %
\ExecuteOptions{letter}                    %
                                           %
\ProcessOptions\relax                      %
                                           %
\LoadClass[\udp@papersize,\udp@ptsize,oneside]{article}   % default article
                                           %
\RequirePackage{geometry}                  %
\geometry{letterpaper}                     % letter paper
\geometry{top=0.600in,bottom=1.175in}      % vertical borders
\geometry{left=1.250in,right=1.250in}      % horizontal borders
\geometry{nohead}                          % no headings
\geometry{marginparwidth=0.75in}           % margin notes width
                                           %
% ---------------------------------------------------------------------
                                           %
\RequirePackage[spanish]{babel}            % spanish language from babel
\RequirePackage{graphicx}                  %
\RequirePackage{epsfig}                    % for eps pictures
\RequirePackage{color}                     % color managment
\RequirePackage{calc}                      % provide calculations
\RequirePackage{setspace}                  % line spacing and ...
\RequirePackage{fancyhdr}                  % after package geometry
\RequirePackage{url}                       %
                                           %
% ---------------------------------------------------------------------
                                           %
\newcommand{\asignatura}[1]{               %
  \renewcommand{\udp@asignatura}{#1}       %
}                                          %
                                           %
\newcommand{\tipoprueba}[1]{               %
  \renewcommand{\udp@testtype}{#1}         %
}                                          %
                                           %
\newcommand{\fecha}[1]{                    %
  \renewcommand{\udp@date}{#1}             %
}                                          %
                                           %
\newcommand{\udp@studentinfo}{             %
  {\bfseries Alumno:}                      %
  \hrulefill                               %
  \par                                     %
  (Escriba primero sus apellidos,          %
  seguido de sus nombres.                  %
  Use letras may\'{u}sculas)               %
  \vskip 1em                               %
  {\bfseries RUN:}                         %
  \rule{.30\textwidth}{0.15mm}             %
  \par                                     %
}                                          %
                                           %
% ---------------------------------------------------------------------
                                           %
\newenvironment{instrucciones}{            %
  {\bfseries Instrucciones}                %
  \singlespacing                           %
  \begin{list}                             %
  {}                                       % {Instrucciones \hfill}
  {                                        %
    \setlength{\itemsep}{0in}              % We control the vertical!!
    \setlength{\topsep}{0in}               %
    \setlength{\partopsep}{0in}            %
    \setlength{\parsep}{0pt}               %
    \setlength{\leftmargin}{0.00in}        % We control the horizontal!!
    \setlength{\rightmargin}{0in}          %
    \setlength{\itemindent}{0in}           %
    \setlength{\labelsep}{0in}             %
    \setlength{\labelwidth}{\leftmargin}   %
    \advance \labelwidth by-\labelsep      %
  }                                        %
}{                                         %
  \end{list}                               %
}                                          %
                                           %
% ---------------------------------------------------------------------
                                           %
\renewenvironment{titlepage}{              % begin{titlepage}
  \pagestyle{empty}                        %
  \begin{center}                           %
    \udp@logo{false}                       % put the logo picture
    \rule[2pt]{\textwidth}{2pt}            % draw an horizontal line
  \end{center}                             %
  \begin{center}                           %
    {\bfseries                             %
      {\Large                              %
        \par\udp@testtype                  % test type
        \par\udp@asignatura                % class name
      }                                    %
      {\large                              %
        \par\udp@date                      % date
        \par                               %
      }                                    %
    }                                      %
  \end{center}                             %
  \vskip 1em                               %
  \udp@studentinfo                         % room for student info
  \vskip 1em                               %
  \par                                     %
  \begin{minipage}[b]{.55\textwidth}       %
}{                                         %
  \vfil                                    %
  \rule[2pt]{.95\textwidth}{0.5pt}         %
  \end{minipage}                           %
  \begin{minipage}{.45\textwidth}          %
  \parindent=0pt                           %
  \@starttoc{pro}                          % score table
  \end{minipage}                           %
  \newpage                                 %
}                                          % end{titlepage}
                                           %
% ---------------------------------------------------------------------
                                           %
\newenvironment{problema}{                 % for each question
  \stepcounter{problemnumber}              %
  \setcounter{optionnumber}{0}             %
  \setcounter{problemscore}{0}             %
  \addtocontents{pro}{\protect\hline}      %
  {\bfseries\large                         %
    Problema \theproblemnumber.            %
  }                                        %
  \par\noindent\ignorespaces               %
}{                                         %
  \vskip 1em                               %
  \rule[2pt]{\textwidth}{.5pt}             % draw an horizontal line
  \vskip 1em                               %
}                                          %
                                           %
% ---------------------------------------------------------------------
                                           %
\newenvironment{pregunta}[1]{              %
  \stepcounter{optionnumber}               %
  \vskip 1em                               %
  \begin{minipage}[b]{\textwidth}          %
    \rule{.16\textwidth}{.5pt}             % draw an horizontal line
    {\bfseries\par\ignorespacesafterend    %
    Pregunta\ \theproblemnumber.\theoptionnumber}%
  \end{minipage}                           %
  \addtocontents{pro}{\theproblemnumber.\theoptionnumber & #1 \quad & \\}
  \addtocounter{totalscore}{#1}            %
  \addtocounter{problemscore}{#1}          %
}{                                         %
}                                          %
                                           %
% ---------------------------------------------------------------------
% redefine enumerate
                                           %
\let\old@enumerate=\enumerate              % old definition
\let\old@endenumerate=\endenumerate        %
                                           %
\renewenvironment{enumerate}{              %
  \old@enumerate                           %
  \setlength{\itemsep}{0in}                %
}{                                         %
  \old@endenumerate                        %
}                                          %
                                           %
% ---------------------------------------------------------------------
                                           %
\newcommand{\udp@linespacing}              % inter line spacing
  {\onehalfspacing}                        %
                                           %
% =====================================================================
% Commands for the whole document
% ---------------------------------------------------------------------
                                           %
\parskip 0in                               %
\parindent 0in                             %
                                           %
\udp@linespacing                           % line spacing
                                           %
% ---------------------------------------------------------------------
                                           %
\AtBeginDocument{                          %
  \addtocontents{pro}{\protect\begin{center}}
  \addtocontents{pro}{\protect\tabular{|r|r|c|}}
  \addtocontents{pro}{\protect\multicolumn {3}{c}{\mbox{}} \\}
  \addtocontents{pro}{\protect\hline}      %
  \addtocontents{pro}{\bfseries Pregunta & \bfseries Puntaje & \bfseries Evaluaci\'{o}n \\}
}                                          %
                                           %
% ---------------------------------------------------------------------
                                           %
\AtEndDocument{                            %
  \addtocontents{pro}{\protect\hline}      %
  \addtocontents{pro}{Total & \thetotalscore\ \quad & \\}
  \addtocontents{pro}{\protect\hline}      %
  \addtocontents{pro}{\protect\hline}      %
  \addtocontents{pro}{\protect\multicolumn {2}{|l|}{\bfseries\large Nota} & \\}
  \addtocontents{pro}{\protect\hline}      %
  \addtocontents{pro}{\protect\endtabular} %
  \addtocontents{pro}{\protect\end{center}}%
  \clearpage                               %
}                                          %
                                           %
\endinput

