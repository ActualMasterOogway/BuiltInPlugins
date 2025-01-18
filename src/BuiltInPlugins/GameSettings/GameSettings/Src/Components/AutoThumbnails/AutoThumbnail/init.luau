local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v3 = {
    GroupIcon = {
        Vector2.new(150, 150), 
        Vector2.new(420, 420)
    }, 
    AvatarHeadShot = {
        Vector2.new(48, 48), 
        Vector2.new(60, 60), 
        Vector2.new(150, 150)
    }, 
    Avatar = {
        Vector2.new(100, 100), 
        Vector2.new(352, 352), 
        Vector2.new(720, 720)
    }, 
    GameIcon = {
        Vector2.new(50, 50), 
        Vector2.new(128, 128), 
        Vector2.new(150, 150), 
        Vector2.new(256, 256), 
        Vector2.new(512, 512)
    }, 
    BadgeIcon = {
        Vector2.new(150, 150)
    }, 
    GamePass = {
        Vector2.new(150, 150)
    }, 
    Asset = {
        Vector2.new(150, 150), 
        Vector2.new(420, 420)
    }, 
    BundleThumbnail = {
        Vector2.new(150, 150), 
        Vector2.new(420, 420)
    }, 
    Outfit = {
        Vector2.new(150, 150), 
        Vector2.new(420, 420)
    }
};
local function v10(v4, v5) --[[ Line: 59 ]] --[[ Name: getRbxthumbSize ]]
    -- upvalues: v3 (copy)
    local v6 = v3[v4];
    local v7 = v6[1];
    for v8 = 2, #v6 do
        local v9 = v6[v8];
        if math.abs(v5.Magnitude - v7.Magnitude) > math.abs(v5.Magnitude - v9.Magnitude) then
            v7 = v9;
        end;
    end;
    return v7;
end;
local function _(v11, v12, v13) --[[ Line: 75 ]] --[[ Name: getRbxthumbUrl ]]
    return "rbxthumb://type=" .. v11 .. "&id=" .. v12 .. "&w=" .. v13.X .. "&h=" .. v13.Y;
end;
local function _(v15, v16) --[[ Line: 79 ]] --[[ Name: getAssetThumbnailUrl ]]
    return "https://www.roblox.com/asset-thumbnail/image?width=" .. v16.X .. "&height=" .. v16.Y .. "&format=png&assetId=" .. v15;
end;
local v18 = v1.Component:extend(script.Name);
v18.init = function(v19) --[[ Line: 90 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v10 (copy), l_ContentProvider_0 (copy)
    v19.state = {
        fetchStatus = nil, 
        contentId = nil
    };
    v19.ref = v1.createRef();
    v19.fetchingContentId = nil;
    v19.currentId = nil;
    v19.currentThumbnailType = nil;
    v19.updateThumbnail = function() --[[ Line: 101 ]]
        -- upvalues: v19 (copy), v10 (ref), v1 (ref)
        local l_props_0 = v19.props;
        local l_ThumbnailType_0 = l_props_0.ThumbnailType;
        local l_Id_0 = l_props_0.Id;
        local l_UseAssetThumbnailUrl_0 = l_props_0.UseAssetThumbnailUrl;
        local l_ref_0 = v19.ref;
        if not l_ref_0:getValue() then
            return;
        else
            local l_AbsoluteSize_0 = l_ref_0:getValue().AbsoluteSize;
            local v26 = v10(l_ThumbnailType_0, l_AbsoluteSize_0);
            local v27 = nil;
            v27 = if l_UseAssetThumbnailUrl_0 then "https://www.roblox.com/asset-thumbnail/image?width=" .. v26.X .. "&height=" .. v26.Y .. "&format=png&assetId=" .. l_Id_0 else "rbxthumb://type=" .. l_ThumbnailType_0 .. "&id=" .. l_Id_0 .. "&w=" .. v26.X .. "&h=" .. v26.Y;
            if l_Id_0 ~= v19.currentId or l_ThumbnailType_0 ~= v19.currentThumbnailType then
                v19.currentId = l_Id_0;
                v19.currentThumbnailType = l_ThumbnailType_0;
                v19:setState({
                    fetchStatus = v1.None, 
                    contentId = v27
                });
            end;
            if v27 ~= v19.state.contentId then
                v19.loadThumbnail(v27);
            end;
            return;
        end;
    end;
    v19.loadThumbnail = function(v28) --[[ Line: 137 ]]
        -- upvalues: v19 (copy), l_ContentProvider_0 (ref)
        if v28 == v19.fetchingContentId then
            return;
        else
            v19.fetchingContentId = v28;
            coroutine.wrap(function() --[[ Line: 144 ]]
                -- upvalues: l_ContentProvider_0 (ref), v28 (copy), v19 (ref)
                l_ContentProvider_0:PreloadAsync({
                    v28
                }, function(v29, v30) --[[ Line: 145 ]]
                    -- upvalues: v19 (ref)
                    local v31 = v19.ref:getValue() ~= nil;
                    if v19.fetchingContentId == v29 and v31 then
                        v19.fetchingContentId = nil;
                        v19:setState({
                            fetchStatus = v30, 
                            contentId = v29
                        });
                    end;
                end);
            end)();
            return;
        end;
    end;
end;
v18.didUpdate = function(v32, v33, _) --[[ Line: 159 ]] --[[ Name: didUpdate ]]
    local l_props_1 = v32.props;
    local l_Id_1 = v33.Id;
    local l_Id_2 = l_props_1.Id;
    local l_ThumbnailType_1 = v33.ThumbnailType;
    local l_ThumbnailType_2 = l_props_1.ThumbnailType;
    if l_Id_1 ~= l_Id_2 or l_ThumbnailType_1 ~= l_ThumbnailType_2 then
        v32.updateThumbnail();
    end;
end;
v18.didMount = function(v40) --[[ Line: 171 ]] --[[ Name: didMount ]]
    v40.updateThumbnail();
end;
v18.render = function(v41) --[[ Line: 175 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_2 = v41.props;
    local l_state_0 = v41.state;
    local l_RenderContents_0 = l_props_2.RenderContents;
    local l_contentId_0 = l_state_0.contentId;
    local l_fetchStatus_0 = l_state_0.fetchStatus;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        [v1.Ref] = v41.ref, 
        [v1.Change.AbsoluteSize] = v41.updateThumbnail
    }, {
        Thumbnail = l_RenderContents_0(l_contentId_0, l_fetchStatus_0)
    });
end;
return v18;