local v0 = require(script.Parent.CoreGuiManager);
local v1 = require(script.Parent.Enum.Direction);
local v2 = require(script.Parent.Extents2D);
local _ = require(script.Parent.FFlag);
local v4 = require(script.Parent.SelectionManager);
local v5 = require(script.Parent.Utility);
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = {};
local v13 = {};
local v14 = Color3.fromRGB(255, 255, 255);
local v15 = Color3.fromRGB(136, 136, 136);
local v16 = Color3.fromRGB(222, 222, 222);
local v17 = {
    [v1.E] = Vector2.new(0, 0.5), 
    [v1.SE] = Vector2.new(0, 0), 
    [v1.S] = Vector2.new(0.5, 0), 
    [v1.SW] = Vector2.new(1, 0), 
    [v1.W] = Vector2.new(1, 0.5), 
    [v1.NW] = Vector2.new(1, 1), 
    [v1.N] = Vector2.new(0.5, 1), 
    [v1.NE] = Vector2.new(0, 1)
};
local v18 = {
    [v1.E] = UDim2.new(1, -2, 0.5, 0), 
    [v1.SE] = UDim2.new(1, -2, 1, -2), 
    [v1.S] = UDim2.new(0.5, 0, 1, -2), 
    [v1.SW] = UDim2.new(0, 2, 1, -2), 
    [v1.W] = UDim2.new(0, 2, 0.5, 0), 
    [v1.NW] = UDim2.new(0, 2, 0, 2), 
    [v1.N] = UDim2.new(0.5, 0, 0, 2), 
    [v1.NE] = UDim2.new(1, -2, 0, 2)
};
local v19 = {
    Vector2.new(0, 0.5), 
    Vector2.new(0.5, 0), 
    Vector2.new(1, 0.5), 
    Vector2.new(0.5, 1)
};
local v20 = {
    UDim2.new(1, 0, 0.5, 0), 
    UDim2.new(0.5, 0, 1, 0), 
    UDim2.new(0, 0, 0.5, 0), 
    UDim2.new(0.5, 0, 0, 0)
};
local v21 = {
    UDim2.new(0, 1, 1, 2), 
    UDim2.new(1, 2, 0, 1), 
    UDim2.new(0, 1, 1, 2), 
    UDim2.new(1, 2, 0, 1)
};
local function v23() --[[ Line: 93 ]] --[[ Name: createSnappingLine ]]
    -- upvalues: v0 (copy)
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.BorderSizePixel = 0;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Image = "rbxasset://textures/blockUpperLeft.png";
    l_ImageLabel_0.ScaleType = Enum.ScaleType.Tile;
    l_ImageLabel_0.TileSize = UDim2.new(0, 16, 0, 16);
    l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_ImageLabel_0.ImageColor3 = Color3.new(0.8, 0.8, 0.8);
    l_ImageLabel_0.Parent = v0:findOrCreateScreenGui("Adornments");
    return l_ImageLabel_0;
end;
local function v25() --[[ Line: 106 ]] --[[ Name: createFrame ]]
    -- upvalues: v0 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.BorderSizePixel = 0;
    l_Frame_0.BackgroundColor3 = Color3.new(0, 0, 0);
    l_Frame_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_0.Parent = v0:findOrCreateScreenGui("Adornments");
    return l_Frame_0;
end;
local function _() --[[ Line: 115 ]] --[[ Name: selectionHandlesExist ]]
    -- upvalues: v12 (ref)
    return #v12 > 0;
end;
local function v28(v27) --[[ Line: 126 ]] --[[ Name: createSelectionHandleParent ]]
    -- upvalues: v11 (ref)
    v11 = Instance.new("Frame");
    v11.Name = v27;
    v11.AnchorPoint = Vector2.new(0, 0);
    v11.BackgroundTransparency = 1;
    v11.BackgroundColor3 = Color3.new(0, 0, 255);
    v11.BorderSizePixel = 0;
