local v0 = game:DefineFastFlag("PathEditorSelectModeShortcutChangeToV", false);
return function() --[[ Line: 3 ]] --[[ Name: getShortcuts ]]
    -- upvalues: v0 (copy)
    return {
        Move = v0 and "v" or "s", 
        AddPoint = "p", 
        AddTangent = "t", 
        Done = "return", 
        DeletePoint = "delete", 
        DeletePoint2 = "backspace"
    };
end;