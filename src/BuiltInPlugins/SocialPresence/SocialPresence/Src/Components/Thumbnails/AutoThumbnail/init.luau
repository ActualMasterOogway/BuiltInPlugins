local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialPresence");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_ContentProvider_0 = game:GetService("ContentProvider");
local function _(v3, v4) --[[ Line: 15 ]] --[[ Name: getRbxthumbUrl ]]
    return "rbxthumb://type=AvatarHeadShot" .. "&id=" .. v3 .. "&w=" .. v4.X .. "&h=" .. v4.Y;
end;
local v6 = v1.Component:extend(script.Name);
v6.init = function(v7) --[[ Line: 21 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_ContentProvider_0 (copy)
    v7.state = {
        fetchStatus = nil, 
        contentId = nil
    };
    v7.fetchingContentId = nil;
    v7.currentId = nil;
    v7.updateThumbnail = function() --[[ Line: 30 ]]
        -- upvalues: v7 (copy), v1 (ref)
        local l_Id_0 = v7.props.Id;
        local v9 = Vector2.new(60, 60);
        local v10 = "rbxthumb://type=AvatarHeadShot" .. "&id=" .. l_Id_0 .. "&w=" .. v9.X .. "&h=" .. v9.Y;
        if l_Id_0 ~= v7.currentId then
            v7.currentId = l_Id_0;
            v7:setState({
                fetchStatus = v1.None, 
                contentId = v10
            });
        end;
        if v10 ~= v7.state.contentId then
            v7.loadThumbnail(v10);
        end;
    end;
    v7.loadThumbnail = function(v11) --[[ Line: 50 ]]
        -- upvalues: v7 (copy), l_ContentProvider_0 (ref)
        if v11 == v7.fetchingContentId then
            return;
        else
            v7.fetchingContentId = v11;
            coroutine.wrap(function() --[[ Line: 57 ]]
                -- upvalues: l_ContentProvider_0 (ref), v11 (copy), v7 (ref)
                l_ContentProvider_0:PreloadAsync({
                    v11
                }, function(v12, v13) --[[ Line: 58 ]]
                    -- upvalues: v7 (ref)
                    if v7.fetchingContentId == v12 then
                        v7.fetchingContentId = nil;
                        v7:setState({
                            fetchStatus = v13, 
                            contentId = v12
                        });
                    end;
                end);
            end)();
            return;
        end;
    end;
end;
v6.didUpdate = function(v14, v15, _) --[[ Line: 71 ]] --[[ Name: didUpdate ]]
    local l_props_0 = v14.props;
    if v15.Id ~= l_props_0.Id then
        v14.updateThumbnail();
    end;
end;
v6.didMount = function(v18) --[[ Line: 78 ]] --[[ Name: didMount ]]
    v18.updateThumbnail();
end;
v6.render = function(v19) --[[ Line: 82 ]] --[[ Name: render ]]
    local l_props_1 = v19.props;
    local l_state_0 = v19.state;
    return l_props_1.RenderContents(l_state_0.contentId, l_state_0.fetchStatus);
end;
return v6;