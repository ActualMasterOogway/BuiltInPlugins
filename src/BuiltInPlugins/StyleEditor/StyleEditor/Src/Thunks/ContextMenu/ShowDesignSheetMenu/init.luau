local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v2 = require(l_Parent_0.Src.Util.MenuHelpers);
local v3 = require(l_Parent_0.Src.Resources.ModernIcons);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v5 = require(l_Thunks_0.Change.CreateStyleRule);
local v6 = require(l_Thunks_0.Change.DeleteInstance);
local v7 = require(l_Thunks_0.Change.PasteInstanceInto);
local v8 = require(l_Thunks_0.Change.ShowInstanceInExplorer);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v11, v12) --[[ Line: 26 ]] --[[ Name: ShowDesignSheetMenu ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy), v6 (copy), v7 (copy), v8 (copy)
    return function(v13, v14) --[[ Line: 27 ]]
        -- upvalues: v2 (ref), v11 (copy), v5 (ref), v12 (copy), v3 (ref), v6 (ref), v7 (ref), v8 (ref)
        local v15 = v13:getState();
        local l_Localization_0 = v14.Localization;
        local v19 = v2.getNewSelectorAction(v11, function(v17) --[[ Line: 31 ]]
            -- upvalues: v13 (copy), v5 (ref), v11 (ref)
            local l_Selector_0 = v17.Data.Selector;
            v13:dispatch(v5(v11, l_Selector_0, true));
        end, l_Localization_0);
        local v21 = v2.getRenameAction(function(_) --[[ Line: 35 ]]
            -- upvalues: v12 (ref)
            v12();
        end, l_Localization_0);
        local v22 = v15.Clipboard.Instance ~= nil;
        local v26 = {
            Id = "DesignSheet", 
            Children = {
                v19, 
                v21, 
                {
                    Id = "Delete", 
                    Text = l_Localization_0:getText("ContextMenu", "Delete"), 
                    Icon = v3.delete(), 
                    OnItemClicked = function(_) --[[ Line: 50 ]] --[[ Name: OnItemClicked ]]
                        -- upvalues: v13 (copy), v6 (ref), v11 (ref)
                        v13:dispatch(v6(v11));
                    end
                }, 
                {
                    Id = "PasteInto", 
                    Text = l_Localization_0:getText("ContextMenu", "PasteInto"), 
                    Icon = v3.paste(), 
                    Enabled = v22, 
                    OnItemClicked = function(_) --[[ Line: 59 ]] --[[ Name: OnItemClicked ]]
                        -- upvalues: v13 (copy), v7 (ref), v11 (ref)
                        v13:dispatch(v7(v11));
                    end
                }, 
                {
                    Id = "ShowInExplorer", 
                    Text = l_Localization_0:getText("ContextMenu", "ShowInExplorer"), 
                    Icon = v2.getClassIcon("ReplicatedStorage"), 
                    OnItemClicked = function(_) --[[ Line: 67 ]] --[[ Name: OnItemClicked ]]
                        -- upvalues: v13 (copy), v8 (ref), v11 (ref)
                        v13:dispatch(v8(v11));
                    end
                }
            }
        };
        v2.trackClicks(v26, v14.Telemetry);
        v2.showContextMenu(v14.Plugin, v26);
    end;
end;