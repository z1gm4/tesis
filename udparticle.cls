%
% Get the latest version and more at
% http://weblogs.udp.cl/carlos.fernandez/archivos/udptexmf.zip
%
% Carlos Fernandez, January 1, 2006.
% cfernandezj@gmail.com
%
% All names defined that includes an @ are internal
%
% ---------------------------------------------------------------------
% Bugs
%
% 2006/01/27 roman numeral for pages (fixed)
% spanish babel fake roman numeral with small caps
% work-around: redefine es@lsc 
% (true solution need some work)
%
% =====================================================================
% Identification
% ---------------------------------------------------------------------
                                           %
\NeedsTeXFormat{LaTeX2e}[1995/12/01]       % We need LaTeX2e or better
                                           %
\ProvidesClass{udparticle}[2006/01/27 v1.0 LaTeX2e UDP document class]
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
% ---------------------------------------------------------------------
% Types of documents
% (no default. need explicit declaration)
                                           %
                                           %
% ---------------------------------------------------------------------
                                           %
\newboolean{udp@twoside}                   % twosides = false
\newboolean{udp@headers}                   % headers = false
                                           %
\newcommand{\udp@sides}{twoside}           % twoside is default
\setboolean{udp@twoside}{true}             %
                                           %
\newcommand{\udp@font}{computer modern}    % default for latex
\newboolean{udp@timesfont}                 % timesfont = false
                                           %
% ---------------------------------------------------------------------
% basic commands
                                           %
\newcommand{\udp@linespacing}              % inter line spacing
  {\onehalfspacing}                        %
                                           %
\newcommand{\udp@ptsize}{11pt}             % default font size
                                           %
\newcommand{\udp@indent}{30pt}             % indent (par., list,..)                                           %
                                           %
% define a new verion of LaTeX's raggedright to allow some hyphenation
% per Edward Tufte's book layout:
                                           %
\newcommand{\udp@raggedright}{             %
  \let\\\@centercr\@rightskip\z@ plus .5em % original = .1\hsize
  \rightskip\@rightskip\leftskip\z@skip    %
}                                          %
                                           %
%  first paragraph of chapter, section,...
                                           %
\newcommand{\fpar}{                        % no indented paragraph
  \par\noindent\ignorespaces               %
}                                          %
                                           %
% ---------------------------------------------------------------------
% define the spanish words for some titles %
                                           %
\newcommand{\udp@abstractname}             % abstract
  {Abstract}                               %
\newcommand{\udp@resumenname}              % abstract
  {Resumen}                                %
\newcommand{\@acknowledgmentname}          % acknowledgement
  {Agradecimientos}                        %
