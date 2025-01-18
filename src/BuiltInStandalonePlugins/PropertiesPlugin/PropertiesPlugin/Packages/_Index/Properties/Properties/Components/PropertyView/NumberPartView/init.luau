local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local v1 = require(l_script_FirstAncestor_0.Components.EditorTextbox);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
return function(v3) --[[ Line: 6 ]] --[[ Name: NumberPartView ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v2.createElement(v1, {
        text = tostring(v3.value), 
        textEditable = v3.editable, 
        finishEditing = function(v4) --[[ Line: 20 ]] --[[ Name: finishEditing ]]
            -- upvalues: v3 (copy)
            local v5 = tonumber(v4);
            if v5 then
                v3.setPart(v3.part, v5);
                v3.finishEditing(Enum.FinishRecordingOperation.Commit);
                return true;
            else
                v3.finishEditing(Enum.FinishRecordingOperation.Cancel);
                return false;
            end;
        end, 
        beginEditingAsync = function() --[[ Line: 31 ]] --[[ Name: beginEditingAsync ]]
            -- upvalues: v3 (copy)
            v3.beginEditingAsync();
        end, 
        position = v3.position, 
        size = v3.size, 
        chipColor = v3.color
    });
end;