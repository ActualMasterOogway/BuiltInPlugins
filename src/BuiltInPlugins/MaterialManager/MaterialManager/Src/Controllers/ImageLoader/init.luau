local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local l_Signal_0 = v1.Util.Signal;
local l_ServiceWrapper_0 = v1.TestHelpers.ServiceWrapper;
local function v7(v5) --[[ Line: 35 ]] --[[ Name: createHelperImageLabel ]]
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Size = UDim2.new(0, 0, 0, 0);
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Parent = v5;
    return l_ImageLabel_0;
end;
local v8 = l_ContextItem_0:extend("ImageLoader");
v8.new = function(v9, v10) --[[ Line: 50 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v7 (copy), v8 (copy), l_ServiceWrapper_0 (copy)
    local v11 = setmetatable({
        ImageLoaded = l_Signal_0.new(), 
        _loadedImagesCache = {}, 
        _imageLabelPool = {}, 
        _loadingImageLabels = {}, 
        _loadingImageIds = {}, 
        _alive = true, 
        _createImageLabel = v9 and v9.createImageLabel or v7
    }, v8);
    local v12 = l_ServiceWrapper_0.new("CoreGui", v10);
    v11._hostGui = Instance.new("ScreenGui");
    v11._hostGui.Name = "ImageLoader";
    v11._hostGui.Enabled = true;
    v11._hostGui.Parent = v12:asInstance();
    if not v9 or not v9._dontPoll then
        spawn(function() --[[ Line: 73 ]]
            -- upvalues: v11 (copy)
            v11:_pollImageLoop();
        end);
    end;
    return v11;
end;
v8.mock = function(v13) --[[ Line: 81 ]] --[[ Name: mock ]]
    -- upvalues: v8 (copy)
    return v8.new({
        dontPoll = true, 
        createImageLabel = v13
    }, true);
end;
v8.loadImage = function(v14, v15) --[[ Line: 88 ]] --[[ Name: loadImage ]]
    if v15 == nil or v15 == "" then
        return false;
    elseif v14._loadedImagesCache[v15] then
        v14.ImageLoaded:Fire(v15);
        return true;
    elseif v14._loadingImageIds[v15] then
        return false;
    else
        local v16 = nil;
        v16 = if #v14._imageLabelPool > 0 then table.remove(v14._imageLabelPool) else v14._createImageLabel(v14._hostGui);
        v16.Image = v15;
        v14._loadingImageIds[v15] = true;
        table.insert(v14._loadingImageLabels, v16);
        return false;
    end;
end;
v8.hasImageLoaded = function(v17, v18) --[[ Line: 117 ]] --[[ Name: hasImageLoaded ]]
    return v17._loadedImagesCache[v18] or false;
end;
v8.destroy = function(v19) --[[ Line: 121 ]] --[[ Name: destroy ]]
    v19._alive = false;
    for _, v21 in ipairs(v19._imageLabelPool) do
        v21:Destroy();
    end;
    v19._imageLabelPool = nil;
    for _, v23 in ipairs(v19._loadingImageLabels) do
        v23:Destroy();
    end;
    v19._loadingImageLabels = nil;
    v19._hostGui:Destroy();
    v19._hostGui = nil;
end;
v8._pollImageLoop = function(v24) --[[ Line: 138 ]] --[[ Name: _pollImageLoop ]]
    while v24._alive do
        v24:_checkImages();
        wait(0.1);
    end;
end;
v8._checkImages = function(v25) --[[ Line: 145 ]] --[[ Name: _checkImages ]]
    local v26 = 1;
    while v26 <= #v25._loadingImageLabels do
        local v27 = v25._loadingImageLabels[v26];
        if v27.IsLoaded then
            local l_Image_0 = v27.Image;
            v25._loadedImagesCache[l_Image_0] = true;
            v25.ImageLoaded:Fire(l_Image_0);
            v27.Image = "";
            v25._loadingImageIds[l_Image_0] = nil;
            table.remove(v25._loadingImageLabels, v26);
            table.insert(v25._imageLabelPool, v27);
        else
            v26 = v26 + 1;
        end;
    end;
end;
return v8;