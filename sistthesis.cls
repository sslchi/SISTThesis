%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SIST Template
%% copyright (c) Guanjie Wang, <wangguanjie0@126.com>

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{sistthesis}[2016/11/16 v1.0 SIST G. Wang]

\newif\ifsist@postdoc \sist@postdoctrue
\newif\ifsist@doctor \sist@doctorfalse % 设置学位级别(博士、硕士,默认博士后)
\newif\ifsist@master \sist@masterfalse
\newif\ifsist@thesis \sist@thesisfalse

\DeclareOption{postdoc}{\sist@postdoctrue}
\DeclareOption{doctor}{\sist@doctortrue}
\DeclareOption{master}{\sist@mastertrue}
%将选项传给ctexbook
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}

% terminates the option processing 结束option进程
\ProcessOptions\relax

\LoadClass[a4paper,UTF8,zihao=-4]{ctexbook}

\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm}
\RequirePackage{graphicx,color,CJKfntef,geometry,fancyhdr}

\RequirePackage{hyperref}

\AtEndOfClass{\makeatletter\input{sistthesis.cfg}\makeatother}

\hypersetup{colorlinks=true,linkcolor=blue,citecolor={blue}}

% 页面设置
\geometry{left=30mm,headheight=5mm,headsep=5mm,textheight=237mm,bottom=29mm ,footskip=6mm}
\geometry{a4paper,hcentering,ignoreall,nomarginpar}

%
%\oddsidemargin 1.5 true cm
%\if@twoside
%\evensidemargin 0 true cm
%\else
%\evensidemargin 1.5 true cm
%\fi
%\textheight 21 true cm
%\textwidth 14.5 true cm
%\headheight 5pt
%\parskip 0.5ex plus 0.25ex minus 0.25ex



\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
	\thispagestyle{empty}%
	\hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}


