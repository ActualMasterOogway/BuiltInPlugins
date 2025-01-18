local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v3) --[[ Line: 13 ]] --[[ Name: PasteStyleInstanceAttribute ]]
    return function(v4, v5) --[[ Line: 14 ]]
        -- upvalues: v3 (copy)
        local l_Attribute_0 = v4:getState().Clipboard.Attribute;
        if not l_Attribute_0 then
            return;
        else
            assert(l_Attribute_0 ~= nil, "expecting valid attribute");
            v5.recordChange({
                Name = "StyleEditor/PasteStyleInstanceAttribute", 
                DisplayName = "StyleEditor - Paste StyleInstance Token", 
                DoChange = function() --[[ Line: 26 ]] --[[ Name: DoChange ]]
                    -- upvalues: v3 (ref), l_Attribute_0 (copy)
                    v3:SetAttribute(l_Attribute_0.Name, l_Attribute_0.Value);
                    return Enum.FinishRecordingOperation.Commit;
                end
            });
            return;
        end;
    end;
end;