local v0 = newproxy(true);
getmetatable(v0).__tostring = function() --[[ Line: 3 ]]
    return "Symbol(LoadingInProgress)";
end;
return v0;