local v0 = {};
v0.__index = v0;
local v1 = require(script.Parent.RigFunctions);
local v2 = require(script.Parent.CharacterTester);
local v3 = require(script.Parent.Constants);
v0.new = function(v4) --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v5 = setmetatable({}, v0);
    v5._enabled = false;
    v5._configureFrame = nil;
    v5._r15Avatar = nil;
    v5._r15Fixed = nil;
    v5._r6Avatar = nil;
    v5._r15TexturesMap = {};
    v5._r6TexturesMap = {};
    v5._r6MeshesMap = {};
    v5._faceTextureId = nil;
    v5._onConfigureStarted = Instance.new("BindableEvent");
    v5:_constructUI(v4);
    v5:_setupExistingRigs();
    return v5;
end;
v0.ConfigureImportedAvatar = function(v6, v7) --[[ Line: 36 ]] --[[ Name: ConfigureImportedAvatar ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v8 = v1.CreateImportedFbxModel(v7);
    v6._r15Avatar = v8:FindFirstChild(v3.R15_ARTIST_INTENT_FOLDER_NAME);
    v6._r15Fixed = v8:FindFirstChild(v3.R15_FIXED_FOLDER_NAME);
    v6._r6Avatar = v8:FindFirstChild(v3.R6_FOLDER_NAME);
    v1.MakeExportVersion(v8);
    v6._onConfigureStarted:Fire(v6._r15Avatar, v6._r6Avatar);
    v6:setEnabled(true);
end;
v0.ConfigureExistingAvatar = function(v9, v10) --[[ Line: 48 ]] --[[ Name: ConfigureExistingAvatar ]]
    -- upvalues: v3 (copy), v1 (copy)
    v9._r15Avatar = v10:FindFirstChild(v3.R15_ARTIST_INTENT_FOLDER_NAME);
    v9._r15Fixed = v10:FindFirstChild(v3.R15_FIXED_FOLDER_NAME);
    v9._r6Avatar = v10:FindFirstChild(v3.R6_FOLDER_NAME);
    v1.MakeExportVersion(v10);
    v9._onConfigureStarted:Fire(v9._r15Avatar, v9._r6Avatar);
    v9:setEnabled(true);
end;
v0._setupExistingRigs = function(v11) --[[ Line: 58 ]] --[[ Name: _setupExistingRigs ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v12 = v1.FindExistingImportedFbx();
    if v12 then
        v11._r15Avatar = v12:FindFirstChild(v3.R15_ARTIST_INTENT_FOLDER_NAME);
        v11._r6Avatar = v12:FindFirstChild(v3.R6_FOLDER_NAME);
        v11._onConfigureStarted:Fire(v11._r15Avatar, v11._r6Avatar);
    end;
end;
v0.setEnabled = function(v13, v14) --[[ Line: 68 ]] --[[ Name: setEnabled ]]
    v13._enabled = v14;
    v13._configureFrame.Visible = v13._enabled;
end;
v0._onFinished = function(v15) --[[ Line: 73 ]] --[[ Name: _onFinished ]]
    -- upvalues: v1 (copy)
    v1.CopyTexturesToRig(v15._r15TexturesMap, v15._r15Avatar);
    v1.AddFaceToRig(v15._faceTextureId, v15._r15Avatar);
    v1.CopyTexturesToRig(v15._r15TexturesMap, v15._r15Fixed);
    v1.AddFaceToRig(v15._faceTextureId, v15._r15Fixed);
    v1.CopyCharacterMeshesToRig(v15._r6MeshesMap, v15._r6Avatar);
    v1.CopyTexturesToRig(v15._r6TexturesMap, v15._r6Avatar);
    v1.AddFaceToRig(v15._faceTextureId, v15._r6Avatar);
    v15:setEnabled(false);
end;
v0._onCancel = function(v16) --[[ Line: 90 ]] --[[ Name: _onCancel ]]
    v16:setEnabled(false);
end;
local function v31(v17, v18, v19) --[[ Line: 94 ]] --[[ Name: updateMapWhenEntryChanged ]]
    -- upvalues: v1 (copy)
    local function _(v20, v21, v22) --[[ Line: 95 ]] --[[ Name: onFieldUpdated ]]
        -- upvalues: v1 (ref), v17 (copy)
        if v22 ~= "" and string.find(v22, "<") == nil then
            v21.Text = v1.RemoveAssetUrlFromText(v22);
            v17[v20.Name] = v21.Text;
        end;
    end;
    for _, v25 in pairs(v18) do
        local l_v25_FirstChild_0 = v25:FindFirstChild(v19);
        if not l_v25_FirstChild_0 then
            warn("Broken entry box for field " .. v19 .. "\n" .. "Traceback: " .. debug.traceback());
        else
            l_v25_FirstChild_0:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 107 ]]
                -- upvalues: v25 (copy), l_v25_FirstChild_0 (copy), v1 (ref), v17 (copy)
                local l_v25_0 = v25;
                local l_l_v25_FirstChild_0_0 = l_v25_FirstChild_0;
                local l_Text_0 = l_v25_FirstChild_0.Text;
                if l_Text_0 ~= "" and string.find(l_Text_0, "<") == nil then
                    l_l_v25_FirstChild_0_0.Text = v1.RemoveAssetUrlFromText(l_Text_0);
                    v17[l_v25_0.Name] = l_l_v25_FirstChild_0_0.Text;
                end;
            end);
            local l_Text_1 = l_v25_FirstChild_0.Text;
            if l_Text_1 ~= "" and string.find(l_Text_1, "<") == nil then
                l_v25_FirstChild_0.Text = v1.RemoveAssetUrlFromText(l_Text_1);
                v17[v25.Name] = l_v25_FirstChild_0.Text;
            end;
        end;
    end;
end;
local function v37(v32) --[[ Line: 115 ]] --[[ Name: setupTextClearOnFocus ]]
    local function _(v33) --[[ Line: 116 ]] --[[ Name: clearTemplateTextOnFocus ]]
        v33.Focused:Connect(function() --[[ Line: 117 ]]
            -- upvalues: v33 (copy)
            if string.find(v33.Text, "<") ~= nil then
                v33.Text = "";
            end;
        end);
    end;
    for _, v36 in pairs(v32:GetChildren()) do
        if v36:IsA("TextBox") then
            v36.Focused:Connect(function() --[[ Line: 117 ]]
                -- upvalues: v36 (copy)
                if string.find(v36.Text, "<") ~= nil then
                    v36.Text = "";
                end;
            end);
        end;
    end;
end;
v0._entryBoxListSetup = function(_, v39, v40, v41) --[[ Line: 131 ]] --[[ Name: _entryBoxListSetup ]]
    -- upvalues: v37 (copy)
    local v42 = {};
    table.sort(v41);
    for v43, v44 in pairs(v41) do
        local v45 = v40:Clone();
        local v46 = (v43 - 1) * v45.Size.Y.Offset;
        v45.Name = v44;
        v45.Position = v40.Position + UDim2.new(0, 0, 0, v46);
        v45.Description.Text = v44;
        v37(v45);
        v42[#v42 + 1] = v45;
        v45.Parent = v39;
    end;
    return v42;
end;
local function _(v47) --[[ Line: 151 ]] --[[ Name: createEntryFrame ]]
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "EntryBox";
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.BorderSizePixel = 0;
    l_Frame_0.Size = UDim2.new(1, -10, 0, 25);
    l_Frame_0.Position = v47;
    return l_Frame_0;
end;
local function v54(v50, v51, v52) --[[ Line: 161 ]] --[[ Name: createEntryField ]]
    local l_TextBox_0 = Instance.new("TextBox");
    l_TextBox_0.Name = v51;
    l_TextBox_0.Text = "<" .. v51 .. ">";
    l_TextBox_0.BackgroundColor3 = Color3.fromRGB(70, 70, 70);
    l_TextBox_0.BorderColor3 = Color3.fromRGB(49, 49, 49);
    l_TextBox_0.Position = v52;
    l_TextBox_0.Size = UDim2.new(0.5, 0, 0, 25);
    l_TextBox_0.Font = Enum.Font.SourceSans;
    l_TextBox_0.TextColor3 = Color3.fromRGB(255, 255, 255);
    l_TextBox_0.TextSize = 14;
    l_TextBox_0.TextStrokeTransparency = 1;
    l_TextBox_0.Parent = v50;
    return l_TextBox_0;
end;
local function v59(v55) --[[ Line: 178 ]] --[[ Name: createEntryBoxTemplate ]]
    -- upvalues: v54 (copy)
    local v56 = UDim2.new(0, 5, 0, 0);
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "EntryBox";
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.BorderSizePixel = 0;
    l_Frame_1.Size = UDim2.new(1, -10, 0, 25);
    l_Frame_1.Position = v56;
    local l_l_Frame_1_0 = l_Frame_1;
    v56 = Instance.new("TextLabel");
    v56.Name = "Description";
    v56.BackgroundTransparency = 1;
    v56.BorderSizePixel = 0;
    v56.Position = UDim2.new(0, 0, 0, 0);
    v56.Size = UDim2.new(0.5, -5, 0, 25);
    v56.Font = Enum.Font.SourceSansBold;
    v56.TextSize = 14;
    v56.TextColor3 = Color3.fromRGB(255, 255, 255);
    v56.TextStrokeTransparency = 1;
    v56.Parent = l_l_Frame_1_0;
    v54(l_l_Frame_1_0, v55, UDim2.new(0.5, 0, 0, 0));
    return l_l_Frame_1_0;
end;
local function v63(v60, v61) --[[ Line: 198 ]] --[[ Name: addSubTitle ]]
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "SubTitle";
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Position = UDim2.new(0, 0, 0, 0);
    l_TextLabel_0.Size = UDim2.new(1, 0, 0, 20);
    l_TextLabel_0.Font = Enum.Font.SourceSansBold;
    l_TextLabel_0.TextColor3 = Color3.fromRGB(255, 165, 10);
    l_TextLabel_0.TextSize = 18;
    l_TextLabel_0.TextStrokeTransparency = 1;
    l_TextLabel_0.Text = v61;
    l_TextLabel_0.BorderSizePixel = 0;
    l_TextLabel_0.Parent = v60;
end;
local function v68(v64, v65, v66) --[[ Line: 213 ]] --[[ Name: addInstructionsLabel ]]
    local l_TextLabel_1 = Instance.new("TextLabel");
    l_TextLabel_1.Name = "Instructions";
    l_TextLabel_1.BackgroundTransparency = 1;
    l_TextLabel_1.BorderSizePixel = 0;
    l_TextLabel_1.Position = v66;
    l_TextLabel_1.Size = UDim2.new(1, 0, 0, 20);
    l_TextLabel_1.Font = Enum.Font.SourceSansBold;
    l_TextLabel_1.Text = v65;
    l_TextLabel_1.TextColor3 = Color3.fromRGB(255, 255, 255);
    l_TextLabel_1.TextStrokeTransparency = 1;
    l_TextLabel_1.TextSize = 14;
    l_TextLabel_1.Parent = v64;
end;
v0._constructR6TextureBoxes = function(v69, v70) --[[ Line: 228 ]] --[[ Name: _constructR6TextureBoxes ]]
    -- upvalues: v54 (copy), v37 (copy), v1 (copy)
    local v71 = UDim2.new(0, 5, 0, 45);
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Name = "EntryBox";
    l_Frame_2.BackgroundTransparency = 1;
    l_Frame_2.BorderSizePixel = 0;
    l_Frame_2.Size = UDim2.new(1, -10, 0, 25);
    l_Frame_2.Position = v71;
    local l_l_Frame_2_0 = l_Frame_2;
    v71 = v54(l_l_Frame_2_0, "BaseTextureId", UDim2.new(0, 0, 0, 0));
    l_Frame_2 = v54(l_l_Frame_2_0, "OverlayTextureId", UDim2.new(0.5, 0, 0, 0));
    v37(l_l_Frame_2_0);
    local function _(v74) --[[ Line: 234 ]] --[[ Name: r6TextureChanged ]]
        -- upvalues: v1 (ref), v69 (copy)
        local l_Text_2 = v74.Text;
        if l_Text_2 ~= "" and string.find(l_Text_2, "<") == nil then
            v74.Text = v1.RemoveAssetUrlFromText(l_Text_2);
            v69._r6TexturesMap[v74.Name] = v74.Text;
        end;
    end;
    v71:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 242 ]]
        -- upvalues: v71 (copy), v1 (ref), v69 (copy)
        local l_v71_0 = v71;
        local l_Text_3 = l_v71_0.Text;
        if l_Text_3 ~= "" and string.find(l_Text_3, "<") == nil then
            l_v71_0.Text = v1.RemoveAssetUrlFromText(l_Text_3);
            v69._r6TexturesMap[l_v71_0.Name] = l_v71_0.Text;
        end;
    end);
    l_Frame_2:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 245 ]]
        -- upvalues: l_Frame_2 (copy), v1 (ref), v69 (copy)
        local l_l_Frame_2_1 = l_Frame_2;
        local l_Text_4 = l_l_Frame_2_1.Text;
        if l_Text_4 ~= "" and string.find(l_Text_4, "<") == nil then
            l_l_Frame_2_1.Text = v1.RemoveAssetUrlFromText(l_Text_4);
            v69._r6TexturesMap[l_l_Frame_2_1.Name] = l_l_Frame_2_1.Text;
        end;
    end);
    v69._onConfigureStarted.Event:Connect(function(_, v82) --[[ Line: 249 ]]
        -- upvalues: v69 (copy), v1 (ref), v71 (copy), l_Frame_2 (copy)
        v69._r6TexturesMap = {};
        local v83 = v1.GetCharacterMeshPropertyFromRig(v82, v71.Name);
        if v83 then
            v71.Text = v1.RemoveAssetUrlFromText(v83);
        end;
        local v84 = v1.GetCharacterMeshPropertyFromRig(v82, l_Frame_2.Name);
        if v84 then
            l_Frame_2.Text = v1.RemoveAssetUrlFromText(v84);
        end;
        local l_v71_1 = v71;
        local l_Text_5 = l_v71_1.Text;
        if l_Text_5 ~= "" and string.find(l_Text_5, "<") == nil then
            l_v71_1.Text = v1.RemoveAssetUrlFromText(l_Text_5);
            v69._r6TexturesMap[l_v71_1.Name] = l_v71_1.Text;
        end;
        l_v71_1 = l_Frame_2;
        l_Text_5 = l_v71_1.Text;
        if l_Text_5 ~= "" and string.find(l_Text_5, "<") == nil then
            l_v71_1.Text = v1.RemoveAssetUrlFromText(l_Text_5);
            v69._r6TexturesMap[l_v71_1.Name] = l_v71_1.Text;
        end;
    end);
    l_l_Frame_2_0.Parent = v70;
