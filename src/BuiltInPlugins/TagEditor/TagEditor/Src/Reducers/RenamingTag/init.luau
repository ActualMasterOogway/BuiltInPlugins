return function(v0, v1) --[[ Line: 1 ]]
    if v1.type == "SetRenaming" then
        if v1.renaming then
            return v1.tag;
        else
            return nil;
        end;
    elseif v1.type == "SetRenamingGroup" then
        return nil;
    else
        return v0;
    end;
end;