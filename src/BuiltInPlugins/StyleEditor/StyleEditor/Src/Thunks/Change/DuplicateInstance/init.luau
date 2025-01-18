local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v3 = require(l_Actions_0.Window.SelectItem);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v6, v7) --[[ Line: 18 ]] --[[ Name: DuplicateInstance ]]
    -- upvalues: v1 (copy), v3 (copy)
    return function(v8, v9) --[[ Line: 19 ]]
        -- upvalues: v6 (copy), v7 (copy), v1 (ref), v3 (ref)
        local v10 = nil;
        v9.recordChange({
            Name = "StyleEditor/DuplicateInstance", 
            DisplayName = "StyleEditor - Duplicate Instance", 
            DoChange = function() --[[ Line: 25 ]] --[[ Name: DoChange ]]
                -- upvalues: v10 (ref), v6 (ref), v7 (ref)
                v10 = v6:Clone();
                v10.Parent = v7;
                return Enum.FinishRecordingOperation.Commit;
            end
        });
        if v10 then
            local v11 = v1.createItemId(v10);
            v8:dispatch(v3(v11));
        end;
        return v10;
    end;
end;