return function(v0, v1) --[[ Line: 6 ]] --[[ Name: endsWith ]]
    return v0:sub(-v1:len()) == v1;
end;