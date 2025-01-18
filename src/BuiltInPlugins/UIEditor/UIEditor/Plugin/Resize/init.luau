local v0 = require(script.Parent.AdornmentModule);
local v1 = require(script.Parent.Analytics);
local v2 = require(script.Parent.CoreGuiManager);
local v3 = require(script.Parent.Convert);
local v4 = require(script.Parent.Enum.Direction);
local v5 = require(script.Parent.Extents2D);
local _ = require(script.Parent.FFlag);
local v7 = require(script.Parent.GlobalValues);
local v8 = require(script.Parent.MouseIconManager);
local v9 = require(script.Parent.SelectionManager);
local v10 = require(script.Parent.SnappingPointManager);
local v11 = require(script.Parent.Utility);
local v12 = require(script.Parent.Flags.GetFFlagUIEditorFixCrashInConvert);
local v13 = require(script.Parent.Enum.SnappingType);
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v16 = Color3.fromRGB(255, 255, 255);
local v17 = Color3.fromRGB(255, 255, 255);
local v18 = Color3.fromRGB(136, 136, 136);
local v19 = Color3.fromRGB(222, 222, 222);
local _ = Vector2.new(1, 1);
local l_NOT_SET_0 = v4.NOT_SET;
local l_NW_0 = v4.NW;
local l_N_0 = v4.N;
local l_NE_0 = v4.NE;
local l_W_0 = v4.W;
local l_E_0 = v4.E;
local l_SW_0 = v4.SW;
local l_S_0 = v4.S;
local l_SE_0 = v4.SE;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = {};
local v35 = {};
local v36 = {};
local v37 = nil;
local v38 = nil;
local v39 = nil;
local v40 = {};
local v41 = false;
local v42 = true;
local l_l_NOT_SET_0_0 = l_NOT_SET_0;
local function _(v44) --[[ Line: 91 ]] --[[ Name: onHandleMouseEnter ]]
    -- upvalues: l_l_NOT_SET_0_0 (ref)
    l_l_NOT_SET_0_0 = v44;
end;
local function _(v46) --[[ Line: 98 ]] --[[ Name: onHandleMouseLeave ]]
    -- upvalues: l_l_NOT_SET_0_0 (ref), l_NOT_SET_0 (copy)
    if v46 == l_l_NOT_SET_0_0 then
        l_l_NOT_SET_0_0 = l_NOT_SET_0;
    end;
end;
local function v48() --[[ Line: 114 ]] --[[ Name: createHandleParent ]]
    -- upvalues: v33 (ref)
    v33 = Instance.new("Frame");
    v33.Name = "UIEditorResizeHandleParent";
    v33.AnchorPoint = Vector2.new(0, 0);
    v33.BackgroundTransparency = 1;
    v33.BackgroundColor3 = Color3.new(0, 0, 255);
    v33.BorderSizePixel = 0;
end;
local function _() --[[ Line: 126 ]] --[[ Name: getHandleSize ]]
    -- upvalues: v31 (ref)
    local v49 = 7;
    if v31 then
        v49 = math.clamp(v31.AbsoluteSize.Y * 0.00875, 3, 7);
    end;
    return UDim2.new(0, v49, 0, v49);
end;
local function v54() --[[ Line: 138 ]] --[[ Name: updateHandleSize ]]
    -- upvalues: v34 (ref), v31 (ref)
    for v51 = 1, #v34 do
        local v52 = v34[v51];
        local v53 = 7;
        if v31 then
            v53 = math.clamp(v31.AbsoluteSize.Y * 0.00875, 3, 7);
        end;
        v52.Size = UDim2.new(0, v53, 0, v53);
        v52:FindFirstChildWhichIsA("ImageLabel").Size = UDim2.new(0, v52.AbsoluteSize.X + 8, 0, v52.AbsoluteSize.Y + 8);
    end;
