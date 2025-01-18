local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v2 = require(l_Parent_0.Src.Util.MenuHelpers);
local v3 = require(l_Parent_0.Src.Resources.ModernIcons);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v5 = require(l_Thunks_0.Change.CreateThemeSheet);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function() --[[ Line: 23 ]] --[[ Name: ShowThemeOtherMenu ]]
    -- upvalues: v3 (copy), v5 (copy), v2 (copy)
    return function(v8, v9) --[[ Line: 24 ]]
        -- upvalues: v3 (ref), v5 (ref), v2 (ref)
        local l_Localization_0 = v9.Localization;
        local v12 = {
            Id = "ThemeCategory_Other", 
            Children = {
                {
                    Id = "New", 
                    Text = l_Localization_0:getText("ContextMenu", "New"), 
                    Icon = v3.new(), 
                    OnItemClicked = function(_) --[[ Line: 34 ]] --[[ Name: OnItemClicked ]]
                        -- upvalues: v8 (copy), v5 (ref)
                        v8:dispatch(v5(nil));
                    end
                }
            }
        };
        v2.trackClicks(v12, v9.Telemetry);
        v2.showContextMenu(v9.Plugin, v12);
    end;
end;