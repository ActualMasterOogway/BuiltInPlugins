local l_script_FirstAncestor_0 = script:FindFirstAncestor("Properties");
local v1 = require(l_script_FirstAncestor_0.Components.EditorTextbox);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
return function(v4) --[[ Line: 7 ]] --[[ Name: BasicPropertyView ]]
    -- upvalues: v2 (copy), v1 (copy)
    local l_value_0 = v4.info.parts.value;
    local v6 = l_value_0.multiple and "" or l_value_0.value;
    return v2.createElement(v1, {
        text = v6, 
        textEditable = not v4.info.readonly, 
        finishEditing = function(v7) --[[ Line: 14 ]] --[[ Name: finishEditing ]]
            -- upvalues: v4 (copy)
            v4.setPart("value", v7);
            v4.finishEditing(Enum.FinishRecordingOperation.Commit);
            return true;
        end, 
        beginEditingAsync = function() --[[ Line: 19 ]] --[[ Name: beginEditingAsync ]]
            -- upvalues: v4 (copy)
            v4.beginEditingAsync();
        end, 
        size = UDim2.new(1, 0, 0, 20)
    });
end;