local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(script.AddItemButton);
local v5 = require(script.CatalogItemButton);
local v6 = require(l_script_FirstAncestor_0.Src.Util.UserCatalogContext);
local v7 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local function v19(v15) --[[ Line: 28 ]] --[[ Name: getPaletteItemDatas ]]
    -- upvalues: v7 (copy)
    local v16 = {};
    for _, v18 in v15.Items do
        table.insert(v16, {
            item = {
                source = v7.SOURCE_BUILTIN, 
                builtinItem = v18
            }, 
            palette = v15
        });
    end;
    return v16;
end;
local function _(v20, v21) --[[ Line: 44 ]] --[[ Name: filterUserCatalog ]]
    -- upvalues: v1 (copy)
    return v1.filter(v20, function(v22) --[[ Line: 45 ]]
        -- upvalues: v21 (copy)
        return v22.palette.Key == v21;
    end);
end;
return function(v24) --[[ Line: 50 ]] --[[ Name: Catalog ]]
    -- upvalues: l_Stylizer_0 (copy), v3 (copy), v6 (copy), l_LayoutOrderIterator_0 (copy), v1 (copy), v19 (copy), v7 (copy), v5 (copy), l_Pane_0 (copy), l_ScrollingFrame_0 (copy), v4 (copy)
    local v25 = l_Stylizer_0:use("Catalog");
    local v26 = v3.useContext(v6);
    local v27 = l_LayoutOrderIterator_0.new();
    local l_Palette_0 = v24.Palette;
    local v33 = v3.useMemo(function() --[[ Line: 58 ]]
        -- upvalues: v1 (ref), v26 (copy), l_Palette_0 (copy), v19 (ref)
        local l_append_0 = v1.append;
        local l_equippableItems_0 = v26.equippableItems;
        local l_Key_0 = l_Palette_0.Key;
        return l_append_0(v1.filter(l_equippableItems_0, function(v32) --[[ Line: 45 ]]
            -- upvalues: l_Key_0 (copy)
            return v32.palette.Key == l_Key_0;
        end), (v19(l_Palette_0)));
    end, {
        l_Palette_0, 
        v26.equippableItems
    });
    local v42 = v1.collectArray(v33, function(v34, v35) --[[ Line: 66 ]]
        -- upvalues: v7 (ref), v3 (ref), v5 (ref), v33 (copy), v25 (copy), v26 (copy), l_Palette_0 (copy), v1 (ref)
        local v36 = v35.item.source == v7.SOURCE_INSTANCE;
        return v3.createElement(v5, {
            key = ("item_%*_%*"):format(v35.item.source, v34), 
            ItemData = v35, 
            IsUserProvided = v36, 
            LayoutOrder = if v36 then v34 else #v33 + v34, 
            Size = v25.CellSize, 
            Delete = v35.item.source ~= v7.SOURCE_BUILTIN and function() --[[ Line: 76 ]]
                -- upvalues: v26 (ref), l_Palette_0 (ref), v35 (copy)
                return v26.removeItem(l_Palette_0, v35.item.instance);
            end or nil, 
            DeleteAll = v35.item.source ~= v7.SOURCE_BUILTIN and function() --[[ Line: 81 ]]
                -- upvalues: v26 (ref), l_Palette_0 (ref), v1 (ref), v7 (ref)
                local l_equippableItems_1 = v26.equippableItems;
                local l_Key_1 = l_Palette_0.Key;
                for _, v41 in v1.filter(l_equippableItems_1, function(v39) --[[ Line: 45 ]]
                    -- upvalues: l_Key_1 (copy)
                    return v39.palette.Key == l_Key_1;
                end) do
                    if v41.item.source == v7.SOURCE_INSTANCE then
                        assert(v41.item.source == v7.SOURCE_INSTANCE, v7.LUAU_ANALYZE_ERROR);
                        v26.removeItem(l_Palette_0, v41.item.instance);
                    end;
                end;
            end or nil
        });
    end);
    local v43 = v24.Palette.PreviewAspectRatio or 1;
    return v3.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical
    }, {
        ScrollingFrame = v3.createElement(l_ScrollingFrame_0, {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v27:getNextOrder(), 
            Size = UDim2.new(UDim.new(1, 0), v25.ScrollingFrameHeight), 
            Style = v25.ScrollingFrame
        }, {
            UIGridLayout = v3.createElement("UIGridLayout", {
                CellPadding = UDim2.fromOffset(5, 5), 
                CellSize = UDim2.new(v25.CellSize.X, UDim.new(v25.CellSize.Y.Scale / v43, v25.CellSize.Y.Offset / v43)), 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }, {
                UIAspectRatioConstraint = v3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = v43
                })
            })
        }, v42), 
        AddItemButton = v3.createElement(v4, {
            LayoutOrder = v27:getNextOrder(), 
            Palette = l_Palette_0
        })
    });
end;