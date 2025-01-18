local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetScreen);
local l_enableAudioImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableAudioImport;
local l_enableVideoImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableVideoImport;
local l_AssetManagerService_0 = game:GetService("AssetManagerService");
return function(v5, v6, _) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), l_AssetManagerService_0 (copy), l_enableAudioImport_0 (copy), l_enableVideoImport_0 (copy)
    return function(v8) --[[ Line: 11 ]]
        -- upvalues: v6 (copy), v5 (copy), v1 (ref), l_AssetManagerService_0 (ref), l_enableAudioImport_0 (ref), l_enableVideoImport_0 (ref)
        if v6.ClassName == "Folder" then
            v5:report("openFolder", v6.Screen.Path);
            v8:dispatch(v1(v6.Screen));
            return;
        else
            local l_assetType_0 = v6.assetType;
            if l_assetType_0 == Enum.AssetType.Place then
                l_AssetManagerService_0:OpenPlace(v6.id);
            elseif l_assetType_0 == Enum.AssetType.Package then
                l_AssetManagerService_0:InsertPackage(v6.id);
            elseif l_assetType_0 == Enum.AssetType.Image then
                l_AssetManagerService_0:InsertImage(v6.id);
            elseif l_assetType_0 == Enum.AssetType.MeshPart then
                l_AssetManagerService_0:InsertMesh("Meshes/" .. v6.name, false, v6.id);
            elseif l_enableAudioImport_0() and l_assetType_0 == Enum.AssetType.Audio then
                l_AssetManagerService_0:InsertAudio(v6.id, v6.name);
            elseif l_enableVideoImport_0() and l_assetType_0 == Enum.AssetType.Video then
                l_AssetManagerService_0:InsertVideo(v6.id, v6.name);
            elseif l_assetType_0 == Enum.AssetType.Model then
                l_AssetManagerService_0:InsertModel(v6.id);
            end;
            v5:report("doubleClickInsert");
            local l_searchTerm_0 = v8:getState().AssetManagerReducer.searchTerm;
            if utf8.len(l_searchTerm_0) ~= 0 then
                v5:report("insertAfterSearch");
            end;
            return;
        end;
    end;
end;