end;
v0._constructR6MeshBoxes = function(v87, v88) --[[ Line: 269 ]] --[[ Name: _constructR6MeshBoxes ]]
    -- upvalues: v59 (copy), v1 (copy), v31 (copy)
    local l_Frame_3 = Instance.new("Frame");
    l_Frame_3.Name = "CharacterMeshIDs";
    l_Frame_3.BackgroundTransparency = 1;
    l_Frame_3.BorderSizePixel = 0;
    l_Frame_3.Size = UDim2.new(1, 0, 0, 175);
    l_Frame_3.Position = UDim2.new(0, 0, 0, 125);
    local v90 = v59("MeshId");
    v87._onConfigureStarted.Event:Connect(function(_, v92) --[[ Line: 279 ]]
        -- upvalues: l_Frame_3 (copy), v1 (ref), v87 (copy), v90 (copy), v31 (ref)
        l_Frame_3:ClearAllChildren();
        local v93 = v1.GetBodyPartNames();
        local v94 = v87:_entryBoxListSetup(l_Frame_3, v90, v93);
        for _, v96 in pairs(v94) do
            local v97 = v1.GetCurrentCharacterMeshIdFromRig(v92, v96.Name);
            if v97 then
                v96.MeshId.Text = v97;
            end;
        end;
        v87._r6MeshesMap = {};
        v31(v87._r6MeshesMap, v94, "MeshId");
    end);
    l_Frame_3.Parent = v88;
