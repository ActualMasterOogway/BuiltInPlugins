return function(v0) --[[ Line: 1 ]]
    if v0 == Enum.AssetType.Place then
        return false;
    elseif v0 == Enum.AssetType.Plugin then
        return false;
    else
        return true;
    end;
end;