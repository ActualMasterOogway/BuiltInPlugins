local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.React);
local _ = require(l_Parent_0.Packages._Index.DeveloperFramework.DeveloperFramework.Types);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v1.Style.Stylizer;
local l_UI_0 = v1.UI;
local l_InfiniteScrollingGrid_0 = l_UI_0.InfiniteScrollingGrid;
local l_Pane_0 = l_UI_0.Pane;
local l_Shimmer_0 = l_UI_0.Shimmer;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local _ = require(l_Parent_0.Src.Types);
local v14 = require(l_Parent_0.Src.Components.TextureItem);
local v15 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v16 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorSupportVariations2);
local v17 = v2.PureComponent:extend("TextureBrowser");
v17.init = function(v18) --[[ Line: 72 ]] --[[ Name: init ]]
    -- upvalues: v15 (copy), v2 (copy), v14 (copy), l_Shimmer_0 (copy), v16 (copy), l_showContextMenu_0 (copy)
    assert(not v15(), "Expected FFlagMaterialGeneratorNewUI to be false");
    v18.getItemKey = function(v19) --[[ Line: 75 ]]
        if v19.Type == "Material" then
            return ("%s-%s"):format(v19.Material.Textures.ColorMap, (tostring(v19.Selected)));
        elseif v19.Type == "Shimmer" then
            return (("shimmer-%*"):format(v19.Index));
        else
            error((("Unknown item type passed to getItemKey: %*"):format(v19.Type)));
            return;
        end;
    end;
    local function v24(v20, v21) --[[ Line: 86 ]] --[[ Name: renderMaterialItem ]]
        -- upvalues: v2 (ref), v14 (ref), v18 (copy)
        local l_Material_0 = v21.Material;
        local l_ColorMap_0 = l_Material_0.Textures.ColorMap;
        return v2.createElement(v14, {
            Image = l_ColorMap_0, 
            LayoutOrder = v20, 
            OnClick = function() --[[ Line: 93 ]] --[[ Name: OnClick ]]
                -- upvalues: v18 (ref), l_Material_0 (copy)
                v18.props.OnMaterialSelected(l_Material_0);
            end, 
            OnRightClick = function() --[[ Line: 96 ]] --[[ Name: OnRightClick ]]
                -- upvalues: v18 (ref), l_Material_0 (copy)
                v18.showContextMenu(l_Material_0);
            end, 
            Selected = v21.Selected
        });
    end;
    local function v26(v25) --[[ Line: 103 ]] --[[ Name: renderShimmer ]]
        -- upvalues: l_Shimmer_0 (ref), v2 (ref)
        assert(l_Shimmer_0 ~= nil, "DevFrameworkShimmer is not enabled");
        return v2.createElement(l_Shimmer_0, {
            LayoutOrder = v25.Index
        });
    end;
    v18.renderItem = function(v27, v28) --[[ Line: 111 ]]
        -- upvalues: v24 (copy), v26 (copy)
        if v28.Type == "Material" then
            return v24(v27, v28);
        elseif v28.Type == "Shimmer" then
            return v26(v28);
        else
            error((("Unknown item type passed to renderItem: %*"):format(v28.Type)));
            return;
        end;
    end;
    v18.showContextMenu = function(v29) --[[ Line: 121 ]]
        -- upvalues: v18 (copy), v16 (ref), l_showContextMenu_0 (ref)
        local l_props_0 = v18.props;
        local v31 = l_props_0.Plugin:get();
        local l_Localization_1 = l_props_0.Localization;
        local v33 = #l_props_0.Materials > 0;
        local v34 = {
            {
                Text = l_Localization_1:getText("TextureBrowser", "Remove"), 
                Enabled = v29 ~= nil, 
                OnItemClicked = function() --[[ Line: 133 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: v18 (ref), v29 (copy)
                    v18.props.OnRemove(v29);
                end
            }, 
            {
                Text = l_Localization_1:getText("TextureBrowser", "RemoveAll"), 
                Enabled = v33, 
                OnItemClicked = l_props_0.OnRemoveAll
            }
        };
        if v16() then
            table.insert(v34, 1, {
                Text = l_Localization_1:getText("TextureBrowser", "GenerateVariations"), 
                Enabled = v29 ~= nil, 
                OnItemClicked = function() --[[ Line: 147 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: v18 (ref), v29 (copy)
                    v18.props.OnGenerateVariations(v29);
                end
            });
        end;
        task.spawn(function() --[[ Line: 152 ]]
            -- upvalues: l_showContextMenu_0 (ref), v31 (copy), v34 (copy)
            l_showContextMenu_0(v31, v34);
        end);
    end;
    v18.rightClick = function() --[[ Line: 157 ]]
        -- upvalues: v18 (copy)
        v18.showContextMenu();
    end;
end;
v17.render = function(v35) --[[ Line: 162 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), l_InfiniteScrollingGrid_0 (copy)
    local l_props_1 = v35.props;
    local l_TextureBrowser_0 = l_props_1.Stylizer.TextureBrowser;
    local l_CellPadding_0 = l_TextureBrowser_0.CellPadding;
    local l_CellSize_0 = l_TextureBrowser_0.CellSize;
    local l_Padding_0 = l_TextureBrowser_0.Padding;
    local v41 = {};
    for v42 = 1, l_props_1.GeneratingImages do
        table.insert(v41, {
            Type = "Shimmer", 
            Index = v42
        });
    end;
    for _, v44 in l_props_1.Materials do
        table.insert(v41, {
            Type = "Material", 
            Material = v44, 
            Selected = l_props_1.SelectedMaterial == v44
        });
    end;
    return v2.createElement(l_Pane_0, {
        LayoutOrder = l_props_1.LayoutOrder, 
        OnRightClick = v35.rightClick, 
        Size = l_props_1.Size
    }, {
        v2.createElement(l_InfiniteScrollingGrid_0, {
            AbsoluteMax = #l_props_1.Materials + l_props_1.GeneratingImages, 
            BackgroundTransparency = 1, 
            CellPadding = l_CellPadding_0, 
            CellSize = l_CellSize_0, 
            BufferedRows = 2, 
            GetItemKey = v35.getItemKey, 
            Items = v41, 
            Loading = false, 
            Padding = l_Padding_0, 
            RenderItem = v35.renderItem, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 1
        })
    });
end;
return l_withContext_0({
    Localization = l_Localization_0, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_Stylizer_0
})(v17);