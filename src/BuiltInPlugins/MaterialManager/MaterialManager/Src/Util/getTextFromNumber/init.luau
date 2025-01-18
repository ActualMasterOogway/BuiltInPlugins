return function(v0) --[[ Line: 1 ]]
    return string.format("%.3f", v0):gsub("%.?0+$", "");
end;