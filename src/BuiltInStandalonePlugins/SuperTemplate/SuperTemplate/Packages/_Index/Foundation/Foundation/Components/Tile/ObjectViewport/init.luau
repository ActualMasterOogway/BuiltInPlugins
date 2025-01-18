local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_EventConnection_0 = require(l_Parent_0.ReactUtils).EventConnection;
local v4 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local l_RunService_0 = game:GetService("RunService");
local function _(v6, v7) --[[ Line: 18 ]] --[[ Name: getCameraDistance ]]
    local l_X_0 = v7.X;
    local l_Y_0 = v7.Y;
    local l_Z_0 = v7.Z;
    return math.max(l_X_0, l_Y_0, l_Z_0) * (1 / math.tan(math.rad(v6) / 2)) + l_Z_0 / 2;
end;
local function _(v12, v13, v14) --[[ Line: 28 ]] --[[ Name: rotateVectorAround ]]
    return CFrame.fromAxisAngle(v14, v13):VectorToWorldSpace(v12);
end;
local v16 = {
    rotationSpeed = 0.01, 
    fieldOfView = 70
};
return function(v17) --[[ Line: 43 ]] --[[ Name: ObjectViewport ]]
    -- upvalues: v4 (copy), v16 (copy), v2 (copy), l_EventConnection_0 (copy), l_RunService_0 (copy)
    local v18 = v4(v17, v16);
    local v19, v20 = v2.useState(v18.model);
    local v21 = v2.useRef(nil);
    local v22 = v2.useRef(nil);
    local v23, v24 = v2.useBinding(CFrame.new());
    local v25, v26 = v2.useBinding(0);
    local v27, v28 = v2.useState(CFrame.new());
    local v29, v30 = v2.useState((Vector3.new()));
    local v31, v32 = v2.useState(0);
    v2.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v22 (copy), v19 (copy)
        if v22.current and v19 ~= nil then
            v19.Parent = v22.current;
        end;
        return function() --[[ Line: 62 ]]
            -- upvalues: v19 (ref)
            if v19 ~= nil then
                v19.Parent = nil;
            end;
        end;
    end, {});
    v2.useEffect(function() --[[ Line: 69 ]]
        -- upvalues: v19 (copy), v28 (copy), v30 (copy), v32 (copy), v18 (copy)
        if v19 ~= nil then
            local l_v19_ModelCFrame_0 = v19:GetModelCFrame();
            v28(l_v19_ModelCFrame_0);
            v30(l_v19_ModelCFrame_0.LookVector);
            local l_v19_ExtentsSize_0 = v19:GetExtentsSize();
            local l_v32_0 = v32;
            local l_fieldOfView_0 = v18.fieldOfView;
            local l_X_1 = l_v19_ExtentsSize_0.X;
            local l_Y_1 = l_v19_ExtentsSize_0.Y;
            local l_Z_1 = l_v19_ExtentsSize_0.Z;
            l_v32_0(math.max(l_X_1, l_Y_1, l_Z_1) * (1 / math.tan(math.rad(l_fieldOfView_0) / 2)) + l_Z_1 / 2);
        end;
    end, {
        v19
    });
    v2.useEffect(function() --[[ Line: 80 ]]
        -- upvalues: v19 (copy), v18 (copy), v22 (copy), v20 (copy)
        if v19 ~= nil then
            v19.Parent = nil;
        end;
        if v18.model ~= nil then
            v18.model.Parent = v22.current;
            v20(v18.model);
        end;
    end, {
        v18.model
    });
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.fromScale(0, 0), 
        AnchorPoint = Vector2.new(0, 0), 
        Size = UDim2.fromScale(1, 1)
    }, {
        AspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1, 
            AspectType = Enum.AspectType.FitWithinMaxSize, 
            DominantAxis = Enum.DominantAxis.Width
        }), 
        ViewportFrame = v2.createElement("ViewportFrame", {
            BackgroundTransparency = 1, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            Size = UDim2.new(1, 25, 1, 25), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LightColor = Color3.fromRGB(240, 240, 240), 
            LightDirection = Vector3.new(1, 1, 1, 0), 
            Ambient = Color3.fromRGB(240, 240, 240), 
            CurrentCamera = v21
        }, {
            Camera = v2.createElement("Camera", {
                CameraType = Enum.CameraType.Scriptable, 
                FieldOfView = v18.fieldOfView, 
                CFrame = v23, 
                ref = v21
            }), 
            WorldModel = v2.createElement("WorldModel", {
                ref = v22
            }), 
            RenderSteppedConnection = v2.createElement(l_EventConnection_0, {
                event = l_RunService_0.RenderStepped, 
                callback = function() --[[ Line: 131 ]] --[[ Name: callback ]]
                    -- upvalues: v26 (copy), v25 (copy), v18 (copy), v29 (copy), v27 (copy), v31 (copy), v24 (copy)
                    v26(v25:getValue() + v18.rotationSpeed or 0);
                    local l_v29_0 = v29;
                    local v41 = v25:getValue();
                    local v42 = CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), v41):VectorToWorldSpace(l_v29_0);
                    l_v29_0 = CFrame.new(v27.p + v42 * v31, v27.p);
                    v24(l_v29_0);
                end
            })
        })
    });
end;