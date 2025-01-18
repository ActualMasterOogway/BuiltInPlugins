local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Util.DesignHelpers);
local v3 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.Window.SelectItem);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function() --[[ Line: 21 ]] --[[ Name: CreateTokenSheet ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v2 (copy), v3 (copy), v5 (copy)
    return function(v8, v9) --[[ Line: 22 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v2 (ref), v3 (ref), v5 (ref)
        local l_DesignSheet_0 = v8:getState().Window.DesignSheet;
        local v11 = nil;
        v9.recordChange({
            Name = "StyleEditor/CreateTokenSheet", 
            DisplayName = "StyleEditor - Create Token Sheet", 
            DoChange = function() --[[ Line: 31 ]] --[[ Name: DoChange ]]
                -- upvalues: v11 (ref), l_DesignSheet_0 (copy), l_ReplicatedStorage_0 (ref), v2 (ref)
                v11 = Instance.new("StyleSheet");
                v11.Name = "StyleSheet";
                v11.Parent = if l_DesignSheet_0 then l_DesignSheet_0.Parent else l_ReplicatedStorage_0;
                v11:SetAttribute("StyleCategory", "Tokens");
                v2.setAsToken(v11, l_DesignSheet_0);
                return Enum.FinishRecordingOperation.Commit;
            end
        });
        if v11 then
            local v12 = v3.createItemId(v11);
            v8:dispatch(v5(v12));
        end;
        return v11;
    end;
end;