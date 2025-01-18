local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v2 = require(l_Parent_0.Src.Util.DesignHelpers);
local v3 = require(l_Parent_0.Src.Util.MenuHelpers);
local v4 = require(l_Parent_0.Src.Resources.ModernIcons);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v6 = require(l_Thunks_0.Change.ClearStyleSheetCategory);
local v7 = require(l_Thunks_0.Change.CreateStyleRule);
local v8 = require(l_Thunks_0.Change.DeleteInstance);
local v9 = require(l_Thunks_0.Change.DuplicateInstance);
local v10 = require(l_Thunks_0.Change.PasteInstanceInto);
local v11 = require(l_Thunks_0.Change.SetStyleSheetCategory);
local v12 = require(l_Thunks_0.Change.ShowInstanceInExplorer);
local l_join_0 = require(l_Parent_0.Packages.Dash).join;
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v16, v17) --[[ Line: 33 ]] --[[ Name: ShowStyleSheetMenu ]]
    -- upvalues: v3 (copy), v7 (copy), v11 (copy), v2 (copy), l_join_0 (copy), v4 (copy), v9 (copy), v8 (copy), v10 (copy), v12 (copy), v6 (copy)
    return function(v18, v19) --[[ Line: 34 ]]
        -- upvalues: v3 (ref), v16 (copy), v7 (ref), v17 (copy), v11 (ref), v2 (ref), l_join_0 (ref), v4 (ref), v9 (ref), v8 (ref), v10 (ref), v12 (ref), v6 (ref)
        local v20 = v18:getState();
        local l_Localization_0 = v19.Localization;
        local v24 = v3.getNewSelectorAction(v16, function(v22) --[[ Line: 38 ]]
            -- upvalues: v18 (copy), v7 (ref), v16 (ref)
            local l_Selector_0 = v22.Data.Selector;
            v18:dispatch(v7(v16, l_Selector_0, true));
        end, l_Localization_0);
        local v26 = v3.getRenameAction(function(_) --[[ Line: 42 ]]
            -- upvalues: v17 (ref)
            v17();
        end, l_Localization_0);
        local v29 = v3.getStyleSheetCategoryActions(function(v27) --[[ Line: 45 ]]
            -- upvalues: v18 (copy), v11 (ref), v16 (ref)
            local l_Category_0 = v27.Data.Category;
            if not l_Category_0 then
                return;
            else
                v18:dispatch(v11(v16, l_Category_0));
                return;
            end;
        end, l_Localization_0);
        local v30 = v20.Clipboard.Instance ~= nil;
        local v31 = v16:GetAttribute("StyleCategory") or "";
        local v32 = v2.isTheme(v16);
        local v33 = v31 == "Tokens" or v32;
        local v39 = {
            Id = "StyleSheet", 
            Children = {
                l_join_0(v24, {
                    Hidden = v33
                }), 
                v26, 
                {
                    Id = "Duplicate", 
                    Text = l_Localization_0:getText("ContextMenu", "Duplicate"), 
                    Icon = v4.duplicate(), 
                    OnItemClicked = function(_) --[[ Line: 69 ]] --[[ Name: OnItemClicked ]]
                        -- upvalues: v18 (copy), v9 (ref), v16 (ref)
                        v18:dispatch(v9(v16, v16.Parent));
                    end
                }, 
                {
                    Id = "Delete", 
                    Text = l_Localization_0:getText("ContextMenu", "Delete"), 
                    Icon = v4.delete(), 
                    OnItemClicked = function(_) --[[ Line: 77 ]] --[[ Name: OnItemClicked ]]
                        -- upvalues: v18 (copy), v8 (ref), v16 (ref)
                        v18:dispatch(v8(v16));
                    end
                }, 
                {
                    Id = "PasteInto", 
                    Text = l_Localization_0:getText("ContextMenu", "PasteInto"), 
                    Icon = v4.paste(), 
                    Hidden = v33, 
                    Enabled = v30, 
                    OnItemClicked = function(_) --[[ Line: 87 ]] --[[ Name: OnItemClicked ]]
                        -- upvalues: v18 (copy), v10 (ref), v16 (ref)
                        v18:dispatch(v10(v16));
                    end
                }, 
                {
                    Id = "ShowInExplorer", 
                    Text = l_Localization_0:getText("ContextMenu", "ShowInExplorer"), 
                    Icon = v3.getClassIcon("ReplicatedStorage"), 
                    OnItemClicked = function(_) --[[ Line: 95 ]] --[[ Name: OnItemClicked ]]
                        -- upvalues: v18 (copy), v12 (ref), v16 (ref)
                        v18:dispatch(v12(v16));
                    end
                }, 
                {
                    Id = "RemoveFromCategory", 
                    Text = l_Localization_0:getText("ContextMenu", v32 and "RemoveFromThemes" or "RemoveFromTokens"), 
                    Icon = v4.remove(), 
                    Hidden = not v33, 
                    OnItemClicked = function(_) --[[ Line: 107 ]] --[[ Name: OnItemClicked ]]
                        -- upvalues: v18 (copy), v6 (ref), v16 (ref)
                        v18:dispatch(v6(v16));
                    end, 
                    Data = {
                        Category = v31
                    }
                }, 
                {
                    Id = "SetCategory", 
                    Text = l_Localization_0:getText("ContextMenu", "SetCategory"), 
                    Icon = v4.set(), 
                    Hidden = v33, 
                    Children = v29
                }
            }
        };
        v3.trackClicks(v39, v19.Telemetry);
        v3.showContextMenu(v19.Plugin, v39);
    end;
end;