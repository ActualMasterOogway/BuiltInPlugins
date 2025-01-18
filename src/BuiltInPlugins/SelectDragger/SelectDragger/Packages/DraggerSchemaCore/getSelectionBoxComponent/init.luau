return function(_, v1) --[[ Line: 1 ]]
    if v1:IsA("Attachment") or v1:IsA("Constraint") then
        return nil;
    else
        return "SelectionBox";
    end;
end;