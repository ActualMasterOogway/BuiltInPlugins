local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v9 = require(l_Parent_0.Packages.React);
local _ = require(l_Parent_0.Packages.Rodux);
local l_showContextMenu_0 = require(l_Parent_0.Packages.Framework).UI.showContextMenu;
local v12 = require(l_Parent_0.Packages.Dash);
local l_map_0 = v12.map;
local l_filter_0 = v12.filter;
local l_join_0 = v12.join;
local v16 = require(l_Parent_0.Src.Resources.Telemetry.ContextMenuItemClickedEvent);
local _ = require(l_Parent_0.Src.Contexts.Telemetry.Types);
local _ = require(l_Parent_0.Src.Types);
local v19 = require(l_Parent_0.Src.Resources.ModernIcons);
local v23 = {
    Classes = {
        "CanvasGroup", 
        "ImageButton", 
        "ImageLabel", 
        "ScrollingFrame", 
        "Frame", 
        "TextBox", 
        "TextButton", 
        "TextLabel"
    }, 
    PseudoInstances = {
        "UIAspectRatioConstraint", 
        "UICorner", 
        "UIGradient", 
        "UIGridLayout", 
        "UIListLayout", 
        "UIPadding", 
        "UIPageLayout", 
        "UIScale", 
        "UISizeConstraint", 
        "UIStroke", 
        "UITableLayout", 
        "UITextSizeConstraint"
    }, 
    GuiStates = {
        "hover", 
        "idle", 
        "pressed"
    }, 
    AttributeTypes = {
        "string", 
        "boolean", 
        "number", 
        "UDim", 
        "UDim2", 
        "BrickColor", 
        "Color3", 
        "Vector2", 
        "Vector3", 
        "CFrame", 
        "ColorSequence", 
        "NumberSequence", 
        "NumberRange", 
        "Rect", 
        "Font"
    }, 
    getClassIcon = function(v20) --[[ Line: 83 ]] --[[ Name: getClassIcon ]]
        -- upvalues: l_StudioService_0 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 84 ]]
            -- upvalues: l_StudioService_0 (ref), v20 (copy)
            return l_StudioService_0:GetClassIcon(v20);
        end);
        if l_status_0 then
            return l_result_0.Image;
        else
            return nil;
        end;
    end, 
    StyleSheetCategories = {
        {
            Name = "Tokens", 
            Icon = v19.Standard.TokenSheet()
        }, 
        {
            Name = "Themes", 
            Icon = v19.Standard.ThemeSheet()
        }, 
        {
            Name = "Designs", 
            Icon = v19.Standard.DesignSheet()
        }
    }, 
    MoreAction = {
        {
            Id = "Menu", 
            Icon = {
                Image = v19.more()
            }, 
            [v9.Tag] = "Contrast IconOnly"
        }
    }, 
    FullSpanMoreAction = {
        {
            Id = "Menu", 
            Icon = {
                Image = v19.more()
            }, 
            [v9.Tag] = "IconOnly SecondaryHoverBackground"
        }
    }
};
v23.getStyleSheetCategoryActions = function(v24, v25) --[[ Line: 130 ]] --[[ Name: getStyleSheetCategoryActions ]]
    -- upvalues: l_map_0 (copy), v23 (copy)
    return l_map_0(v23.StyleSheetCategories, function(v26) --[[ Line: 134 ]]
        -- upvalues: v25 (copy), v24 (copy)
        return {
            Id = v26.Name, 
            Text = v25:getText("Category", v26.Name), 
            Icon = v26.Icon, 
            OnItemClicked = v24, 
            Data = {
                Category = v26.Name
            }
        };
    end);
end;
v23.getAttributeTypeActions = function(v27, v28) --[[ Line: 147 ]] --[[ Name: getAttributeTypeActions ]]
    -- upvalues: l_map_0 (copy)
    return l_map_0(v27, function(v29) --[[ Line: 151 ]]
        -- upvalues: v28 (copy)
        return {
            Id = v29, 
            Text = v29, 
            OnItemClicked = v28, 
            Data = {
                Type = v29
            }
        };
    end);
end;
v23.getClassTypeActions = function(v30, _) --[[ Line: 163 ]] --[[ Name: getClassTypeActions ]]
    -- upvalues: l_map_0 (copy), v23 (copy)
    return l_map_0(v23.Classes, function(v32) --[[ Line: 167 ]]
        -- upvalues: v23 (ref), v30 (copy)
        return {
            Id = v32, 
            Text = v32, 
            Icon = v23.getClassIcon(v32), 
            OnItemClicked = v30, 
            Data = {
                Selector = v32
            }
        };
    end);