end;
local function v65() --[[ Line: 148 ]] --[[ Name: createResizeHandles ]]
    -- upvalues: v4 (copy), v31 (ref), v17 (copy), v18 (copy), l_l_NOT_SET_0_0 (ref), l_NOT_SET_0 (copy), v33 (ref), v34 (ref)
    local v55 = {
        [v4.E] = Vector2.new(0, 0.5), 
        [v4.SE] = Vector2.new(0, 0), 
        [v4.S] = Vector2.new(0.5, 0), 
        [v4.SW] = Vector2.new(1, 0), 
        [v4.W] = Vector2.new(1, 0.5), 
        [v4.NW] = Vector2.new(1, 1), 
        [v4.N] = Vector2.new(0.5, 1), 
        [v4.NE] = Vector2.new(0, 1)
    };
    local v56 = {
        [v4.E] = UDim2.new(1, -2, 0.5, 0), 
        [v4.SE] = UDim2.new(1, -2, 1, -2), 
        [v4.S] = UDim2.new(0.5, 0, 1, -2), 
        [v4.SW] = UDim2.new(0, 2, 1, -2), 
        [v4.W] = UDim2.new(0, 2, 0.5, 0), 
        [v4.NW] = UDim2.new(0, 2, 0, 2), 
        [v4.N] = UDim2.new(0.5, 0, 0, 2), 
        [v4.NE] = UDim2.new(1, -2, 0, 2)
    };
    for v57 = v4.FIRST, v4.LAST do
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.Name = "ResizeHandle_" .. v4:toShortName(v57);
        l_Frame_0.AnchorPoint = v55[v57];
        local v59 = 7;
        if v31 then
            v59 = math.clamp(v31.AbsoluteSize.Y * 0.00875, 3, 7);
        end;
        l_Frame_0.Size = UDim2.new(0, v59, 0, v59);
        l_Frame_0.Position = v56[v57];
        l_Frame_0.BackgroundColor3 = v17;
        l_Frame_0.BorderColor3 = v18;
        l_Frame_0.ZIndex = 3;
        local l_ImageLabel_0 = Instance.new("ImageLabel");
        l_ImageLabel_0.Image = "rbxasset://textures/StudioUIEditor/resizeHandleDropShadow.png";
        l_ImageLabel_0.Name = "ResizeHandleDropShadow_" .. v4:toShortName(v57);
        l_ImageLabel_0.Size = UDim2.new(0, l_Frame_0.AbsoluteSize.X + 8, 0, l_Frame_0.AbsoluteSize.Y + 8);
        l_ImageLabel_0.Position = UDim2.new(0, -4, 0, -3);
        l_ImageLabel_0.BackgroundTransparency = 1;
        l_ImageLabel_0.BorderSizePixel = 0;
        l_ImageLabel_0.ImageColor3 = Color3.fromRGB(0, 0, 0);
        l_ImageLabel_0.ImageTransparency = 0.6;
        l_ImageLabel_0.ScaleType = Enum.ScaleType.Slice;
        l_ImageLabel_0.SliceCenter = Rect.new(4, 4, 12, 12);
        l_ImageLabel_0.ZIndex = 2;
        l_ImageLabel_0.Parent = l_Frame_0;
        l_Frame_0.MouseEnter:connect(function(_, _) --[[ Line: 213 ]]
            -- upvalues: v57 (copy), l_l_NOT_SET_0_0 (ref)
            l_l_NOT_SET_0_0 = v57;
        end);
        l_Frame_0.MouseLeave:connect(function(_, _) --[[ Line: 216 ]]
            -- upvalues: v57 (copy), l_l_NOT_SET_0_0 (ref), l_NOT_SET_0 (ref)
            if v57 == l_l_NOT_SET_0_0 then
                l_l_NOT_SET_0_0 = l_NOT_SET_0;
            end;
        end);
        l_Frame_0.Parent = v33;
        v34[v57] = l_Frame_0;
    end;
