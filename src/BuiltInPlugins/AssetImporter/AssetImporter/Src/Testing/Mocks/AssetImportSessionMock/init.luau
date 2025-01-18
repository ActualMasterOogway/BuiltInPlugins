local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Testing.Mocks.EventMock);
local v3 = require(l_script_FirstAncestor_0.Src.Testing.Mocks.MakeMockStatus);
local v4 = {};
v4.__index = v4;
v4.new = function() --[[ Line: 34 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v5 = setmetatable({}, v4);
    v5.UploadProgress = v2.new();
    v5.UploadComplete = v2.new();
    v5._isAvatar = false;
    v5._isR15 = false;
    v5._isGltf = false;
    v5._didUpload = false;
    v5._didCancel = false;
    v5._statuses = {};
    v5._importTree = nil;
    v5._hasAnimation = false;
    v5._results = {};
    return v5;
end;
v4.SetFilename = function(v6, v7) --[[ Line: 55 ]] --[[ Name: SetFilename ]]
    v6._fileName = v7;
end;
v4.GetFilename = function(v8) --[[ Line: 59 ]] --[[ Name: GetFilename ]]
    return v8._fileName;
end;
v4.SetIsAvatar = function(v9, v10) --[[ Line: 63 ]] --[[ Name: SetIsAvatar ]]
    v9._isAvatar = v10;
end;
v4.IsAvatar = function(v11) --[[ Line: 67 ]] --[[ Name: IsAvatar ]]
    return v11._isAvatar;
end;
v4.SetIsGltf = function(v12, v13) --[[ Line: 71 ]] --[[ Name: SetIsGltf ]]
    v12._isGltf = v13;
end;
v4.IsGltf = function(v14) --[[ Line: 75 ]] --[[ Name: IsGltf ]]
    return v14._isGltf;
end;
v4.SetHasAnimation = function(v15, v16) --[[ Line: 79 ]] --[[ Name: SetHasAnimation ]]
    v15._hasAnimation = v16;
end;
v4.HasAnimation = function(v17) --[[ Line: 83 ]] --[[ Name: HasAnimation ]]
    return v17._hasAnimation;
end;
v4.IsR15 = function(v18) --[[ Line: 87 ]] --[[ Name: IsR15 ]]
    return v18._isR15;
end;
v4.SetResults = function(v19, v20) --[[ Line: 91 ]] --[[ Name: SetResults ]]
    v19._results = v20;
end;
v4.Upload = function(v21) --[[ Line: 95 ]] --[[ Name: Upload ]]
    v21._didUpload = true;
    v21.UploadComplete:Fire(v21._results);
end;
v4.Cancel = function(v22) --[[ Line: 100 ]] --[[ Name: Cancel ]]
    v22._didCancel = true;
end;
v4.AddMockStatus = function(v23, v24, v25, v26) --[[ Line: 104 ]] --[[ Name: AddMockStatus ]]
    -- upvalues: v3 (copy)
    v23._statuses[v25] = v3(v24, v25, {
        DebugMessage = v26
    });
end;
v4.GetStatuses = function(v27) --[[ Line: 108 ]] --[[ Name: GetStatuses ]]
    return v27._statuses;
end;
v4.SetImportTree = function(v28, v29) --[[ Line: 112 ]] --[[ Name: SetImportTree ]]
    v28._importTree = v29;
end;
v4.GetImportTree = function(v30) --[[ Line: 116 ]] --[[ Name: GetImportTree ]]
    return v30._importTree;
end;
v4.CreatePresetFromData = function(_, v32) --[[ Line: 120 ]] --[[ Name: CreatePresetFromData ]]
    local v33 = {};
    local v34 = v32.ClassName or "";
    v33[v34] = {};
    for v35, v36 in v32 do
        v33[v34][v35] = v36;
    end;
    return v33;
end;
v4.Reset = function(_) --[[ Line: 131 ]] --[[ Name: Reset ]]

end;
v4.ApplyPreset = function(_) --[[ Line: 135 ]] --[[ Name: ApplyPreset ]]

end;
v4.Destroy = function(v39) --[[ Line: 139 ]] --[[ Name: Destroy ]]
    v39.UploadProgress:Destroy();
    v39.UploadComplete:Destroy();
end;
return v4;