end;
v0._constructFaceTextureEntry = function(v98, v99) --[[ Line: 301 ]] --[[ Name: _constructFaceTextureEntry ]]
    -- upvalues: v59 (copy), v1 (copy)
    local v100 = v59("TextureId");
    v100.Position = UDim2.new(0, 5, 0, 315);
    local function _(v101) --[[ Line: 305 ]] --[[ Name: textboxChanged ]]
        -- upvalues: v100 (copy), v1 (ref), v98 (copy)
        if v101 ~= "" and string.find(v101, "<") == nil then
            v100.TextureId.Text = v1.RemoveAssetUrlFromText(v101);
            v98._faceTextureId = v100.TextureId.Text;
        end;
    end;
    v100.Description.Text = "Texture ID:";
    v100.TextureId:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 313 ]]
        -- upvalues: v100 (copy), v1 (ref), v98 (copy)
        local l_Text_6 = v100.TextureId.Text;
        if l_Text_6 ~= "" and string.find(l_Text_6, "<") == nil then
            v100.TextureId.Text = v1.RemoveAssetUrlFromText(l_Text_6);
            v98._faceTextureId = v100.TextureId.Text;
        end;
    end);
    v98._onConfigureStarted.Event:Connect(function(v104, v105) --[[ Line: 318 ]]
        -- upvalues: v1 (ref), v100 (copy), v98 (copy)
        local v106 = v1.FindFaceTexture(v104, v105);
        if v106 and v106 ~= "" and string.find(v106, "<") == nil then
            v100.TextureId.Text = v1.RemoveAssetUrlFromText(v106);
            v98._faceTextureId = v100.TextureId.Text;
        end;
    end);
    v100.Parent = v99;
