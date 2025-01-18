local l_BaseWrapVerticesModified_0 = game:GetFastFlag("BaseWrapVerticesModified");
local l_BaseWrapVerticesModifiedArgument_0 = game:GetFastFlag("BaseWrapVerticesModifiedArgument");
game:DefineFastFlag("EnableCageEditingTools_Dev", false);
return function() --[[ Line: 7 ]]
    -- upvalues: l_BaseWrapVerticesModified_0 (copy), l_BaseWrapVerticesModifiedArgument_0 (copy)
    return game:GetFastFlag("EnableCageEditingTools_Dev") and l_BaseWrapVerticesModified_0 and l_BaseWrapVerticesModifiedArgument_0;
end;