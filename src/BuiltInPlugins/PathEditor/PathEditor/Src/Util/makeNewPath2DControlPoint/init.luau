return function(v0, v1, v2) --[[ Line: 4 ]] --[[ Name: makeNewPath2DControlPoint ]]
    if not v0 then
        return Path2DControlPoint.new();
    elseif not v2 then
        return Path2DControlPoint.new(v0);
    else
        return Path2DControlPoint.new(v0, v1, v2);
    end;
end;