end;
local function v33(v29) --[[ Line: 143 ]] --[[ Name: createSelectionHandles ]]
    -- upvalues: v1 (copy), v17 (copy), v18 (copy), v14 (copy), v15 (copy), v11 (ref), v12 (ref)
    for v30 = v1.FIRST, v1.LAST do
        local l_Frame_1 = Instance.new("Frame");
        l_Frame_1.Name = v29 .. "Handle_" .. v1:toShortName(v30);
        l_Frame_1.AnchorPoint = v17[v30];
        l_Frame_1.Size = UDim2.new(0, 8, 0, 8);
        l_Frame_1.Position = v18[v30];
        l_Frame_1.BackgroundColor3 = v14;
        l_Frame_1.BorderColor3 = v15;
        l_Frame_1.ZIndex = 3;
        local l_ImageLabel_1 = Instance.new("ImageLabel");
        l_ImageLabel_1.Image = "rbxasset://textures/StudioUIEditor/resizeHandleDropShadow.png";
        l_ImageLabel_1.Name = "ResizeHandleDropShadow_" .. v1:toShortName(v30);
        l_ImageLabel_1.Size = UDim2.new(0, 16, 0, 16);
        l_ImageLabel_1.Position = UDim2.new(0, -4, 0, -3);
        l_ImageLabel_1.BackgroundTransparency = 1;
        l_ImageLabel_1.BorderSizePixel = 0;
        l_ImageLabel_1.ImageColor3 = Color3.fromRGB(0, 0, 0);
        l_ImageLabel_1.ImageTransparency = 0.6;
        l_ImageLabel_1.ScaleType = Enum.ScaleType.Slice;
        l_ImageLabel_1.SliceCenter = Rect.new(4, 4, 12, 12);
        l_ImageLabel_1.ZIndex = 2;
        l_ImageLabel_1.Parent = l_Frame_1;
        l_Frame_1.Parent = v11;
        v12[v30] = l_Frame_1;
    end;
end;
local function v36() --[[ Line: 183 ]] --[[ Name: createSelectionBoundingBox ]]
    -- upvalues: v19 (copy), v16 (copy), v20 (copy), v21 (copy), v13 (ref), v11 (ref)
    for v34 = 1, 4 do
        local l_Frame_2 = Instance.new("Frame");
        l_Frame_2.AnchorPoint = v19[v34];
        l_Frame_2.BackgroundColor3 = v16;
        l_Frame_2.BorderSizePixel = 0;
        l_Frame_2.Position = v20[v34];
        l_Frame_2.Size = v21[v34];
        v13[v34] = l_Frame_2;
        v13[v34].Parent = v11;
    end;
end;
local v37 = {};
local v38 = {};
v37.showSnappingLine = function(_, v40) --[[ Line: 203 ]] --[[ Name: showSnappingLine ]]
    -- upvalues: v23 (copy), v5 (copy), v38 (ref)
    local v41 = v23();
    v41.AnchorPoint = Vector2.new(0, 0);
    v41.Position = UDim2.new(0, v40[1].X, 0, v40[1].Y);
    v41.Size = UDim2.new(0, math.max(1, v5:distance(v40[1].X, v40[2].X)), 0, (math.max(1, v5:distance(v40[1].Y, v40[2].Y))));
    v41.ImageColor3 = v40[3];
    table.insert(v38, v41);
end;
v37.hideSnappingLines = function(_) --[[ Line: 218 ]] --[[ Name: hideSnappingLines ]]
    -- upvalues: v38 (ref)
    for v43 = 1, #v38 do
        v38[v43]:Destroy();
    end;
    v38 = {};
end;
v37.showXSnappingLine = function(_, v45, v46) --[[ Line: 226 ]] --[[ Name: showXSnappingLine ]]
    -- upvalues: v8 (ref), v25 (copy)
    if not v8 then
        v8 = v25();
    end;
    v8.Visible = true;
    v8.Size = UDim2.new(0, 1, 0, v46);
    v8.Position = UDim2.new(0, v45.X, 0, v45.Y);
end;
v37.showYSnappingLine = function(_, v48, v49) --[[ Line: 237 ]] --[[ Name: showYSnappingLine ]]
    -- upvalues: v9 (ref), v25 (copy)
    if not v9 then
        v9 = v25();
    end;
    v9.Visible = true;
    v9.Size = UDim2.new(0, v49, 0, 1);
    v9.Position = UDim2.new(0, v48.X, 0, v48.Y);
end;
v37.hideXSnappingLine = function(_) --[[ Line: 248 ]] --[[ Name: hideXSnappingLine ]]
    -- upvalues: v8 (ref)
    if v8 then
        v8.Visible = false;
    end;
end;
v37.hideYSnappingLine = function(_) --[[ Line: 254 ]] --[[ Name: hideYSnappingLine ]]
    -- upvalues: v9 (ref)
    if v9 then
        v9.Visible = false;
    end;
