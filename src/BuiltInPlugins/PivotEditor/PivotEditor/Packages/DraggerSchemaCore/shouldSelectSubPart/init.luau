return function(v0) --[[ Line: 1 ]]
    return (v0:areConstraintsEnabled() and v0:shouldSelectScopeByDefault()) ~= v0:isAltKeyDown();
end;