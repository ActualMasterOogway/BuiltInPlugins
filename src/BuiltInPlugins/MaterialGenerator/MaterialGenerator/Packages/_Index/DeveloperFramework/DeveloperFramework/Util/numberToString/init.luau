return function(v0, v1) --[[ Line: 5 ]] --[[ Name: numberToString ]]
    local v2 = ("%." .. v1 .. "f"):format(v0);
    local v3 = v2:match("%.?0+$") or "";
    return v2:sub(1, #v2 - #v3);
end;