end;
v23.getNewSelectorAction = function(v33, v34, v35) --[[ Line: 180 ]] --[[ Name: getNewSelectorAction ]]
    -- upvalues: l_map_0 (copy), l_join_0 (copy), v23 (copy), v19 (copy), v12 (copy)
    local function v36(v37, v38) --[[ Line: 185 ]] --[[ Name: buildSubActions ]]
        -- upvalues: l_map_0 (ref), l_join_0 (ref), v36 (copy)
        return l_map_0(v38, function(v39) --[[ Line: 186 ]]
            -- upvalues: l_join_0 (ref), v36 (ref), v37 (copy)
            if v39.Children then
                return l_join_0(v39, {
                    Children = v36(v37, v39.Children)
                });
            else
                return l_join_0(v39, {
                    Data = {
                        Selector = v37 .. v39.Data.Selector
                    }
                });
            end;
        end);
    end;
    local v40 = v33:IsA("StyleRule");
    local v42 = l_map_0(v23.PseudoInstances, function(v41) --[[ Line: 203 ]]
        -- upvalues: v23 (ref), v34 (copy)
        return {
            Id = v41, 
            Text = v41, 
            Icon = v23.getClassIcon(v41), 
            OnItemClicked = v34, 
            Data = {
                Selector = "::" .. v41
            }
        };
    end);
    local v44 = l_map_0(v23.GuiStates, function(v43) --[[ Line: 215 ]]
        -- upvalues: v19 (ref), v34 (copy)
        return {
            Id = v43, 
            Text = v43, 
            Icon = v19.Selectors.GuiState(), 
            OnItemClicked = v34, 
            Data = {
                Selector = ":" .. v43
            }
        };
    end);
    local v45 = {
        Id = "Name", 
        Icon = v19.Selectors.Name(), 
        Text = v35:getText("ContextMenu", "New.Name"), 
        OnItemClicked = v34, 
        Data = {
            Selector = "#Name"
        }
    };
    local v46 = {
        Id = "Tag", 
        Text = v35:getText("ContextMenu", "New.Tag"), 
        Icon = v19.Selectors.Tag(), 
        OnItemClicked = v34, 
        Data = {
            Selector = ".Tag"
        }
    };
    local v47 = {
        Id = "Class", 
        Icon = v19.Selectors.Class(), 
        Text = v35:getText("ContextMenu", "New.Class"), 
        OnItemClicked = v12.noop, 
        Children = v23.getClassTypeActions(v34, v35)
    };
    local v48 = {
        Id = "Empty", 
        Text = v35:getText("ContextMenu", "New.Empty"), 
        OnItemClicked = v34, 
        Data = {
            Selector = ""
        }
    };
    local v49 = {
        Id = "New", 
        Text = v35:getText("ContextMenu", "New"), 
        Icon = v19.new()
    };
    local v50 = {};
    local l_v45_0 = v45;
    local l_v46_0 = v46;
    local l_v47_0 = v47;
    local v54 = {
        Id = "PseudoInstance", 
        Icon = v19.Selectors.PseudoInstance(), 
        Text = v35:getText("ContextMenu", "New.PseudoInstance"), 
        Children = v42
    };
    local v55 = {
        Id = "GuiState", 
        Icon = v19.Selectors.GuiState(), 
        Text = v35:getText("ContextMenu", "New.GuiState"), 
        Children = v44
    };
    local v56 = {
        Id = "Enumerator", 
        Icon = v19.Selectors.Enumerator(), 
        Enabled = v40, 
        Text = v35:getText("ContextMenu", "New.Enumerator")
    };
    local v57;
    if v40 then
        local v58 = {
            v45, 
            v46, 
            v47, 
            v48
        };
        local l_l_map_0_0 = l_map_0;
        local l_v58_0 = v58;
        local v61 = ",";
        local l_v61_0 = v61 --[[ copy: 24 -> 27 ]];
        v57 = l_l_map_0_0(l_v58_0, function(v63) --[[ Line: 186 ]]
            -- upvalues: l_join_0 (ref), v36 (copy), l_v61_0 (copy)
            if v63.Children then
                return l_join_0(v63, {
                    Children = v36(l_v61_0, v63.Children)
                });
            else
                return l_join_0(v63, {
                    Data = {
                        Selector = l_v61_0 .. v63.Data.Selector
                    }
                });
            end;
        end);
    else
        v57 = nil;
    end;
    v56.Children = v57;
    v57 = {
        Id = "Child", 
        Icon = v19.Selectors.Child(), 
        Text = v35:getText("ContextMenu", "New.Child")
    };
    local v64 = {
        v45, 
        v46, 
        v47, 
        v48
    };
    local l_l_map_0_1 = l_map_0;
    local l_v64_0 = v64;
    local v67 = ">";
    v57.Children = l_l_map_0_1(l_v64_0, function(v68) --[[ Line: 186 ]]
        -- upvalues: l_join_0 (ref), v36 (copy), v67 (copy)
        if v68.Children then
            return l_join_0(v68, {
                Children = v36(v67, v68.Children)
            });
        else
            return l_join_0(v68, {
                Data = {
                    Selector = v67 .. v68.Data.Selector
                }
            });
        end;
    end);
    local v69 = {
        Id = "Descendant", 
        Icon = v19.Selectors.Descendant(), 
        Text = v35:getText("ContextMenu", "New.Descendant")
    };
    l_l_map_0_1 = {
        v45, 
        v46, 
        v47, 
        v48
    };
    l_v64_0 = l_map_0;
    local l_l_l_map_0_1_0 = l_l_map_0_1;
    local v71 = ">>";
    v69.Children = l_v64_0(l_l_l_map_0_1_0, function(v72) --[[ Line: 186 ]]
        -- upvalues: l_join_0 (ref), v36 (copy), v71 (copy)
        if v72.Children then
            return l_join_0(v72, {
                Children = v36(v71, v72.Children)
            });
        else
            return l_join_0(v72, {
                Data = {
                    Selector = v71 .. v72.Data.Selector
                }
            });
        end;
    end);
    v64 = v48;
    v6(v50, 1, l_v45_0, l_v46_0, l_v47_0, v54, v55, v56, v57, v69, v64);
    v49.Children = v50;
    return v49;
