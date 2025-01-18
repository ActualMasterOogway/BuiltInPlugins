local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.React);
local v2 = require(l_Parent_0.UI.Components.Pane);
local v3 = require(l_Parent_0.UI.Components.TextLabel);
local v4 = require(l_Parent_0.UI.Components.ViewTypeSelector);
local v5 = require(l_Parent_0.UI.Components.ViewTypeButton.ViewType);
local l_List_0 = v5.List;
local function _(v7) --[[ Line: 12 ]] --[[ Name: getViewTypeString ]]
    -- upvalues: v5 (copy)
    return ({
        [v5.List] = "List", 
        [v5.Grid] = "Grid"
    })[v7] or "Unsupported";
end;
local function v14(v9, v10, v11, v12, v13) --[[ Line: 20 ]] --[[ Name: ViewTypeSelectorStory ]]
    -- upvalues: v1 (copy), v2 (copy), v4 (copy), v3 (copy), v5 (copy)
    return v1.createElement(v2, {
        [v1.Tag] = "X-RowM X-Fit X-Middle"
    }, {
        ViewTypeSelector = v1.createElement(v4, {
            OnGridTileSizeChanged = v12, 
            OnViewTypeSelected = v10, 
            Default = v9, 
            DefaultGridTileSize = v11, 
            HideSlider = v13.HideSlider, 
            HideLabels = v13.HideLabels, 
            LayoutOrder = 1, 
            [v1.Tag] = v13[v1.Tag]
        }), 
        Label = v1.createElement(v3, {
            Text = ({
                [v5.List] = "List", 
                [v5.Grid] = "Grid"
            })[v9] or "Unsupported", 
            LayoutOrder = 2, 
            [v1.Tag] = "X-Fit"
        })
    });
end;
return {
    stories = {
        {
            name = "Default", 
            story = function() --[[ Line: 46 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), l_List_0 (copy), v14 (copy)
                local v15, v16 = v1.useState(l_List_0);
                local v17, v18 = v1.useState(100);
                return v14(v15, v16, v17, v18, {});
            end
        }, 
        {
            name = "Icon Only", 
            story = function() --[[ Line: 55 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), l_List_0 (copy), v14 (copy)
                local v19, v20 = v1.useState(l_List_0);
                local v21, v22 = v1.useState(100);
                local v23 = {
                    [v1.Tag] = "IconOnly"
                };
                return v14(v19, v20, v21, v22, v23);
            end
        }, 
        {
            name = "No Slider", 
            story = function() --[[ Line: 66 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), l_List_0 (copy), v14 (copy)
                local v24, v25 = v1.useState(l_List_0);
                local v26, v27 = v1.useState(100);
                local v28 = {
                    HideSlider = true
                };
                return v14(v24, v25, v26, v27, v28);
            end
        }, 
        {
            name = "No Labels", 
            story = function() --[[ Line: 77 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), l_List_0 (copy), v14 (copy)
                local v29, v30 = v1.useState(l_List_0);
                local v31, v32 = v1.useState(100);
                local v33 = {
                    HideLabels = true
                };
                return v14(v29, v30, v31, v32, v33);
            end
        }, 
        {
            name = "No Labels or Slider", 
            story = function() --[[ Line: 88 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), l_List_0 (copy), v14 (copy)
                local v34, v35 = v1.useState(l_List_0);
                local v36, v37 = v1.useState(100);
                local v38 = {
                    HideLabels = true, 
                    HideSlider = true
                };
                return v14(v34, v35, v36, v37, v38);
            end
        }
    }
};