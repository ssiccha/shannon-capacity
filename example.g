# ? c(C5) = sqrt 5;
# C7 Lovasz ~~ 3.31767
LoadPackage("digraphs");
n := 7;
C := DigraphSymmetricClosure(CycleDigraph(n));

# Graphs
G := [];
adjBasic := DigraphAdjacencyFunction(C);
adjFunc := function(u, v)
    if u = v then return false; fi;
    return ForAll([1..Length(u)], i -> u[i] = v[i] or adjBasic(u[i],v[i]));
end;

# do this to get the graphs
i := 1;
G[i] := Digraph(Tuples([1..n], i), adjFunc); time;
Size( AutomorphismGroup(G[i]) ); time;

# do this to get independent sets
# DigraphMaximalIndependentSetsReps( digraph[, include[, exclude[, limit[, size]]]] )
# Note: The argument size restricts the search to those cliques which contain
# precisely size vertices.
DigraphIndependentSetsReps(G[i], [], [], 1, 10);
