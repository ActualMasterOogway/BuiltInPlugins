local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_LayoutOrderIterator_0 = require(l_Parent_0.Util).LayoutOrderIterator;
local v3 = require(l_Parent_0.Parent.Dash);
local l_append_0 = v3.append;
local l_join_0 = v3.join;
local l_keys_0 = v3.keys;
local l_StudioService_0 = game:GetService("StudioService");
local v8 = tonumber(settings():GetFVariable("FileMaxSizeBytes"));
local v9 = require(l_Parent_0.UI.Components.MultiImagePicker);
local function v15() --[[ Line: 18 ]]
    -- upvalues: l_StudioService_0 (copy), v8 (copy)
    local v10 = l_StudioService_0:PromptImportFiles({
        "jpg", 
        "jpeg", 
        "png"
    });
    local v11 = {};
    local v12 = {};
    if v10 and #v10 > 0 then
        for _, v14 in ipairs(v10) do
            if v14.Size > v8 then
                table.insert(v11, v14.Name);
            else
                table.insert(v12, v14);
            end;
        end;
        if next(v11) ~= nil then
            print("thumbnail rejected");
        end;
        return v12;
    else
        return nil;
    end;
end;
local v16 = {};
local v17 = {};
local function v24() --[[ Line: 45 ]]
    -- upvalues: v15 (copy), l_join_0 (copy), v16 (ref), l_append_0 (copy), v17 (ref)
    local v18 = v15();
    if v18 then
        local v19 = l_join_0(v16, {});
        local v20 = l_append_0(v17, {});
        for _, v22 in pairs(v18) do
            local l_v22_TemporaryId_0 = v22:GetTemporaryId();
            table.insert(v20, l_v22_TemporaryId_0);
            v19[l_v22_TemporaryId_0] = {
                asset = v22, 
                tempId = l_v22_TemporaryId_0
            };
        end;
        v16 = v19;
        v17 = v20;
        print("thumbnail state now is:", v16);
    end;
end;
local function v25() --[[ Line: 67 ]]
    print("thumbnails changed");
end;
local function v26() --[[ Line: 71 ]]
    print("thumbnail order changed");
end;
local function _(v27, v28, v29, v30, v31, v32, v33) --[[ Line: 75 ]]
    local v34 = v31 ~= nil and v31;
    return {
        id = v27, 
        altText = if v28 ~= nil then v28 else nil, 
        approved = v29 == nil or v29, 
        imageId = if v30 ~= nil then v30 else v27, 
        isModerated = v34, 
        videoHash = if v32 ~= nil then v32 else nil, 
        videoTitle = if v33 ~= nil then v33 else nil
    };