% define classification etc. 定义分类号等
\newcommand{\classification}[1]{\def\value@classification{#1}}
\newcommand{\confidential}[1]{\def\value@confidential{#1}}
\newcommand{\UDC}[1]{\def\value@UDC{#1}} 
\newcommand{\IDnumber}[1]{\def\value@IDnumber{#1}}

\ifsist@master
\sist@thesistrue
\sist@postdocfalse
\def\cndegree{硕\quad 士}
\def\endegree{Master of Science}
\fi

\ifsist@doctor
\sist@thesistrue
\sist@postdocfalse
\def\cndegree{博\quad 士}
\def\endegree{Doctor of Philosophy}
\fi


% define title and author   定义中英文title和author
\renewcommand{\title}[1]{\def\value@cntitle{#1}}
\newcommand{\englishtitle}[1]{\def\value@entitle{#1}}
\newcommand{\setitle}[1]{\def\value@smallentitlea{#1}}
\newcommand{\setitlee}[1]{\def\value@smallentitleb{#1}}
% 作者
\renewcommand{\author}[1]{\def\value@cnauthor{#1}}
\newcommand{\englishauthor}[1]{\def\value@enauthor{#1}}

% 指导教师
\newcommand{\advisor}[1]{\def\value@cnadvisor{#1}}
\newcommand{\englishadvisor}[1]{\def\value@enadvisor{#1}}

\newcommand{\research}[1]{\def\value@cnresearch{#1}}
\newcommand{\englishresearch}[1]{\def\value@enresearch{#1}}

\newcommand{\submitdate}[1]{\def\value@cnsubmitdate{#1}}
\newcommand{\englishsubmitdate}[1]{\def\value@ensubmitdate{#1}}
% define time
\newcommand{\jobbegin}[1]{\def\POST@value@jobbegin{#1}}
\newcommand{\jobend}[1]{\def\POST@value@jobend{#1}}
\newcommand{\reportfinish}[1]{\def\POST@value@reprortfinish{#1}}
\newcommand{\reportsubmit}[1]{\def\value@submitdate{#1}}

% major 二级学科
\newcommand{\major}[1]{\def\value@cnmajor{#1}}
\newcommand{\englishmajor}[1]{\def\value@enmajor{#1}}

% discipline 一级学科
\newcommand{\discipline}[1]{\def\value@cndiscipline{#1}}
\newcommand{\englishdiscipline}[1]{\def\value@endiscipline{#1}}

% 学院
\newcommand{\school}[1]{\def\value@cnschool{#1}}
\newcommand{\englishschool}[1]{\def\value@enschool{#1}}
\newcommand{\institute}[1]{\def\value@institute{#1}}
\newcommand{\address}[1]{\def\value@address{#1}}
% 两端对齐
%\newlength{\SIST@title@width}
%\newcommand{\SIST@put@title}[2][\SIST@title@width]{%
%	\begin{CJKfilltwosides}{#1}#2\end{CJKfilltwosides}}


% 定义下划线的长度级线上内容
\renewcommand{\CJKunderlinecolor}{\color{black}}
\def\SIST@underline[#1]#2{%
	\CJKunderline{\hbox to #1{\hfill#2\hfill}}}
\def\SISTunderline{\@ifnextchar[\SIST@underline\CJKunderline}



% 博士后
\ifsist@postdoc
	% redefine \maketitle
	\renewcommand{\maketitle}{
		\cleardoublepage
		\thispagestyle{empty}
		\begin{center}
			{\songti\zihao{-5} 分类号:~\SISTunderline[100pt]{\value@classification}\hfill 密级:~\SISTunderline[88pt]{\value@confidential}}\\
			\vspace{0.7cm}
			{\songti\zihao{-5}
			U~D~C:~\SISTunderline[100pt]{\value@UDC} \hfill 编号:~\SISTunderline[88pt]{\value@IDnumber} }\\
			\vskip \stretch{5}
			\heiti\zihao{2}\textbf{ \value@institute\\博~士~后~研~究~工~作~报~告}\\ 
			\vskip \stretch{3}
			\heiti\zihao{3} \textbf{\SISTunderline{~\value@cntitle~}}\\
			\vskip \stretch{2}
			\heiti\zihao{-3} \textbf{~\value@cnauthor~}\\
			{\songti\zihao{-3}
			\vskip \stretch{3}
			工作完成日期：\SISTunderline[180pt]{~\POST@value@reprortfinish~}\\
			\vspace{10pt}
			报告提交日期：\SISTunderline[180pt]{~\value@cnsubmitdate~}\\
			\vskip 20pt
			\value@institute（\value@address）\\
			\value@cnsubmitdate
		}
		\end{center}
		}


	\newcommand\makeenglishtitle{%
		\cleardoublepage
		\thispagestyle{empty}
		\begin{center}
            \vspace*{\stretch{1.5}}
			\heiti\zihao{-2} \textbf{\value@cntitle}
			\vskip \stretch{1}
			{\linespread{1.2}\selectfont
				\sf \zihao{-2} \value@entitle\\}
			\vskip\stretch{1}
			{\songti\zihao{4}
				\begin{tabular}{rl}
				\begin{CJKfilltwosides}{11em}博士后姓名\end{CJKfilltwosides}:&\SISTunderline[180pt]{\value@cnauthor}\\ [3mm]
				\begin{CJKfilltwosides}{11em}流动站(一级学科)名称\end{CJKfilltwosides}:&\SISTunderline[180pt]{\value@cndiscipline}\\ [3mm]
				\begin{CJKfilltwosides}{11em}专\hspace{1em}业(二级学科)名称\end{CJKfilltwosides}:&\SISTunderline[180pt]{\value@cnmajor}\\
			\end{tabular}\\
			\vskip \stretch{2}
		\begin{tabular}{rl}
			\begin{CJKfilltwosides}{11em}研究工作起始时间\end{CJKfilltwosides}:&\SISTunderline[180pt]{\POST@value@jobbegin}\\ [3mm]
			\begin{CJKfilltwosides}{11em}研究工作期满时间\end{CJKfilltwosides}:&\SISTunderline[180pt]{\POST@value@jobend}\\
		\end{tabular}
				\vskip \stretch{2}
				\value@institute（\value@address）\\
				\value@cnsubmitdate
				}
		\end{center}
	}
\fi



\ifsist@thesis
\renewcommand{\maketitle}{
	\cleardoublepage
	\thispagestyle{empty}
	\begin{center}
		{\songti\zihao{-5} 分类号:~\SISTunderline[100pt]{\value@classification}\hfill 密级:~\SISTunderline[88pt]{\value@confidential}}\\
		\vspace{0.7cm}
		{\songti\zihao{-5}
			U~D~C:~\SISTunderline[100pt]{\value@UDC} \hfill 学号:~\SISTunderline[88pt]{\value@IDnumber} }\\
		\vspace{2cm}
		{\bfseries\heiti\zihao{2} 上~海~科~技~大~学\\\vspace{2.5ex}\cndegree\quad 学 \quad 位 \quad 论\quad 文}\\ 
		\vspace{1cm}
			\begin{figure}[h]
				\begin{center}
					\includegraphics[width=3cm]{logo.jpg}
				\end{center}
			\end{figure}
		\vspace{1cm}
		{\heiti\zihao{4}
			\begin{tabular}{rl}
				\begin{CJKfilltwosides}{7em}中文论文题目：\end{CJKfilltwosides}&\SISTunderline[300pt]{\value@cntitle}\\ [2mm]
				\begin{CJKfilltwosides}{7em}英文论文题目：\end{CJKfilltwosides}&\SISTunderline[300pt]{\value@smallentitlea}\\ [2mm]
				\begin{CJKfilltwosides}{7em}\end{CJKfilltwosides}&\SISTunderline[300pt]{\value@smallentitleb}\\ [2mm]
			\end{tabular}
			}\\
			\vspace{1cm}
			{\heiti\zihao{4}
			\begin{tabular}{rl}
			\begin{CJKfilltwosides}{6em}作者姓名：\end{CJKfilltwosides}&\SISTunderline[250pt]{\value@cnauthor}\\ [3mm]
			\begin{CJKfilltwosides}{6em}指导教师：\end{CJKfilltwosides}&\SISTunderline[250pt]{\value@cnadvisor}\\ [3mm]
			\begin{CJKfilltwosides}{6em}研究方向：\end{CJKfilltwosides}&\SISTunderline[250pt]{\value@cnresearch}\\ [3mm]
			\begin{CJKfilltwosides}{6em}学科(专业)：\end{CJKfilltwosides}&\SISTunderline[250pt]{\value@cnmajor}\\ [3mm]
			\begin{CJKfilltwosides}{6em}所在学院：\end{CJKfilltwosides}&\SISTunderline[250pt]{\value@cnschool}\\ [3mm]
			\begin{CJKfilltwosides}{6em}提交日期：\end{CJKfilltwosides}&\SISTunderline[250pt]{\value@cnsubmitdate}\\ [3mm]
			\end{tabular}
		}
	\end{center}
}


\newcommand\makeenglishtitle{%
	\cleardoublepage
	\thispagestyle{empty}
	\vspace*{50pt}   
	\begin{center}
		{\linespread{1.2}\selectfont
		\sf \zihao{-1} \value@entitle\\}
		\vspace{1cm}
		\vskip \stretch{1}
		\begin{figure}[h]
			\begin{center}
				\includegraphics[width=3cm]{logo.jpg}
			\end{center}
		\end{figure}
		\vspace{1.5cm}
		{\bfseries \zihao{-2}\value@enauthor}\\
		\vspace{0.5cm}
		{\normalfont \zihao{-3} \value@enschool}\\
		\vspace{2.5ex}
		{\normalfont \zihao{-3} ShanghaiTech University}\\
		\vspace{3.5cm}
		{\it\normalsize \zihao{-4} A thesis submitted for the degree of\\
			\endegree}\\
		\vfill
		\value@ensubmitdate
	\end{center}
}
\fi

%设置页眉页脚
\fancypagestyle{plain}{%
	\fancyhf{}%
	\renewcommand{\headrulewidth}{0pt}%
	\renewcommand{\footrulewidth}{0pt}%
}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[RE]{\small \rightmark}
\fancyhead[LO]{\small \leftmark}
%\fancyhead[LE,RO]{\small ~\thepage~}
\fancyfoot[C]{\small ~\thepage~}


%==================================================================+


% 设置frontmatter区域内容



% 声明
\newenvironment{announce}
{\Nchapter{}}
{}
% 中英文摘要
\newenvironment{abstract}
{\Nchapter{\value@cnabstract}}
{}
\newcommand\keywords[1]{%
	\vspace{2ex}\noindent{\value@cnkeywords} #1}
\newenvironment{englishabstract}
{\Nchapter{\value@enabstract}}
{}
\newcommand\englishkeywords[1]{%
	\vspace{2ex}\noindent{\value@enkeywords} #1}

\renewcommand\tableofcontents{%
	\if@twocolumn
	\@restonecoltrue\onecolumn
	\else
	\@restonecolfalse
	\fi
	\Nchapter{\contentsname}%
	\@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
	\@starttoc{toc}%
	\if@restonecol\twocolumn\fi
}
\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}

\newcommand\Nchapter[1]{%
	\if@mainmatter%
	\@mainmatterfalse%
	\chapter{#1}%
	\@mainmattertrue%
	\else
	\chapter{#1}%
	\fi}

%参考文献
\newenvironment{publications}[1]
{\Nchapter{\value@pub}%
	\@mkboth{\MakeUppercase \value@pub}
	{\MakeUppercase \value@pub}%
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\sloppy
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m}
{\def\@noitemerr
	{\@latex@warning{Empty `publications' environment}}%
	\endlist}

\newenvironment{resume}
{\Nchapter{\value@resume}}
{}
\newenvironment{resumesection}[1]
{{\noindent\normalfont\bfseries #1}
	\list{}{\labelwidth\z@
		\leftmargin 2\ccwd}
	\item\relax}
{\endlist}
\newenvironment{resumelist}[1]
{{\noindent\normalfont\bfseries #1}
	\list{}{\labelwidth\z@
		\leftmargin 4\ccwd
		\itemindent -2\ccwd
		\listparindent\itemindent}
	\item\relax}
{\endlist}

\renewenvironment{thanks}
{\Nchapter{\value@thanks}}
{}
\setcounter{secnumdepth}{4}

\endinput
