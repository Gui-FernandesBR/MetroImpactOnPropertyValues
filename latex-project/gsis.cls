%% -------------------------------------
%%
%% This is file `gsis.cls', Version 1.0, 2022/06/10
%% This file is part of a Taylor & Francis GSIS LaTeX Template.
%%
%% -------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gsis}
%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{a4paper,oneside,onecolumn,final}
\ProcessOptions
%
\LoadClass[12pt,a4paper]{article}
%
%作者
\RequirePackage{authblk}
% 页面布局
\RequirePackage{geometry,fancyhdr}
\RequirePackage[hang,flushmargin]{footmisc} 
% 数学宏包
\RequirePackage{amsmath,amsfonts,amssymb,amsbsy,amsthm,bm}
% 设置颜色
\RequirePackage{xcolor}
% 图片
\RequirePackage{graphicx,epsfig}
% 表格
\RequirePackage{tabularx,array,booktabs,multirow}
% 图注 表注
\RequirePackage{caption}
\captionsetup{labelsep=space,justification=justified,singlelinecheck=off}
%参考文献
\RequirePackage{natbib}
\setlength{\bibsep}{0pt plus 0.3ex}

% 超链接 hyperref 的设置
\RequirePackage[colorlinks,urlcolor=blue,citecolor=purple]{hyperref}
\urlstyle{same}

% 页面布局
\geometry{top=20.0mm,bottom=20.0mm,left=15mm,right=15mm,headsep=8mm}
\renewcommand*{\baselinestretch}{1.38}
% 浮动环境设置
% 默认情况下, \LaTeX{} 要求每页的文字至少占据 20%,否则该页就只单独放置一个浮动环境,
% 而这通常不是我们想要的, 我们将这个要求降低到 5%.
\renewcommand*{\textfraction}{0.05}
% 有时如果多个浮动环境连续放在一起, \LaTeX{}
% 会将它们分在几个不同页，即使它们可在同一页放
% 得下. 我们可以通过修改 |\topfraction| 和 |\bottomfraction| 分别设置顶端和底端的浮
% 动环境的最大比例.
\renewcommand*{\topfraction}{0.9}
\renewcommand*{\bottomfraction}{0.8}
% 有时\LaTeX{}会把一个浮动环境单独放在一页,
% 我们要求这个环境至少要占据 85% 才能单独放在一页.
% 注意:  |\floatpagefraction| 的数值必须小于 |\topfraction|.
\renewcommand*{\floatpagefraction}{0.85}

%%字体
% uses Times Roman font, so we'll default to Times.
% These three commands make up the entire times.sty package.
\renewcommand{\sfdefault}{phv}
\renewcommand{\rmdefault}{ptm}
\renewcommand{\ttdefault}{pcr}
% enable Times/Palatino main text font
\normalfont\selectfont

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Theorem-like structures %%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsthm}
\newtheoremstyle{gsis}% name
{12pt}% space above
{12pt}% space below
{\itshape}% body font
{}% indent amount 1
{\bfseries}% theorem head font
{.}% punctuation after theorem head
{.5em}% space after theorem head
{}% theorem head spec (can be left empty, meaning `normal')
\theoremstyle{gsis}
\newcounter{theorem}
\setcounter{theorem}{0}
\newtheorem{Theorem}[theorem]{Theorem}

\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \bfseries\itshape
    #1\@addpunct{.}]\ignorespaces
}{\popQED\endtrivlist\@endpefalse}
%
\newtheoremstyle{plain}
  {9pt}{9pt}{\itshape}{}{\bfseries}{.}{0.5em}{}
%
\newtheoremstyle{definition}
  {9pt}{9pt}{}{}{\bfseries}{.}{0.5em}{}
%
\newtheoremstyle{remark}
  {9pt}{9pt}{}{}{\bfseries}{.}{0.5em}{}
%
%%%%%%%%%%%%%%%%%%%%%%%%%% End Theorem-like structures %%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Title commands %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\copyrightyear}[1]{\gdef\@copyrightyear{#1}}
\newcommand{\datereceived}[1]{\gdef\@datereceived{#1}} 
\newcommand{\dateaccepted}[1]{\gdef\@dateaccepted{#1}} 
\newcommand{\datepublished}[1]{\gdef\@datepublished{#1}}
\newcommand{\keywords}[1]{\gdef\@keywords{#1}} 
\newcommand{\Abstract}[1]{\gdef\@Abstract{#1}}

\newcommand{\cright}{%
	\textbf{Copyright:}
	\copyright{} {\@ \the\year} University of São Paulo. %
	% Published by Informa UK limited,trading as Taylor \& Francis Group.\\
	% This is an Open Access article distributed under the terms of the Creative 
	% Commons Attribution License (\url{http://creativecommons.org/licenses/by/4.0/}), 
	% which permits unrestricted use, distribution, and reproduction 
	% in any medium, provided the original work is properly cited. 
	No commercial re-use. See rights and permissions. The author does not allow you to publish this article in any journals or conference, except if you have permission from the author.
}


\fancypagestyle{plain}{
	\renewcommand\headrulewidth{0pt}
	\setlength{\headheight}{14.49998pt}
	\renewcommand\footrulewidth{0pt}
	\setlength{\footskip}{12mm}
	\fancyfoot{}
	\fancyfoot[L]{\footnotesize \cright}}

% Set the title font
\def\titlefont{\fontsize{16}{19}\selectfont\bfseries\raggedright\boldmath}%
% Set the separate between the author and affiliation lines to zero
\setlength{\affilsep}{0em}
% Set the author and affiliation fonts
\renewcommand\Authfont{\normalsize\mdseries\raggedright}
\renewcommand\Affilfont{\footnotesize\mdseries\raggedright}

\def\thanks#1{\begingroup
	\def\protect{\noexpand\protect\noexpand}\xdef\@thanks{\@thanks%
		\protect\footnotetext[\the\c@footnote]{\footnotesize#1}}\endgroup}

\def\@maketitle{
    \thispagestyle{empty}
    \clearpage
	\null
	\let \footnote \@thanks
	{\titlefont{\@title}\par}%
	\vskip 2.2ex 
	{\noindent\sloppy\raggedright\@author \par}
	\vskip 2.2ex	
	{\noindent \textbf{ARTICLE HISTORY}\\
	Received: \@datereceived\\
	Accepted: \@dateaccepted\\
	%Published: \@datepublished
	\par \vskip 2.2ex}
	{\noindent \textbf{KEYWORDS}\\
	\@keywords \\}
	{\noindent \textbf{ABSTRACT}\\
	\@Abstract\\}	
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End Title commands %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Sectioning commands %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Special sections %%%%%
\def\acknowledgments{\subsection*{Acknowledgments}}
\def\endacknowledgments{}

%%%% section aspects %%%%
% all headings bold
% all section headings, ample size, flush left
\def\sectfont{\raggedright\bfseries}
\def\subsectfont{\raggedright\itshape}
\def\subsubsectfont{\raggedright\small\itshape}
\def\append{0}

\def\section{\@startsection{section}{1}{\z@}
	{-2.5ex plus -1ex minus -0.5ex}{1.2ex plus 0.5ex minus 0ex}{\sectfont}} 
\def\subsection{\@startsection{subsection}{2}{\z@}
	{-2.5ex plus -1ex minus -0.5ex}{1.1ex plus 0.1ex minus 0.1ex}{\subsectfont}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}
	{-2.5ex plus -1ex minus -0.5ex}{1.1ex plus 0.1ex}{\subsubsectfont}}
%%%%%%%%%%%%%%%%%%%%%%%%%%% End Sectioning commands %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% end of gsis.cls
