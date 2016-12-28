%%
%% This is file `udpletter.cls',
%%
%% The original source files were:
%%
%% --------------------------------------------------------------
%% 
%% It may be distributed and/or modified under the
%% conditions of the GNU Public License, either version xxxx
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.gnu.org/xxxxxxx.txt
%% 
%% --------------------------------------------------------------
%% 
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%% --------------------------------------------------------------
%% 
%
% =====================================================================
% Identification
% ---------------------------------------------------------------------
                                           %
\NeedsTeXFormat{LaTeX2e}[1996/06/01]       % We need LaTeX2e or better
                                           %
\ProvidesClass{udpletter}[2006/01/01 v0.4 LaTeX UDP letter class]
                                           %
% =====================================================================
% Preliminary declarations
% ---------------------------------------------------------------------
                                           %
\RequirePackage{udpbase}                   %
                                           %
\newcommand{\udp@Direccion}                %
  {Ejercito 123\\Santiago}                 %
                                           %
\newcommand{\udp@ptsize}{11pt}             % default font size
                                           %
% =====================================================================
% Options for the class
% ---------------------------------------------------------------------
                                           %
\DeclareOption{letterpaper}{               %
  \setlength\paperheight{11in}             %
  \setlength\paperwidth{8.5in}             %
}                                          %
                                           %
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
                                           %
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
%
                                           %
% =====================================================================
% Process options
% ---------------------------------------------------------------------
                                           %
\ExecuteOptions{letterpaper,oneside,final}
\ProcessOptions
                                           %
% ---------------------------------------------------------------------
% Load other packages
% ---------------------------------------------------------------------
                                           %
\LoadClass[\udp@ptsize]{letter}            % this class is base on letter
                                           %
\RequirePackage{setspace}                  %
\RequirePackage{graphicx}                  %
\RequirePackage{epsfig}                    % for eps pictures
                                           %
\newlength{\udp@HH}                        % header height
\newlength{\udp@HS}                        % header separation
\newlength{\udp@TOP}                       % topmargin
\setlength{\udp@HS}{20pt}                  %
\setlength{\udp@HH}{1.394in}               %
\setlength{\udp@TOP}{\udp@HH}              %
\addtolength{\udp@TOP}{\udp@HS}            %
\addtolength{\udp@TOP}{.5in}               %
                                           %
\RequirePackage{geometry}                  %
\geometry{letterpaper}                     % letter paper
\geometry{headheight=\udp@HH}              % head height
\geometry{headsep=\udp@HS}                 % head height
\geometry{top=\udp@TOP}                    % top vertical borders
\geometry{bottom=1.275in}                  % bottom vertical borders
                                           %
\geometry{left=1.750in,right=1.250in}      % horizontal borders
\geometry{marginparwidth=0.0in}            % margin notes width
\geometry{bindingoffset=0.00in}            % no offset for bindings
                                           %
% -----------------------------------------------------------------------------
%
%\geometry{top=0.700in,bottom=1.275in}      % vertical borders
%\geometry{headheight=1.5in}                % head height
%\geometry{nohead}                         % no headings
                                           %
%\geometry{left=1.750in,right=1.250in}      % horizontal borders
                                           %
% ---------------------------------------------------------------------
                                           %
\renewcommand\ps@empty{                    % empty page style
  \let\@oddhead\@empty                     %
  \let\@evenhead\@empty                    %
  \let\@oddfoot\@empty                     %
  \let\@evenfoot\@empty                    %
}                                          %
                                           %
\renewcommand\ps@plain{                    % plain page style
  \let\@oddhead\@empty                     %
  \def\@oddfoot{\normalfont\hfil\thepage\hfil}%
  \def\@evenfoot{\normalfont\hfil\thepage\hfil}%
}                                          %
                                           %
\renewcommand\ps@headings{                 % headings page style
  \let\@oddfoot\@empty                     %
  \def\@oddhead{\slshape\headtoname{}      %
    \ignorespaces\toname                   %
    \hfil \@date                           %
    \hfil \pagename{} \thepage}}           %
                                           %
\renewcommand\ps@firstpage{                % first page style
  \setlength\unitlength{1mm}               %
  \let\@oddfoot\@empty                     %
  \let\@evenfoot\@empty                    %
  \def \@oddhead{                          %
    \begin{picture}(69.0,25.4)(0,0)        %
      \put(0,10.0){\epsfbox{udplogo}}      % logo UDP
      \put(0,5.0)                          %
        {\makebox(69.0,3.0){\bfseries \udp@Facultad}}
      \put(0,0)                            %
        {\makebox(69.0,3.0){\bfseries \udp@Escuela}}
    \end{picture}                          %
  }                                        %
  \let\@evenhead\@oddhead                  %
}                                          %
                                           %
% ---------------------------------------------------------------------
                                           %
%\newcommand*{\name}[1]{\def\fromname{#1}}
%\newcommand*{\signature}[1]{\def\fromsig{#1}}
%\newcommand*{\address}[1]{\def\fromaddress{#1}}
%\newcommand*{\location}[1]{\def\fromlocation{#1}}
%\newcommand*{\telephone}[1]{\def\telephonenum{#1}}
                                           %
% ---------------------------------------------------------------------
                                           %
%
\newcommand*{\fecha}[1]{\date{#1}}
\renewcommand*{\cc}[1]{\def\udp@cc{#1}}
\renewcommand*{\encl}[1]{\def\udp@encl{#1}}
%
%
\newcommand*{\udp@inccc}[1]{%
  \par\noindent
  \parbox[t]{\textwidth}{%
    \@hangfrom{\normalfont cc: }%
    \ignorespaces #1\\archivo\strut}\par}
%
                                           %
\newcommand*{\udp@incencl}[1]{%
  \par\noindent
  \parbox[t]{\textwidth}{%
    \@hangfrom{\normalfont adj: }%
    \ignorespaces #1\strut}\par}
%
                                           %
\long\def\@processtofields#1{%
  \@toprocfieldsx #1\\@@@%
  \ifx\toaddress\@empty
  \else
    \@toprocfieldsy #1@@@%
  \fi}
                                           %
\long\def\@toprocfieldsx #1\\#2@@@{\def\toname{#1}\def\toaddress{#2}}
\long\def\@toprocfieldsy #1\\#2@@@{\def\toaddress{#2}}
                                           %
\long\def\@processfromfields#1{%
  \@fromprocfieldsx #1\\@@@%
  \ifx\fromaddress\@empty
  \else
    \@fromprocfieldsy #1@@@%
  \fi}
                                           %
\long\def\@fromprocfieldsx #1\\#2@@@{\def\fromname{#1}\def\fromaddress{#2}}
\long\def\@fromprocfieldsy #1\\#2@@@{\def\fromaddress{#2}}
                                           %
\newcommand{\para}[1]
  {\@processtofields{\leavevmode\ignorespaces #1}}

\newcommand{\de}[1]
  {\@processfromfields{\leavevmode\ignorespaces #1}}
                                           %
\newcommand*{\saludo}[1]{\def\udp@saludo{#1}}
                                           %
\newcommand*{\despedida}[1]{\def\udp@despedida{#1}}
                                           %
\renewcommand*{\opening}[1]{               %
  \noindent\ignorespaces\@date             %
  \vskip 2em                               %
  \@hangfrom{\normalfont At.: }            %
    \ignorespaces\toname\\\toaddress\strut %
  \vskip 4em                               %
  \noindent\ignorespaces                   %
  \udp@saludo\par\nobreak                  %
  \doublespacing                           %
}                                          %
                                           %
\renewcommand{\closing}[1]{                %
  \par\nobreak\vspace{\parskip}            %
  \vskip 1em                               %
  \noindent\ignorespaces                   %
  \parbox{\indentedwidth}{\raggedright     %
    \ignorespaces #1                       % \\[6\medskipamount]%
    \vskip 6em                             %
    \fromname                              %
    \strut}                                %
  \vskip 1em                               %
  \udp@inccc{\udp@cc}                      %
  \udp@incencl{\udp@encl}                  %
}                                          %
                                           %
\renewenvironment{letter}{                 %
  \newpage                                 %
  \thispagestyle{firstpage}                % first page style
  \noindent\ignorespaces                   %
  \rule[2pt]{\textwidth}{.1pt}             % draw an horizontal line
  \opening{\udp@saludo}                    %
}{                                         %
  \closing{\udp@despedida}                 %
}                                          %
                                           %
% -----------------------------------------------------------------------------
%
\long\def\@processto#1{%
  \@xproc #1\\@@@%
  \ifx\toaddress\@empty
  \else
    \@yproc #1@@@%
  \fi}
\long\def\@xproc #1\\#2@@@{\def\toname{#1}\def\toaddress{#2}}
\long\def\@yproc #1\\#2@@@{\def\toaddress{#2}}
%
%
%
                                           %
% -----------------------------------------------------------------------------
                                           %
\name{}
\signature{}
\address{}
\location{}
\telephone{}
                                           %
\parindent=30pt                            %
                                           %
\@lowpenalty   51                          %
\@medpenalty  151                          %
\@highpenalty 301                          %
                                           %
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
                                           %
%\setlength\columnsep{10\p@}
%\setlength\columnseprule{0\p@}
                                           %
\pagestyle{plain}
\pagenumbering{arabic}
                                           %
%\raggedbottom                              %
                                           %
\def\@texttop{\ifnum\c@page=1\vskip \z@ plus.00006fil\relax\fi}
                                           %
\@twocolumnfalse
\onecolumn
                                           %
%\doublespacing
%\onehalfspacing

%\parskip=3ex
%\global\topskip=0pt
%\global\headsep=0pt
                                           %
\AtBeginDocument                           %
  {\begin{letter}}                         %
                                           %
\AtEndDocument                             %
  {\end{letter}}                           %
                                           %
                                           %
\endinput
%%
%% End of file `udpletter.cls'.