end;
v0._constructConfigureR6 = function(v107, v108) --[[ Line: 328 ]] --[[ Name: _constructConfigureR6 ]]
    -- upvalues: v63 (copy), v68 (copy)
    local l_Frame_4 = Instance.new("Frame");
    l_Frame_4.Name = "R6";
    l_Frame_4.BackgroundTransparency = 1;
    l_Frame_4.BorderSizePixel = 0;
    l_Frame_4.Position = UDim2.new(0, 0, 0, 40);
    l_Frame_4.Size = UDim2.new(0.5, 0, 1, -25);
    l_Frame_4.ZIndex = 2;
    v63(l_Frame_4, "R6");
    v68(l_Frame_4, "Enter Texture IDs", UDim2.new(0, 5, 0, 20));
    v107:_constructR6TextureBoxes(l_Frame_4);
    v68(l_Frame_4, "Enter Character Mesh IDs", UDim2.new(0, 5, 0, 100));
    v107:_constructR6MeshBoxes(l_Frame_4);
    v68(l_Frame_4, "Face Texture ID", UDim2.new(0, 5, 0, 290));
    v107:_constructFaceTextureEntry(l_Frame_4);
    l_Frame_4.Parent = v108;
end;
v0._constructConfigureTextures = function(v110, v111) --[[ Line: 351 ]] --[[ Name: _constructConfigureTextures ]]
    -- upvalues: v59 (copy), v1 (copy), v31 (copy)
    local l_Frame_5 = Instance.new("Frame");
    l_Frame_5.Name = "TextureIDs";
    l_Frame_5.BackgroundTransparency = 1;
    l_Frame_5.BorderSizePixel = 0;
    l_Frame_5.Size = UDim2.new(1, 0, 1, -20);
    l_Frame_5.Position = UDim2.new(0, 0, 0, 45);
    local v113 = v59("TextureID");
    v110._onConfigureStarted.Event:Connect(function(v114) --[[ Line: 361 ]]
        -- upvalues: l_Frame_5 (copy), v1 (ref), v110 (copy), v113 (copy), v31 (ref)
        l_Frame_5:ClearAllChildren();
        local v115 = v1.GetLimbNames();
        local v116 = v110:_entryBoxListSetup(l_Frame_5, v113, v115);
        for _, v118 in pairs(v116) do
            local v119 = v1.GetCurrentTextureIdFromRig(v114, v118.Name);
            if v119 then
                v118.TextureID.Text = v119;
            end;
        end;
        v110._r15TexturesMap = {};
        v31(v110._r15TexturesMap, v116, "TextureID");
    end);
    l_Frame_5.Parent = v111;
