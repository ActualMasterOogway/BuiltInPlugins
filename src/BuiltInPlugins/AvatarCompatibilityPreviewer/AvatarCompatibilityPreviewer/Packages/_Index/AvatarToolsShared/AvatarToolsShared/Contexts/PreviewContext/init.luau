local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Dash);
local l_join_0 = v1.join;
local l_append_0 = v1.append;
local v4 = require(l_Parent_0.Framework);
local l_ContextItem_0 = v4.ContextServices.ContextItem;
local l_Signal_0 = v4.Util.Signal;
local v7 = l_ContextItem_0:extend("PreviewContext");
v7.new = function() --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy), l_Signal_0 (copy)
    local v8 = {};
    setmetatable(v8, v7);
    v8.previewAvatars = {};
    v8.storageAvatars = {};
    v8.previewItems = {};
    v8.currentPreviewAvatarIndex = 1;
    v8.previewModelChangedSignal = l_Signal_0.new();
    v8.animationTargetChangedSignal = l_Signal_0.new();
    return v8;
end;
v7.addAvatar = function(v9, v10) --[[ Line: 36 ]] --[[ Name: addAvatar ]]
    table.insert(v9.previewAvatars, v10);
end;
v7.setAvatars = function(v11, v12) --[[ Line: 40 ]] --[[ Name: setAvatars ]]
    v11:destroyAvatars();
    v11.previewAvatars = v12;
end;
v7.getAvatars = function(v13) --[[ Line: 45 ]] --[[ Name: getAvatars ]]
    -- upvalues: l_join_0 (copy)
    return l_join_0({}, v13.previewAvatars);
end;
v7.getAllAvatars = function(v14) --[[ Line: 49 ]] --[[ Name: getAllAvatars ]]
    -- upvalues: l_append_0 (copy)
    return l_append_0({}, v14.previewAvatars, v14.storageAvatars);
end;
v7.setStorageAvatars = function(v15, v16) --[[ Line: 53 ]] --[[ Name: setStorageAvatars ]]
    v15:destroyStorageAvatars();
    v15.storageAvatars = v16;
end;
v7.updatePreviewModel = function(v17) --[[ Line: 58 ]] --[[ Name: updatePreviewModel ]]
    v17.previewModelChangedSignal:Fire();
end;
v7.setPreviewAvatarIndex = function(v18, v19) --[[ Line: 62 ]] --[[ Name: setPreviewAvatarIndex ]]
    if #v18.previewAvatars > 0 and v19 ~= v18.currentPreviewAvatarIndex then
        v18.currentPreviewAvatarIndex = math.clamp(v19, 1, #v18.previewAvatars);
        v18:updatePreviewModel();
    end;
end;
v7.getCurrentPreviewAvatarIndex = function(v20) --[[ Line: 71 ]] --[[ Name: getCurrentPreviewAvatarIndex ]]
    return v20.currentPreviewAvatarIndex;
end;
v7.cyclePreviewAvatarIndex = function(v21, v22) --[[ Line: 75 ]] --[[ Name: cyclePreviewAvatarIndex ]]
    if #v21.previewAvatars > 0 then
        local v23 = 1;
        if not v22 then
            v23 = -1;
        end;
        v21.currentPreviewAvatarIndex = (v21.currentPreviewAvatarIndex + v23 - 1) % #v21.previewAvatars + 1;
        v21:updatePreviewModel();
    end;
end;
v7.getPreviewModelChangedSignal = function(v24) --[[ Line: 86 ]] --[[ Name: getPreviewModelChangedSignal ]]
    return v24.previewModelChangedSignal;
end;
v7.getAnimationTargetChangedSignal = function(v25) --[[ Line: 90 ]] --[[ Name: getAnimationTargetChangedSignal ]]
    return v25.animationTargetChangedSignal;
end;
v7.destroyAvatars = function(v26) --[[ Line: 94 ]] --[[ Name: destroyAvatars ]]
    for _, v28 in ipairs(v26.previewAvatars) do
        v28:destroy();
    end;
    v26.previewAvatars = {};
end;
v7.destroyStorageAvatars = function(v29) --[[ Line: 101 ]] --[[ Name: destroyStorageAvatars ]]
    for _, v31 in ipairs(v29.storageAvatars) do
        v31:destroy();
    end;
    v29.storageAvatars = {};
end;
return v7;