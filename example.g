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

#G[i] := Digraph(Tuples([1..5], i), adjFunc);

# garbage
#adjFunc := function(u, v)
#    local i, prevG, prevAdjFunc, firstU, firstV, lastU, lastV;
#    if u = v then
#        return false;
#    fi;
#    if IsInt(u) then
#        return adjBasic(u, v);
#    fi;
#    if Length(u) = 1 then
#        return adjBasic(u[1], v[1]);
#    fi;
#    i := Length(u);
#    prevG := G[i-1];
#    prevAdjFunc := DigraphAdjacencyFunction(prevG);
#    firstU := u{[1..i-1]};
#    firstV := v{[1..i-1]};
#    lastU := u[i];
#    lastV := v[i];
#    if (firstU = firstV or prevAdjFunc(firstU, firstV))
#        and (lastU = lastV or adjBasic(lastU, lastV))
#    then
#        return true;
#    fi;
#    return false;
#end;

#### unused, mb more efficient? probably not
#adjFuncs := [];
#adjFuncs[1] := {u, v} -> adjC5(u[1], v[1]);
#i := 2;
#adjFuncs[i]:= function(u, v)
#    local basic, previous, i;
#    basic := adjFuncs[1];
#    previous := adjFuncs[i-1];
#    if u = v then
#        return false;
#    fi;
#    if
#        (u{[1..i-1]} = v{[1..i-1]} or previous(u{[1..i-1]}, v{[1..i-1]}))
#        and (u{[i]} = v{[i]} or basic(u{[i]}, v{[i]}))
#    then
#        return true;
#    fi;
#    return false;
#end;
#
#Size(DigraphMaximalIndependentSet(C5));