end;
local v36 = {
    {
        id = 11457774193, 
        altText = nil, 
        approved = true, 
        imageId = 11457774193, 
        isModerated = false, 
        videoHash = nil, 
        videoTitle = nil
    }, 
    {
        id = 10979850405, 
        altText = nil, 
        approved = true, 
        imageId = 10979850405, 
        isModerated = false, 
        videoHash = nil, 
        videoTitle = nil
    }, 
    {
        id = 11114178824, 
        altText = nil, 
        approved = true, 
        imageId = 11114178824, 
        isModerated = false, 
        videoHash = nil, 
        videoTitle = nil
    }, 
    {
        id = 11187570100, 
        altText = nil, 
        approved = true, 
        imageId = 11187570100, 
        isModerated = false, 
        videoHash = nil, 
        videoTitle = nil
    }, 
    {
        id = 11260544390, 
        altText = nil, 
        approved = true, 
        imageId = 11260544390, 
        isModerated = false, 
        videoHash = nil, 
        videoTitle = nil
    }
};
local v37 = l_keys_0(v36);
local v38 = {
    {
        id = 1, 
        altText = nil, 
        approved = true, 
        imageId = 1, 
        isModerated = false, 
        videoHash = "wBYjsROAy5w", 
        videoTitle = "RDC 2022 Intro"
    }, 
    {
        id = 2, 
        altText = nil, 
        approved = false, 
        imageId = 2, 
        isModerated = false, 
        videoHash = "_EPelwsaF9E", 
        videoTitle = "Roblox 2021 Cinematic"
    }
};
local v39 = l_keys_0(v38);
local v40 = {
    {
        id = 11457774193, 
        altText = nil, 
        approved = true, 
        imageId = 11457774193, 
        isModerated = true, 
        videoHash = nil, 
        videoTitle = nil
    }, 
    {
        id = 11114178824, 
        altText = nil, 
        approved = true, 
        imageId = 11114178824, 
        isModerated = false, 
        videoHash = nil, 
        videoTitle = nil
    }, 
    {
        id = 11260544390, 
        altText = nil, 
        approved = false, 
        imageId = 11260544390, 
        isModerated = true, 
        videoHash = nil, 
        videoTitle = nil
    }, 
    {
        id = 11647696560, 
        altText = nil, 
        approved = false, 
        imageId = 11647696560, 
        isModerated = false, 
        videoHash = nil, 
        videoTitle = nil
    }
};
local v41 = l_keys_0(v40);
local v42 = l_LayoutOrderIterator_0.new();
return {
    stories = {
        {
            name = "Empty MultiImagePicker", 
            story = v1.createElement(v9, {
                AddThumbnail = v24, 
                AltTextError = {
                    ErrorMessage = "Alt text error"
                }, 
                Enabled = true, 
                ErrorMessage = nil, 
                IsVideoAllowed = true, 
                LayoutOrder = v42:getNextOrder(), 
                Notes = nil, 
                Order = v17, 
                Thumbnails = v16, 
                ThumbnailsChanged = v25, 
                ThumbnailOrderChanged = v26
            })
        }, 
        {
            name = "MultiImagePicker with title hidden", 
            story = v1.createElement(v9, {
                AddThumbnail = v24, 
                AltTextError = {
                    ErrorMessage = "Alt text error"
                }, 
                Enabled = true, 
                ErrorMessage = nil, 
                IsVideoAllowed = true, 
                LayoutOrder = v42:getNextOrder(), 
                Notes = nil, 
                Order = v17, 
                ShowTitle = false, 
                Thumbnails = v16, 
                ThumbnailsChanged = v25, 
                ThumbnailOrderChanged = v26
            })
        }, 
        {
            name = "MultiImagePicker with smaller thumbnails", 
            story = v1.createElement(v9, {
                AddThumbnail = v24, 
                AltTextError = {
                    ErrorMessage = "Alt text error"
                }, 
                Enabled = true, 
                ErrorMessage = nil, 
                IsVideoAllowed = true, 
                LayoutOrder = v42:getNextOrder(), 
                Notes = nil, 
                Order = v17, 
                ThumbnailSize = UDim2.new(0, 185, 0, 104), 
                Thumbnails = v16, 
                ThumbnailsChanged = v25, 
                ThumbnailOrderChanged = v26
            })
        }, 
        {
            name = "Five Thumbnails in MultiImagePicker (Nonupdateable)", 
            story = v1.createElement(v9, {
                AddThumbnail = v24, 
                AltTextError = {
                    ThumbnailId = nil, 
                    ErrorMessage = "Alt text error"
                }, 
                Enabled = true, 
                ErrorMessage = nil, 
                IsVideoAllowed = true, 
                LayoutOrder = v42:getNextOrder(), 
                Notes = nil, 
                Order = v37, 
                Thumbnails = v36, 
                ThumbnailsChanged = v25, 
                ThumbnailOrderChanged = v26
            })
        }, 
        {
            name = "Thumbnails with alt text hidden in MultiImagePicker (Nonupdateable)", 
            story = v1.createElement(v9, {
                AddThumbnail = v24, 
                AltTextError = {
                    ThumbnailId = nil, 
                    ErrorMessage = "Alt text error"
                }, 
                Enabled = true, 
                ErrorMessage = nil, 
                IsVideoAllowed = true, 
                LayoutOrder = v42:getNextOrder(), 
                Notes = nil, 
                Order = v37, 
                ShowAltText = false, 
                Thumbnails = v36, 
                ThumbnailsChanged = v25, 
                ThumbnailOrderChanged = v26
            })
        }, 
        {
            name = "Video thumbnails in MultiImagePicker (Nonupdateable) with IsVideoAllowed = false", 
            story = v1.createElement(v9, {
                AddThumbnail = v24, 
                AltTextError = {
                    ThumbnailId = nil, 
                    ErrorMessage = "Alt text error"
                }, 
                Enabled = true, 
                ErrorMessage = nil, 
                IsVideoAllowed = false, 
                LayoutOrder = v42:getNextOrder(), 
                Notes = nil, 
                Order = v39, 
                Thumbnails = v38, 
                ThumbnailsChanged = v25, 
                ThumbnailOrderChanged = v26
            })
        }, 
        {
            name = "Video thumbnails in MultiImagePicker (Nonupdateable) with IsVideoAllowed = true", 
            story = v1.createElement(v9, {
                AddThumbnail = v24, 
                AltTextError = {
                    ThumbnailId = nil, 
                    ErrorMessage = "Alt text error"
                }, 
                Enabled = true, 
                ErrorMessage = nil, 
                IsVideoAllowed = true, 
                LayoutOrder = v42:getNextOrder(), 
                Notes = nil, 
                Order = v39, 
                Thumbnails = v38, 
                ThumbnailsChanged = v25, 
                ThumbnailOrderChanged = v26
            })
        }, 
        {
            name = "Some moderated thumbnails in MultiImagePicker", 
            story = v1.createElement(v9, {
                AddThumbnail = v24, 
                AltTextError = {
                    ThumbnailId = nil, 
                    ErrorMessage = "Alt text error"
                }, 
                Enabled = true, 
                ErrorMessage = nil, 
                IsVideoAllowed = true, 
                LayoutOrder = v42:getNextOrder(), 
                Notes = nil, 
                Order = v41, 
                Thumbnails = v40, 
                ThumbnailsChanged = v25, 
                ThumbnailOrderChanged = v26
            })
        }
    }
};