end;
v0._constructConfigureR15 = function(v120, v121) --[[ Line: 383 ]] --[[ Name: _constructConfigureR15 ]]
    -- upvalues: v63 (copy), v68 (copy)
    local l_Frame_6 = Instance.new("Frame");
    l_Frame_6.Name = "R15";
    l_Frame_6.BackgroundTransparency = 1;
    l_Frame_6.BorderSizePixel = 0;
    l_Frame_6.Position = UDim2.new(0.5, 5, 0, 40);
    l_Frame_6.Size = UDim2.new(0.5, -5, 1, -100);
    l_Frame_6.ZIndex = 2;
    v63(l_Frame_6, "R15");
    v68(l_Frame_6, "Enter Texture IDs", UDim2.new(0, 5, 0, 20));
    v120:_constructConfigureTextures(l_Frame_6);
    l_Frame_6.Parent = v121;
end;
v0._constructUI = function(v123, v124) --[[ Line: 400 ]] --[[ Name: _constructUI ]]
    local l_Frame_7 = Instance.new("Frame");
    l_Frame_7.Name = "RigConfiguration";
    l_Frame_7.Visible = false;
    l_Frame_7.BackgroundColor3 = Color3.fromRGB(16, 16, 16);
    l_Frame_7.BackgroundTransparency = 0.5;
    l_Frame_7.BorderSizePixel = 0;
    l_Frame_7.Position = UDim2.new(0.5, -300, 0.5, -250);
    l_Frame_7.Size = UDim2.new(0, 600, 0, 400);
    local l_Frame_8 = Instance.new("Frame");
    l_Frame_8.Name = "Divide";
    l_Frame_8.BackgroundColor3 = Color3.fromRGB(255, 165, 10);
    l_Frame_8.BackgroundTransparency = 0;
    l_Frame_8.BorderColor3 = Color3.fromRGB(27, 42, 53);
    l_Frame_8.Position = UDim2.new(0.5, 2, 0, 60);
    l_Frame_8.Size = UDim2.new(0, 2, 1, -66);
    l_Frame_8.Parent = l_Frame_7;
    local l_TextLabel_2 = Instance.new("TextLabel");
    l_TextLabel_2.Name = "Title";
    l_TextLabel_2.Text = "Configure Imported Rig";
    l_TextLabel_2.BackgroundColor3 = Color3.fromRGB(49, 49, 49);
    l_TextLabel_2.BackgroundTransparency = 1;
    l_TextLabel_2.BorderSizePixel = 0;
    l_TextLabel_2.Position = UDim2.new(0, 15, 0, 5);
    l_TextLabel_2.Size = UDim2.new(1, 0, 0, 40);
    l_TextLabel_2.TextSize = 18;
    l_TextLabel_2.Font = Enum.Font.SourceSansBold;
    l_TextLabel_2.TextStrokeTransparency = 1;
    l_TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255);
    l_TextLabel_2.Parent = l_Frame_7;
    local l_TextLabel_3 = Instance.new("TextLabel");
    l_TextLabel_3.Name = "Topbar";
    l_TextLabel_3.BackgroundColor3 = Color3.fromRGB(49, 49, 49);
    l_TextLabel_3.BackgroundTransparency = 0;
    l_TextLabel_3.BorderColor3 = Color3.fromRGB(27, 42, 53);
    l_TextLabel_3.Position = UDim2.new(0, 0, 0, 0);
    l_TextLabel_3.Size = UDim2.new(1, 0, 0, 5);
    l_TextLabel_3.Text = "";
    l_TextLabel_3.Parent = l_Frame_7;
    local l_TextButton_0 = Instance.new("TextButton");
    l_TextButton_0.Name = "Cancel";
    l_TextButton_0.BackgroundColor3 = Color3.fromRGB(132, 132, 132);
    l_TextButton_0.BackgroundTransparency = 0;
    l_TextButton_0.BorderColor3 = Color3.fromRGB(49, 49, 49);
    l_TextButton_0.Position = UDim2.new(1, -270, 1, -40);
    l_TextButton_0.Size = UDim2.new(0, 120, 0, 30);
    l_TextButton_0.Text = "Cancel";
    l_TextButton_0.Font = Enum.Font.SourceSansBold;
    l_TextButton_0.TextColor3 = Color3.fromRGB(255, 255, 255);
    l_TextButton_0.TextSize = 14;
    l_TextButton_0.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
    l_TextButton_0.TextStrokeTransparency = 0.75;
    l_TextButton_0.MouseButton1Down:Connect(function() --[[ Line: 456 ]]
        -- upvalues: v123 (copy)
        v123:_onCancel();
    end);
    l_TextButton_0.Parent = l_Frame_7;
    local l_TextButton_1 = Instance.new("TextButton");
    l_TextButton_1.Name = "Done";
    l_TextButton_1.BackgroundColor3 = Color3.fromRGB(255, 165, 10);
    l_TextButton_1.BackgroundTransparency = 0;
    l_TextButton_1.BorderColor3 = Color3.fromRGB(49, 49, 49);
    l_TextButton_1.Position = UDim2.new(1, -140, 1, -40);
    l_TextButton_1.Size = UDim2.new(0, 120, 0, 30);
    l_TextButton_1.Text = "Done";
    l_TextButton_1.Font = Enum.Font.SourceSansBold;
    l_TextButton_1.TextColor3 = Color3.fromRGB(255, 255, 255);
    l_TextButton_1.TextSize = 14;
    l_TextButton_1.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
    l_TextButton_1.TextStrokeTransparency = 0.75;
    l_TextButton_1.MouseButton1Down:Connect(function() --[[ Line: 474 ]]
        -- upvalues: v123 (copy)
        v123:_onFinished();
    end);
    l_TextButton_1.Parent = l_Frame_7;
    v123:_constructConfigureR6(l_Frame_7);
    v123:_constructConfigureR15(l_Frame_7);
    l_Frame_7.Parent = v124;
    v123._configureFrame = l_Frame_7;
