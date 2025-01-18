local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Util.DesignHelpers);
local v3 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.Window.SelectItem);
local v6 = require(l_Actions_0.Window.SetDesignSheet);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v9) --[[ Line: 22 ]] --[[ Name: CreateThemeSheet ]]
    -- upvalues: v2 (copy), v6 (copy), l_ReplicatedStorage_0 (copy), v3 (copy), v5 (copy)
    return function(v10, v11) --[[ Line: 23 ]]
        -- upvalues: v2 (ref), v6 (ref), v9 (copy), l_ReplicatedStorage_0 (ref), v3 (ref), v5 (ref)
        local l_DesignSheet_0 = v10:getState().Window.DesignSheet;
        local v13 = nil;
        v11.recordChange({
            Name = "StyleEditor/CreateThemeSheet", 
            DisplayName = "StyleEditor - Create Theme Sheet", 
            DoChange = function() --[[ Line: 32 ]] --[[ Name: DoChange ]]
                -- upvalues: l_DesignSheet_0 (ref), v2 (ref), v10 (copy), v6 (ref), v13 (ref), v9 (ref), l_ReplicatedStorage_0 (ref)
                if not l_DesignSheet_0 then
                    l_DesignSheet_0 = v2.createDesign();
                    v10:dispatch(v6(l_DesignSheet_0));
                end;
                assert(l_DesignSheet_0 ~= nil, "expecting valid design sheet");
                v13 = Instance.new("StyleSheet");
                v13.Name = "StyleSheet";
                v13.Parent = v9 or l_ReplicatedStorage_0;
                v13:SetAttribute("StyleCategory", "Themes");
                v2.setAsTheme(v13, l_DesignSheet_0);
                return Enum.FinishRecordingOperation.Commit;
            end
        });
        if v13 then
            local v14 = v3.createItemId(v13);
            v10:dispatch(v5(v14));
        end;
        return v13;
    end;
end;