end;
local function v71() --[[ Line: 227 ]] --[[ Name: createBoundingBox ]]
    -- upvalues: v19 (copy), v35 (ref), v33 (ref)
    local v66 = {
        Vector2.new(0, 0.5), 
        Vector2.new(0.5, 0), 
        Vector2.new(1, 0.5), 
        Vector2.new(0.5, 1)
    };
    local v67 = {
        UDim2.new(1, 0, 0.5, 0), 
        UDim2.new(0.5, 0, 1, 0), 
        UDim2.new(0, 0, 0.5, 0), 
        UDim2.new(0.5, 0, 0, 0)
    };
    local v68 = {
        UDim2.new(0, 1, 1, 2), 
        UDim2.new(1, 2, 0, 1), 
        UDim2.new(0, 1, 1, 2), 
        UDim2.new(1, 2, 0, 1)
    };
    for v69 = 1, 4 do
        local l_Frame_1 = Instance.new("Frame");
        l_Frame_1.AnchorPoint = v66[v69];
        l_Frame_1.BackgroundColor3 = v19;
        l_Frame_1.BorderSizePixel = 0;
        l_Frame_1.Position = v67[v69];
        l_Frame_1.Size = v68[v69];
        v35[v69] = l_Frame_1;
        v35[v69].Parent = v33;
    end;
end;
local function _() --[[ Line: 273 ]] --[[ Name: handlesExist ]]
    -- upvalues: v34 (ref)
    return #v34 > 0;
end;
local function _(v73, v74) --[[ Line: 278 ]] --[[ Name: getPositionFromHandle ]]
    -- upvalues: l_NW_0 (copy), l_N_0 (copy), l_NE_0 (copy), l_W_0 (copy), l_E_0 (copy), l_SW_0 (copy), l_S_0 (copy), l_SE_0 (copy)
    if v74 == l_NW_0 then
        return v73.TopLeft;
    elseif v74 == l_N_0 then
        return Vector2.new(v73.Center.X, v73.Top);
    elseif v74 == l_NE_0 then
        return v73.TopRight;
    elseif v74 == l_W_0 then
        return Vector2.new(v73.Left, v73.Center.Y);
    elseif v74 == l_E_0 then
        return Vector2.new(v73.Right, v73.Center.Y);
    elseif v74 == l_SW_0 then
        return v73.BottomLeft;
    elseif v74 == l_S_0 then
        return Vector2.new(v73.Center.X, v73.Bottom);
    elseif v74 == l_SE_0 then
        return v73.BottomRight;
    else
        return v73.Center;
    end;
end;
local function _(v76) --[[ Line: 300 ]] --[[ Name: getSnappingTypeFromHandle ]]
    -- upvalues: l_NW_0 (copy), v13 (copy), l_N_0 (copy), l_NE_0 (copy), l_W_0 (copy), l_E_0 (copy), l_SW_0 (copy), l_S_0 (copy), l_SE_0 (copy)
    if v76 == l_NW_0 then
        return v13.ResizeXnYn;
    elseif v76 == l_N_0 then
        return v13.ResizeYn;
    elseif v76 == l_NE_0 then
        return v13.ResizeXpYn;
    elseif v76 == l_W_0 then
        return v13.ResizeXn;
    elseif v76 == l_E_0 then
        return v13.ResizeXp;
    elseif v76 == l_SW_0 then
        return v13.ResizeXnYp;
    elseif v76 == l_S_0 then
        return v13.ResizeYp;
    elseif v76 == l_SE_0 then
        return v13.ResizeXpYp;
    else
        return nil;
    end;
end;
local function v81(v78) --[[ Line: 324 ]] --[[ Name: updateHandlePositionFromExtents ]]
    -- upvalues: v33 (ref), v36 (ref), v54 (copy)
    if v78 == nil then
        return;
    else
        local l_Size_0 = v78.Size;
        local l_TopLeft_0 = v78.TopLeft;
        if v33 == nil then
            return;
        else
            v33.Position = UDim2.new(0, l_TopLeft_0.X, 0, l_TopLeft_0.Y);
            v33.Size = UDim2.new(0, l_Size_0.X, 0, l_Size_0.Y);
            if #v36 == 1 then
                v33.Rotation = v36[1].AbsoluteRotation;
            else
                v33.Rotation = 0;
            end;
            v54();
            return;
        end;
    end;
