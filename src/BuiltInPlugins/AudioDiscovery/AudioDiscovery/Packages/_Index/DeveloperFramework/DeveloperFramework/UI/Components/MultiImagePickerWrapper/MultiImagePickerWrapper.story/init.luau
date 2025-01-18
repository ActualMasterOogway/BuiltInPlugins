local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.MultiImagePickerWrapper);
local function _(v3, v4, v5, v6, v7, v8) --[[ Line: 8 ]]
    return {
        id = v3, 
        altText = if v4 ~= nil then v4 else nil, 
        approved = v5 == nil or v5, 
        imageId = if v6 ~= nil then v6 else v3, 
        videoHash = if v7 ~= nil then v7 else nil, 
        videoTitle = if v8 ~= nil then v8 else nil
    };
end;
local function v10() --[[ Line: 26 ]]
    return {
        {
            id = 11457774193, 
            altText = nil, 
            approved = true, 
            imageId = 11457774193, 
            videoHash = nil, 
            videoTitle = nil
        }, 
        {
            id = 10979850405, 
            altText = nil, 
            approved = true, 
            imageId = 10979850405, 
            videoHash = nil, 
            videoTitle = nil
        }, 
        {
            id = 11114178824, 
            altText = nil, 
            approved = true, 
            imageId = 11114178824, 
            videoHash = nil, 
            videoTitle = nil
        }, 
        {
            id = 11588223734, 
            altText = nil, 
            approved = true, 
            imageId = 11588223734, 
            videoHash = nil, 
            videoTitle = nil
        }, 
        {
            id = 1, 
            altText = nil, 
            approved = true, 
            imageId = 1, 
            videoHash = "wBYjsROAy5w", 
            videoTitle = "RDC 2022 Intro"
        }
    };
end;
local v11 = v1.PureComponent:extend("ComponentDataProvider");
v11.init = function(v12) --[[ Line: 38 ]] --[[ Name: init ]]
    v12.state = {
        thumbnailUpdateInfo = {}
    };
    v12.thumbnailUpdateInfo = function(v13) --[[ Line: 43 ]]
        -- upvalues: v12 (copy)
        v12:setState({
            thumbnailUpdateInfo = v13
        });
        print("New thumbnail update info:", v13);
    end;
end;
v11.render = function(v14) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy), v10 (copy)
    return v1.createElement(v2, {
        Thumbnails = v10(), 
        SetThumbnailUpdateInfo = v14.thumbnailUpdateInfo
    });
end;
return {
    stories = {
        {
            name = "Five thumbnails in MultiImagePickerWrapper (Updateable)", 
            story = v11
        }
    }
};