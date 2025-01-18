local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.flags.getFFlagUGCValidateCoverViewportFrames);
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5, v6) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    local v7 = false;
    if v5 > 0 then
        v7 = v5 <= 120;
    end;
    assert(v7);
    v7 = false;
    if v6.X > 0 then
        v7 = v6.Y > 0;
    end;
    assert(v7);
    local v8 = {
        mode = v4 and 1 or 2, 
        imgSize = v6, 
        cameraFov = v5
    };
    setmetatable(v8, v3);
    return v8;
end;
v3.setImgSize = function(v9, v10) --[[ Line: 32 ]] --[[ Name: setImgSize ]]
    v9.imgSize = v10;
end;
local function _(v11) --[[ Line: 36 ]] --[[ Name: setUpViewportFrameCover ]]
    v11.AnchorPoint = Vector2.new(0, 0);
    v11.Position = UDim2.new(1, -1, 1, -1);
end;
v3.setupViewportFrame = function(v13) --[[ Line: 42 ]] --[[ Name: setupViewportFrame ]]
    -- upvalues: v2 (copy)
    assert(v13.screenGui);
    assert(v13.worldModel);
    assert(v13.vpfs);
    assert(v13.camera);
    local v14 = Instance.new("ViewportFrame", v13.screenGui);
    v14.BackgroundTransparency = 1;
    v14.BorderSizePixel = 0;
    v14.Size = UDim2.fromOffset(v13.imgSize.X, v13.imgSize.Y);
    if v2() then
        v14.AnchorPoint = Vector2.new(0, 0);
        v14.Position = UDim2.new(1, -1, 1, -1);
    end;
    v13.worldModel.Parent = v14;
    if v13.cameraOptions.cameraTransform then
        v13:setCameraTransform(v13.cameraOptions.cameraTransform);
    else
        v13:setCamera(v13.cameraOptions.fill, v13.cameraOptions.maxDim, v13.cameraOptions.dir);
    end;
    local l_camera_0 = v13.camera;
    l_camera_0.Parent = v14;
    v14.CurrentCamera = l_camera_0;
    table.insert(v13.vpfs, v14);
end;
v3.setupScreenGui = function(v16) --[[ Line: 73 ]] --[[ Name: setupScreenGui ]]
    local v17 = Instance.new("ScreenGui", game:GetService("CoreGui"));
    local l_WorldModel_0 = Instance.new("WorldModel");
    v16.screenGui = v17;
    v16.worldModel = l_WorldModel_0;
    v16.vpfs = {};
end;
v3.init = function(v19, v20) --[[ Line: 82 ]] --[[ Name: init ]]
    v19.target = v20;
    local l_v20_FirstAncestorWhichIsA_0 = v20:FindFirstAncestorWhichIsA("Model");
    local l_v20_FirstAncestorWhichIsA_1 = v20:FindFirstAncestorWhichIsA("Folder");
    local v23 = nil;
    if l_v20_FirstAncestorWhichIsA_0 then
        v23 = l_v20_FirstAncestorWhichIsA_0;
        v19.ancestor = v23;
    elseif l_v20_FirstAncestorWhichIsA_1 then
        v23 = l_v20_FirstAncestorWhichIsA_1;
        v19.ancestor = v23;
    else
        v23 = v20;
    end;
    if v19.mode == 2 then
        v19:setupScreenGui();
        v23.Parent = v19.worldModel;
        return;
    else
        if v19.mode == 1 then
            v23.Parent = workspace;
        end;
        return;
    end;
end;
v3.setCameraTransform = function(v24, v25) --[[ Line: 107 ]] --[[ Name: setCameraTransform ]]
    if not v24.camera then
        v24.camera = Instance.new("Camera");
        v24.camera.FieldOfView = v24.cameraFov;
        if v24.mode == 1 then
            v24.camera.Name = "ThumbnailCamera";
            v24.camera.Parent = workspace:GetChildren()[1];
        end;
    end;
    v24.camera.CFrame = v25;
    v24.cameraOptions = {
        cameraTransform = v25
    };
end;
v3.setCamera = function(v26, v27, v28, v29) --[[ Line: 125 ]] --[[ Name: setCamera ]]
    assert(v26.target);
    local l_camera_1 = v26.camera;
    local l_cameraFov_0 = v26.cameraFov;
    local l_target_0 = v26.target;
    if not l_camera_1 then
        l_camera_1 = Instance.new("Camera");
        l_camera_1.FieldOfView = l_cameraFov_0;
        if v26.mode == 1 then
            l_camera_1.Name = "ThumbnailCamera";
            l_camera_1.Parent = workspace:GetChildren()[1];
        end;
        v26.camera = l_camera_1;
    end;
    local l_Size_0 = l_target_0.Size;
    local l_Position_0 = l_target_0.CFrame.Position;
    local v35 = v28 / (v27 * 2 * math.tan((math.rad(l_cameraFov_0 / 2))));
    l_camera_1.CFrame = CFrame.lookAt(l_Position_0 + v29 * v35 + v29 * l_Size_0 / 2, l_Position_0);
    v26.cameraOptions = {
        fill = v27, 
        maxDim = v28, 
        dir = v29
    };
end;
v3.cleanup = function(v36) --[[ Line: 156 ]] --[[ Name: cleanup ]]
    if v36.screenGui then
        v36.screenGui:Destroy();
        v36.screenGui = nil;
        v36.vpfs = nil;
    end;
    if v36.cameraOptions then
        v36.cameraOptions = nil;
    end;
    if v36.target then
        v36.target:Destroy();
        v36.target = nil;
    end;
    if v36.ancestor then
        v36.ancestor:Destroy();
        v36.ancestor = nil;
    end;
    if v36.camera then
        v36.camera:Destroy();
        v36.camera = nil;
    end;
end;
v3.takeSnapshot = function(v37) --[[ Line: 183 ]] --[[ Name: takeSnapshot ]]
    -- upvalues: v1 (copy)
    local v38 = os.clock();
    local v39 = nil;
    local v40 = nil;
    if v37.mode == 1 then
        local l_ThumbnailGenerator_0 = game:GetService("ThumbnailGenerator");
        local l_l_ThumbnailGenerator_0_0 = l_ThumbnailGenerator_0 --[[ copy: 4 -> 7 ]];
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 189 ]]
            -- upvalues: l_l_ThumbnailGenerator_0_0 (copy), v37 (copy)
            return l_l_ThumbnailGenerator_0_0:Click("Png", v37.imgSize.X, v37.imgSize.Y, true);
        end);
        v39 = l_status_0;
        v40 = l_result_0;
    else
        v37:setupViewportFrame();
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 194 ]]
            -- upvalues: v37 (copy)
            task.wait(1);
            return v37.vpfs[#v37.vpfs]:CaptureSnapshotAsync();
        end);
        v39 = l_status_1;
        v40 = l_result_1;
    end;
    local v47 = os.clock();
    v1.reportThumbnailing(v47 - v38);
    return v39, v40;
end;
return v3;