end;
local function v83() --[[ Line: 352 ]] --[[ Name: createResizeAdorns ]]
    -- upvalues: v34 (ref), v2 (copy), v31 (ref), v48 (copy), v33 (ref), v65 (copy), v71 (copy)
    if #v34 > 0 then
        return;
    else
        local v82 = v2:findOrCreateFolder("m_handles");
        if not v31 then
            v31 = Instance.new("ScreenGui", v82);
            v31.Enabled = false;
            v31.ClipToDeviceSafeArea = false;
            v31.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None;
        end;
        v48();
        v33.Parent = v31;
        v65();
        v71();
        return;
    end;
end;
local function v86() --[[ Line: 372 ]] --[[ Name: deleteResizeAdorns ]]
    -- upvalues: v34 (ref), v35 (ref), l_l_NOT_SET_0_0 (ref), l_NOT_SET_0 (copy), v33 (ref), v31 (ref)
    for v84 = 1, #v34 do
        v34[v84]:Destroy();
    end;
    for v85 = 1, #v35 do
        v35[v85]:Destroy();
    end;
    v34 = {};
    v35 = {};
    l_l_NOT_SET_0_0 = l_NOT_SET_0;
    if v33 then
        v33:Destroy();
        v33 = nil;
    end;
    if v31 then
        v31:Destroy();
        v31 = nil;
    end;
end;
hasSelection = function() --[[ Line: 400 ]] --[[ Name: hasSelection ]]
    -- upvalues: v36 (ref)
    return #v36 > 0;
end;
local v87 = {};
v87.onSelectionChanged = function(_) --[[ Line: 407 ]] --[[ Name: onSelectionChanged ]]
    -- upvalues: v36 (ref), v9 (copy), v87 (copy)
    v36 = v9:getFilteredSelection();
    if not v9:hasFilteredSelection() then
        v87:hide();
        return;
    else
        v87:updatePosition();
        v87:show();
        return;
    end;
end;
v87.updatePosition = function(_) --[[ Line: 418 ]] --[[ Name: updatePosition ]]
    -- upvalues: v36 (ref), v81 (copy), v5 (copy)
    if #v36 == 0 then
        return;
    else
        v81(v5:getExtentsFromGuis(v36));
        return;
    end;
end;
v87.isOverAHandle = function(_) --[[ Line: 429 ]] --[[ Name: isOverAHandle ]]
    -- upvalues: l_l_NOT_SET_0_0 (ref), l_NOT_SET_0 (copy)
    if not hasSelection() then
        return false;
    else
        return l_l_NOT_SET_0_0 ~= l_NOT_SET_0;
    end;
end;
v87.updateHandleHighlight = function(_, v92) --[[ Line: 443 ]] --[[ Name: updateHandleHighlight ]]
    -- upvalues: v4 (copy), l_l_NOT_SET_0_0 (ref), v34 (ref), v16 (copy), v17 (copy)
    if not hasSelection() then
        return;
    else
        for v93 = v4.FIRST, v4.LAST do
            if not v92 and l_l_NOT_SET_0_0 == v93 then
                v34[v93].BackgroundColor3 = v16;
            else
                v34[v93].BackgroundColor3 = v17;
            end;
        end;
        return;
    end;
end;
v87.isDragInProgress = function(_) --[[ Line: 457 ]] --[[ Name: isDragInProgress ]]
    -- upvalues: v41 (ref)
    return v41;
end;
v87.updateMouseIcon = function(_) --[[ Line: 464 ]] --[[ Name: updateMouseIcon ]]
    -- upvalues: l_l_NOT_SET_0_0 (ref), v4 (copy), v36 (ref), v8 (copy)
    if l_l_NOT_SET_0_0 ~= v4.NOT_SET then
        if #v36 == 1 then
            local l_AbsoluteRotation_0 = v36[1].AbsoluteRotation;
            local v97 = v8:calcMouseIconDirection(l_l_NOT_SET_0_0, l_AbsoluteRotation_0);
            v8:setToResizeIcon(v97);
            return;
        else
            v8:setToResizeIcon(l_l_NOT_SET_0_0);
        end;
    end;
