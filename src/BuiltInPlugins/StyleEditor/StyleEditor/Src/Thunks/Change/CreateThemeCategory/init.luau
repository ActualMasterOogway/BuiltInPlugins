local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.Window.SelectItem);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function() --[[ Line: 20 ]] --[[ Name: CreateThemeCategory ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v2 (copy), v4 (copy)
    return function(v7, v8) --[[ Line: 21 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v2 (ref), v4 (ref)
        local l_DesignSheet_0 = v7:getState().Window.DesignSheet;
        local v10 = nil;
        v8.recordChange({
            Name = "StyleEditor/CreateThemeCategory", 
            DisplayName = "StyleEditor - Create Theme Category", 
            DoChange = function() --[[ Line: 30 ]] --[[ Name: DoChange ]]
                -- upvalues: v10 (ref), l_DesignSheet_0 (copy), l_ReplicatedStorage_0 (ref)
                v10 = Instance.new("Folder");
                v10.Name = "Folder";
                v10.Parent = if l_DesignSheet_0 then l_DesignSheet_0.Parent else l_ReplicatedStorage_0;
                v10:SetAttribute("StyleCategory", "Themes");
                return Enum.FinishRecordingOperation.Commit;
            end
        });
        if v10 then
            local v11 = v2.createItemId(v10);
            v7:dispatch(v4(v11));
        end;
        return v10;
    end;
end;