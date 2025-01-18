local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local _ = require(script.Parent.types);
local l_Components_0 = l_Parent_0.Components;
local v5 = require(l_Components_0.Tile);
local v6 = require(l_Components_0.PreviewTile);
local l_LayoutOrderIterator_0 = require(l_Parent_1.Framework).Util.LayoutOrderIterator;
local function v11(v8, v9, v10) --[[ Line: 19 ]] --[[ Name: renderTile ]]
    -- upvalues: v5 (copy), v2 (copy)
    if v8 == v5 then
        v10.Image = v9;
    else
        v10.Model = v9;
    end;
    return v2.createElement(v8, v10);
end;
local function v24(v12, v13, v14) --[[ Line: 28 ]] --[[ Name: createThumbnailTile ]]
    -- upvalues: v11 (copy), v6 (copy), v5 (copy)
    local l_AssetsInfo_0 = v12.AssetsInfo;
    local l_OnThumbnailClick_0 = v12.OnThumbnailClick;
    local l_DefaultThumbnail_0 = v12.DefaultThumbnail;
    local v18 = v12.SelectedTiles[v13] ~= nil;
    local l_l_DefaultThumbnail_0_0 = l_DefaultThumbnail_0;
    local v20 = l_AssetsInfo_0[v13];
    if v20 then
        local v21 = {
            OnClick = function() --[[ Line: 40 ]] --[[ Name: OnClick ]]
                -- upvalues: l_OnThumbnailClick_0 (copy), v13 (copy), v18 (copy)
                l_OnThumbnailClick_0(v13, v18);
            end, 
            Text = v20.Name or v20.name or "", 
            IsOn = v18, 
            LayoutOrder = v14
        };
        if v20.Instance then
            local l_Instance_0 = v20.Instance;
            return v11(v6, l_Instance_0, v21);
        else
            local l_ThumbnailType_0 = v20.ThumbnailType;
            if l_ThumbnailType_0 and l_ThumbnailType_0 ~= "" then
                l_l_DefaultThumbnail_0_0 = "rbxthumb://type=" .. l_ThumbnailType_0 .. "&id=" .. tostring(v13) .. "&w=150&h=150";
            end;
            return v11(v5, l_l_DefaultThumbnail_0_0, v21);
        end;
    else
        return;
    end;
end;
return function(v25) --[[ Line: 60 ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v24 (copy)
    local l_AssetIds_0 = v25.AssetIds;
    local l_LayoutOrder_0 = v25.LayoutOrder;
    local v28 = l_LayoutOrderIterator_0.new();
    local l_l_LayoutOrder_0_0 = l_LayoutOrder_0;
    local v30 = {};
    for _, v32 in ipairs(l_AssetIds_0) do
        v30[l_l_LayoutOrder_0_0] = v24(v25, v32, l_l_LayoutOrder_0_0);
        l_l_LayoutOrder_0_0 = l_LayoutOrder_0 + v28:getNextOrder();
    end;
    return v30;
end;