end;
onlyShowHandle = function(v98) --[[ Line: 480 ]] --[[ Name: onlyShowHandle ]]
    -- upvalues: v34 (ref)
    for v99 = 1, #v34 do
        if v99 == v98 then
            v34[v99].Visible = true;
        else
            v34[v99].Visible = false;
        end;
    end;
end;
v87.startDrag = function(_, v101) --[[ Line: 490 ]] --[[ Name: startDrag ]]
    -- upvalues: v41 (ref), v32 (ref), l_l_NOT_SET_0_0 (ref), v36 (ref), v40 (ref), v39 (ref), v5 (copy), v37 (ref), v38 (ref), v30 (ref)
    if not hasSelection() then
        return;
    elseif v41 then
        return;
    else
        v41 = true;
        v32 = l_l_NOT_SET_0_0;
        onlyShowHandle(v32);
        for v102 = 1, #v36 do
            table.insert(v40, {
                v36[v102], 
                v36[v102].AbsolutePosition, 
                v36[v102].Position, 
                v36[v102].AbsoluteSize, 
                v36[v102].Size
            });
        end;
        v39 = v5:getExtentsFromGuis(v36);
        v37 = v39.Width / v39.Height;
        v38 = v101;
        v30:onResizeBegan(v101);
        return;
    end;
end;
local function v126(v103, v104, v105, v106) --[[ Line: 522 ]] --[[ Name: retainAspectRatio ]]
    -- upvalues: v32 (ref), l_E_0 (copy), l_W_0 (copy), v37 (ref), l_N_0 (copy), l_S_0 (copy), l_SE_0 (copy), v39 (ref), l_NE_0 (copy), l_SW_0 (copy), l_NW_0 (copy)
    local v107 = v105 and not v106;
    local v108 = v106 and not v105;
    if v32 == l_E_0 or v32 == l_W_0 then
        local v109 = v103.Width / v37;
        v103:expandFromCenter(Vector2.new(0, v109 - v103.Height));
        return;
    elseif v32 == l_N_0 or v32 == l_S_0 then
        local v110 = v37 * v103.Height;
        v103:expandFromCenter(Vector2.new(v110 - v103.Width, 0));
        return;
    elseif v32 == l_SE_0 then
        local v111 = v104 - v39.TopLeft;
        local v112 = v111.X / v111.Y;
        local v113 = true;
        if v111.Y > 0 then
            v113 = v37 < v112;
        end;
        if (v113 or v107) and not v108 then
            v103.BottomRight = v103.TopLeft + Vector2.new(v103.Width, v103.Width / v37);
            return;
        else
            v103.BottomRight = v103.TopLeft + Vector2.new(v37 * v103.Height, v103.Height);
            return;
        end;
    elseif v32 == l_NE_0 then
        local v114 = Vector2.new(1, -1);
        local v115 = (v104 - v39.BottomLeft) * v114;
        local v116 = v115.X / v115.Y;
        local v117 = true;
        if v115.y > 0 then
            v117 = v37 < v116;
        end;
        if v117 then
            v103.TopRight = v103.BottomLeft + Vector2.new(v103.Width, v103.Width / v37) * v114;
            return;
        else
            v103.TopRight = v103.BottomLeft + Vector2.new(v37 * v103.Height, v103.Height) * v114;
            return;
        end;
    elseif v32 == l_SW_0 then
        local v118 = Vector2.new(-1, 1);
        local v119 = (v104 - v39.TopRight) * v118;
        local v120 = v119.X / v119.Y;
        local v121 = true;
        if v119.y > 0 then
            v121 = v37 < v120;
        end;
        if v121 then
            v103.BottomLeft = v103.TopRight + Vector2.new(v103.Width, v103.Width / v37) * v118;
            return;
        else
            v103.BottomLeft = v103.TopRight + Vector2.new(v37 * v103.Height, v103.Height) * v118;
            return;
        end;
    else
        if v32 == l_NW_0 then
            local v122 = Vector2.new(-1, -1);
            local v123 = (v104 - v39.BottomRight) * v122;
            local v124 = v123.X / v123.Y;
            local v125 = true;
            if v123.y > 0 then
                v125 = v37 < v124;
            end;
            if (v125 or v107) and not v108 then
                v103.TopLeft = v103.BottomRight + Vector2.new(v103.Width, v103.Width / v37) * v122;
                return;
            else
                v103.TopLeft = v103.BottomRight + Vector2.new(v37 * v103.Height, v103.Height) * v122;
            end;
        end;
        return;
    end;