end;
v23.getRenameAction = function(v73, v74) --[[ Line: 310 ]] --[[ Name: getRenameAction ]]
    -- upvalues: v19 (copy)
    return {
        Id = "Rename", 
        Text = v74:getText("ContextMenu", "Rename"), 
        Icon = v19.edit(), 
        OnItemClicked = v73
    };
end;
v23.buildMenu = function(v75) --[[ Line: 322 ]] --[[ Name: buildMenu ]]
    -- upvalues: v23 (copy), l_map_0 (copy), l_join_0 (copy)
    local v76 = v23.filterHiddenActions(v75.Children or {});
    local v78 = l_map_0(v76, function(v77) --[[ Line: 324 ]]
        -- upvalues: v75 (copy), v23 (ref)
        v77.Id = v75.Id .. "/" .. v77.Id;
        return (v23.buildMenu(v77));
    end);
    local v79 = l_join_0(v75, v78);
    v79.Children = nil;
    return v79;
end;
v23.decorateClickHandlers = function(v80, v81) --[[ Line: 336 ]] --[[ Name: decorateClickHandlers ]]
    -- upvalues: v23 (copy)
    local l_OnItemClicked_0 = v80.OnItemClicked;
    if l_OnItemClicked_0 then
        v80.OnItemClicked = function(v83) --[[ Line: 339 ]]
            -- upvalues: v81 (copy), l_OnItemClicked_0 (copy)
            v81(v83);
            l_OnItemClicked_0(v83);
        end;
    end;
    if v80.Children then
        for _, v85 in v80.Children do
            v23.decorateClickHandlers(v85, v81);
        end;
    end;
end;
v23.trackClicks = function(v86, v87) --[[ Line: 352 ]] --[[ Name: trackClicks ]]
    -- upvalues: v23 (copy), v16 (copy)
    v23.decorateClickHandlers(v86, function(v88) --[[ Line: 353 ]]
        -- upvalues: v87 (copy), v16 (ref)
        v87:logTelemetryEvent(v16({
            path = v88.Id, 
            data = v88.Data
        }));
    end);
end;
v23.showContextMenu = function(v89, v90) --[[ Line: 361 ]] --[[ Name: showContextMenu ]]
    -- upvalues: v23 (copy), l_showContextMenu_0 (copy)
    local v91 = v23.buildMenu(v90);
    l_showContextMenu_0(v89, v91);
end;
v23.filterHiddenActions = function(v92) --[[ Line: 366 ]] --[[ Name: filterHiddenActions ]]
    -- upvalues: l_filter_0 (copy)
    return l_filter_0(v92, function(v93) --[[ Line: 367 ]]
        return v93.Hidden ~= true;
    end);
end;
return v23;