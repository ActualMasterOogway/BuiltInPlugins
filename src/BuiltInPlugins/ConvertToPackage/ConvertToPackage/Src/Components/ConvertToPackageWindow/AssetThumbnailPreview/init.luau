local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local l_Util_0 = l_Parent_0.Src.Util;
require(l_Parent_0.Bin.defineLuaFlags);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.Roact);
local v5 = require(l_Packages_0.RoactRodux);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = require(l_Util_0.Constants);
local l_Pane_0 = v3.UI.Pane;
local function v13(v10) --[[ Line: 39 ]] --[[ Name: removeAllScripts ]]
    for _, v12 in pairs(v10:GetDescendants()) do
        if v12:IsA("LuaSourceContainer") then
            v12:Destroy();
        end;
    end;
end;
local function v17(v14) --[[ Line: 47 ]] --[[ Name: muteAllSounds ]]
    for _, v16 in pairs(v14:GetDescendants()) do
        if v16:IsA("Sound") then
            v16.Playing = false;
        end;
    end;
end;
local function v21(v18) --[[ Line: 55 ]] --[[ Name: hasShowableObject ]]
    if v18:IsA("PVInstance") then
        return true;
    else
        for _, v20 in pairs(v18:GetDescendants()) do
            if v20:IsA("PVInstance") and not v20:FindFirstAncestorWhichIsA("LuaSourceContainer") then
                return true;
            end;
        end;
        return false;
    end;
end;
local v22 = v4.PureComponent:extend("AssetThumbnailPreview");
v22.init = function(v23, _) --[[ Line: 71 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    v23.viewportRef = v4.createRef();
end;
v22.didMount = function(v25) --[[ Line: 75 ]] --[[ Name: didMount ]]
    -- upvalues: v21 (copy), v13 (copy), v17 (copy)
    if v25.props.instances and v21(v25.props.instances[1]) then
        local l_current_0 = v25.viewportRef.current;
        l_current_0:ClearAllChildren();
        local l_Camera_0 = Instance.new("Camera");
        l_Camera_0.Name = "Camera";
        l_Camera_0.Parent = l_current_0;
        l_current_0.CurrentCamera = l_Camera_0;
        local l_Model_0 = Instance.new("Model");
        l_Model_0.Parent = l_current_0;
        for _, v30 in pairs(v25.props.instances) do
            if not v30:IsA("LuaSourceContainer") then
                pcall(function() --[[ Line: 91 ]]
                    -- upvalues: v30 (copy), v13 (ref), v17 (ref), l_Model_0 (copy)
                    local v31 = v30:Clone();
                    v13(v31);
                    v17(v31);
                    v31.Parent = l_Model_0;
                end);
            end;
        end;
        local l_l_Model_0_ModelCFrame_0 = l_Model_0:GetModelCFrame();
        l_Camera_0:SetImageServerView(l_l_Model_0_ModelCFrame_0);
        local v33 = l_Model_0:GetExtentsSize().magnitude / 2 / math.tan(math.rad(l_Camera_0.FieldOfView) / 2);
        l_Camera_0.CFrame = l_Camera_0.CFrame - l_Camera_0.CFrame.p + l_l_Model_0_ModelCFrame_0.p + (l_Camera_0.CFrame.p - l_l_Model_0_ModelCFrame_0.p).unit * v33;
    end;
end;
v22.getName = function(v34) --[[ Line: 115 ]] --[[ Name: getName ]]
    if v34.props.instances and #v34.props.instances > 0 then
        return v34.props.instances[1].Name;
    else
        return "";
    end;
end;
v22.render = function(v35) --[[ Line: 122 ]] --[[ Name: render ]]
    -- upvalues: v21 (copy), v4 (copy), l_Pane_0 (copy), v8 (copy)
    local l_props_0 = v35.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v38 = l_props_0.title or v35:getName();
    local v39 = true;
    if l_props_0.ShowTitle ~= nil then
        v39 = l_props_0.showTitle;
    end;
    local v40 = l_props_0.Position or UDim2.new(1, 0, 1, 0);
    local v41 = l_props_0.titleHeight or 24;
    local v42 = l_props_0.titlePadding or 12;
    local v43 = l_props_0.LayoutOrder or 1;
    local v44 = v35.props.instances and not v21(v35.props.instances[1]);
    return v4.createElement("Frame", {
        Name = "AssetThumbnailPreview", 
        BackgroundTransparency = 1, 
        Size = l_props_0.Size, 
        Position = v40, 
        LayoutOrder = v43
    }, {
        PreviewFrame = v4.createElement(l_Pane_0, {
            Style = "BorderBox", 
            Size = if v39 then UDim2.new(1, 0, 1, -(v41 + v42)) else nil
        }, {
            Viewport = not v44 and v4.createElement("ViewportFrame", {
                [v4.Ref] = v35.viewportRef, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = l_Stylizer_0.thumbnailPreview.background, 
                BackgroundTransparency = 1
            }), 
            PreviewPlaceholder = v44 and v4.createElement("ImageLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 0, 
                Image = v8.Images.IMAGE_PLACEHOLDER, 
                BackgroundColor3 = l_Stylizer_0.thumbnailPreview.background, 
                ImageColor3 = l_Stylizer_0.thumbnailPreview.placeholderColor
            })
        }), 
        Title = v39 and v4.createElement("TextLabel", {
            Text = v38, 
            Font = v8.FONT, 
            TextSize = v8.FONT_SIZE_MEDIUM, 
            TextColor3 = l_Stylizer_0.thumbnailPreview.text, 
            Position = UDim2.new(0, 0, 1, -v41), 
            Size = UDim2.new(1, 0, 0, v41), 
            BackgroundTransparency = 1
        })
    });
end;
v22 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v22);
return v5.connect(function(v45, _) --[[ Line: 178 ]] --[[ Name: mapStateToProps ]]
    return {
        instances = (v45 or {}).AssetConfigReducer.instances
    };
end)(v22);