end;
local function v139(v127, v128, v129) --[[ Line: 587 ]] --[[ Name: applyConstraints ]]
    -- upvalues: l_UserInputService_0 (copy), v126 (copy), v10 (copy), l_NW_0 (copy), v13 (copy), l_N_0 (copy), l_NE_0 (copy), l_W_0 (copy), l_E_0 (copy), l_SW_0 (copy), l_S_0 (copy), l_SE_0 (copy), v0 (copy)
    local v130 = l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift);
    if v130 then
        v126(v127, v128, false, false);
    end;
    local v131 = nil;
    local v132 = nil;
    local v133 = nil;
    local v134, v135, v136, v137 = v10:snapExtents(v127, if v129 == l_NW_0 then v13.ResizeXnYn else if v129 == l_N_0 then v13.ResizeYn else if v129 == l_NE_0 then v13.ResizeXpYn else if v129 == l_W_0 then v13.ResizeXn else if v129 == l_E_0 then v13.ResizeXp else if v129 == l_SW_0 then v13.ResizeXnYp else if v129 == l_S_0 then v13.ResizeYp else if v129 == l_SE_0 then v13.ResizeXpYp else nil);
    v127 = v134;
    v131 = v135;
    v132 = v136;
    v133 = v137;
    for v138 = 1, #v131 do
        v0:showSnappingLine(v131[v138]);
    end;
    if v130 then
        v126(v127, v128, v132, v133);
    end;
    return v127, v130 or v132 or v133;
end;
local function v142(v140) --[[ Line: 611 ]] --[[ Name: getCenterToAnchorNormalized ]]
    -- upvalues: l_SE_0 (copy), l_E_0 (copy), l_S_0 (copy), l_NW_0 (copy), l_N_0 (copy), l_W_0 (copy), l_SW_0 (copy)
    local _ = nil;
    if v140 == l_SE_0 or v140 == l_E_0 or v140 == l_S_0 then
        return (Vector2.new(-0.5, -0.5));
    elseif v140 == l_NW_0 or v140 == l_N_0 or v140 == l_W_0 then
        return (Vector2.new(0.5, 0.5));
    elseif v140 == l_SW_0 then
        return (Vector2.new(0.5, -0.5));
    else
        return (Vector2.new(-0.5, 0.5));
    end;
end;
local function v145(v143, v144) --[[ Line: 650 ]] --[[ Name: transformExtentsByDragDelta ]]
    -- upvalues: v32 (ref), l_NW_0 (copy), l_W_0 (copy), l_SW_0 (copy), l_NE_0 (copy), l_E_0 (copy), l_SE_0 (copy), l_N_0 (copy), l_S_0 (copy)
    if v32 == l_NW_0 or v32 == l_W_0 or v32 == l_SW_0 then
        v143:translate(Vector2.new(v144.X, 0));
        v143:resize(v143.Size - Vector2.new(v144.X, 0));
    elseif v32 == l_NE_0 or v32 == l_E_0 or v32 == l_SE_0 then
        v143:resize(v143.Size + Vector2.new(v144.X, 0));
    end;
    if v32 == l_NW_0 or v32 == l_N_0 or v32 == l_NE_0 then
        v143:translate(Vector2.new(0, v144.Y));
        v143:resize(v143.Size - Vector2.new(0, v144.Y));
        return;
    else
        if v32 == l_SW_0 or v32 == l_S_0 or v32 == l_SE_0 then
            v143:resize(v143.Size + Vector2.new(0, v144.Y));
        end;
        return;
    end;
