local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v2 = require(l_Parent_0.Src.Util.MenuHelpers);
local v3 = require(l_Parent_0.Src.Resources.ModernIcons);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v5 = require(l_Thunks_0.Change.CreateStyleRule);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v8, v9) --[[ Line: 23 ]] --[[ Name: ShowNewStyleRuleMenu ]]
    -- upvalues: v3 (copy), v5 (copy), v2 (copy)
    return function(v10, v11) --[[ Line: 24 ]]
        -- upvalues: v3 (ref), v5 (ref), v8 (copy), v9 (copy), v2 (ref)
        local l_Localization_0 = v11.Localization;
        local v14 = {
            Id = "DesignCategory", 
            Children = {
                {
                    Id = "New", 
                    Text = l_Localization_0:getText("ContextMenu", "New"), 
                    Icon = v3.new(), 
                    OnItemClicked = function(_) --[[ Line: 34 ]] --[[ Name: OnItemClicked ]]
                        -- upvalues: v10 (copy), v5 (ref), v8 (ref), v9 (ref)
                        v10:dispatch(v5(v8, v9, true));
                    end
                }
            }
        };
        v2.trackClicks(v14, v11.Telemetry);
        v2.showContextMenu(v11.Plugin, v14);
    end;
end;