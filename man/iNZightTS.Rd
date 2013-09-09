\name{iNZightTS}
\alias{iNZightTS}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  iNZightTS (Time-Series) Objects
}
\description{
 The function \code{iNZightTS} is used to create time-series object used
 in iNZight.
}
\usage{
iNZightTS(data, start = 1, end = numeric(), freq = 1, var = 2, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
    a \code{data.frame} containing time information and observation or a
    path to a \code{.csv} file with such information or a \code{ts} object
  }
  \item{start}{
    the time of the first observation. Either a single number or a vector
    of two integers, which specify a natural time unit and a (1-based)
    number of samples into the time unit
  }
  \item{end}{
    the time of the last observation, specified in the same way as \code{start}
  }
  \item{freq}{
    the number of observations per unit of time
  }
  \item{var}{
    the column number or name for the observations used from \code{data}
    in the actual time series
  }
  \item{\dots}{
    additional information passed to \code{read.csv()} and used when
      \code{data} is a path
  }
}
\details{
  The function \code{iNZgithTS} is used to create time-series
  objects. Unlike \code{ts} objects, these are lists containing
  information about the time-series as well as the data and the
  time-series (\code{ts} object) itself.

  If a \code{ts} object is used to create the \code{iNZightTS} object,
  all the domain infortmation are extracted from that object.

  In case of \code{data} being a data.frame or path to a \code{.csv}
  file and \code{start} being omitted, the starting date and the
  \code{freq} is extracted from the column that includes the time
  information. This column is either named \code{"Time"} or is the first
  column. If \code{end} is omitted, all of the data will be used for the
  time-series.
}

\seealso{
\code{\link{ts}}, \code{\link{print.iNZightTS}}, \code{\link{rawplot}}
}
\examples{
# create from a ts object
z <- iNZightTS(UKgas)
rawplot(z)

# create from a data.frame
x <- iNZightTS(data.frame(Return = rnorm(100), Time = 1:100), var = "Return")

# create from a data.frame with modified time frame
y <- iNZightTS(data.frame(Return = rnorm(100)), start = c(1990, 1), end =
c(1993, 5), freq = 12, var = 1)
rawplot(y)
}