end;
local function _(v146) --[[ Line: 666 ]] --[[ Name: getSizeDeltaVector ]]
    -- upvalues: v32 (ref), l_NW_0 (copy), l_W_0 (copy), l_SW_0 (copy), l_NE_0 (copy), l_E_0 (copy), l_SE_0 (copy), l_N_0 (copy), l_S_0 (copy)
    local l_zero_0 = Vector2.zero;
    if v32 == l_NW_0 or v32 == l_W_0 or v32 == l_SW_0 then
        l_zero_0 = l_zero_0 + Vector2.new(-v146.X, 0);
    elseif v32 == l_NE_0 or v32 == l_E_0 or v32 == l_SE_0 then
        l_zero_0 = l_zero_0 + Vector2.new(v146.X, 0);
    end;
    if v32 == l_NW_0 or v32 == l_N_0 or v32 == l_NE_0 then
        return l_zero_0 + Vector2.new(0, -v146.Y);
    else
        if v32 == l_SW_0 or v32 == l_S_0 or v32 == l_SE_0 then
            l_zero_0 = l_zero_0 + Vector2.new(0, v146.Y);
        end;
        return l_zero_0;
    end;
end;
local function v156(v149, v150, v151) --[[ Line: 683 ]] --[[ Name: getResizeFactorFromExtents ]]
    -- upvalues: v39 (ref)
    local v152 = 1;
    local v153 = 1;
    local v154 = 0;
    local v155 = 0;
    if v39.Size.X ~= 0 then
        v152 = v150.Size.X / v149.Size.X;
    else
        v154 = v151.X;
    end;
    if v39.Size.Y ~= 0 then
        v153 = v150.Size.Y / v149.Size.Y;
    else
        v155 = v151.Y;
    end;
    return UDim2.new(v152, v154, v153, v155);