end;
v37.showOfferReparentAdornments = function(_, v53, v54) --[[ Line: 260 ]] --[[ Name: showOfferReparentAdornments ]]
    -- upvalues: v6 (ref), v7 (ref), v25 (copy), v0 (copy)
    if not v6 then
        v6 = v53:Clone();
        v6.AnchorPoint = Vector2.new(0, 0);
        v6.ZIndex = 3;
        v7 = v25();
        v7.BackgroundColor3 = Color3.new(0, 0, 0);
        v7.BackgroundTransparency = 0.8;
        v7.AnchorPoint = Vector2.new(0, 0);
        v7.ZIndex = 2;
    end;
    v6.Parent = v0:findOrCreateScreenGui("Adornments");
    v6.Position = UDim2.new(0, v53.AbsolutePosition.X, 0, v53.AbsolutePosition.Y);
    v6.Size = UDim2.new(0, v53.AbsoluteSize.X, 0, v53.AbsoluteSize.Y);
    v7.Position = UDim2.new(0, v54.AbsolutePosition.X, 0, v54.AbsolutePosition.Y);
    v7.Size = UDim2.new(0, v54.AbsoluteSize.X, 0, v54.AbsoluteSize.Y);
end;
v37.hideOfferReparent = function(_) --[[ Line: 282 ]] --[[ Name: hideOfferReparent ]]
    -- upvalues: v6 (ref), v7 (ref)
    if v6 then
        v6:Destroy();
        v7:Destroy();
        v6 = nil;
        v7 = nil;
    end;
end;
v37.showSelection = function(_) --[[ Line: 292 ]] --[[ Name: showSelection ]]
    -- upvalues: v10 (ref), v4 (copy)
    if v10 and v4:hasFilteredSelection() and not v10.Enabled then
        v10.Enabled = true;
    end;
end;
v37.hideSelection = function(_) --[[ Line: 300 ]] --[[ Name: hideSelection ]]
    -- upvalues: v10 (ref)
    if v10 and v10.Enabled then
        v10.Enabled = false;
    end;
end;
v37.updateSelectionPosition = function(_) --[[ Line: 308 ]] --[[ Name: updateSelectionPosition ]]
    -- upvalues: v4 (copy), v10 (ref), v37 (copy), v2 (copy)
    local v59 = v4:getFilteredSelection();
    if v10 == nil or #v59 == 0 then
        return;
    else
        v37:updateSelectionAdorns(v2:getExtentsFromGuis(v59));
        return;
    end;
end;
v37.createSelectionAdorns = function(_) --[[ Line: 317 ]] --[[ Name: createSelectionAdorns ]]
    -- upvalues: v12 (ref), v0 (copy), v10 (ref), v28 (copy), v11 (ref), v33 (copy), v36 (copy), v37 (copy), v2 (copy), v4 (copy)
    if #v12 > 0 then
        return;
    else
        local v61 = v0:findOrCreateFolder("m_handles");
        if not v10 then
            v10 = Instance.new("ScreenGui", v61);
            v10.Enabled = false;
            v10.ClipToDeviceSafeArea = false;
            v10.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None;
        end;
        v28("UIEditorSelectionHandleParent");
        v11.Parent = v10;
        v33("Selection");
        v36();
        v37:updateSelectionAdorns(v2:getExtentsFromGuis(v4:getFilteredSelection()));
        v10.Enabled = true;
        return;
    end;
end;
v37.updateSelectionAdorns = function(_, v63) --[[ Line: 340 ]] --[[ Name: updateSelectionAdorns ]]
    -- upvalues: v11 (ref), v4 (copy)
    local l_Size_0 = v63.Size;
    local l_TopLeft_0 = v63.TopLeft;
    v11.Position = UDim2.new(0, l_TopLeft_0.X, 0, l_TopLeft_0.Y);
    v11.Size = UDim2.new(0, l_Size_0.X, 0, l_Size_0.Y);
    local v66 = v4:getFilteredSelection();
    if #v66 == 1 then
        v11.Rotation = v66[1].AbsoluteRotation;
        return;
    else
        v11.Rotation = 0;
        return;
    end;
end;
v37.deleteSelectionAdorns = function(_) --[[ Line: 360 ]] --[[ Name: deleteSelectionAdorns ]]
    -- upvalues: v12 (ref), v13 (ref), v11 (ref), v10 (ref)
    for v68 = 1, #v12 do
        v12[v68]:Destroy();
    end;
    for v69 = 1, #v13 do
        v13[v69]:Destroy();
    end;
    v12 = {};
    v13 = {};
    if v11 then
        v11:Destroy();
        v11 = nil;
    end;
    if v10 then
        v10:Destroy();
        v10 = nil;
    end;
end;
return v37;