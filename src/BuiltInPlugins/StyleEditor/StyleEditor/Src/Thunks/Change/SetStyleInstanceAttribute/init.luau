local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
local _ = require(l_Parent_0.Src.Types);
return function(v4, v5, v6) --[[ Line: 16 ]] --[[ Name: SetStyleInstanceAttribute ]]
    return function(_, v8) --[[ Line: 21 ]]
        -- upvalues: v4 (copy), v5 (copy), v6 (copy)
        v8.recordChange({
            Name = "StyleEditor/SetStyleInstanceAttribute", 
            DisplayName = "StyleEditor - Set StyleInstance Token", 
            DoChange = function() --[[ Line: 25 ]] --[[ Name: DoChange ]]
                -- upvalues: v4 (ref), v5 (ref), v6 (ref)
                v4:SetAttribute(v5, v6);
                return Enum.FinishRecordingOperation.Commit;
            end
        });
    end;
end;