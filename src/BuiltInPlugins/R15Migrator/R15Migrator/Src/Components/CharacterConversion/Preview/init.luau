local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v4 = require(l_Components_0.CharacterConversion.InstanceTree);
local l_ContextServices_0 = v1.ContextServices;
local l_UI_0 = v1.UI;
local l_Util_0 = v1.Util;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local l_Pane_0 = l_UI_0.Pane;
local v10 = v2.PureComponent:extend("CharacterPreview");
v10.init = function(v11, _) --[[ Line: 17 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    v11.onViewModelLoaded = function(v13) --[[ Line: 18 ]]
        v13:MoveTo((Vector3.new()));
    end;
    v11.onSelectionChanged = function(v14) --[[ Line: 22 ]]
        -- upvalues: v11 (copy)
        if v11.props.OnSelectionChange then
            v11.props.OnSelectionChange(v14);
        end;
    end;
    v11.getMatchingInstance = function(v15, v16) --[[ Line: 28 ]]
        -- upvalues: v4 (ref)
        for _, v18 in v15:GetDescendants() do
            if v18.Name == v16 and v4.isValidDisplayInstance(v18) then
                return v18;
            end;
        end;
        return nil;
    end;
    local function v26(v19) --[[ Line: 37 ]] --[[ Name: getMeshForPart ]]
        local l_Parent_0 = v19.Parent;
        if not l_Parent_0 then
            return nil;
        else
            local l_SpecialMesh_0 = v19:FindFirstChildWhichIsA("SpecialMesh");
            if l_SpecialMesh_0 then
                return l_SpecialMesh_0;
            else
                local v22 = v19.Name:gsub("%s+", "");
                for _, v24 in l_Parent_0:GetChildren() do
                    if v24:IsA("CharacterMesh") then
                        local l_BodyPart_0 = v24.BodyPart;
                        if l_BodyPart_0 and l_BodyPart_0.Name == v22 then
                            return v24;
                        end;
                    end;
                end;
                return nil;
            end;
        end;
    end;
    v11.applySelectionEffect = function(v27) --[[ Line: 65 ]]
        -- upvalues: v11 (copy), v26 (copy)
        local l_SelectionColor_0 = v11.props.Stylizer.SelectionColor;
        if not v27 then
            return;
        else
            local function _(v29) --[[ Line: 73 ]] --[[ Name: applyStyle ]]
                -- upvalues: l_SelectionColor_0 (copy)
                v29.Color = l_SelectionColor_0;
                v29.Material = Enum.Material.Neon;
                v29.Transparency = 0.5;
                if v29:IsA("MeshPart") then
                    v29.TextureID = "";
                end;
            end;
            local function _(v31) --[[ Line: 83 ]] --[[ Name: createSelectionPart ]]
                -- upvalues: l_SelectionColor_0 (copy)
                local l_Part_0 = Instance.new("Part");
                l_Part_0.Name = "SelectionPart";
                l_Part_0.Anchored = true;
                l_Part_0.CanCollide = false;
                l_Part_0.CFrame = v31.CFrame;
                l_Part_0.Locked = true;
                l_Part_0.Size = v31.Size;
                l_Part_0.Parent = v31.Parent;
                l_Part_0.Color = l_SelectionColor_0;
                l_Part_0.Material = Enum.Material.Neon;
                l_Part_0.Transparency = 0.5;
                if l_Part_0:IsA("MeshPart") then
                    l_Part_0.TextureID = "";
                end;
            end;
            if v27:IsA("MeshPart") then
                v27.Color = l_SelectionColor_0;
                v27.Material = Enum.Material.Neon;
                v27.Transparency = 0.5;
                if v27:IsA("MeshPart") then
                    v27.TextureID = "";
                end;
                v27.Color = l_SelectionColor_0;
                v27.Material = Enum.Material.Neon;
                v27.TextureID = "";
                v27.Transparency = 0.5;
                return;
            else
                if v27:IsA("BasePart") then
                    if v26(v27) then
                        local l_Part_1 = Instance.new("Part");
                        l_Part_1.Name = "SelectionPart";
                        l_Part_1.Anchored = true;
                        l_Part_1.CanCollide = false;
                        l_Part_1.CFrame = v27.CFrame;
                        l_Part_1.Locked = true;
                        l_Part_1.Size = v27.Size;
                        l_Part_1.Parent = v27.Parent;
                        l_Part_1.Color = l_SelectionColor_0;
                        l_Part_1.Material = Enum.Material.Neon;
                        l_Part_1.Transparency = 0.5;
                        if l_Part_1:IsA("MeshPart") then
                            l_Part_1.TextureID = "";
                            return;
                        end;
                    else
                        v27.Color = l_SelectionColor_0;
                        v27.Material = Enum.Material.Neon;
                        v27.Transparency = 0.5;
                        if v27:IsA("MeshPart") then
                            v27.TextureID = "";
                            return;
                        end;
                    end;
                elseif v27:IsA("Accoutrement") then
                    local l_Handle_0 = v27:FindFirstChild("Handle");
                    if l_Handle_0 then
                        if l_Handle_0:IsA("MeshPart") then
                            l_Handle_0.Color = l_SelectionColor_0;
                            l_Handle_0.Material = Enum.Material.Neon;
                            l_Handle_0.Transparency = 0.5;
                            if l_Handle_0:IsA("MeshPart") then
                                l_Handle_0.TextureID = "";
                                return;
                            end;
                        else
                            local l_Part_2 = Instance.new("Part");
                            l_Part_2.Name = "SelectionPart";
                            l_Part_2.Anchored = true;
                            l_Part_2.CanCollide = false;
                            l_Part_2.CFrame = l_Handle_0.CFrame;
                            l_Part_2.Locked = true;
                            l_Part_2.Size = l_Handle_0.Size;
                            l_Part_2.Parent = l_Handle_0.Parent;
                            l_Part_2.Color = l_SelectionColor_0;
                            l_Part_2.Material = Enum.Material.Neon;
                            l_Part_2.Transparency = 0.5;
                            if l_Part_2:IsA("MeshPart") then
                                l_Part_2.TextureID = "";
                            end;
                        end;
                    end;
                end;
                return;
            end;
        end;
    end;
    v11.setupAssetRenderModel = function(v37) --[[ Line: 121 ]]
        -- upvalues: v11 (copy)
        if not v37 then
            return nil;
        else
            local l_Selection_0 = v11.props.Selection;
            local v39 = v37:Clone();
            for v40, v41 in l_Selection_0 do
                if v41 then
                    local v42 = v11.getMatchingInstance(v39, v40);
                    v11.applySelectionEffect(v42);
                end;
            end;
            return v39;
        end;
    end;
end;
v10.render = function(v43) --[[ Line: 142 ]] --[[ Name: render ]]
    -- upvalues: l_Util_0 (copy), v2 (copy), l_Pane_0 (copy), l_AssetRenderModel_0 (copy)
    local l_props_0 = v43.props;
    local l_Character_0 = l_props_0.Character;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v47 = v43.setupAssetRenderModel(l_Character_0);
    local v48 = l_Util_0.LayoutOrderIterator.new();
    return v2.createFragment({
        ViewPortPane = v2.createElement(l_Pane_0, {
            BackgroundColor3 = l_Stylizer_0.ViewportBackgroundColor, 
            BackgroundTransparency = 0, 
            LayoutOrder = v48:getNextOrder(), 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.ViewportHeight)
        }, {
            Viewport = v2.createElement(l_AssetRenderModel_0, {
                DisablePan = true, 
                DisableZoom = true, 
                FocusDirection = Vector3.new(0, 0, -1, 0), 
                Model = v47, 
                OnViewModelLoaded = v43.onViewModelLoaded, 
                RecenterModelOnUpdate = false, 
                Size = UDim2.fromScale(1, 1)
            })
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));