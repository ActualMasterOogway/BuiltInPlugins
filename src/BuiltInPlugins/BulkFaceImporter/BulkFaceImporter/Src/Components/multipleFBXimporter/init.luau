local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkFaceImporter");
local v1 = {};
local v2 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagBulkFaceImporterRemoveDashSplitOn);
local v3 = require(script.Parent.animateModule);
local v4 = require(script.Parent.avatarUtils);
local v5 = if v2() then nil else require(script.Parent.Parent.Parent.Packages._Index.Dash.Dash.splitOn);
v1.attachScript = function(v6) --[[ Line: 17 ]] --[[ Name: attachScript ]]
    -- upvalues: v3 (copy)
    local l_Script_0 = Instance.new("Script");
    l_Script_0.Source = v3;
    l_Script_0.Parent = v6;
end;
v1.alignFaceModels = function(v8, v9) --[[ Line: 26 ]] --[[ Name: alignFaceModels ]]
    local v10 = Instance.new("Model", workspace);
    local v11 = 5;
    if not v9 then
        for _, v13 in v8 do
            local v14 = 0;
            local v15 = {};
            for v16, _ in pairs(v13) do
                table.insert(v15, v16);
            end;
            table.sort(v15);
            for _, v19 in pairs(v15) do
                local v20 = CFrame.new(-4 + v14, v11, 0);
                v13[v19]:PivotTo(v20);
                v13[v19].Parent = v10;
                v14 = v14 + 2;
            end;
            v11 = v11 + 2;
        end;
        v10:PivotTo(CFrame.new(0, 10, 0));
        return v10;
    else
        for _, v22 in v8 do
            local v23 = 0;
            local v24 = {};
            for v25, _ in pairs(v22) do
                table.insert(v24, v25);
            end;
            table.sort(v24);
            for _, v28 in pairs(v24) do
                local v29 = v22[v28].PrimaryPart.Size.Y / 2 + v22[v28].Humanoid.HipHeight;
                local v30 = CFrame.new(-5 + v23, v29, v11);
                v22[v28]:PivotTo(v30);
                v22[v28].Parent = v10;
                v23 = v23 + 5;
            end;
            v11 = v11 + 5;
        end;
        return v10;
    end;
end;
v1.setUpFaceModel = function(v31, v32) --[[ Line: 76 ]] --[[ Name: setUpFaceModel ]]
    -- upvalues: v2 (copy), v5 (copy), v1 (copy)
    local v33 = if v2() then string.split(v31.Name, "_")[1] else v5(v31.Name, "_")[1];
    v31:WaitForChild("Humanoid").DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    local l_Head_0 = v31:WaitForChild("Head");
    if not v32 then
        local l_v31_Children_0 = v31:GetChildren();
        for _, v37 in pairs(l_v31_Children_0) do
            if v37.Name ~= "Head" and v37:IsA("MeshPart") then
                v37:Destroy();
            end;
        end;
        local l_Neck_0 = l_Head_0:FindFirstChild("Neck");
        if l_Neck_0 ~= nil then
            l_Neck_0:Destroy();
        end;
        v31.PrimaryPart = l_Head_0;
        v31.PrimaryPart.PivotOffset = CFrame.new(0, 0, 0);
    else
        local l_v31_Children_1 = v31:GetChildren();
        local v40 = false;
        for _, v42 in pairs(l_v31_Children_1) do
            if v42.Name ~= "Head" and v42:IsA("MeshPart") then
                v40 = true;
            end;
        end;
        if not v40 then
            v31.PrimaryPart = l_Head_0;
            v31.PrimaryPart.PivotOffset = CFrame.new(0, 0, 0);
        end;
    end;
    local v43 = {
        ChiseledGoodLooks = "rbxassetid://12259863451", 
        Man = "rbxassetid://12259863451", 
        StevieStandard = "rbxassetid://12651328744", 
        Stevie = "rbxassetid://12651328744", 
        MakeupMinimalist = "rbxassetid://12262506468", 
        Woman = "rbxassetid://12262506468", 
        ClassicVampire = "rbxassetid://12431828460"
    };
    local function v47(v44) --[[ Line: 130 ]] --[[ Name: getFaceTextureId ]]
        -- upvalues: v43 (copy)
        for v45, _ in pairs(v43) do
            if string.match(v44, v45) then
                return v43[v45];
            end;
        end;
        return "rbxassetid://144080495";
    end;
    if l_Head_0 ~= nil then
        l_Head_0.Name = "Head";
        l_Head_0.Anchored = true;
        l_Head_0.BrickColor = BrickColor.new("Bright orange");
        l_Head_0.Material = Enum.Material.SmoothPlastic;
        local l_face_0 = l_Head_0:FindFirstChild("face");
        if l_face_0 ~= nil then
            l_face_0:Destroy();
        end;
        local v49 = "";
        v49 = if l_Head_0.TextureID ~= "" then l_Head_0.TextureID else v47(v33);
        local v50 = nil;
        v50 = l_Head_0:FindFirstChild("SurfaceAppearance");
        if v50 ~= nil then
            v50:Destroy();
        end;
        Instance.new("SurfaceAppearance", l_Head_0).ColorMap = v49;
    end;
    v31:WaitForChild("HumanoidRootPart").Anchored = true;
    if v31:FindFirstChild("Script") == nil then
        v1.attachScript(v31);
    end;