\newcommand{\udp@symbologyname}            % symbology
  {Simbolog\'{i}a y glosario}              %
\newcommand{\udp@dedicatoryname}           % dedicatory
  {Dedicatoria}                            %
\newcommand{\udp@refname}                  % references
  {Referencias}                            %
\newcommand{\udp@thesistext}               %
  {para optar al t\'{\i}tulo de}           %
                                           %
\newcommand{\udp@appendixtitle}            %
      {ANEXOS}                             %
\newcommand{\udp@draftmark}{               %
  {\bfseries BORRADOR \today}}             %
                                           %
% ---------------------------------------------------------------------
% define other fields                      %
                                           %
\newcommand{\@chairpersontitle}            %
  {Profesor}                               %
\newcommand{\udp@committeetext}            %
  {Comit\'{e}}                             %
                                           %
% ---------------------------------------------------------------------
% define commands for the title page       %
                                           %
%\newcommand{\degree}[1]{                   %
%  \gdef\udp@alumnidegree{#1}}              %
                                           %
\newcommand{\asignature}[2]{               %
  \gdef\udp@reporttype{#1}                 %
  \gdef\udp@asignature{#2}                 %
  }                                        %
                                           %
\newcommand{\chairperson}[1]{              %
  \gdef\@chairperson{#1}}                  %
                                           %
\newcommand{\committee}[1]{                %
  \gdef\udp@committeepersons{#1}}          %
                                           %
% ---------------------------------------------------------------------
% define spanish commands for the title page
                                           %
\newcommand{\grado}[1]{                    %
  \degree{#1}}                             %
\newcommand{\gradodoc}[1]{                 %
  \gradodoc{#1}}                           %
\newcommand{\profesorguia}[1]{             %
  \chairperson{#1}}                        %
\newcommand{\comite}[1]{                   %
  \committee{#1}}                          %
                                           %
% =====================================================================
% Options for the class
% ---------------------------------------------------------------------
                                           %
\DeclareOption{final}{                     % final
  \PassOptionsToClass{\CurrentOption}{article}%
  \renewcommand{\udp@draftmark}{}          % clear "draft"
}                                          %
                                           %
\DeclareOption{times}{                     % times font
  \renewcommand{\udp@font}{times}          %
  \setboolean{udp@timesfont}{true}         % use times font
}                                          %
                                           %
\DeclareOption{oneside}{                   % oneside
  \PassOptionsToClass{\CurrentOption}{article}%
  \setboolean{udp@twoside}{false}          %
  \renewcommand{\udp@sides}{oneside}       %
}                                          %
                                           %
\DeclareOption{twoside}{                   % twoside
  \PassOptionsToClass{\CurrentOption}{article}%
  \PassOptionsToClass{\CurrentOption}{geometry}
  \setboolean{udp@twoside}{true}           %
  \renewcommand{\udp@sides}{twoside}       %
}                                          %
                                           %
\DeclareOption{10pt}{                      % 10pt font size
  \renewcommand{\udp@ptsize}{10pt}         %
}                                          %
                                           %
\DeclareOption{11pt}{                      % 11pt font size
  \renewcommand{\udp@ptsize}{11pt}         %
}                                          %
                                           %
\DeclareOption{12pt}{                      % 12pt font size
  \renewcommand{\udp@ptsize}{12pt}         %
}                                          %
                                           %
\DeclareOption*{                           % unknown options
  \ClassError{udpreport}{                  %
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
\ProcessOptions\relax                      %
                                           %
% ---------------------------------------------------------------------
% Load other packages
% ---------------------------------------------------------------------
                                           %
\LoadClass[\udp@ptsize,\udp@sides]{article} %
                                           %
\RequirePackage{geometry}                  %
\geometry{letterpaper}                     % letter paper
\ifthenelse{\boolean{udp@headers}}{        % check for headers
  \geometry{top=1.275in,bottom=1.275in}    % vertical borders
  \geometry{headheight=15pt}               % head height
}{                                         % no headers
  \geometry{top=0.900in,bottom=1.275in}    % vertical borders
  \geometry{nohead}                        % no headings
}                                          %
\geometry{left=1.750in,right=1.250in}      % horizontal borders
\geometry{marginparwidth=1.0in}            % margin notes width
\geometry{bindingoffset=0.50in}            % offset for bindings
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
\ifthenelse{\boolean{udp@timesfont}}{      % want to use times font?
  \RequirePackage{times}                   %
}{                                         %
}                                          %
                                           %
% =====================================================================
% More declarations
% ---------------------------------------------------------------------
                                           %
% redefine words for spanish babel
                                           %
\addto\captionsspanish{                    %
  \renewcommand{\contentsname}             % table of contents
    {Contenido}                            %
  \renewcommand{\listtablename}            % list of tables
    {Lista de tablas}                      %
  \renewcommand{\listfigurename}           % list of figures
    {Lista de figuras}                     %
  \renewcommand{\refname}                  %
    {Referencias bibliogr\'{a}ficas}       %
  \renewcommand{\bibname}                  %
    {Referencias bibliogr\'{a}ficas}       %
  \renewcommand{\indexname}                %
    {\'{I}ndice general}                   %
  \renewcommand{\tablename}                % name for tables
    {Tabla}                                %
  \renewcommand{\figurename}               % name for figures
    {Figura}                               %
  \renewcommand{\partname}                 %
    {Parte}                                %
  \renewcommand{\chaptername}              % chapter name
    {Cap\'{i}tulo}                         %
  \renewcommand{\appendixname}             % appendix name
    {Anexo}                                %
}                                          %
                                           %
% ---------------------------------------------------------------------
% 2006/01/27 bug fix
% spanish babel fake roman numeral with small caps
% need some work (this is not the best solution)
                                           %
\renewcommand{\es@lsc}[1]{                 % spanish babel
  #1                                       % strange things with roman
%  \typeout{----- es@lsc \showthe#1}        %
}                                          %
                                           %
% =====================================================================
% Actions for the whole document
% ---------------------------------------------------------------------
% some global actions
                                           %
\udp@linespacing                           % line spacing
                                           %
\setcounter{tocdepth}{2}                   % contents depth
\setcounter{secnumdepth}{2}                % section numbering depth
                                           %
\udp@raggedright                           %
                                           %
\setlength{\parindent}{\udp@indent}        % paragraph indent
                                           %
\fancyhf{}                                 % clear header/footer
                                           %
\pagestyle{fancy}                          % default style for pages
                                           %
% =====================================================================
% More declarations
% ---------------------------------------------------------------------
% headers and footers
                                           %
\renewcommand{\headrulewidth}{0.0pt}       %
\renewcommand{\footrulewidth}{0.0pt}       %
                                           %
\newcommand{\udp@mainmatterheaders}{       % headers for mainmatter
  \fancyhf{}                               %
  \ifthenelse{\boolean{udp@twoside}}{      %
    \ifthenelse{\boolean{udp@headers}}{    % two sides printing
      \fancyhead[RO]{\rightmark\ \         % with headers
        \thepage}                          %
      \fancyhead[LE]{\thepage              %
        \ \ \leftmark}                     %
      \fancyfoot[LO,RE]{\udp@draftmark}    %
    }{                                     %
      \fancyfoot[LE,RO]{\thepage}          % no headers
      \fancyfoot[LO,RE]{\udp@draftmark}    %
    }                                      %
  }{                                       %
    \fancyfoot[R]{\thepage}                % one side printing
    \fancyfoot[L]{\udp@draftmark}          %
  }                                        %
}                                          %
                                           %
\fancypagestyle{plain}{                    % redefine plain
  \fancyhead{}                             %
  \ifthenelse{\boolean{udp@twoside}}{      %
    \fancyfoot[L]{\udp@draftmark}          % two sides printing
    \fancyfoot[R]{\thepage}                %
  }{                                       %
    \fancyfoot[L]{\udp@draftmark}          % one side printing
    \fancyfoot[R]{\thepage}                %
  }                                        %
}                                          %
                                           %
% ---------------------------------------------------------------------
% redefine table of contents, figures and tables
% (not really needed but allows some extensions)
                                           %
\renewcommand{\tableofcontents}{           % tableofcontents command
  \section*{\contentsname}                 %
  \@starttoc{toc}                          %
}                                          %
                                           %
% ---------------------------------------------------------------------
                                           %
\renewcommand{\listoffigures}{             % listoffigures command
  \section*{\listfigurename}               %
  \@starttoc{lof}                          %
}                                          %
                                           %
% ---------------------------------------------------------------------
                                           %
\renewcommand{\listoftables}{              % listoftables command
  \section*{\listtablename}                %
  \@starttoc{lot}                          %
}                                          %
                                           %
% ---------------------------------------------------------------------
                                           %
\newcommand{\putbibliography}[1]{          % bibliography
%  \cleardoublepage                         %
  \addcontentsline{toc}{section}           %
    {\bibname}                             %
  \bibliographystyle{udpbook}              % acm style
  \bibliography{#1}                        % biblio db file
}                                          %
                                           %
% ---------------------------------------------------------------------
                                           %
\renewcommand{\cleardoublepage}{           % double page eject
  \clearpage                               %
  \if@twoside                              %
    \ifodd\c@page\else                     %
      \hbox{}                              %
      \thispagestyle{empty}                %
      \newpage                             %
      \if@twocolumn\hbox{}                 %
        \newpage                           %
      \fi                                  %
    \fi                                    %
  \fi                                      %
}                                          %
                                           %
% ---------------------------------------------------------------------
% chapter and section marks
                                           %
\renewcommand{\sectionmark}[1]{            % section mark
  \markright{                              %
%    \ifnum \c@secnumdepth >\z@             %
%      \thesection\                         %
%    \fi                                    %
    #1}                                    % section name
}                                          %
                                           %
% ---------------------------------------------------------------------
                                           %
\let\old@appendix=\appendix                % original appendix
                                           %
\renewcommand{\appendix}{                  %
  \cleardoublepage                         %
  \old@appendix                            %
}                                          %
                                           %
% ---------------------------------------------------------------------
                                           %
\newcommand{\udp@coverpage}[1]{            % cover page
  \vskip 1em                               %
  {\bfseries                               %
    \singlespacing                         %
    \begin{center}                         %
      {\LARGE\@title\par}                  % title
      \vskip 4em                           %
      {\large\@author}                     % author
      \vskip 6em                           %
      #1                                   %
      \vfill\null                          %
      \@date                               % date
    \end{center}                           %
  }                                        %
}                                          %
                                           %
% ---------------------------------------------------------------------
                                           %
\renewenvironment{titlepage}{              % titlepage
  \thispagestyle{empty}                    %
  \begin{center}                           %
    \udp@logo{true}                        % put the logo picture
    \rule[2pt]{\textwidth}{2pt}            % draw an horizontal line
  \end{center}                             %
  \vskip 1em                               %
  {\bfseries                               %
    \singlespacing                         %
    \begin{center}                         %
      {\LARGE\@title\par}                  % title
      \vskip 4em                           %
      {\large\@author}                     % author
      \vskip 6em                           %
    \end{center}                           %
  }                                        %
}{                                         %
  {\bfseries                               %
    \begin{center}                         %
      \vfill\null                          %
      \@date                               % date
    \end{center}                           %
  }                                        %
  \newpage                                 %
  \setcounter{page}{1}                     % page 1 (frontmatter)
}                                          % end{titlepage}
                                           %
% ---------------------------------------------------------------------
                                           %
\renewenvironment{abstract}{               % begin{abstract}
%  \cleardoublepage                         %
  \begin{center}                           %
  {                                        %
    \bfseries                              %
    \Large                                 %
    \udp@abstractname                      %
  }                                        %
  \end{center}                             %
  \addcontentsline{toc}{section}           %
    {\udp@abstractname}                    %
}{                                         %
%  \newpage                                 % end page
  \vskip 3em                               %
}                                          % end{abstract}
                                           %
% ---------------------------------------------------------------------
                                           %
\newenvironment{resumen}{                  % begin{resumen}
%  \cleardoublepage                         %
  \begin{center}                           %
  {                                        %
    \bfseries                              %
    \Large                                 %
    \udp@resumenname                       %
  }                                        %
  \end{center}                             %
  \addcontentsline{toc}{section}           %
    {\udp@resumenname}                     %
}{                                         %
%  \newpage                                 % end page
  \vskip 3em                               %
}                                          % end{resumen}
                                           %
% =====================================================================
% commands at begin and end of document
% ---------------------------------------------------------------------
                                           %
% Check some of the user directives and setup a few things
                                           %
\AtBeginDocument{                          %
  \udp@mainmatterheaders                   %
}                                          %
                                           %
% ---------------------------------------------------------------------
                                           %
\AtEndDocument{                            %
  \clearpage                               %
}                                          %
                                           %
\endinput
