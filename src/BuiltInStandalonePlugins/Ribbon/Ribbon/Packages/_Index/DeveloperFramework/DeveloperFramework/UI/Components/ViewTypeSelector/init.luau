local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local l_Localization_0 = require(l_Parent_0.ContextServices).Localization;
local v2 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else "";
local v3 = require(l_Parent_0.Styling.hasTag);
local v4 = require(l_Parent_0.Styling.joinTags);
local l_LOCALIZATION_PROJECT_NAME_0 = require(l_Parent_0.Resources).LOCALIZATION_PROJECT_NAME;
local v6 = require(l_Parent_0.Parent.Dash);
local v7 = require(l_Parent_0.UI.Components.Pane);
local v8 = require(l_Parent_0.UI.Components.SelectInput);
local v9 = require(l_Parent_0.UI.Components.ViewTypeButton);
local v10 = require(l_Parent_0.UI.Components.ViewTypeButton.ViewType);
local l_useState_0 = v2.useState;
local v12 = require(script.styles);
local v13 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkViewTypeSelectorUpdate);
local v14 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkViewTypeSelectorIcons);
local function _(v15) --[[ Line: 73 ]] --[[ Name: getViewTypeAsString ]]
    -- upvalues: v10 (copy)
    return ({
        [v10.List] = "List", 
        [v10.Grid] = "Grid", 
        [v10.Unsupported] = "Unsupported"
    })[v15] or "Unsupported";
end;
local function v20(v17) --[[ Line: 82 ]] --[[ Name: createInputItems ]]
    -- upvalues: v10 (copy), v6 (copy), l_LOCALIZATION_PROJECT_NAME_0 (copy)
    local v18 = v10.allValues();
    table.remove(v18, v10.Unsupported.rawValue());
    return v6.map(v18, function(v19) --[[ Line: 85 ]]
        -- upvalues: v17 (copy), l_LOCALIZATION_PROJECT_NAME_0 (ref), v10 (ref)
        return {
            Id = v19, 
            Label = v17:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "ViewTypeSelector", ({
                [v10.List] = "List", 
                [v10.Grid] = "Grid", 
                [v10.Unsupported] = "Unsupported"
            })[v19] or "Unsupported")
        };
    end);
end;
return function(v21) --[[ Line: 97 ]] --[[ Name: ViewTypeSelector ]]
    -- upvalues: v2 (copy), l_Localization_0 (copy), v20 (copy), v10 (copy), l_useState_0 (copy), v9 (copy), v3 (copy), v14 (copy), v12 (copy), v7 (copy), v4 (copy), v8 (copy), v13 (copy)
    assert(v2 ~= "", "You must be using non-legacy React in order to use ViewTypeSelector");
    local v22 = l_Localization_0:use();
    local v23 = v21[v2.Tag] or "";
    local v24 = v20(v22);
    local v25 = if type(v21.Default) == "number" then v10.fromRawValue(v21.Default) else v21.Default;
    local v26, v27 = l_useState_0(v25 or v10.List);
    local function v34(v28, v29, v30) --[[ Line: 106 ]] --[[ Name: renderItem ]]
        -- upvalues: v10 (ref), v21 (copy), v2 (ref), v9 (ref)
        local v31 = v28.Id == v10.Grid;
        local v32 = v31 and "Grid" or "";
        local v33 = v21.HideLabels and v21.HideSlider and "Icon" or "";
        return v2.createElement(v9, {
            ViewType = v28.Id, 
            Text = if not v21.HideLabels then v28.Label else "", 
            GridTileSize = v21.DefaultGridTileSize, 
            OnGridTileSizeChanged = if v31 then v21.OnGridTileSizeChanged else nil, 
            OnClick = v30, 
            LayoutOrder = v29, 
            MinGridTileSize = v21.MinGridTileSize, 
            MaxGridTileSize = v21.MaxGridTileSize, 
            HasSlider = not v21.HideSlider and v28.Id == v10.Grid, 
            [v2.Tag] = ("%* %*"):format(v32, v33)
        });
    end;
    local v35 = v3(v21[v2.Tag], "IconOnly");
    local v36 = nil;
    if v14() then
        v36 = v26 == v10.Grid and "Grid" or "List";
    elseif v35 then
        v36 = if v26 == v10.Grid then v12:GetAttribute("GridIcon") else v12:GetAttribute("ListIcon");
    end;
    return v2.createElement(v7, {
        LayoutOrder = v21.LayoutOrder, 
        [v2.Tag] = v4("Component-ViewTypeSelector", if not v14() then nil else v36, v23)
    }, {
        Input = v2.createElement(v8, {
            ExpandIcon = if not v14() and v13() then v36 else nil, 
            Items = v24, 
            Icons = if not v14() then {
                v12:GetAttribute("ListIcon"), 
                v12:GetAttribute("GridIcon")
            } else nil, 
            UseAutoWidth = true, 
            Size = if v13() and v35 then v12:GetAttribute("SizeIconOnly") else v12:GetAttribute("SizeDefault"), 
            HideText = true, 
            LayoutOrder = v21.LayoutOrder, 
            OnRenderItem = v34, 
            SelectedId = if v13() then v26 else v21.Default or v10.List, 
            OnItemActivated = function(v37) --[[ Line: 172 ]] --[[ Name: OnItemActivated ]]
                -- upvalues: v13 (ref), v27 (copy), v21 (copy)
                if v13() then
                    v27(v37.Id);
                end;
                v21.OnViewTypeSelected(v37.Id);
            end, 
            ShowSelection = if v13() then not v35 else nil, 
            [v2.Tag] = if not v14() then nil else ("%* HasIcon"):format(v36)
        })
    });
end;