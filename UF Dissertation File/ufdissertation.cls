\LoadClass{report}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%    Support Packages and Commands    %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Generic useful configuration packages, used to configure most of the stuff below.
\usepackage{etoolbox}
\usepackage{amsmath}
\usepackage[linktoc=all]{hyperref}% Use this to provide intra-pdf hyperlinking and better toc
                                    % linktoc=all used to extend the hyperlink across the dotted lines.
\usepackage{titlesec}% Use this to manipulate default chapter styling

\providecommand{\ifExists}[3]{% Check to see if a macro is defined, for the use of detecting how much of the configuration options have been supplied by the user.
     \ifcsname#1\endcsname%
         #2% If it is defined, do this.
     \else
         #3% Otherwise, do this.
     \fi
     
    }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Formating Design    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%
%%% Margins: They want 1 inch all around margins, which we do with the geometry package.
%%%%%%%
\usepackage[margin=1in]{geometry}

%% End Margin Config.

%%%%%%%
%%% Font Options:   They want Times New Roman, or Arial. 
%                   Times New Roman is loaded by default, uncomment the \renewcommand below to switch it to Arial.
%%%%%%%
\usepackage{mathptmx}% This is required to load and convert to times new roman
\usepackage{helvet}% This is required to load Arial Font
%\renewcommand{\familydefault}{\sfdefault}% Converts default to actual Arial

%% End Font Setting

%%%%%%%
%%% They want a ragged right edge.
%%%%%%%
\raggedright

%% End ragged right edge setting


%%%%%%%
%%% They want the page number in arabic numerals in the bottom middle of each page.
%%%%%%%
\usepackage{fancyhdr}
\pagestyle{fancy}
\renewcommand\headrulewidth{0pt}
\lhead{}\chead{}\rhead{}
\cfoot{\vspace*{1.5\baselineskip}\thepage}
%% End page numbering settings



%%%%%%%
%%% They want tables configured a certain way that makes the package "longtables" a more desirable option.
%   More specifically, from their website on text-flow:
%        Text must be continuous throughout the chapter. 
%        It is best to place all tables and figures at the end of the appropriate chapter. 
%        Avoid inserting them into the text of the chapter, unless you are able to do so 
%        without leaving blank gaps at the bottom of text pages.
%%%%%%%
\usepackage{longtable}
\usepackage{flafter}% This package stops tables from floating backward up the text. This stops weirdness like tables appearing before the section they are in within the source.

%% End table configure


%%%%%%%
%%% We want double spacing for the document, but not for certain environments: From their website:
%                   Double-space most text. Indent first lines of paragraphs consistently. 
%                   Single-space headings, tables, figures, bulleted-list items, equations, block quotes, 
%                   and appendix matter (with only one blank line space before and after the single-spaced matter). 
%                   There should be no more than one blank line space anywhere.
%%%%%%%
%                   Note: To make every paragraph indented, use a blank line in the source, and NOT the \\ macro.
%
\usepackage[nodisplayskipstretch]{setspace}% This will allow us to set spacing in general.
%                   The optional argument "nodisplayskipstretch" turns off doublespacing for math display mode environments.
\usepackage{indentfirst}% This will make sure the first paragraph of every chapter is also indented.
\doublespacing% Make everything double spaced by default.
\preto\longtable{\par\singlespacing}% Pre-append using longtables to make sure that tables are single spaced.
\preto\itemize{\par\singlespacing}% Pre-append singlespace to itemize to account for single space bullet point lists.

%% End Spacing


%%%%%%%
%%% Maketitle needs to be redefined to make the titlepage look how they want. It should be noted that how they want it to look is only demonstrated on their website, it has no actual specific given parameters... that would be way too easy.
%%%%%%%

