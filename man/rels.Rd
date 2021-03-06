% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/rels.R
\name{rels}
\alias{rels}
\title{Retrieve Relationships from Paths}
\usage{
rels(path)
}
\arguments{
\item{path}{A path object.}
}
\value{
A list of relationship objects.
}
\description{
Retrieve all relationships from a path object.
}
\examples{
\dontrun{
graph = startGraph("http://localhost:7474/db/data/")
clear(graph)

alice = createNode(graph, "Person", name = "Alice")
bob = createNode(graph, "Person", name = "Bob")
charles = createNode(graph, "Person", name = "Charles")

createRel(alice, "WORKS_WITH", bob)
createRel(bob, "WORKS_WITH", charles)

query = "
MATCH p = (:Person {name:'Alice'})-[:WORKS_WITH*]->(:Person {name:'Charles'})
RETURN p
"

path = cypherToList(graph, query)[[1]]$p

rels(path)
}
}
\seealso{
\code{\link{nodes}}
}

