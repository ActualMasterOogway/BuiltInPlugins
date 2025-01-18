local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v2 = require(l_Parent_0.Src.Util.MenuHelpers);
local v3 = require(l_Parent_0.Src.Resources.ModernIcons);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v5 = require(l_Thunks_0.Change.CreateStyleRule);
local v6 = require(l_Thunks_0.Change.PasteInstanceInto);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v9) --[[ Line: 24 ]] --[[ Name: ShowUiElementsMenu ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy), v6 (copy)
    return function(v10, v11) --[[ Line: 25 ]]
        -- upvalues: v2 (ref), v5 (ref), v9 (copy), v3 (ref), v6 (ref)
        local v12 = v10:getState();
        local l_Localization_0 = v11.Localization;
        local v16 = v2.getClassTypeActions(function(v14) --[[ Line: 29 ]]
            -- upvalues: v10 (copy), v5 (ref), v9 (ref)
            local l_Selector_0 = v14.Data.Selector;
            v10:dispatch(v5(v9, l_Selector_0, true));
        end, l_Localization_0);
        local v17 = v12.Clipboard.Instance ~= nil;
        local v19 = {
            Id = "DesignCategory_UiElements", 
            Children = {
                {
                    Id = "New", 
                    Text = l_Localization_0:getText("ContextMenu", "New"), 
                    Icon = v3.new(), 
                    Children = v16
                }, 
                {
                    Id = "PasteInto", 
                    Text = l_Localization_0:getText("ContextMenu", "PasteInto"), 
                    Icon = v3.paste(), 
                    Enabled = v17, 
                    OnItemClicked = function(_) --[[ Line: 50 ]] --[[ Name: OnItemClicked ]]
                        -- upvalues: v10 (copy), v6 (ref), v9 (ref)
                        v10:dispatch(v6(v9));
                    end
                }
            }
        };
        v2.trackClicks(v19, v11.Telemetry);
        v2.showContextMenu(v11.Plugin, v19);
    end;
end;