\providecommand{\thesisType}[1]{%
    \providecommand{\@ThesisType}{#1}
    }

\providecommand{\degreeType}[1]{%
    \providecommand{\@DegreeType}{#1}
    }

\providecommand{\degreeYear}[1]{%
    \providecommand{\@DegreeYear}{#1}
    }

\renewcommand{\maketitle}{%
    \clearpage%
    \begin{center}
    \thispagestyle{empty}%

    {\singlespace\large\MakeUppercase{\@title}}%
    \vfill%
    By \\*[\baselineskip]%
    \MakeUppercase{\@author}%
    \vfill%
    A \MakeUppercase{\@ThesisType} PRESENTED TO THE GRADUATE SCHOOL \\%
    OF THE UNIVERSITY OF FLORIDA IN PARTIAL FULFILLMENT \\%
    OF THE REQUIREMENTS FOR THE DEGREE OF \\%
    \MakeUppercase{\@DegreeType} \\*[\baselineskip]%
    UNIVERSITY OF FLORIDA \\*[\baselineskip]%
    \@DegreeYear%
    \end{center}
    \vspace*{0in}
    \clearpage
    }

%%%%%%%
%%% Desired Header Formating: From their webpage:
%        A chapter heading is an example of a major division heading. 
%        All formatting rules for appendices are the same as for chapters, 
%        except that some appendix material is often single-spaced.
%        Examples:
%            ALL MAJOR DIVISION HEADINGS ARE IN UPPERCASE AND NOT IN BOLD. 
%            (PRELIMINARY PAGES, CHAPTERS, APPENDICES, REFERENCE LIST AND BIOGRAPHICAL SKETCH)
%            All subheadings and paragraph headings are in bold.  
%            First-Level Subheadings Are Centered and in Title Case (Like This Sentence).
%            Second-Level Subheadings Are Flush-Left and in Title Case (Like This Sentence).
%            Third-level subheadings are flush-left and in sentence case (like this sentence).
%            Paragraph subheadings are indented and in sentence case. 
%            Paragraph headings end with a period or colon. 
%            Start the text on the same line as the paragraph heading.
%            (Paragraph headings can also be used with bulleted lists). 
%%%%%%%

%\titleformat*{\section}{\small}
%\titlelabel{\small}
\titleformat{\chapter}[hang]{\large}{}{0pt}{\centering\singlespacing\MakeUppercase}{\raggedright\doublespacing}

%% End of Header formating


%%%%%%%
%%% Table of Content fixes: They wanted hyperlinked dotted lines between the chapter name and the page number.
%%%%%%%
\renewcommand{\contentsname}{TABLE OF CONTENTS}%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%   User Configuration Commands    %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\providecommand{\setCopyrightFile}[2][tex]{% Sets the file name for the copyright file and saves it in the macro \copyrightFile
    \edef\copyrightFile{#2.#1}
    }

\providecommand{\setDedicationFile}[2][tex]{% Sets the file name for the dedication file and saves it in the macro \dedicationFile
    \edef\dedicationFile{#2.#1}
    }

\providecommand{\setAcknowledgementsFile}[2][tex]{% Sets the file name for the acknowledgements file and saves it in the macro \acknowledgementsFile
    \edef\acknowledgementsFile{#2.#1}
    }

\providecommand{\setAbbreviationsFile}[2][tex]{% Sets the file name for the abbreviations file and saves it in the macro \abbreviationsFile
    \edef\abbreviationsFile{#2.#1}
    }
    
\providecommand{\setAbstractFile}[2][tex]{% Sets the file name for the abstract file and saves it in the macro \abstractFile
    \edef\abstractFile{#2.#1}
    }

\providecommand{\setAppendixFile}[2][tex]{% Sets the file name for the appendix file and saves it in the macro \appendixFile
    \edef\appendixFile{#2.#1}
    }

\providecommand{\setReferenceFile}[2][tex]{% Sets the file name for the reference file and saves it in the macro \referenceFile
    \edef\referenceFile{#2.#1}
    }

\providecommand{\setBiographicalFile}[2][tex]{% Sets the file name for the biographical file and saves it in the macro \biographicalFile
    \edef\biographicalFile{#2.#1}
    }

%% End Input Page Order.





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%   Automated Document Building    %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Automatic input of pages and lists in the correct order, omitting the chapters which must be individually input in the main document.

%%%%%%%
%%% Desired Input Page Order:
% Title page, 
% copyright page, 
% dedication (if any), 
% acknowledgments, 
% table of contents, 
% list of tables (if any), 
% list of figures (if any), 
% list of abbreviations (if any), 
% academic abstract, 
% chapters, 
% appendices (if any), 
% list of references, 
% biographical sketch
%%%%%%%


\AtBeginDocument{% This should do most of the pre-chapter formatting... hopefully.
    \maketitle
    
    \newpage
    \vspace*{0pt}
    \vfill
    \begin{center}
        \textcopyright{} \@DegreeYear{} \@author
    \end{center}
    \vfill
    \vspace*{0pt}
    \newpage

    \setcounter{secnumdepth}{-1}% We don't want chapter numbers until later, 
                                % So let's kill off the table of contents depth detector until we want to start counting.

    \ifExists{dedicationFile}
        {% If we have defined a dedication file, import it.
            \input{\dedicationFile}
        }
        {
            \@latex@warning{You haven't specified a dedication file using the command \setDedicationFile. Hopefully this is intentional!}
        }    


    \ifExists{acknowledgementsFile}
        {% If we have defined a acknowledgements file, import it.
        \chapter{ACKNOWLEDGEMENTS}
        \label{Acknowledgements}
%        \addcontentsline{toc}{chapter}{\nameref{Acknowledgements}}
            \input{\acknowledgementsFile}
        }
        {
            \@latex@warning{You haven't specified a acknowledgements file using the command \setAcknowledgementsFile. Hopefully this is intentional!}
        }
    
    \tableofcontents
    
    \listoftables
    \addcontentsline{toc}{chapter}{LIST OF TABLES}
    %\addtocontents{toc}{\protect\contentsline{chapter}{LIST OF TABLES}{}{\@currentHref}}
    
    \listoffigures
    \addcontentsline{toc}{chapter}{LIST OF FIGURES}
    %\addtocontents{toc}{\protect\contentsline{chapter}{LIST OF FIGURES}{}{\@currentHref}}


    \ifExists{abbreviationsFile}
        {% If we have defined a abbreviations file, import it.
            \chapter{ABBREVIATIONS}
            \input{\abbreviationsFile}
        }
        {
            \@latex@warning{You haven't specified a abbreviations file using the command \setAbbreviationsFile. Hopefully this is intentional!}
        }

    \ifExists{abstractFile}
        {% If we have defined a abstract file, import it.
            \chapter{ABSTRACT}
            \input{\abstractFile}
        }
        {
            \@latex@warning{You haven't specified a abstract file using the command \setAbstractFile. Hopefully this is intentional!}
        }
        \addtocontents{toc}{\protect\contentsline{chapter}{CHAPTER}{}{}}
        \setcounter{secnumdepth}{4}
    }

\AtEndDocument{% Use this to display the end-content files.

    \ifExists{appendixFile}
        {% If we have defined a appendix file, import it.
            \setcounter{secnumdepth}{-1}% We don't want the Appendix to have a number, but it should be linked.
            \chapter*{APPENDIX}
            \addtocontents{toc}{\protect\contentsline{chapter}{APPENDIX}{}{\@currentHref}}
            \setcounter{secnumdepth}{4}
            \input{\appendixFile}
        }
        {
            \@latex@warning{You haven't specified an appendix file using the command \setAppendixFile. Hopefully this is intentional!}
        }


    \ifExists{referenceFile}
        {% If we have defined a reference file, import it.
            \chapter{REFERENCES}
            \input{\referenceFile}
        }
        {
            \@latex@warning{You haven't specified a reference file using the command \setReferenceFile. Hopefully this is intentional!}
        }
        
    \ifExists{biographicalFile}
        {% If we have defined a biography file, import it.
            \chapter{BIOGRAPHY}
            \input{\biographicalFile}
        }
        {
            \@latex@warning{You haven't specified a biography file using the command \setBiographicalFile. Hopefully this is intentional!}
        }
    }% End of End-Document processing.


%% End of automatic input of documents and lists.



\usepackage{tabularx}
\newcommand{\dissertationTable}[5]{
    \begin{table}
    \centering
        \caption{#4}
        \begin{tabularx}{\textwidth}{#1}
        #2\\ \hline% This is the header line
        #3\\ \hline% This is the body of the table, which should include all the relevant line breaks etc.
        \end{tabularx}
        \label{#5}
    \end{table}
    }