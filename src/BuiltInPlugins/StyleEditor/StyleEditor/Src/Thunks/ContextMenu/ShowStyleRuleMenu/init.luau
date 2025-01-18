local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v2 = require(l_Parent_0.Src.Util.MenuHelpers);
local v3 = require(l_Parent_0.Src.Resources.ModernIcons);
local v4 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v6 = require(l_Actions_0.Clipboard.CopyInstanceToClipboard);
local v7 = require(l_Actions_0.Window.SetItemsExpanded);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v9 = require(l_Thunks_0.Change.CreateStyleRule);
local v10 = require(l_Thunks_0.Change.DeleteInstance);
local v11 = require(l_Thunks_0.Change.DuplicateInstance);
local v12 = require(l_Thunks_0.Change.PasteInstanceInto);
local v13 = require(l_Thunks_0.Change.ShowInstanceInExplorer);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v16, v17, v18) --[[ Line: 32 ]] --[[ Name: ShowStyleRuleMenu ]]
    -- upvalues: v2 (copy), v9 (copy), v4 (copy), v7 (copy), v13 (copy), v3 (copy), v6 (copy), v12 (copy), v11 (copy), v10 (copy)
    return function(v19, v20) --[[ Line: 33 ]]
        -- upvalues: v16 (copy), v2 (ref), v9 (ref), v18 (copy), v4 (ref), v7 (ref), v17 (copy), v13 (ref), v3 (ref), v6 (ref), v12 (ref), v11 (ref), v10 (ref)
        if not v16 or not v16:IsA("StyleRule") then
            warn("Selected invalid StyleRule: ", v16);
            return;
        else
            local v21 = v19:getState();
            local l_Localization_0 = v20.Localization;
            local v26 = v2.getNewSelectorAction(v16, function(v23) --[[ Line: 42 ]]
                -- upvalues: v19 (copy), v9 (ref), v16 (ref), v18 (ref), v4 (ref), v7 (ref)
                local l_Selector_0 = v23.Data.Selector;
                v19:dispatch(v9(v16, l_Selector_0, v18));
                local v25 = v4.createItemId(v16);
                v19:dispatch(v7({
                    [v25] = true
                }));
            end, l_Localization_0);
            local v28 = v2.getRenameAction(function(_) --[[ Line: 51 ]]
                -- upvalues: v17 (ref)
                v17();
            end, l_Localization_0);
            local v29 = v21.Clipboard.Instance ~= nil;
            local v35 = {
                Id = "StyleRule", 
                Children = {
                    v26, 
                    v28, 
                    {
                        Id = "ShowInExplorer", 
                        Text = l_Localization_0:getText("ContextMenu", "ShowInExplorer"), 
                        Icon = v2.getClassIcon("ReplicatedStorage"), 
                        OnItemClicked = function(_) --[[ Line: 66 ]] --[[ Name: OnItemClicked ]]
                            -- upvalues: v19 (copy), v13 (ref), v16 (ref)
                            v19:dispatch(v13(v16));
                        end
                    }, 
                    {
                        Id = "Copy", 
                        Text = l_Localization_0:getText("ContextMenu", "Copy"), 
                        Icon = v3.copy(), 
                        OnItemClicked = function(_) --[[ Line: 74 ]] --[[ Name: OnItemClicked ]]
                            -- upvalues: v19 (copy), v6 (ref), v16 (ref)
                            v19:dispatch(v6(v16));
                        end
                    }, 
                    {
                        Id = "PasteInto", 
                        Text = l_Localization_0:getText("ContextMenu", "PasteInto"), 
                        Icon = v3.paste(), 
                        Enabled = v29, 
                        OnItemClicked = function(_) --[[ Line: 83 ]] --[[ Name: OnItemClicked ]]
                            -- upvalues: v19 (copy), v12 (ref), v16 (ref)
                            v19:dispatch(v12(v16));
                        end
                    }, 
                    {
                        Id = "Duplicate", 
                        Text = l_Localization_0:getText("ContextMenu", "Duplicate"), 
                        Icon = v3.duplicate(), 
                        OnItemClicked = function(_) --[[ Line: 91 ]] --[[ Name: OnItemClicked ]]
                            -- upvalues: v16 (ref), v19 (copy), v11 (ref)
                            assert(typeof(v16.Parent) == "Instance", "StyleRule expected to have a valid parent");
                            v19:dispatch(v11(v16, v16.Parent));
                        end
                    }, 
                    {
                        Id = "Delete", 
                        Text = l_Localization_0:getText("ContextMenu", "Delete"), 
                        Icon = v3.delete(), 
                        OnItemClicked = function(_) --[[ Line: 100 ]] --[[ Name: OnItemClicked ]]
                            -- upvalues: v19 (copy), v10 (ref), v16 (ref)
                            v19:dispatch(v10(v16));
                        end
                    }
                }
            };
            v2.trackClicks(v35, v20.Telemetry);
            v2.showContextMenu(v20.Plugin, v35);
            return;
        end;
    end;
end;