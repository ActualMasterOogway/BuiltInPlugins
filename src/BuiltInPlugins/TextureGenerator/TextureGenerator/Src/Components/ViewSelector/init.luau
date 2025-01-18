local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useEventConnection_0 = require(l_script_FirstAncestor_0.Packages.ReactUtils).useEventConnection;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_UI_0 = v1.UI;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local l_Pane_0 = l_UI_0.Pane;
local v8 = require(l_script_FirstAncestor_0.Src.Components.GenerationAngleHelp);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v11 = require(l_Util_0.cloneIgnoreArchivable);
local v12 = require(l_Util_0.Constants);
local v13 = require(l_Util_0.OptionsContext);
local v14 = require(l_Util_0.centerCameraOnModelForRotation);
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorMuteSounds);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorFixNilIndexBug);
return function(v18) --[[ Line: 29 ]] --[[ Name: ViewSelector ]]
    -- upvalues: l_Stylizer_0 (copy), v2 (copy), v13 (copy), v17 (copy), v11 (copy), v14 (copy), l_useEventConnection_0 (copy), l_LayoutOrderIterator_0 (copy), l_Pane_0 (copy), v8 (copy), l_AssetRenderModel_0 (copy), v16 (copy), v12 (copy)
    local v19 = l_Stylizer_0:use("ViewSelector");
    local l_current_0 = v2.useRef(Instance.new("Camera")).current;
    local v21 = v2.useContext(v13);
    local v27 = v2.useMemo(function() --[[ Line: 37 ]]
        -- upvalues: v18 (copy), v17 (ref), v11 (ref)
        local l_MeshParts_0 = v18.MeshParts;
        if l_MeshParts_0 then
            local l_Model_0 = Instance.new("Model");
            for _, v25 in l_MeshParts_0 do
                local v26 = nil;
                if v17() then
                    v26 = v11(v25);
                    if not v26 then
                        continue;
                    end;
                else
                    v26 = v25:Clone();
                end;
                v26.Parent = l_Model_0;
            end;
            return l_Model_0;
        else
            return nil;
        end;
    end, {
        v18.MeshParts
    });
    if not v27 then
        return nil;
    else
        local v28 = v2.useMemo(function() --[[ Line: 64 ]]
            -- upvalues: v14 (ref), v27 (copy)
            return v14(v27, CFrame.new());
        end, {
            v27
        });
        l_useEventConnection_0(l_current_0:GetPropertyChangedSignal("CFrame"), function() --[[ Line: 68 ]]
            -- upvalues: l_current_0 (copy), v28 (copy), v21 (copy)
            local v29, v30, v31 = (l_current_0.CFrame * v28:Inverse()):ToEulerAnglesYXZ();
            local v32 = CFrame.fromEulerAnglesYXZ(-v29, -v30, -v31);
            v21.setRotation(v32);
        end, {
            v28, 
            v21.setRotation
        });
        v2.useEffect(function() --[[ Line: 75 ]]
            -- upvalues: v21 (copy), v14 (ref), v27 (copy), l_current_0 (copy)
            local l_rotation_0 = v21.rotation;
            local v34 = v14(v27, l_rotation_0);
            if not v34:FuzzyEq(l_current_0.CFrame) then
                l_current_0.CFrame = v34;
            end;
            return function() --[[ Line: 82 ]]

            end;
        end, {
            v21.rotation, 
            v27
        });
        local v35 = l_LayoutOrderIterator_0.new();
        return v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundColor = v19.BackgroundColor, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v18.LayoutOrder, 
            Size = v19.Size, 
            Spacing = 10, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }, {
            GenerationAngleHelp = v2.createElement(v8, {
                LayoutOrder = v35:getNextOrder()
            }), 
            Display = v2.createElement(l_Pane_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                LayoutOrder = v35:getNextOrder(), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = v19.Size
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 8), 
                    PaddingRight = UDim.new(0, 8)
                }), 
                ImageContainer = v2.createElement(l_Pane_0, {
                    BackgroundColor3 = Color3.new(0, 0, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    ZIndex = v35:getNextOrder()
                }, {
                    Corner = v2.createElement("UICorner"), 
                    ModelView = v2.createElement(l_AssetRenderModel_0, {
                        BackgroundColor3 = v19.BackgroundColor, 
                        Camera = l_current_0, 
                        DisablePan = v19.DisablePan, 
                        DisableZoom = v19.DisableZoom, 
                        Model = v27, 
                        ShouldMuteModelSounds = v16() and true or nil, 
                        Size = UDim2.new(1, 0, 1, -32), 
                        FocusDirection = v12.INITIAL_FOCUS_DIRECTION, 
                        LightColor = Color3.new(1, 1, 1), 
                        LightDirection = Vector3.new(1, 1, 1, 0), 
                        ShowAxisIndicator = true, 
                        ShowResetCamera = true
                    })
                })
            })
        });
    end;
end;