end;
v1.setCameraPosition = function(v51) --[[ Line: 186 ]] --[[ Name: setCameraPosition ]]
    local l_Camera_0 = workspace.Camera;
    local l_v51_Children_0 = v51:GetChildren();
    if #l_v51_Children_0 ~= 0 then
        local l_v51_ExtentsSize_0 = v51:GetExtentsSize();
        local v55 = math.clamp(math.max(l_v51_ExtentsSize_0.X, l_v51_ExtentsSize_0.Y) * 5, 40, 90);
        l_Camera_0.CameraType = Enum.CameraType.Scriptable;
        local l_Position_0 = v51:GetPivot().Position;
        l_Camera_0.CFrame = CFrame.lookAt(Vector3.new(l_Position_0.X, l_Position_0.Y, v55 * -1), l_Position_0);
        l_Camera_0.DiagonalFieldOfView = 4;
        l_Camera_0.FieldOfView = 9.8;
        l_Camera_0.FieldOfViewMode = Enum.FieldOfViewMode.Vertical;
        l_Camera_0.MaxAxisFieldOfView = 19;
        for _, v58 in pairs(l_v51_Children_0) do
            v58.Parent = workspace;
        end;
        v51:Destroy();
        l_Camera_0.CameraType = Enum.CameraType.Custom;
        return;
    else
        v51:Destroy();
        return;
    end;
end;
v1.importAvatars = function(v59) --[[ Line: 221 ]] --[[ Name: importAvatars ]]
    -- upvalues: v1 (copy), v4 (copy)
    local v60 = {};
    local v61 = nil;
    local l_keepBody_0 = v59.state.keepBody;
    local v63 = v1.selectFiles();
    for _, v65 in pairs(v63) do
        local v66, v67 = v1.setUploadSession(v65);
        v66:GetImportTree().RigType = 0;
        local v68 = false;
        v59:setState({
            objectName = v67
        });
        v59:setState({
            enabled = true
        });
        v66:Upload();
        do
            local l_v68_0 = v68;
            v66.UploadComplete:Connect(function(v70) --[[ Line: 235 ]]
                -- upvalues: l_v68_0 (ref), v60 (copy)
                l_v68_0 = true;
                local l_Instance_0 = v70.Instance;
                l_Instance_0.Parent = workspace;
                table.insert(v60, l_Instance_0);
            end);
            while not l_v68_0 do
                if v59.state.canceled then
                    v66:Cancel();
                    break;
                else
                    v66.UploadProgress:Connect(function(v72) --[[ Line: 251 ]]
                        -- upvalues: v59 (copy)
                        v59:setState({
                            progress = v72
                        });
                    end);
                    wait();
                end;
            end;
        end;
    end;
    if v60 ~= {} then
        for _, v74 in v60 do
            v1.setUpFaceModel(v74, l_keepBody_0);
        end;
        v61 = v4.getFaceList(v60);
        if v61 ~= {} then
            local v75 = v1.alignFaceModels(v61, l_keepBody_0);
            if v75 ~= nil then
                v1.setCameraPosition(v75);
            end;
        end;
    end;
    v59:setState({
        enabled = false
    });
end;
v1.selectFiles = function() --[[ Line: 286 ]] --[[ Name: selectFiles ]]
    return (game:GetService("AssetImportService"):PickMultipleFilesWithPrompt());
end;
v1.setUploadSession = function(v76) --[[ Line: 293 ]] --[[ Name: setUploadSession ]]
    -- upvalues: v2 (copy), v5 (copy)
    local v77 = if v2() then string.split(v76, "/") else v5(v76, "/");
    local v78 = string.gsub(v77[#v77], ".fbx", "");
    return game:GetService("AssetImportService"):StartSessionWithPath(v76), v78;
end;
return v1;