local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v3 = require(l_Actions_0.Window.SelectItem);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v6, v7, v8) --[[ Line: 18 ]] --[[ Name: CreateStyleRule ]]
    -- upvalues: v1 (copy), v3 (copy)
    return function(v9, v10) --[[ Line: 19 ]]
        -- upvalues: v7 (copy), v6 (copy), v8 (copy), v1 (ref), v3 (ref)
        local v11 = nil;
        v10.recordChange({
            Name = "StyleEditor/CreateStyleRule", 
            DisplayName = "StyleEditor - Create StyleRule", 
            DoChange = function() --[[ Line: 25 ]] --[[ Name: DoChange ]]
                -- upvalues: v7 (ref), v6 (ref), v11 (ref)
                if v7:sub(1, 1) == "," and v6:IsA("StyleRule") then
                    v6.Selector = v6.Selector .. v7;
                    v6.Name = v6.Selector;
                    v11 = v6;
                else
                    v11 = Instance.new("StyleRule");
                    v11.Name = v7;
                    v11.Selector = v7;
                    v11.Parent = v6;
                end;
                return Enum.FinishRecordingOperation.Commit;
            end
        });
        if v8 and v11 then
            local v12 = v1.createItemId(v11);
            v9:dispatch(v3(v12));
        end;
        return v11;
    end;
end;