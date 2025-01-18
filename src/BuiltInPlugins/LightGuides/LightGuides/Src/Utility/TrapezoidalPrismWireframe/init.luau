local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local l_Utility_0 = l_Parent_0.Src.Utility;
local v3 = require(l_Utility_0.Constants);
local v4 = {
    [Enum.NormalId.Back] = CFrame.fromMatrix(Vector3.new(), Vector3.new(1, 0, 0, 0), Vector3.new(0, 1, 0, 0), (Vector3.new(0, 0, 1, 0))), 
    [Enum.NormalId.Front] = CFrame.fromMatrix(Vector3.new(), Vector3.new(-1, 0, 0, 0), Vector3.new(0, 1, 0, 0), (Vector3.new(0, 0, -1, 0))), 
    [Enum.NormalId.Right] = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 0, -1, 0), Vector3.new(0, 1, 0, 0), (Vector3.new(1, 0, 0, 0))), 
    [Enum.NormalId.Left] = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 0, 1, 0), Vector3.new(0, 1, 0, 0), (Vector3.new(-1, 0, 0, 0))), 
    [Enum.NormalId.Bottom] = CFrame.fromMatrix(Vector3.new(), Vector3.new(1, 0, 0, 0), Vector3.new(0, 0, 1, 0), (Vector3.new(0, -1, 0, 0))), 
    [Enum.NormalId.Top] = CFrame.fromMatrix(Vector3.new(), Vector3.new(1, 0, 0, 0), Vector3.new(0, 0, -1, 0), (Vector3.new(0, 1, 0, 0)))
};
local l_THICKNESS_0 = v3.THICKNESS;
local l_TRANSPARENCY_0 = v3.TRANSPARENCY;
local v7 = {};
v7.__index = v7;
v7.new = function() --[[ Line: 65 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    return (setmetatable({
        _adornee = nil, 
        _parent = nil, 
        _light = nil, 
        _handlesFolder = Instance.new("Folder"), 
        _guidesFolder = nil, 
        _handles = {}, 
        _handlesPresent = false, 
        _listener = nil, 
        _sizeListener = nil, 
        _attachmentListener = nil
    }, v7));
end;
v7.render = function(v8) --[[ Line: 82 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy)
    v8:_setListeners();
    if not v8:_setAncestry() then
        return;
    else
        if not v8._handlesPresent then
            v8:_setHandles();
        end;
        local v9 = Vector3.new();
        if v8._parent:IsA("BasePart") then
            v9 = v8._parent.Size;
        end;
        local l_Enabled_0 = v8._light.Enabled;
        local l_Color_0 = v8._light.Color;
        local l_Range_0 = v8._light.Range;
        local v13 = math.rad(v8._light.Angle);
        local v14 = l_Range_0 * math.cos(v13 / 2);
        local v15 = 2 * (l_Range_0 * math.sin(v13 / 2));
        local v16 = Vector3.fromNormalId(v8._light.Face);
        local l_magnitude_0 = (v9 * (CFrame.Angles(0, (v16.Y - 1) * 3.141592653589793 / 2, (v16.Z - 1) * (v16.X - 1) * 3.141592653589793 / 2) * v16)).magnitude;
        local l_magnitude_1 = (v9 * (CFrame.Angles((v16.X - 1) * 3.141592653589793 / 2, 0, (v16.Z - 1) * (v16.Y - 1) * 3.141592653589793 / 2) * v16)).magnitude;
        local v19 = l_magnitude_0 + v15;
        local v20 = l_magnitude_1 + v15;
        local l_magnitude_2 = (v9 * Vector3.fromNormalId(v8._light.Face)).magnitude;
        local v22 = math.pow((v19 - l_magnitude_0) / 2, 2);
        local v23 = math.pow((v20 - l_magnitude_1) / 2, 2);
        local v24 = math.pow(v14, 2);
        local v25 = math.sqrt(v22 + v23 + v24);
        local l_innerTopOutline_0 = v8._handles.innerTopOutline;
        local l_innerBottomOutline_0 = v8._handles.innerBottomOutline;
        local l_innerLeftOutline_0 = v8._handles.innerLeftOutline;
        local l_innerRightOutline_0 = v8._handles.innerRightOutline;
        local l_outerTopOutline_0 = v8._handles.outerTopOutline;
        local l_outerBottomOutline_0 = v8._handles.outerBottomOutline;
        local l_outerLeftOutline_0 = v8._handles.outerLeftOutline;
        local l_outerRightOutline_0 = v8._handles.outerRightOutline;
        local l_topLeftOutline_0 = v8._handles.topLeftOutline;
        local l_topRightOutline_0 = v8._handles.topRightOutline;
        local l_bottomLeftOutline_0 = v8._handles.bottomLeftOutline;
        local l_bottomRightOutline_0 = v8._handles.bottomRightOutline;
        local l_centerOutline_0 = v8._handles.centerOutline;
        l_innerTopOutline_0.Height = l_magnitude_0;
        l_innerTopOutline_0.Adornee = v8._adornee;
        l_innerTopOutline_0.Visible = l_Enabled_0;
        l_innerTopOutline_0.Color3 = l_Color_0;
        l_innerBottomOutline_0.Height = l_magnitude_0;
        l_innerBottomOutline_0.Adornee = v8._adornee;
        l_innerBottomOutline_0.Visible = l_Enabled_0;
        l_innerBottomOutline_0.Color3 = l_Color_0;
        l_innerLeftOutline_0.Height = l_magnitude_1;
        l_innerLeftOutline_0.Adornee = v8._adornee;
        l_innerLeftOutline_0.Visible = l_Enabled_0;
        l_innerLeftOutline_0.Color3 = l_Color_0;
        l_innerRightOutline_0.Height = l_magnitude_1;
        l_innerRightOutline_0.Adornee = v8._adornee;
        l_innerRightOutline_0.Visible = l_Enabled_0;
        l_innerRightOutline_0.Color3 = l_Color_0;
        l_outerTopOutline_0.Height = v19;
        l_outerTopOutline_0.Adornee = v8._adornee;
        l_outerTopOutline_0.Visible = l_Enabled_0;
        l_outerTopOutline_0.Color3 = l_Color_0;
        l_outerBottomOutline_0.Height = v19;
        l_outerBottomOutline_0.Adornee = v8._adornee;
        l_outerBottomOutline_0.Visible = l_Enabled_0;
        l_outerBottomOutline_0.Color3 = l_Color_0;
        l_outerLeftOutline_0.Height = v20;
        l_outerLeftOutline_0.Adornee = v8._adornee;
        l_outerLeftOutline_0.Visible = l_Enabled_0;
        l_outerLeftOutline_0.Color3 = l_Color_0;
        l_outerRightOutline_0.Height = v20;
        l_outerRightOutline_0.Adornee = v8._adornee;
        l_outerRightOutline_0.Visible = l_Enabled_0;
        l_outerRightOutline_0.Color3 = l_Color_0;
        l_topLeftOutline_0.Height = v25;
        l_topLeftOutline_0.Adornee = v8._adornee;
        l_topLeftOutline_0.Visible = l_Enabled_0;
        l_topLeftOutline_0.Color3 = l_Color_0;
        l_topRightOutline_0.Height = v25;
        l_topRightOutline_0.Adornee = v8._adornee;
        l_topRightOutline_0.Visible = l_Enabled_0;
        l_topRightOutline_0.Color3 = l_Color_0;
        l_bottomLeftOutline_0.Height = v25;
        l_bottomLeftOutline_0.Adornee = v8._adornee;
        l_bottomLeftOutline_0.Visible = l_Enabled_0;
        l_bottomLeftOutline_0.Color3 = l_Color_0;
        l_bottomRightOutline_0.Height = v25;
        l_bottomRightOutline_0.Adornee = v8._adornee;
        l_bottomRightOutline_0.Visible = l_Enabled_0;
        l_bottomRightOutline_0.Color3 = l_Color_0;
        l_centerOutline_0.Height = l_Range_0;
        l_centerOutline_0.Adornee = v8._adornee;
        l_centerOutline_0.Visible = l_Enabled_0;
        l_centerOutline_0.Color3 = l_Color_0;
        v8:_setCFrameValues(v4[v8._light.Face], l_magnitude_0, l_magnitude_1, v19, v20, l_magnitude_2, l_Range_0, v14);
        return;
    end;
end;
v7.pool = function(v39) --[[ Line: 218 ]] --[[ Name: pool ]]
    assert(v39._handlesFolder, "Wireframe already pooled");
    assert(v39._light, "Wireframe already pooled");
    v39._handlesFolder.Name = "pooled";
    v39._handlesFolder.Parent = nil;
    v39._light = nil;
    v39:_removeListeners();
    return v39;
end;
v7.adorn = function(v40, v41) --[[ Line: 231 ]] --[[ Name: adorn ]]
    assert(v41, "Can't adorn nil");
    assert(not v40._light, "Wireframe already adorned");
    v40._light = v41;
    v40._handlesFolder.Name = v41.name;
    v40._handlesFolder.Parent = v40._guidesFolder;
    local l_Parent_1 = v41.Parent;
    if l_Parent_1 and l_Parent_1:IsA("Attachment") then
        v40._adornee = l_Parent_1.Parent;
        v40._offset = l_Parent_1.CFrame;
        v40._parent = l_Parent_1;
    else
        v40._adornee = l_Parent_1;
        v40._parent = l_Parent_1;
    end;
    v40:_setListeners();
    return v40;
end;
v7.destroy = function(v43) --[[ Line: 254 ]] --[[ Name: destroy ]]
    v43:_removeHandles();
    v43:_removeListeners();
    v43._handlesFolder:Destroy();
    v43._handlesFolder = nil;
end;
v7.setGuidesFolder = function(v44, v45) --[[ Line: 262 ]] --[[ Name: setGuidesFolder ]]
    v44._guidesFolder = v45;
end;
v7._setAncestry = function(v46) --[[ Line: 266 ]] --[[ Name: _setAncestry ]]
    local l_Parent_2 = v46._light.Parent;
    local v48 = CFrame.new((Vector3.new()));
    if not l_Parent_2 then
        return false;
    else
        assert(l_Parent_2, "Trapezoidal Prism Wireframe should have valid Adornee.");
        if l_Parent_2:IsA("Attachment") then
            l_Parent_2 = v46._light.Parent.Parent;
            v48 = v46._light.Parent.CFrame;
            while l_Parent_2:IsA("Attachment") do
                v48 = l_Parent_2.CFrame * v48;
                l_Parent_2 = l_Parent_2.Parent;
            end;
        end;
        if not l_Parent_2:IsA("Attachment") and not l_Parent_2:IsA("BasePart") then
            v46:_removeHandles();
            return false;
        else
            v46._adornee = l_Parent_2;
            v46._offset = v48;
            v46._parent = v46._light.Parent;
            return true;
        end;
    end;
end;
v7._setCFrameValues = function(v49, v50, v51, v52, v53, v54, v55, v56, v57) --[[ Line: 300 ]] --[[ Name: _setCFrameValues ]]
    local v58 = math.atan((v53 - v51) / 2 * 1.4142135623730951 / v57);
    local v59 = v52 / 2;
    local v60 = v55 / 2;
    local v61 = v51 / 2;
    local v62 = v54 / 2;
    local v63 = v53 / 2;
    local v64 = v55 / 2 + v57;
    local v65 = (v51 + v53) / 4;
    local v66 = (v52 + v54) / 4;
    local v67 = (v55 + v57) / 2;
    local v68 = (v55 + v56) / 2;
    v49._handles.innerTopOutline.CFrame = v49._offset * (v50 * CFrame.new(0, v59, v60) * CFrame.Angles(0, 1.5707963267948966, 0));
    v49._handles.innerBottomOutline.CFrame = v49._offset * (v50 * CFrame.new(0, -v59, v60) * CFrame.Angles(0, 1.5707963267948966, 0));
    v49._handles.innerRightOutline.CFrame = v49._offset * (v50 * CFrame.new(v61, 0, v60) * CFrame.Angles(1.5707963267948966, 0, 0));
    v49._handles.innerLeftOutline.CFrame = v49._offset * (v50 * CFrame.new(-v61, 0, v60) * CFrame.Angles(1.5707963267948966, 0, 0));
    v49._handles.outerTopOutline.CFrame = v49._offset * v50 * CFrame.new(0, v62, v64) * CFrame.Angles(0, 1.5707963267948966, 0);
    v49._handles.outerBottomOutline.CFrame = v49._offset * (v50 * CFrame.new(0, -v62, v64) * CFrame.Angles(0, 1.5707963267948966, 0));
    v49._handles.outerLeftOutline.CFrame = v49._offset * (v50 * CFrame.new(v63, 0, v64) * CFrame.Angles(1.5707963267948966, 0, 0));
    v49._handles.outerRightOutline.CFrame = v49._offset * (v50 * CFrame.new(-v63, 0, v64) * CFrame.Angles(1.5707963267948966, 0, 0));
    v49._handles.topLeftOutline.CFrame = v49._offset * (v50 * CFrame.new(v65, v66, v67) * CFrame.Angles(0, 0, -0.7853981633974483) * CFrame.Angles(-v58, 0, 0));
    v49._handles.topRightOutline.CFrame = v49._offset * (v50 * CFrame.new(-v65, v66, v67) * CFrame.Angles(0, 0, 0.7853981633974483) * CFrame.Angles(-v58, 0, 0));
    v49._handles.bottomLeftOutline.CFrame = v49._offset * (v50 * CFrame.new(v65, -v66, v67) * CFrame.Angles(0, 0, 0.7853981633974483) * CFrame.Angles(v58, 0, 0));
    v49._handles.bottomRightOutline.CFrame = v49._offset * (v50 * CFrame.new(-v65, -v66, v67) * CFrame.Angles(0, 0, -0.7853981633974483) * CFrame.Angles(v58, 0, 0));
    v49._handles.centerOutline.CFrame = v49._offset * (v50 * CFrame.new(0, 0, v68));
end;
v7._setHandles = function(v69) --[[ Line: 376 ]] --[[ Name: _setHandles ]]
    -- upvalues: l_THICKNESS_0 (copy), l_TRANSPARENCY_0 (copy)
    local l_CylinderHandleAdornment_0 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_0.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_0.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_0.Parent = v69._handlesFolder;
    local l_CylinderHandleAdornment_1 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_1.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_1.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_1.Parent = v69._handlesFolder;
    local l_CylinderHandleAdornment_2 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_2.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_2.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_2.Parent = v69._handlesFolder;
    local l_CylinderHandleAdornment_3 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_3.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_3.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_3.Parent = v69._handlesFolder;
    local l_CylinderHandleAdornment_4 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_4.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_4.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_4.Parent = v69._handlesFolder;
    local l_CylinderHandleAdornment_5 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_5.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_5.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_5.Parent = v69._handlesFolder;
    local l_CylinderHandleAdornment_6 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_6.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_6.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_6.Parent = v69._handlesFolder;
    local l_CylinderHandleAdornment_7 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_7.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_7.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_7.Parent = v69._handlesFolder;
    local l_CylinderHandleAdornment_8 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_8.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_8.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_8.Parent = v69._handlesFolder;
    local l_CylinderHandleAdornment_9 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_9.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_9.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_9.Parent = v69._handlesFolder;
    local l_CylinderHandleAdornment_10 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_10.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_10.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_10.Parent = v69._handlesFolder;
    local l_CylinderHandleAdornment_11 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_11.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_11.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_11.Parent = v69._handlesFolder;
    local l_CylinderHandleAdornment_12 = Instance.new("CylinderHandleAdornment");
    l_CylinderHandleAdornment_12.Radius = l_THICKNESS_0 * 0.5;
    l_CylinderHandleAdornment_12.Transparency = l_TRANSPARENCY_0;
    l_CylinderHandleAdornment_12.Parent = v69._handlesFolder;
    v69._handles.innerTopOutline = l_CylinderHandleAdornment_0;
    v69._handles.innerBottomOutline = l_CylinderHandleAdornment_1;
    v69._handles.innerLeftOutline = l_CylinderHandleAdornment_2;
    v69._handles.innerRightOutline = l_CylinderHandleAdornment_3;
    v69._handles.outerTopOutline = l_CylinderHandleAdornment_4;
    v69._handles.outerBottomOutline = l_CylinderHandleAdornment_5;
    v69._handles.outerLeftOutline = l_CylinderHandleAdornment_6;
    v69._handles.outerRightOutline = l_CylinderHandleAdornment_7;
    v69._handles.topLeftOutline = l_CylinderHandleAdornment_8;
    v69._handles.topRightOutline = l_CylinderHandleAdornment_9;
    v69._handles.bottomLeftOutline = l_CylinderHandleAdornment_10;
    v69._handles.bottomRightOutline = l_CylinderHandleAdornment_11;
    v69._handles.centerOutline = l_CylinderHandleAdornment_12;
    v69._handlesPresent = true;
end;
v7._removeHandles = function(v83) --[[ Line: 459 ]] --[[ Name: _removeHandles ]]
    if v83._handles and v83._handlesPresent then
        v83._handles.innerTopOutline:Destroy();
        v83._handles.innerBottomOutline:Destroy();
        v83._handles.innerLeftOutline:Destroy();
        v83._handles.innerRightOutline:Destroy();
        v83._handles.outerTopOutline:Destroy();
        v83._handles.outerBottomOutline:Destroy();
        v83._handles.outerLeftOutline:Destroy();
        v83._handles.outerRightOutline:Destroy();
        v83._handles.topLeftOutline:Destroy();
        v83._handles.topRightOutline:Destroy();
        v83._handles.bottomLeftOutline:Destroy();
        v83._handles.bottomRightOutline:Destroy();
        v83._handles.centerOutline:Destroy();
        v83._handlesPresent = false;
    end;
end;
v7._setListeners = function(v84) --[[ Line: 479 ]] --[[ Name: _setListeners ]]
    if not v84._listener then
        v84._listener = v84._light.Changed:Connect(function() --[[ Line: 481 ]]
            -- upvalues: v84 (copy)
            v84:render();
        end);
    end;
    if not v84._sizeListener and not v84._parent:IsA("Attachment") and v84._parent:IsA("BasePart") then
        v84._sizeListener = v84._parent:GetPropertyChangedSignal("Size"):Connect(function() --[[ Line: 487 ]]
            -- upvalues: v84 (copy)
            v84:render();
        end);
    end;
    if not v84._attachmentListeners and v84._parent:IsA("Attachment") then
        v84._attachmentListeners = {};
        local l__parent_0 = v84._parent;
        while l__parent_0:IsA("Attachment") do
            table.insert(v84._attachmentListeners, l__parent_0:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 500 ]]
                -- upvalues: v84 (copy)
                v84:render();
            end));
            table.insert(v84._attachmentListeners, l__parent_0:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 506 ]]
                -- upvalues: v84 (copy)
                v84:_removeListeners();
                v84:_setListeners();
                v84:render();
            end));
            l__parent_0 = l__parent_0.Parent;
        end;
    end;
end;
v7._removeListeners = function(v86) --[[ Line: 518 ]] --[[ Name: _removeListeners ]]
    if v86._listener then
        v86._listener:Disconnect();
        v86._listener = nil;
    end;
    if v86._sizeListener then
        v86._sizeListener:Disconnect();
        v86._sizeListener = nil;
    end;
    if v86._attachmentListeners then
        for _, v88 in v86._attachmentListeners do
            v88:Disconnect();
        end;
        v86._attachmentListeners = nil;
    end;
end;
return v7;