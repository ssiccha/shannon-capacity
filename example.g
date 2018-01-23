# ? c(C5) = sqrt 5;
# C7 Lovasz ~~ 3.31767
LoadPackage("digraphs");
DigraphSymmetricClosure( CycleDigraph(5) );
C5 := DigraphSymmetricClosure( CycleDigraph(5) );
adjG1 := DigraphAdjacencyFunction(C5);
adjG2 := function(u,v)
    if u = v then
        return false;
    fi;
    if (u[1] = v[1] or adjG1(u[1], v[1])) and (u[2] = v[2] or adjG1(u[2], v[2])) then
        return true;
    fi;
    return false;
end;

# Graphs
G := [];
adjBasic := DigraphAdjacencyFunction(C5);
adjFunc := function(u, v)
    if u = v then return false; fi;
    return ForAll([1..Length(u)], i -> u[i] = v[i] or adjBasic(u[i],v[i]));
end;

# do this to get the graphs
i := 0;
i := i+1; 5 ^ i * (3 ^ i - 1); G[i] := Digraph(Tuples([1..5], i), adjFunc); time; Size( AutomorphismGroup(G[i]) ); time; Size( DigraphMaximalIndependentSet(G[i]) ); time;
