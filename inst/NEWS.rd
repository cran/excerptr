\name{NEWS}
\title{NEWS}

\section{Changes in version 2.1.0}{
\itemize{
\item Comply with the changes required by Beni Altmann (CRAN).
}
}

\section{Changes in version 2.0.1}{
\itemize{
\item Removed LazyData from file DESCRIPTION.
}
}

\section{Changes in version 2.0.0}{
\itemize{
\item The package is refactored to now using reticualte instead of rPython.
The now obsolete funtions get_excerpts() set_excertps_path() were removed.
\item Now using checkmate to check function arguments.
}
}

\section{Changes in version 1.4.1}{
\itemize{
\item Declared imports from devtools in tests as requested by CRAN on Thu, 17 May 2018 10:28:07 +0200.
}
}

\section{Changes in version 1.4.0}{
\itemize{
\item Handle exception from pandoc call via rPython using an R system call to pandoc.
Calling pandoc from rPython fails on windows, so we work around using
system2().
}
}

\section{Changes in version 1.3.1}{
\itemize{
\item Run tests requiring pandoc only if pandoc is installed.
}
}

\section{Changes in version 1.3.0}{
\itemize{
\item Add 'excerpts' version 2.0.0 from github and adjust the internal interface in
excerptr().
\item Enhance documentation
}
}

\section{Changes in version 1.2.0}{
\itemize{
\item Add 'excerpts' version 1.1.0 from github.
\item vignettes/excerptr_Introduction.Rmd: cope with CRAN's check warnings.
}
}

\section{Changes in version 1.1.0}{
\itemize{
\item vignettes/excerptr_Introduction.Rmd: cope with CRAN's check warnings.
\item R/internals.R: construct path using inst/ only on development.
}
}

\section{Changes in version 1.0.2}{
\itemize{
\item Change example to not require pandoc.
}
}

\section{Changes in version 1.0.1}{
\itemize{
\item Remove test failing on CRAN.
}
}

\section{Changes in version 1.0.0}{
\itemize{
\item First release, just importing \href{https://github.com/fvafrCU/excerpts}{excerpts}.
}
}

