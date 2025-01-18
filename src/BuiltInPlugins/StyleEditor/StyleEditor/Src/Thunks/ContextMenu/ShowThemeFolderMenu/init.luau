local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v2 = require(l_Parent_0.Src.Util.MenuHelpers);
local v3 = require(l_Parent_0.Src.Resources.ModernIcons);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v5 = require(l_Thunks_0.Change.CreateThemeSheet);
local v6 = require(l_Thunks_0.Change.DeleteInstance);
local v7 = require(l_Thunks_0.Change.ShowInstanceInExplorer);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v10, v11) --[[ Line: 25 ]] --[[ Name: ShowThemeFolderMenu ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy), v6 (copy), v7 (copy)
    return function(v12, v13) --[[ Line: 26 ]]
        -- upvalues: v2 (ref), v11 (copy), v3 (ref), v5 (ref), v10 (copy), v6 (ref), v7 (ref)
        local l_Localization_0 = v13.Localization;
        local v16 = v2.getRenameAction(function(_) --[[ Line: 29 ]]
            -- upvalues: v11 (ref)
            v11();
        end, l_Localization_0);
        local v20 = {
            Id = "ThemeCategory_Folder", 
            Children = {
                {
                    Id = "New", 
                    Text = l_Localization_0:getText("ContextMenu", "New"), 
                    Icon = v3.new(), 
                    OnItemClicked = function(_) --[[ Line: 40 ]] --[[ Name: OnItemClicked ]]
                        -- upvalues: v12 (copy), v5 (ref), v10 (ref)
                        v12:dispatch(v5(v10));
                    end
                }, 
                {
                    Id = "Delete", 
                    Text = l_Localization_0:getText("ContextMenu", "Delete"), 
                    Icon = v3.delete(), 
                    OnItemClicked = function(_) --[[ Line: 48 ]] --[[ Name: OnItemClicked ]]
                        -- upvalues: v12 (copy), v6 (ref), v10 (ref)
                        v12:dispatch(v6(v10));
                    end
                }, 
                v16, 
                {
                    Id = "ShowInExplorer", 
                    Text = l_Localization_0:getText("ContextMenu", "ShowInExplorer"), 
                    Icon = v2.getClassIcon("ReplicatedStorage"), 
                    OnItemClicked = function(_) --[[ Line: 57 ]] --[[ Name: OnItemClicked ]]
                        -- upvalues: v12 (copy), v7 (ref), v10 (ref)
                        v12:dispatch(v7(v10));
                    end
                }
            }
        };
        v2.trackClicks(v20, v13.Telemetry);
        v2.showContextMenu(v13.Plugin, v20);
    end;
end;