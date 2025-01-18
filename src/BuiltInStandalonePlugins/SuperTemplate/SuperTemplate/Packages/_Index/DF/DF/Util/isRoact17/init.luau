return function(v0) --[[ Line: 29 ]] --[[ Name: isRoact17 ]]
    if v0.Ref == "ref" and v0.Children == "children" then
        return true;
    elseif rawget(v0, "useState") ~= nil then
        return true;
    else
        return false;
    end;
end;