end;
v87.updateDrag = function(_, v158) --[[ Line: 705 ]] --[[ Name: updateDrag ]]
    -- upvalues: v41 (ref), v9 (copy), v11 (copy), v39 (ref), v0 (copy), v38 (ref), v145 (copy), v139 (copy), v32 (ref), v156 (copy), v142 (copy), v40 (ref), v7 (copy), v12 (copy), v3 (copy), v81 (copy), v5 (copy), v30 (ref)
    if not v41 then
        return;
    else
        local v159 = v9:getFilteredSelection();
        local v160 = v11:cloneTable(v39);
        v0:hideSnappingLines();
        local v161 = 0;
        if #v159 == 1 then
            v161 = v159[1].AbsoluteRotation;
        end;
        local v162 = v158 - v38;
        local v163 = v11:rotate(v162, Vector2.zero, -v161);
        v145(v160, v163);
        local v164 = false;
        if v161 == 0 then
            local v165, v166 = v139(v160, v158, v32);
            v160 = v165;
            v164 = v166;
        end;
        local v167 = v156(v39, v160, v163);
        local v168 = v142(v32);
        local v169 = v39.Center + v11:rotate(v168 * v39.Size, Vector2.zero, v161);
        local l_zero_1 = Vector2.zero;
        if v161 == 0 and v164 then
            l_zero_1 = v160.Center + v168 * v160.Size - (v39.Center + v168 * v39.Size);
        end;
        v160:translate(l_zero_1);
        local v171 = {};
        local v172 = {};
        for v173 = 1, #v40 do
            local v174 = v40[v173];
            local v175 = v174[1];
            local v176 = v174[2] + v174[4] * 0.5;
            local v177 = v11:rotate(v176 - v169, Vector2.zero, -v161);
            local v178 = v177 + v11:rotate(v174[4] / 2, Vector2.zero, v175.AbsoluteRotation - v161);
            local v179 = v11:multUDimWithVector(UDim2.new(v167.X.Scale, v167.X.Offset / 2, v167.Y.Scale, v167.Y.Offset / 2), v177);
            local v180 = v11:multUDimWithVector(v167, v178);
            local v181 = 2 * v11:rotate(v180 - v179, Vector2.zero, v161 - v175.AbsoluteRotation);
            local v182 = v169 + v11:rotate(v179, Vector2.zero, v161) - v181 * 0.5 + l_zero_1;
            local v183 = v11:isOnlyScaleUDim2(v174[3]) or not v11:isOnlyOffsetUDim2(v174[3]) and v7:isScale();
            local v184 = v11:isOnlyScaleUDim2(v174[5]) or not v11:isOnlyOffsetUDim2(v174[5]) and v7:isScale();
            local l_v175_FirstAncestorWhichIsA_0 = v175:FindFirstAncestorWhichIsA("GuiBase2d");
            if not v12 or l_v175_FirstAncestorWhichIsA_0 then
                local v186, v187 = v3:convertAbsoluteToScaleOrOffset(v183, v184, v182, v181, v174[3], v174[5], l_v175_FirstAncestorWhichIsA_0, v175.AnchorPoint);
                v171[v175] = v186;
                v172[v175] = v187;
            end;
        end;
        for v188 = 1, #v40 do
            local v189 = v40[v188][1];
            v189.Position = v171[v189];
            v189.Size = v172[v189];
        end;
        v81(v5:getExtentsFromGuis(v159));
        v30:onResizeChanged(v158);
        return;
    end;
end;
v87.finishDrag = function(_, v191) --[[ Line: 817 ]] --[[ Name: finishDrag ]]
    -- upvalues: v41 (ref), v0 (copy), v38 (ref), v1 (copy), l_ChangeHistoryService_0 (copy), v40 (ref), v39 (ref), v32 (ref), v34 (ref), v30 (ref)
    if not v41 then
        return;
    else
        v0:hideSnappingLines();
        if v38 ~= v191 then
            v1:reportEvent("Resize");
            l_ChangeHistoryService_0:SetWaypoint("Resize");
        end;
        v41 = false;
        v0:hideXSnappingLine();
        v0:hideYSnappingLine();
        v40 = {};
        v38 = nil;
        v39 = nil;
        v32 = nil;
        for v192 = 1, #v34 do
            v34[v192].Visible = true;
        end;
        v30:onResizeEnded(v191);
        return;
    end;
end;
v87.hide = function(_) --[[ Line: 846 ]] --[[ Name: hide ]]
    -- upvalues: v42 (ref), v31 (ref)
    if v42 then
        return;
    else
        v42 = true;
        if v31 then
            v31.Enabled = false;
        end;
        return;
    end;
end;
v87.show = function(_) --[[ Line: 857 ]] --[[ Name: show ]]
    -- upvalues: v42 (ref), v36 (ref), v31 (ref)
    if not v42 or #v36 == 0 then
        return;
    else
        v42 = false;
        if v31 then
            v31.Enabled = true;
        end;
        return;
    end;
end;
v87.setActionMediator = function(_, v196) --[[ Line: 867 ]] --[[ Name: setActionMediator ]]
    -- upvalues: v30 (ref)
    v30 = v196;
end;
v87.On = function(_) --[[ Line: 872 ]] --[[ Name: On ]]
    -- upvalues: v83 (copy)
    v83();
end;
v87.Off = function(_) --[[ Line: 877 ]] --[[ Name: Off ]]
    -- upvalues: v87 (copy), v86 (copy)
    v87:hide();
    v86();
end;
v87.updateSize = function(_) --[[ Line: 883 ]] --[[ Name: updateSize ]]
    -- upvalues: v54 (copy)
    v54();
end;
return v87;