end;
v0._setupExistingRig = function(v131) --[[ Line: 486 ]] --[[ Name: _setupExistingRig ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v132 = v1.FindExistingImportedFbx();
    if v132 then
        v131._r15Avatar = v132:FindFirstChild(v3.R15_ARTIST_INTENT_FOLDER_NAME);
        v131._r6Avatar = v132:FindFirstChild(v3.R6_FOLDER_NAME);
        if v131._r15Avatar and v131._r6Avatar then
            v131._onConfigureStarted:Fire(v131._r15Avatar, v131._r6Avatar);
            v1.MakeExportVersion(v132);
        end;
    end;
end;
v0.createButtons = function(v133, v134, v135) --[[ Line: 499 ]] --[[ Name: createButtons ]]
    -- upvalues: v1 (copy), v2 (copy)
    v135:CreateButton("Configure Avatar", "Configure FBX imported avatar", "rbxasset://textures/AvatarImporter/fbximportlogo.png").Click:Connect(function() --[[ Line: 506 ]]
        -- upvalues: v1 (ref), v133 (copy)
        local v136 = v1.FindExistingImportedFbx();
        if v136 then
            v133:ConfigureExistingAvatar(v136);
        end;
    end);
    v135:CreateButton("Export Avatar", "Export .rbxm files for imported avatar", "rbxasset://textures/AvatarImporter/fbximportlogo.png").Click:Connect(function() --[[ Line: 520 ]]
        -- upvalues: v1 (ref), v134 (copy)
        v1.Export(v134);
    end);
    v135:CreateButton("Test Avatar", "Click to make imported FBX avatar into StarterCharacter", "").Click:Connect(function() --[[ Line: 530 ]]
        -- upvalues: v2 (ref), v133 (copy)
        v2.SetupCharacterForTesting(v133._r15Avatar);
    end);
end;
return v0;