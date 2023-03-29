%%
%% This is file `cumtthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% cumtthesis.dtx    (with options: `cls')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2005-2015 by Xiao Lishun <xiaolishun@cumt.edn.cn>
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.0
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.0 or later is part of all distributions of LaTeX
%% version 2004/10/01 or later.
%% 
%% To produce the documentation run the original source files ending with `.dtx'
%% through LaTeX.

%% Verison
%% 
%% 20xx/xx/xx v1.0 
%% ?
%% 
%% 2015/08/04 v2.0
%% 肖立顺
%% https://github.com/xiaolishun/cumtthesis/tree/%% f846fc4b00fb785987a70bb401659c2ca34aa5cb
%% 
%% 2017/05/29 v3.0 
%% 高峰
%% https://github.com/RayYoung000/GraduationThesis
%% 
%% 2021/05/18 v4.0
%% 陆玺文
%% https://github.com/Xiwen-Lu/cumtthesis
%% 
%% 2022/05/03 v5.0
%% Lighter207
%% https://github.com/Lighter207/CUMT-undergraduate-latex-template2022
%% 
%% 2023/03/04 v6.0
%% 胡钧耀
%% https://github.com/JunyaoHu/CUMT-undergraduate-latex-template2023
%% 

\NeedsTeXFormat{LaTeX2e}[2004/10/01]
\ProvidesClass{cumtthesis}[China University of Mining and Technology Thesis Template]
% 检查预印版\终稿\盲审\检查格式
% check the preprint, final, blindreview, check
% 只要读取到了 \iffoo，就等价于读到了 if，并且缺省值是 flase
% \iffoo A \else B \fi
% 就会执行 B
% \footrue \iffoo A \else B \fi
% 就会执行 A
% \foofalse \iffoo A \else B \fi
% 就会执行 B

\newif\ifcumt@preprint
\newif\ifcumt@final
\newif\ifcumt@blindreview
\newif\ifcumt@check
\cumt@preprinttrue
\cumt@finalfalse
\cumt@blindreviewfalse
\cumt@checkfalse

\DeclareOption{preprint}{
    \cumt@preprinttrue
    \cumt@finalfalse
}
\DeclareOption{final}{
    \cumt@finaltrue
    \cumt@preprintfalse
}
\DeclareOption{blindreview}{
    \cumt@blindreviewtrue
}
\DeclareOption{check}{
    \cumt@checktrue
}

% reference type: authoryear, numbers
\newif\ifcumt@authoryear
\newif\ifcumt@numbers
\cumt@authoryeartrue
\cumt@numbersfalse
\DeclareOption{authoryear}{
    \global
    \cumt@authoryeartrue
    \cumt@numbersfalse
}
\DeclareOption{numbers}{
    \global
    \cumt@numberstrue
    \cumt@authoryearfalse
}

% 论文学位类型判断
% the type of this thesis: BD, Master Degree or PhD
\newif\ifcumt@BD
\newif\ifcumt@MD
\newif\ifcumt@PhD
\cumt@BDtrue
\cumt@MDfalse
\cumt@PhDfalse
\DeclareOption{BD}{
    \cumt@BDtrue
    \cumt@MDfalse
    \cumt@PhDfalse
}
\DeclareOption{MD}{
    \cumt@BDfalse
    \cumt@MDtrue
    \cumt@PhDfalse
}
\DeclareOption{PhD}{
    \cumt@BDfalse
    \cumt@MDfalse
    \cumt@PhDtrue
}

% 非中文字符使用新罗马字体
% the no-chinese character using new times roman
\DeclareOption{times}{
    \IfFileExists{txfonts.sty}{
        \AtEndOfClass{
            \RequirePackage{txfonts}
            \gdef\ttdefault{cmtt}
            \let\iint\relax
            \let\iiint\relax
            \let\iiiint\relax
            \let\idotsint\relax
            \let\openbox\relax
        }
    }{
        \RequirePackage{mathptmx}
    }
}
\DeclareOption*{
    \PassOptionsToClass{\CurrentOption}{ctexbook}
}
% TODO: 默认选项的意思?
\ExecuteOptions{preprint,numbers,MD}
\ProcessOptions\relax
%start the thesis
\LoadClass[UTF8,space=auto,autoindent=true,scheme=plain]{ctexbook} %TODO:book
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{ifpdf}
\RequirePackage{ifxetex}
\ifpdf
    \renewcommand{\sfdefault}{phv}
    \renewcommand{\rmdefault}{ptm}
    \renewcommand{\ttdefault}{pcr}
\else
    \ifxetex
        \RequirePackage{fontspec}
        \setmainfont[Ligatures=TeX]{Times New Roman}
    \fi
\fi
\let\latexcontentsline\contentsline
\DeclareGraphicsExtensions{.eps,.mps,.pdf,.jpg,.png,.gif}
% 链接\超链接\引用参考文献在文中引用颜色:
% 预印版为蓝色 @refcolor{blue}
% 终稿版为黑色 @refcolor{black}
% 新章开始:
% TODO: 每章都从奇数页开始? openright
\ifcumt@preprint
    \xdef\cumt@refcolor{blue}
    \@openrightfalse
    \overfullrule5\p@
\else
    \ifcumt@final
        \xdef\cumt@refcolor{black}
        \@openrighttrue
        \overfullrule\z@
    \fi
\fi
\RequirePackage{hyperref}
\hypersetup{
    unicode=true,
    bookmarksnumbered=true,
    bookmarksopen=true,
    bookmarksopenlevel=3,
    breaklinks=true,
    plainpages=false,
    pdfborder=0 0 0,
    pdfstartview=FitH,
    colorlinks=true,
    linkcolor=\cumt@refcolor,
    urlcolor=\cumt@refcolor,
    citecolor=\cumt@refcolor
}
\urlstyle{same}
\RequirePackage{array,booktabs,longtable}
\RequirePackage{tabu}
\oddsidemargin=17\p@
\evensidemargin=\oddsidemargin
\topmargin=-17\p@
\headheight=12\p@
\headsep=19\p@
\textheight=674\p@
\textwidth=416\p@
\marginparsep=7\p@
\marginparwidth=98\p@
\footskip=30\p@
\marginparpush=7\p@
\hoffset=\z@
\voffset=\z@
\paperwidth=597\p@
\paperheight=845\p@
\RequirePackage{amsfonts,amssymb,amsmath,amsthm}
\RequirePackage{fancybox}
\RequirePackage{makeidx}
% 
\input{cumtthesis.cfg}
\graphicspath{{figures/}}

% empty：无页脚、页眉。
% plain：无页眉，页脚只包含一个居中的页码。
% headings：无页脚，页眉包含章/节名称与页码。
% myheadings：无页脚，页眉包含页码和用户定义的信息。
\def\ps@cumt@empty{
    \let\@oddhead\@empty
    \let\@evenhead\@empty
    \let\@oddfoot\@empty
    \let\@evenfoot\@empty
}

\def\ps@cumt@plain{
    \let\@oddhead\@empty
    \let\@evenhead\@empty
    % 定义包含页码的页脚
    \def\@oddfoot{
        \hfill
        \zihao{-5}
        % 页码数
        \thepage 
        \hfill
    }
    % 左右页脚一样
    \let\@evenfoot=\@oddfoot
}

% \leftmark  当前的章名 1   chapter
% TODO: 显示空白 虽然不影响模板 \rightmark 当前的节名 1.1 section
\def\ps@cumt@headings{
    % 宽度倍数不能为1 否则编译出现溢出警告，pdf出现黑块
    % 奇数页(右)显示
    \def\@oddhead{
        \vbox to\headheight{
            \hb@xt@.99\textwidth{
                \hfill
                \zihao{-5}
                \songti
                \leftmark
                \hfill
            }
            \vskip5\p@\hbox{\vrule width.99\textwidth height.4\p@ depth\z@}
        }
    }
    % 偶数页(左)显示学位和论文类型
    \def\@evenhead{
        \vbox to\headheight{
            \hb@xt@.99\textwidth{
                \hfill
                \zihao{-5}
                \songti
                \cumt@xueweileixing\cumt@lunwenleixing
                \hfill
            }
            \vskip5\p@\hbox{\vrule width.99\textwidth height.4\p@ depth\z@}
        }
    }
    \def\@oddfoot{\hfil\zihao{-5}\thepage\hfil}
    \let\@evenfoot=\@oddfoot
}

% \frontmatter：关闭章节序号， 页码使用罗马数字;
% \mainmatter：开启章节序号计数，重置页码，页码使用阿拉伯数字;
% \appendix：重置章节序号计数， 章节序号使用字母，对页码没有影响；
% \backmatter：关闭章节序号，对页码没有影响。

\renewcommand\frontmatter{%
    \clearpage
    \@mainmatterfalse
    \pagenumbering{Roman}
    \pagestyle{cumt@empty}
    \setlength{\baselineskip}{21\p@}
    \def\baselinestretch{1.4}
    \sloppy
}

\renewcommand\mainmatter{
    \ifcumt@final
        \cleardoublepage
    \else
        \clearpage
    \fi
    \@mainmattertrue
    \pagenumbering{arabic}
    \pagestyle{cumt@headings}
    \zihao{-4}
    %\setlength{\baselineskip}{20\p@}
    \setlength{\baselineskip}{20pt}
    %\setlength{\parskip}{0\baselineskip}
    %set paragraph skip is 0pt
    \setlength{\parskip}{0pt}
    \def\baselinestretch{1.4}
    \sloppy
}
\renewcommand\backmatter{
    \clearpage
    \@mainmatterfalse
    \pagestyle{cumt@plain}
    \setlength{\baselineskip}{21\p@}
    \def\baselinestretch{1.4}
    \sloppy
}
\let\cumt@A\cleardoublepage
\newcommand{\cumt@clearemptydoublepage}{
    \let\cleardoublepage\cumt@clearemptydoublepage
    \clearpage{\pagestyle{cumt@empty}\cumt@A}
}
% 选择学位类型\论文类型对应文字模板
% \def：局部定义，定义时不展开?；
% \edef：局部定义，定义时完全展开?；
% \gdef：相当于 \global\def；
% \xdef：相当于 \global\edef。

\gdef\cumt@xueweileixing{\cumt@benke@name}
\gdef\cumt@lunwenleixing{\cumt@biyelunwen@name}
\xdef\cumt@thesis{Thesis}

% TODO: 这个if不知道为什么一直不行 \ifcumt@BD 有问题 后两者没有问题
% \ifcumt@BD
%     \gdef\cumt@xueweileixing{\cumt@benke@name}
%     \gdef\cumt@lunwenleixing{\cumt@biyelunwen@name}
%     \xdef\cumt@thesis{BD-Thesis}
% \else
%     \ifcumt@MD
%         \gdef\cumt@xueweileixing{\cumt@shuoshi@name}
%         \gdef\cumt@lunwenleixing{\cumt@xueweilunwen@name}
%         \xdef\cumt@thesis{Thesis}
%     \else
%         \ifcumt@PhD
%             \gdef\cumt@xueweileixing{\cumt@boshi@name}
%             \gdef\cumt@lunwenleixing{\cumt@xueweilunwen@name}
%             \xdef\cumt@thesis{Dissertation}
%     \fi
% \fi

% 中文论文题目 @@不能去
\def\CLunWenTiMu{
    \@ifnextchar[{\cumt@@clunwentimu}{\cumt@@clunwentimu[]}
}
\def\cumt@@clunwentimu[#1]#2{
    \def\cumt@clunwentimu@width{#1}
    \gdef\cumt@clunwentimu{#2}
    \hypersetup{pdftitle={\cumt@clunwentimu}}
}
\let\cumt@clunwentimu@width\@empty
\let\cumt@clunwentimu\@empty

% 英文论文题目
\def\ELunWenTiMu{
    \@ifnextchar[{\cumt@@elunwentimu}{\cumt@@elunwentimu[]}
}
\def\cumt@@elunwentimu[#1]#2{
    \def\cumt@elunwentimu@width{#1}
    \gdef\cumt@elunwentimu{#2}
    \hypersetup{pdfkeywords={\cumt@elunwentimu}}
}
\let\cumt@elunwentimu@width\@empty
\let\cumt@elunwentimu\@empty

% 作者
\def\ZuoZhe#1{
    \def\cumt@zuozhe{
        \ifcumt@blindreview
            [盲审]
        \else#1\hypersetup{pdfauthor={#1}}
        \fi
    }
}
\let\cumt@zuozhe\@empty

\def\XueHao#1{
    \def\cumt@xuehao{
        \ifcumt@blindreview
            [盲审]
        \else
            #1
        \fi
    }
}
\let\cumt@xuehao\@empty

% 导师和职称
\def\DaoShi[#1]#2{
    \def\cumt@daoshizhicheng{
        \ifcumt@blindreview
            [盲审]
        \else
            #1
        \fi
    }
    \def\cumt@daoshi{
        \ifcumt@blindreview
            [盲审]
        \else 
            #2
        \fi
    }
}
\let\cumt@daoshi\@empty
\let\cumt@daoshizhicheng\@empty

% 第二导师
\def\DiErDaoShi[#1]#2{
    \def\cumt@dierdaoshizhicheng{
        \ifcumt@blindreview
            [盲审]
        \else
            #1
        \fi
    }
    \def\cumt@dierdaoshi{
        \ifcumt@blindreview
            [盲审]
        \else
            #2
        \fi
        }
    \def\@sep{,\space}
}
\let\cumt@dierdaoshi\@empty
\let\@sep\@empty
\let\cumt@dierdaoshizhicheng\@empty

% 毕业年月
\def\BiYeShiJian#1#2{
    \def\cumt@biyeshijiannian{#1}
    \def\cumt@biyeshijianyue{#2}
}
\def\cumt@biyeshijiannian{\the\year}
\def\cumt@biyeshijianyue{\the\month}
\def\cumt@year{\zhdigits{\cumt@biyeshijiannian}}
\def\cumt@month{\zhnumber{\cumt@biyeshijianyue}}

% 毕业学校
\def\BiYeXueXiao#1{
    \def\cumt@biyexuexiao{#1}
}
\let\cumt@biyexuexiao\@empty

% 制作封面命令(首页\第二页\授权声明\认定书\原创声明等)
% make the cover
\newcommand{\makecover}{
    \phantomsection
    \pdfbookmark[-1]{\cumt@clunwentimu}{clunwentimu}
    \tolerance=10000
    \hbadness=10000
    \vbadness=10000
    \begin{titlepage}
        \pagestyle{cumt@empty}
        % 首页
        \cumt@first@titlepage
        % 第二页
        \cumt@coverboxed
        % 原创性声明
        \cumt@declaration
        % 诚信承诺书+使用授权声明
        \cumt@commitmentAndAuthorization
        % 授权声明
        % \cumt@authorization
        % 认定书
        % \cumt@authenticate
    \end{titlepage}

    \ifcumt@final
        \cleardoublepage
    \else
        \clearpage
    \fi
    \pagestyle{cumt@plain}
    \pagenumbering{Roman}
}

% 封面第一页 首页
\newcommand{\cumt@first@titlepage}{
    % 矿大校徽标题
    \begin{figure}
        \includegraphics[scale=0.175]{style/logo_and_name.png}\\
    \end{figure}
    % 居中的中英文标题
    \begin{center}
        % 学位类型和论文类型字样
        \vskip2\p@\bgroup\zihao{-2}\songti
        \cumt@xueweileixing\cumt@lunwenleixing
        \egroup\par\vskip2.5cm
        % 中文字样
        \parbox[t]{\cumt@clunwentimu@width}{
            \zihao{2}\bf\boldmath\centering
            % 中文题目
            \cumt@clunwentimu
        }
        \par\bigskip\bigskip
        % 英文字样
        \parbox[t]{\cumt@elunwentimu@width}{
            \zihao{2}\centering
            % 英文题目
            \cumt@elunwentimu
        }\par
    \end{center}
    \vfill
    % 作者导师名称
    \begin{table}
        \centering
        \zihao{-3}
        \begin{tabular}{lcr}
            \makebox[3em][s]{\cumt@zuozhe@name}: & \cumt@zuozhe & \\
            \makebox[3em][s]{\cumt@daoshi@name}: & \cumt@daoshi & \cumt@daoshizhicheng\\
        \end{tabular}
    \end{table}
    \vfill
    % 学校和毕业年月
    \begin{center}
        \kaishu\zihao{-2}
        \cumt@biyexuexiao
        \par
        \cumt@year\cumt@biyeshijiannian@name\cumt@month\cumt@biyeshijianyue@name
    \end{center}
}


\def\cstostr#1{
    \expandafter\@gobble\detokenize\expandafter{\string#1}
}

\def\ZhongTuFenLeiHao#1{\def\cumt@zhongtufenleihao{#1}}
\def\UDC#1{\def\cumt@udc{#1}}
\def\XueXiaoDaiMa#1{\def\cumt@xuexiaodaima{#1}}
\def\MiJi#1{\def\cumt@miji{#1}}
\def\XueKeZhuanYe#1{\def\cumt@xuekezhuanye{#1}}
\def\XueWeiLeiBie#1{\def\cumt@xueweileibie{#1}}
\def\DaBianWeiYuanHuiZhuXi#1{\def\cumt@dabianweiyuanhuizhuxi{#1}}
\def\PeiYangDanWei#1{\def\cumt@peiyangdanwei{#1}}
\def\YanJiuFangXiang#1{\def\cumt@yanjiufangxiang{#1}}
\def\PingYueRen#1{\def\cumt@pingyueren{#1}}
\let\cumt@zhongtufenleihao\@empty
\let\cumt@udc\@empty
\let\cumt@xuexiaodaima\@empty
\let\cumt@miji\@empty
\let\cumt@xuekezhuanye\@empty
\let\cumt@xueweileibie\@empty
\let\cumt@dabianweiyuanhuizhuxi\@empty
\let\cumt@peiyangdanwei\@empty
\let\cumt@yanjiufangxiang\@empty
\let\cumt@pingyueren\@empty

% 使用STXINGKA.TTF华文行楷字体
\setCJKfamilyfont{hwxk}{STXINGKA.TTF}
\newcommand{\huawenxingkai}{\CJKfamily{hwxk}}

% 封面 第二页 框页 生成命令
\newcommand\cumt@coverboxed{
    \ifcumt@final
        \cleardoublepage
    \else  
        \clearpage
    \fi
    % TODO: 为框页的边框设置页面新大小
    \newgeometry{centering, textwidth=16.8cm, top=2.54cm, bottom=2.54cm}
    \thisfancypage{}{
        % \fboxrule 粗细
        \setlength{\fboxrule}{.6\p@}
        \fbox
    }{}
    \begingroup
        \centering\zihao{4}\hspace{-1em}
        \par\vskip1cm
        % 华文行楷 毕业学校
        \zihao{1}\huawenxingkai
        \cumt@biyexuexiao
        \par\vskip.5cm
        % 隶书 学历和论文类型
        \begingroup
            \zihao{1}\lishu
            \cumt@xueweileixing\cumt@lunwenleixing
        \endgroup
        \par\vskip2.5cm
        % 中英文论文题目
        \begingroup
            \parbox[t]{\cumt@clunwentimu@width}{\zihao{2}\bf\boldmath\centering\cumt@clunwentimu}\par
            \bigskip\bigskip
            \parbox[t]{\cumt@elunwentimu@width}{\zihao{2}\centering\cumt@elunwentimu}\par
        \endgroup
        \par\vskip2.5cm
        % 个人相关信息
        \vfill\heiti
        \Large 姓 \quad 名\ \ \underline{\makebox[140pt]{\cumt@zuozhe}} \quad 学 \quad 号\ \ \underline{\makebox[140pt]{\cumt@xuehao}}\\
        \Large 导 \quad 师\ \ \underline{\makebox[140pt]{\cumt@daoshi}} \quad 职 \quad 称\ \ \underline{\makebox[140pt]{\cumt@daoshizhicheng}}\\
        \Large 学 \quad 院\ \ \underline{\makebox[140pt]{\cumt@peiyangdanwei}} \quad 专 \quad 业\ \ \underline{\makebox[140pt]{\cumt@xuekezhuanye}}\\
        % TODO: 位置调不动
        % 毕业年月
        \vfill
        \begin{center}
            \cumt@year \cumt@biyeshijiannian@name \cumt@month \cumt@biyeshijianyue@name
        \end{center}
    \endgroup
    % 还原后面的页面大小
    \restoregeometry
}

% 为了使得后面承诺书和授权声明在一页中 
\newif\ifinapage
\inapagefalse

% 正文前的标题设置
\def\make@title@cover#1{
    \ifinapage
        \relax
    \else
        \ifcumt@final
            \cleardoublepage
        \else
            \clearpage
        \fi
    \fi
    % PDF书签
    \pdfbookmark[0]{#1}{\cstostr{#1}}
    % 黑体小二
    \parindent\z@\parbox[t]{\textwidth}{
        \bfseries\heiti\zihao{-2}\centering
        #1
    }
    \par\vskip1.5em\parindent2em
}

% 原创性声明命令
\newcommand{\cumt@declaration}{
    % 原创性声明标题
    \make@title@cover{\cumt@biyeshejideclaration@title}
    % 原创性声明正文
    \zihao{-4}\kaishu\parindent2em
    \cumt@biyeshejideclaration@neirong
    \par\vskip40\p@
    % 原创性声明签名
    \hb@xt@\textwidth{
        \zihao{-4}\songti\hfill
        \cumt@xueweilunwenzuozheqianming@name
        \hskip10em
    }
    % 原创性声明日期
    \hb@xt@\textwidth{
        \zihao{-4}\songti\hfill
        \cumt@qianmingriqi
        \hskip4em
    }
    % TODO: delete it
    % 原创性声明标题生成
    % 星号是一个不编号也不编目的小节
    % \chapter*{\cumt@declaration@title}\vskip-6\p@
    % 将不编号也不编目的小节加入目录
    % \phantomsection
    % \addcontentsline{toe}{chapter}{Declaration of \cumt@thesis{} Originality}
}

% 诚信承诺书+使用授权声明 
\newcommand{\cumt@commitmentAndAuthorization}{
    % 诚信承诺书标题
    \make@title@cover{\cumt@commitment@title}
    % 诚信承诺书正文
    \zihao{-4}\kaishu
    \cumt@commitment@neirong
    \par\vskip40\p@
    % 诚信承诺书签名
    \hb@xt@\textwidth{
        \zihao{-4}\songti\hfill
        \cumt@xueweilunwenzuozheqianming@name
        \hskip10em
    }
    % 诚信承诺书日期
    \hb@xt@\textwidth{
        \zihao{-4}\songti\hfill
        \cumt@qianmingriqi
        \hskip4em
    }
    \par\vskip120\p@
    % 使得诚信承诺书+使用授权声明在一页呈现
    \inapagetrue
    % 授权声明标题
    \make@title@cover{\cumt@biyeshejiauthorization@title}
    % 学位论文使用授权声明正文
    \zihao{-4}\kaishu
    \cumt@biyeshejiauthorization@neirong
    % 学位论文使用授权声明签名
    \vskip40\p@\parindent\z@\songti
    \hb@xt@.66\textwidth{
        \hfill
        \cumt@zuozheqianming@name
        \hskip10em
        \hfill
        \cumt@daoshiqianming@name
    }
    \hb@xt@\textwidth{
        \hfill
        \cumt@qianmingriqi
        \hfill
        \cumt@qianmingriqi
        \hfill
    }
    % 还原设置
    \inapagefalse
}

% 学位论文使用授权声明
% \newcommand{\cumt@authorization}{
%     % 学位论文使用授权声明标题
%     \make@title@cover{\cumt@authorization@title}
%     % 学位论文使用授权声明正文
%     \zihao{-4}\kaishu
%     \cumt@authorization@neirong
%     % 学位论文使用授权声明签名
%     \vskip40\p@\parindent\z@\songti
%     \hb@xt@.66\textwidth{
%         \hfill
%         \cumt@zuozheqianming@name
%         \hskip4em
%         \hfill
%         \cumt@daoshiqianming@name
%     }
%     \hb@xt@\textwidth{
%         \hfill
%         \cumt@qianmingriqi
%         \hfill
%         \cumt@qianmingriqi
%         \hfill
%     }
% }

% 论文审阅认定书
% \newcommand{\cumt@authenticate}{
%     \make@title@cover{\cumt@authenticate@title}
%     \bgroup\parindent\z@\parbox[t]{\textwidth}{
%          \renewcommand\baselinestretch{2}\parindent2em\kaishu\zihao{4}
%          \cumt@authenticate@neirong}\egroup
%     \par\vskip40\p@
%     \hb@xt@\textwidth{\songti\hfill\cumt@daoshiqianming@name\hskip3.5em}
%     \hb@xt@\textwidth{\songti\hfill\cumt@qianmingriqi}
% }

% 致谢
\def\acknowledgements{
    \make@title@cover{\cumt@acknowledgements@title}
    \pagestyle{cumt@empty}
    \zihao{-4}\kaishu
    \parindent2em
}
% 正文在 frontmatter.tex 编辑
\def\endacknowledgements{
    \clearpage
    \cleardoublepage
}

% 中文摘要
\def\cabstract{
    \ifcumt@final\cleardoublepage\else\clearpage\fi
    \chapter*{\abstractname}
    \@mkboth{\abstractname}{\abstractname}
    \setcounter{page}{1}
    \zihao{-4}\songti\parindent2em
    \def\CKeyWords##1{\par\bigskip\parindent\z@
        \sbox\@tempboxa{\bfseries\songti\cumt@ckeywords@name:\hskip8\p@}
        \@tempdima=\wd\@tempboxa
        \hangindent\@tempdima\noindent
        \bgroup\bfseries\songti\cumt@ckeywords@name:\space\egroup
        ##1}}
\def\endcabstract{
    \clearpage
}

% 英文摘要
\def\eabstract{
    \ifcumt@final\cleardoublepage\else\clearpage\fi
    \phantomsection
    \addcontentsline{toe}{chapter}{Abstract}
    \parindent\z@
    % arial加粗总是失败，先使用times new roman
    \parbox[t]{\textwidth}{
        \bfseries
        % \sffamily
        \zihao{-2}
        \centering
        Abstract
        }
    \par\vskip1.7em    
    \@mkboth{Abstract}{Abstract}
    \zihao{-4}\parindent2em
    \def\EKeyWords##1{\par\bigskip\parindent\z@
        \sbox\@tempboxa{\bfseries Keywords:\hskip8\p@}
        \@tempdima=\wd\@tempboxa
        \hangindent\@tempdima\noindent
        \bgroup\bfseries Keywords:\space\egroup
        ##1}}
\def\endeabstract{
    \clearpage
}

% \ifcumt@PhD
%     \def\exabstract{
%         \ifcumt@final\cleardoublepage\else\clearpage\fi
%         \phantomsection
%         \addcontentsline{toe}{chapter}{Extended Abstract}
%         \parindent\z@
%         \parbox[t]{\textwidth}{
%             \bfseries
%             % \sffamily
%             \zihao{-2}
%             \centering
%             Extended Abstract
%         }
%         \par\vskip1.7em
%         \@mkboth{Extended Abstract}{Extended Abstract}
%         \zihao{-4}\parindent2em
%         \def\ExKeyWords##1{\par\bigskip\parindent\z@
%             \sbox\@tempboxa{\bfseries Keywords:\hskip8\p@}
%             \@tempdima=\wd\@tempboxa
%             \hangindent\@tempdima\noindent
%             \bgroup\bfseries Keywords:\space\egroup
%             ##1}}
%     \def\endexabstract{\clearpage}
% \else
%     \relax
% \fi

% content in chinese
\renewcommand\tableofcontents{
    \ifcumt@final\cleardoublepage\else\clearpage\fi
    \chapter*{\contentsname}
    \@mkboth{\contentsname}{\contentsname}\normalsize
    \zihao{-4}
    \@starttoc{toc}}
\def\econtentsname{Contents}

% content in english 
\newcommand\tableofecontents{
    \ifcumt@final\cleardoublepage\else\clearpage\fi
    \phantomsection
    \addcontentsline{toe}{chapter}{\econtentsname}
    \parindent\z@
    \parbox[t]{\textwidth}{
        \bfseries
        \zihao{-2}
        \centering
        \econtentsname
    }
    \par\vskip8\p@\parindent2em
    \@mkboth{\econtentsname}{\econtentsname}
    \@starttoc{toe}}
\newcommand\addecontents[2]{%
    \addcontentsline{toe}{#1}{\protect\numberline{\csname the #1\endcsname}#2}}%
\setcounter{tocdepth}{1}
\def\@dotsep{1}
\def\@pnumwidth{2em}
\def\@tocrmarg{3em}
\def\@dottedtocline#1#2#3#4#5{%
    \ifnum #1>\c@tocdepth
    \else
        \vskip \z@ \@plus .2\p@
        \bgroup
            \leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
            \parindent #2\relax\@afterindenttrue
            \interlinepenalty\@M
            \leavevmode\@tempdima #3\relax
            \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
            {#4}\nobreak
            \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
            \nobreak
            \hb@xt@\@pnumwidth{\hfil\normalfont\normalcolor \ifnum 0=#1 \bf\fi #5}%
            \par%
        \egroup
    \fi}
    % chapter title format
\renewcommand*\l@chapter[2]{%
    \ifnum \c@tocdepth >\m@ne
        \addpenalty{-\@highpenalty}%
        \vskip 4bp \@plus\p@
        \setlength\@tempdima{1em}%
        \begingroup
            \parindent\z@ \rightskip\@tocrmarg
            \parfillskip-\@tocrmarg
            \leavevmode
            \advance\leftskip\@tempdima
            \hskip -\leftskip
            {\bf\songti\boldmath #1}
            %{\bf\heiti\boldmath #1}
            \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{\bf.}\mkern \@dotsep mu$}\hfill
            \nobreak
            \hb@xt@\@pnumwidth{\hfil\normalfont\normalcolor\bf #2}\par
            \penalty\@highpenalty
        \endgroup
    \fi}
\renewcommand*\l@section{\@dottedtocline{1}{\z@}{1.8em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{\z@}{2.3em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{\z@}{3em}}
\newcounter{cumt@totalfigures}
\setcounter{cumt@totalfigures}{-1}
\newcounter{cumt@totaltables}
\setcounter{cumt@totaltables}{-1}
% -----------------------------------------
\renewcommand\listoffigures{%
    \ifcumt@final\cleardoublepage\else\clearpage\fi
    \chapter*{\listfigurename}%
    \phantomsection
    \addcontentsline{toe}{chapter}{List of Figures}
    \@mkboth{\MakeUppercase\listfigurename}%
                    {\MakeUppercase\listfigurename}%
    \bgroup\let\addvspace\@gobble
        \raggedbottom\offinterlineskip\parindent\z@\zihao{5}
        \let\contentsline\latexcontentsline
        \hrule
        \vrule\vrule width \z@ height 1.2\ht\strutbox depth 1.2\dp\strutbox
        \makebox[\dimexpr3cm-.8pt\relax][c]{\bfseries \cumt@figurenumber@name }\vrule
        \parbox{\dimexpr\textwidth-6cm}{\normalbaselines\centering
            {\large\strut}\bfseries \cumt@figurename@name{\large\strut}}\vrule
        \makebox[\dimexpr3cm-.8pt\relax][c]{\bfseries \cumt@pagenumber@name}\vrule
        \hrule
        \@starttoc{lof}%
    \egroup}
% -----------------------------------------
\def\l@figure{\cumt@figure}
\def\cumt@figure#1{\cumt@figurei#1}
\long\def\cumt@figurei\numberline#1#2#3{%
    \vrule\vrule width \z@ height 1.2\ht\strutbox depth 1.2\dp\strutbox
    \makebox[\dimexpr3cm-.8pt\relax][c]{\zihao{5}#1}\vrule
    \parbox{\dimexpr\textwidth-6cm}{\normalbaselines\centering
                 {\large\strut}\zihao{5}#2{\large\strut}}\vrule
    \makebox[\dimexpr3cm-.8pt\relax][c]{\zihao{5}#3}\vrule
    \hrule
    \hskip-.4pt \hrule\nobreak}
\renewcommand\listoftables{%
    \ifcumt@final\cleardoublepage\else\clearpage\fi
    \chapter*{\listtablename}%
    \phantomsection
    \addcontentsline{toe}{chapter}{List of Tables}
    \@mkboth{\MakeUppercase\listtablename}%
                    {\MakeUppercase\listtablename}%
    \bgroup\let\addvspace\@gobble
        \raggedbottom\offinterlineskip\parindent\z@\zihao{5}
        \let\contentsline\latexcontentsline
        \hrule
        \vrule\vrule width \z@ height 1.2\ht\strutbox depth 1.2\dp\strutbox
        \makebox[\dimexpr3cm-.8pt\relax][c]{\bfseries \cumt@tablenumber@name}\vrule
        \parbox{\dimexpr\textwidth-6cm}{\normalbaselines\centering
            {\large\strut}\bfseries \cumt@tablename@name{\large\strut}}\vrule
        \makebox[\dimexpr3cm-.8pt\relax][c]{\bfseries \cumt@pagenumber@name}\vrule
        \hrule
        \@starttoc{lot}%
    \egroup}
\def\l@table{\cumt@table}
\def\cumt@table#1{\cumt@tablei#1}
\long\def\cumt@tablei\numberline#1#2#3{%
    \vrule\vrule width \z@ height 1.2\ht\strutbox depth 1.2\dp\strutbox
    \makebox[\dimexpr3cm-.8pt\relax][c]{\zihao{5}#1}\vrule
    \parbox{\dimexpr\textwidth-6cm}{\normalbaselines\centering
        {\large\strut}\zihao{5}#2{\large\strut}}\vrule
    \makebox[\dimexpr3cm-.8pt\relax][c]{\zihao{5}#3}\vrule
    \hrule
    \hskip-.4pt \hrule\nobreak}
% the figure
\renewcommand\thefigure{\ifnum \c@chapter>\z@ \thechapter--\fi \@arabic\c@figure}
\def\fps@figure{htbp}
%\def\fps@figure{h}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\def\figureename{Figure}
\renewenvironment{figure}
    {\@float{figure}\zihao{5}\addtocounter{cumt@totalfigures}{1}}
    {\end@float}
% the table
\renewcommand\thetable{\ifnum \c@chapter>\z@ \thechapter--\fi \@arabic\c@table}
\def\fps@table{htbp}
%\def\fps@table{h}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\def\tableename{Table}
\renewenvironment{table}
    {\@float{table}\zihao{5}\addtocounter{cumt@totaltables}{1}}
    {\end@float}
\setlength\abovecaptionskip{7\p@}
\setlength\belowcaptionskip{7\p@}
\long\def\@caption#1[#2]#3#4{%
    \par
    \addcontentsline{\csname ext@#1\endcsname}{#1}%
    {\protect\numberline{\csname #1name\endcsname\space%
     \csname the#1\endcsname}{\ignorespaces #2}}%
    \addcontentsline{\csname ext@#1\endcsname}{#1}%
    {\protect\numberline{\csname #1ename\endcsname%
     \space\csname the#1\endcsname}{\ignorespaces #4}}%
    \begingroup
        \@parboxrestore
        \if@minipage
            \@setminipage
        \fi
        \zihao{5}\songti\phantomsection
        \@makecaption{#1}{\ignorespaces #3}{\ignorespaces #4}\par
    \endgroup}
\long\def\@makecaption#1#2#3{%
    \vskip\abovecaptionskip
    \sbox\@tempboxa{\csname #1name\endcsname\nobreakspace%
                                    \csname the#1\endcsname\nobreakspace\nobreakspace#2}%
    \newbox\@tempboxb
    \setbox\@tempboxb=\hbox{\csname #1ename\endcsname\nobreakspace%
                                                    \csname the#1\endcsname\nobreakspace\nobreakspace#3}%
    \ifdim \wd\@tempboxa >\hsize
        \csname #1name\endcsname\nobreakspace%
        \csname the#1\endcsname\nobreakspace\nobreakspace#2\par
    \else
        \global\@minipagefalse
        \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}\par%
    \fi
    \ifdim \wd\@tempboxb>\hsize
        \csname #1ename\endcsname\nobreakspace%
        \csname the#1\endcsname\nobreakspace\nobreakspace#3\par
    \else
        \global\@minipagefalse
        \hb@xt@\hsize{\hfil\box\@tempboxb\hfil}
    \fi
    \vskip\belowcaptionskip}
% the notation
\newenvironment{notation}[1][2.5cm]{
    \ifcumt@final\cleardoublepage\else\clearpage\fi
    \chapter*{\cumt@notation@name}
    \phantomsection
    \addcontentsline{toe}{chapter}{List of Variables}
    \@mkboth{\cumt@notation@name}{\cumt@notation@name}
    \noindent\zihao{5}
    \list{}%
        {\vskip-30bp\zihao{-4}\songti
         \renewcommand\makelabel[1]{##1\hfil}
         \labelwidth #1 \labelsep.5cm \itemindent\z@%
         \leftmargin\labelwidth \advance\leftmargin\labelsep%
         \rightmargin\z@ \parsep\z@ \itemsep\z@ \listparindent\z@ \topsep\z@%
        }}
        {\endlist}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter~~#1}{}}
\renewcommand\thechapter             {\@arabic\c@chapter}
\renewcommand\thesection             {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection        {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection {\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph         {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph    {\theparagraph.\@arabic\c@subparagraph}
\renewcommand\chaptername{Chapter}
\renewcommand\chapter{
    \clearpage
    \phantomsection
    \global\@topnum\z@
    \@afterindenttrue
    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2#3{%
    \ifnum \c@secnumdepth>\m@ne
        \if@mainmatter
            \refstepcounter{chapter}%
            \typeout{\@chapapp\space\thechapter.}%
            \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}
            \addcontentsline{toe}{chapter}{\protect\numberline{\thechapter}#3}
        \else
            \addcontentsline{toc}{chapter}{#1}
            \addcontentsline{toe}{chapter}{#3}
        \fi
    \else
        \addcontentsline{toc}{chapter}{#1}
        \addcontentsline{toe}{chapter}{#3}
    \fi
    \chaptermark{#1}%
    \@makechapterhead{#2}
    \@makeechapterhead{#3}}
\def\@makechapterhead#1{%
    \bgroup\parindent\z@
        \bf\heiti\boldmath\zihao{-2}
        \ifnum \c@secnumdepth>\m@ne
            \sbox\@tempboxa{\thechapter}
            \@tempdima=\wd\@tempboxa
            \advance\@tempdima by .8em
            \hangindent\@tempdima \thechapter{\hskip.8em}#1
        \fi
        \par\nobreak
    \egroup}
\def\@makeechapterhead#1{%
    \bgroup\parindent\z@
        \bf\boldmath\zihao{-2}
        \ifnum \c@secnumdepth>\m@ne
            \setbox0=\hbox{\thechapter}\dimen0=\wd0
            \advance\dimen0 by .8em
            \hangindent\dimen0 \thechapter{\hskip.8em}#1
        \fi
        \par\nobreak
        \vskip .5em \@plus .2ex \@minus .5em
    \egroup}
\def\@schapter#1{%
    \addcontentsline{toc}{chapter}{#1}
    \@makeschapterhead{#1}
    \@afterheading}
\def\@makeschapterhead#1{%
    \bgroup\parindent\z@\raggedright
     \centering\bfseries\heiti\boldmath\zihao{-2}
     \interlinepenalty\@M
     #1\par\nobreak\vskip1em
    \egroup}
\renewcommand\section{
    \phantomsection
    \global\@topnum\@ne
    \@afterindenttrue
    \secdef\@section\@ssection}
\def\@section[#1]#2#3{%
    \ifnum \c@secnumdepth>\z@
        \if@mainmatter
            \refstepcounter{section}%
            \typeout{\thesection.}%
            \addcontentsline{toc}{section}{\protect\numberline{\thesection}#1}
            \addcontentsline{toe}{section}{\protect\numberline{\thesection}#3}
        \else
            \addcontentsline{toc}{section}{#1}%
            \addcontentsline{toe}{section}{#3}%
        \fi
    \else
        \addcontentsline{toc}{section}{#1}%
        \addcontentsline{toe}{section}{#3}%
    \fi
    \sectionmark{#1}%
    \@makesectionhead{#2}{#3}}
\def\@makesectionhead#1#2{%
    \bgroup\vskip.5em \@plus .2ex \@minus .2ex
     \parindent\z@\zihao{-3}\bf\boldmath
     \ifnum \c@secnumdepth>\z@
         \sbox\@tempboxa{\thesection}
         \@tempdima=\wd\@tempboxa
         \advance\@tempdima by .8em
         \hangindent\@tempdima \thesection{\hskip.8em}#1~(#2)
     \fi\par\nobreak\vskip.5em \@plus .2ex \@minus .2ex
    \egroup}
\def\@ssection#1{%
    \@makessectionhead{#1}
    \@afterheading}
\def\@makessectionhead#1{%
    {\parindent\z@
     \bf\boldmath\zihao{-3}
     \interlinepenalty\@M
     \vskip.5em #1\par\vskip5\p@\nobreak}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                                 {.5em \@plus .2ex \@minus .2ex}%
                                                 {.5em \@plus .4ex}%
                                                 {\zihao{4}\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                                        {.5em \@plus .2ex \@minus .2ex}%
                                                        {.5em \@plus .4ex}%
                                                        {\zihao{4}}}
\setlength    \leftmargini{3.8em}
\setlength    \labelsep     {2ex}
\setlength    \labelwidth {\leftmargini}
\addtolength\labelwidth {-\labelsep}
\addtolength\labelwidth {-\itemindent}
\setlength\partopsep{\z@ \@plus 1\p@ \@minus 1\p@}
\def\@listi{\leftmargin\leftmargini
                        \parsep 2\z@ \@plus2\p@ \@minus\p@
                        \topsep 8\p@ \@plus2\p@ \@minus4\p@
                        \itemsep2\p@ \@plus2\p@ \@minus\p@}
\let\@listI\@listi
\@listi
\setlength\leftmarginii {2em}
\def\@listii{\leftmargin\leftmarginii
                         \labelwidth\leftmarginii
                         \advance\labelwidth-\labelsep
                         \topsep 4.5\p@ \@plus2\p@ \@minus\p@
                         \parsep 1\z@ \@plus2\p@ \@minus\p@
                         \itemsep1\p@ \@plus2\p@ \@minus\p@}
\renewenvironment{description}
    {\list{}{\labelwidth\z@ \itemindent-.45\leftmargin
     \let\makelabel\descriptionlabel}}
    {\endlist}
\ifcumt@authoryear
    \xdef\cumt@biboptions{square,super,sort}
    %\xdef\cumt@biboptions{square,numbers,sort}
    \AtEndOfClass{
    \def\cumt@authoryear@format{
        \advance\leftmargin\bibindent
        \itemindent -\bibindent
        \listparindent \itemindent
        \parsep5\p@}}
\else
    \ifcumt@numbers
        %\xdef\cumt@biboptions{square,numbers,sort&compress}
        \xdef\cumt@biboptions{square,super,sort&compress}
        \let\cumt@authoryear@format\@empty
    \fi
\fi
%\@ifundefined{cumt@biboptions}{\xdef\cumt@biboptions{square,numbers,sort}}{}
\@ifundefined{cumt@biboptions}{\xdef\cumt@biboptions{square,super,sort}}{}
\InputIfFileExists{\jobname.spl}{}{}
\RequirePackage[\cumt@biboptions]{natbib}
\newwrite\splwrite
\immediate\openout\splwrite=\jobname.spl
\def\biboptions#1{\def\next{#1}\immediate\write\splwrite{%
     \string\g@addto@macro\string\@biboptions{%
        ,\expandafter\strip@prefix\meaning\next}}}
\renewenvironment{thebibliography}[1]
    {\clearpage
     \chapter*{\bibname}\vskip-6\p@%
     \phantomsection
     \addcontentsline{toe}{chapter}{References}
     \zihao{5}\normalfont
     \list{\@biblabel{\@arabic\c@enumiv}}%
                {\settowidth\labelwidth{\@biblabel{#1}}%
                 \leftmargin\labelwidth
                 \advance\leftmargin\labelsep
                 \parsep\z@ \itemsep\z@ \topsep\z@%
                 \cumt@authoryear@format
                 \usecounter{enumiv}%
                 \let\p@enumiv\@empty
                 \renewcommand\theenumiv{\@arabic\c@enumiv}
                }%
     \sloppy
     \clubpenalty4000
     \@clubpenalty \clubpenalty
     \widowpenalty4000%
     \sfcode`\.\@m}
     {\def\@noitemerr
         {\@latex@warning{Empty `thebibliography' environment}}%
     \endlist
        \label{totalpage}
        \addtocounter{cumt@totaltables}{-1}
        \refstepcounter{cumt@totaltables}
        \label{totaltable}
        \addtocounter{cumt@totalfigures}{-1}
        \refstepcounter{cumt@totalfigures}
        \label{totalfigure}
        \addtocounter{NAT@ctr}{-1}
        \refstepcounter{NAT@ctr}
        \label{totalbib}
     }
\newcount\c@appendix
\c@appendix=0
\def\appendix#1{%
    \advance\c@appendix by1
    \def\thechapter{\@Alph\c@appendix}
    \ifcumt@final\cleardoublepage\else\clearpage\fi
    \bgroup\parindent\z@\centerline{\bf\heiti\zihao{-2}
     \appendixname{~\@Alph\c@appendix}}\egroup
    \par\vskip.3ex\centerline{\songti\zihao{-4}#1}
    \par\nobreak\vskip .5em \@plus .2ex \@minus .5em
}
\newenvironment{resume}{%
    \ifcumt@final\cleardoublepage\else\clearpage\fi
    \chapter*{\cumt@resume@title}\vskip-6\p@
    \phantomsection
    \addcontentsline{toe}{chapter}{Author's Resume}
    \@mkboth{\cumt@resume@title}{\cumt@resume@title}
    \zihao{5}\setlength\leftmargini{3.2em}
    \setlength\labelsep{1ex}}{}



\newcommand{\makebackcover}{
    \tolerance=10000
    \hbadness=10000
    \vbadness=10000
    % \cumt@declaration
    % \cumt@
    % 论文翻译原文
    % 论文翻译中文
}
\def\GuanJianCi#1{\def\cumt@guanjianci{#1}}
        \let\cumt@guanjianci\@empty
\def\LunWenZiZhu#1{\def\cumt@lunwenzizhu{#1}}
        \let\cumt@lunwenzizhu\@empty
\def\XueWeiShouYuDanWeiMingCheng#1{\def\cumt@xueweishouyudanweimingcheng{#1}}
        \def\cumt@xueweishouyudanweimingcheng{\cumt@biyexuexiao}
\def\XueWeiShouYuDanWeiDaiMa#1{\def\cumt@xueweishouyudanweidaima{#1}}
        \def\cumt@xueweishouyudanweidaima{\cumt@xuexiaodaima}
\def\XueWeiJiBie#1{\def\cumt@xueweijibie{#1}}
        \def\cumt@xueweijibie{\cumt@xueweileixing}
\def\LunWenTiMing#1{\def\cumt@lunwentiming{#1}}
        \def\cumt@lunwentiming{\cumt@clunwentimu}
\def\BingLieTiMing#1{\def\cumt@binglietiming{#1}}
        \let\cumt@binglietiming\@empty
\def\LunWenYuZhong#1{\def\cumt@lunwenyuzhong{#1}}
        \let\cumt@lunwenyuzhong\@empty
\def\PeiYangDanWeiMingCheng#1{\def\cumt@peiyangdanweimingcheng{#1}}
        \def\cumt@peiyangdanweimingcheng{\cumt@peiyangdanwei}
\def\PeiYangDanWeiDaiMa#1{\def\cumt@peiyangdanweidaima{#1}}
        \let\cumt@peiyangdanweidaima\@empty
\def\PeiYangDanWeiDiZhi#1{\def\cumt@peiyangdanweidizhi{#1}}
        \let\cumt@peiyangdanweidizhi\@empty
\def\YouBian#1{\def\cumt@youbian{#1}}
        \def\cumt@youbian{221116}
\def\XueZhi#1{\def\cumt@xuezhi{#1}}
        \let\cumt@xuezhi\@empty
\def\XueWeiShouYuNian#1{\def\cumt@xueweishouyunian{#1}}
        \def\cumt@xueweishouyunian{\cumt@biyeshijiannian}
\def\LunWenTiJiaoRiQi#1{\def\cumt@lunwentijiaoriqi{#1}}
        \def\cumt@lunwentijiaoriqi{\cumt@biyeshijiannian{} \cumt@biyeshijiannian@name{}
                \cumt@biyeshijianyue{} \cumt@biyeshijianyue@name}
\def\DaBianWeiYuanHuiChengYuan#1{\def\cumt@dabianweiyuanhuichengyuan{#1}}
        \let\cumt@dabianweiyuanhuichengyuan\@empty
\def\DianZiLunWenChuBanZhe#1{\def\cumt@dianzilunwenchubanzhe{#1}}
        \let\cumt@dianzilunwenchubanzhe\@empty
\def\DianZiLunWenChuBanDi#1{\def\cumt@dianzilunwenchubandi{#1}}
        \let\cumt@dianzilunwenchubandi\@empty
\def\QuanXianShengMing#1{\def\cumt@quanxianshengming{#1}}
        \let\cumt@quanxianshengming\@empty
\newcommand{\cumt@datacollection}{
    \ifcumt@final\cleardoublepage\else\clearpage\fi
    \chapter*{\cumt@datacollection@title}
    \phantomsection
    \addcontentsline{toe}{chapter}{\cumt@thesis{} Data Collection}
    \bgroup
    \centering\parindent\z@\zihao{5}
    \setlength{\tabcolsep}{\z@}
\tabulinesep=0mm
%\begin{tabu}to\linewidth{|X[c,m]|}
%    \hline
%    \tabulinesep=3mm
%    \begin{tabu}to\linewidth{X[-2,c,m]|X[1,c,m]|X[1,c,m]|X[1,c,m]|X[1,c,m]}%[2pt,white][1.5pt,white]
%        \rowfont\bf
%        \cumt@ckeywords@name* & \cumt@miji@name* & \cumt@zhongtufenleihao@name*
%        & UDC & \cumt@lunwenzizhu@name\\
%        \hline
%        \cumt@guanjianci & \cumt@miji & \cumt@zhongtufenleihao & \cumt@udc
%        & \cumt@lunwenzizhu\\
%    \end{tabu}\\
%    \hline
%    \tabulinesep=3mm
%    \begin{tabu}to\linewidth{X[1,c,m]|X[1,c,m]|X[1,c,m]|X[1,c,m]}
%        \rowfont\bf
%        \cumt@xueweishouyudanweimingcheng@name* & \cumt@xueweishouyudanweidaima@name*
%        & \cumt@xueweileibie@name* & \cumt@xueweijibie@name*\\
%        \hline
%        \cumt@xueweishouyudanweimingcheng & \cumt@xueweishouyudanweidaima
%        & \cumt@xueweileibie & \cumt@xueweijibie\\
%    \end{tabu}\\
%    \hline
%    \tabulinesep=3mm
%    \begin{tabu}to\linewidth{X[2,c,m]|X[2,c,m]|X[1,c,m]}%|[2pt,white]|[1.5pt,white]
%        \rowfont\bf
%        \cumt@lunwentiming@name* & \cumt@binglietiming@name*
%        & \cumt@lunwenyuzhong@name*\\
%        \hline
%        \cumt@lunwentiming & \cumt@binglietiming & \cumt@lunwenyuzhong\\
%    \end{tabu}\\
%    \hline
%    \tabulinesep=3mm
%    \begin{tabu}to\linewidth{X[1,c,m]|X[1,c,m]|X[1,c,m]|X[1,c,m]}
%         {\bf\cumt@zuozhexingming@name*} & \cumt@zuozhe & {\bf\cumt@xuehao@name*}
%         & \cumt@xuehao\\
%         \hline
%         \rowfont\bf
%         \cumt@peiyangdanweimingcheng@name* & \cumt@peiyangdanweidaima@name*
%         & \cumt@peiyangdanweidizhi@name & \cumt@youbian@name\\
%         \hline
%         \cumt@peiyangdanweimingcheng & \cumt@peiyangdanweidaima
%         & \cumt@peiyangdanweidizhi & \cumt@youbian\\
%         \hline
%         \rowfont\bf
%         \cumt@xuekezhuanye@name* & \cumt@yanjiufangxiang@name* & \cumt@xuezhi@name*
%         & \cumt@xueweishouyunian@name*\\
%         \hline
%         \cumt@xuekezhuanye & \cumt@yanjiufangxiang & \cumt@xuezhi
%         & \cumt@xueweishouyunian{} \cumt@biyeshijiannian@name\\
%    \end{tabu}\\
%    \hline
%    \tabulinesep=3mm
%    \begin{tabu}to\linewidth{X[1,c,m]|X[2,c,m]}
%        {\bf\cumt@lunwentijiaoriqi@name*} & \cumt@lunwentijiaoriqi\\
%    \end{tabu}\\
%    \hline
%    \tabulinesep=3mm
%    \begin{tabu}to\linewidth{X[1,c,m]|X[1,c,m]|X[1,c,m]|X[1,c,m]}
%        {\bf\cumt@daoshixingming@name*} & \cumt@daoshi & {\bf\cumt@zhicheng@name*}
%        & \cumt@daoshizhicheng\\
%    \end{tabu}\\
%    \hline
%    \tabulinesep=3mm
%    \begin{tabu}to\linewidth{X[1,c,m]|X[1,c,m]|X[1,c,m]}
%        \rowfont\bf
%        \cumt@pingyueren@name & \cumt@dabianweiyuanhuizhuxi@name*
%        & \cumt@dabianweiyuanhuichengyuan@name* \\
%    \end{tabu}\\
%    \hline
%    \tabulinesep=3mm
%    \begin{tabu}to\linewidth{X[1,c,m]|X[1,c,m]|X[1,c,m]}
%        \cumt@pingyueren & \cumt@dabianweiyuanhuizhuxi
%        & \cumt@dabianweiyuanhuichengyuan\\
%    \end{tabu}\\
%    \hline
%    \tabulinesep=2mm
%    \begin{tabu}to\linewidth{X[-1,m]X[l,m]}%|[2pt,white]|[2pt,white]|[2pt,white]
%        ~{\bf\cumt@dianzibanlunwentijiaogeshi@name}~ &
%        ~\bf\songti \cumt@wenben@name~(~\checkmark~)
%        ~\cumt@tuxiang@name~(~\textcolor[rgb]{1.00,1.00,1.00}{\checkmark}~)
%        ~\cumt@shipin@name~(~\textcolor[rgb]{1.00,1.00,1.00}{\checkmark}~)
%        ~\cumt@yinpin@name~(~\textcolor[rgb]{1.00,1.00,1.00}{\checkmark}~)
%        ~\cumt@duomeiti@name~(~\textcolor[rgb]{1.00,1.00,1.00}{\checkmark}~)
%        ~\cumt@qita@name~(~\textcolor[rgb]{1.00,1.00,1.00}{\checkmark}~)\\
%    \end{tabu}\\
%    \tabulinesep=2mm
%    \begin{tabu}to\linewidth{X[l,m]}%|[2pt,white]
%        \rowfont\bf
%        ~\cumt@tuijiangeshi@name: application msword; application pdf\\
%    \end{tabu}\\
%    \hline
%    \tabulinesep=3mm
%    \begin{tabu}to\linewidth{X[1,c,m]|X[1,c,m]|X[1,c,m]}
%        \rowfont\bf
%        \cumt@dianzibanlunwenchubanzhe@name & \cumt@dianzibanlunwenchubandi@name
%        & \cumt@quanxianshengming@name\\
%    \end{tabu}\\
%    \hline
%    \extrarowsep=2mm
%    \begin{tabu}to\linewidth{X[1,c,m]|X[1,c,m]|X[1,c,m]}
%        \cumt@dianzilunwenchubanzhe & \cumt@dianzilunwenchubandi
%        & \cumt@quanxianshengming \\
%    \end{tabu}\\
%    \hline
%    \tabulinesep=3mm
%    \begin{tabu}to\linewidth{X[1,c,m]|X[2,c,m]}
%        {\bf\cumt@lunwenzongyeshu@name*} & \pageref{totalpage}\\
%    \end{tabu}\\
%    \hline
%    \tabulinesep=3mm
%    \begin{tabu}to\linewidth{X[l,m]}%|[2pt,white]
%        \rowfont\bf
%        ~\cumt@beizhu@name.\\
%    \end{tabu}\\
%    \hline
%\end{tabu}
\egroup}
\newtheoremstyle{cumt}                                % <name>
         {10\p@ \@minus 4\p@ \@plus 2\p@} % <Space above>
         {10\p@ \@minus 4\p@ \@plus 2\p@} % <Space below>
         {\kaishu}% <Body font>
         {}% <Indent amounti>
         {\bf}% <Theorem head font>
         {.}% <Punctuation after theorem head>
         {.6em}% <Space after theorem head>
         {}% <Theorem head spec (can be left empty)>
\theoremstyle{cumt}
\newtheorem{definition}{\cumt@def@name~}[chapter]
\newtheorem{theorem}[definition]{\cumt@thm@name~}
\newtheorem{lemma}[definition]{\cumt@lem@name~}
\newtheorem{corollary}[definition]{\cumt@cly@name~}
\newtheorem{proposition}[definition]{\cumt@pro@name~}
\newtheorem{remark}[definition]{\cumt@rem@name~}
\newtheorem{example}[definition]{\cumt@exm@name~}
\allowdisplaybreaks[4]
\renewcommand{\textfraction}{.15}
\renewcommand{\topfraction}{.85}
\renewcommand{\bottomfraction}{.65}
\renewcommand{\floatpagefraction}{.6}
\setlength{\floatsep}{10\p@ \@plus 3\p@ \@minus 2\p@}
\setlength{\textfloatsep}{10\p@ \@plus 3\p@ \@minus 2\p@}
\setlength{\intextsep}{10\p@ \@plus 3\p@ \@minus 2\p@}
\AtBeginDocument{
     \hypersetup{%
         pdfsubject={\cumt@xueweileixing\cumt@lunwenleixing},
         pdfproducer={cumtthesis.cls by Xiao Lishun}}}
\ifcumt@check
    \let\makecover\relax
    \let\tableofcontents\relax
    \let\tableofecontents\relax
    \let\listoffigures\relax
    \let\listoftables\relax
    \let\makebackcover\relax
    \RequirePackage{environ}
    \RenewEnviron{acknowledgements}{}
    \RenewEnviron{cabstract}{}
    \RenewEnviron{eabstract}{}
    \RenewEnviron{exabstract}{}
    \RenewEnviron{notation}{}
    \RenewEnviron{resume}{}
    \RenewEnviron{thebibliography}{}
\fi
\endinput
%%
%% End of file `cumtthesis.cls'.
