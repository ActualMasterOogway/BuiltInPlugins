local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.DesignHelpers);
local v2 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.Window.SelectItem);
local v5 = require(l_Actions_0.Window.SetDesignSheet);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function() --[[ Line: 20 ]] --[[ Name: CreateDesignSheet ]]
    -- upvalues: v1 (copy), v5 (copy), v2 (copy), v4 (copy)
    return function(v8, v9) --[[ Line: 21 ]]
        -- upvalues: v1 (ref), v5 (ref), v2 (ref), v4 (ref)
        local v10 = nil;
        v9.recordChange({
            Name = "StyleEditor/CreateDesignSheet", 
            DisplayName = "StyleEditor - Create Design Sheet", 
            DoChange = function() --[[ Line: 27 ]] --[[ Name: DoChange ]]
                -- upvalues: v10 (ref), v1 (ref), v8 (copy), v5 (ref)
                v10 = v1.createDesign();
                v8:dispatch(v5(v10));
                return Enum.FinishRecordingOperation.Commit;
            end
        });
        if v10 then
            local v11 = v2.createItemId(v10);
            v8:dispatch(v4(v11));
        end;
        return v10;
    end;
end;