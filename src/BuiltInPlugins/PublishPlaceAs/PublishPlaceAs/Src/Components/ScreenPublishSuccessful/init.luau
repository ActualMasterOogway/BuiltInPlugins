local l_Parent_0 = script.Parent.Parent.Parent;
local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Button_0 = v2.UI.Button;
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v9 = v3.PureComponent:extend("ScreenPublishSuccessful");
v9.init = function(v10) --[[ Line: 26 ]] --[[ Name: init ]]
    v10.state = {};
    v10.isMounted = false;
    local l_Id_0 = v10.props.Id;
    if l_Id_0 == 0 then
        l_Id_0 = game.GameId;
    end;
    v10.thumbnailUrl = string.format("rbxthumb://type=GameIcon&id=%i&w=%i&h=%i", l_Id_0, 150, 150);
end;
v9.didMount = function(v12) --[[ Line: 39 ]] --[[ Name: didMount ]]
    -- upvalues: l_ContentProvider_0 (copy)
    v12.isMounted = true;
    spawn(function() --[[ Line: 41 ]]
        -- upvalues: v12 (copy), l_ContentProvider_0 (ref)
        local v13 = {
            v12.thumbnailUrl
        };
        l_ContentProvider_0:PreloadAsync(v13, function(_, v15) --[[ Line: 43 ]] --[[ Name: setStatus ]]
            -- upvalues: v12 (ref)
            if v12.isMounted then
                v12:setState({
                    assetFetchStatus = v15
                });
            end;
        end);
    end);
end;
v9.willUnmount = function(v16) --[[ Line: 54 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_StudioPublishService_0 (copy)
    v16.isMounted = false;
    l_StudioPublishService_0:CloseAfterPublish(v16.props.CloseMode);
end;
v9.render = function(v17) --[[ Line: 59 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_Button_0 (copy)
    local l_props_0 = v17.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_OnClose_0 = l_props_0.OnClose;
    local l_Name_0 = l_props_0.Name;
    local v23 = l_Localization_0:getText("PublishSuccess", "FindInGame", {
        l_props_0.ParentGameName
    });
    local v24 = l_Localization_0:getText("PublishSuccess", "Success");
    if l_props_0.IsPublish == false then
        v24 = l_Localization_0:getText("PublishSuccess", "SaveSuccess");
    end;
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Stylizer_0.backgroundColor, 
        BorderSizePixel = 0
    }, {
        Icon = v3.createElement("ImageLabel", {
            Position = UDim2.new(0.5, 0, 0.2, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(0, 150, 0, 150), 
            Image = v17.state.assetFetchStatus == Enum.AssetFetchStatus.Success and v17.thumbnailUrl or l_Stylizer_0.icons.thumbnailPlaceHolder, 
            BorderSizePixel = 0
        }), 
        Name = v3.createElement("TextLabel", {
            Text = l_Name_0, 
            Position = UDim2.new(0.5, 0, 0.35, 0), 
            TextSize = 20, 
            BackgroundTransparency = 1, 
            TextColor3 = l_Stylizer_0.header.text, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            Font = l_Stylizer_0.header.font
        }), 
        Success = v3.createElement("TextLabel", {
            Text = v24, 
            Position = UDim2.new(0.5, 0, 0.4, 0), 
            TextSize = 24, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextColor3 = l_Stylizer_0.successText.text, 
            Font = l_Stylizer_0.successText.font
        }), 
        ParentGame = v3.createElement("TextLabel", {
            Text = v23, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            TextSize = 18, 
            BackgroundTransparency = 1, 
            TextColor3 = l_Stylizer_0.header.text, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            Font = l_Stylizer_0.header.font
        }), 
        CloseButton = v3.createElement(l_Button_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            OnClick = l_OnClose_0, 
            Position = UDim2.new(0.5, 0, 0.9, 0), 
            Size = UDim2.new(0, 150, 0, 30), 
            Style = "Round", 
            Text = l_Localization_0:getText("Button", "Close")
        })
    });
end;
v9 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v9);
return v4.connect(function(v25, _) --[[ Line: 138 ]] --[[ Name: mapStateToProps ]]
    local l_publishInfo_0 = v25.PublishedPlace.publishInfo;
    return {
        Id = l_publishInfo_0.id, 
        Name = l_publishInfo_0.name, 
        ParentGameName = l_publishInfo_0.parentGameName
    };
end)(v9);