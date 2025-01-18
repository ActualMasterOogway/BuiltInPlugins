local v0 = newproxy(true);
getmetatable(v0).__tostring = function() --[[ Line: 6 ]]
    return "nil";
end;
return v0;