local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = v3.RobloxAPI.new();
local v7 = require(l_Parent_0.Src.Actions.SetPublishInfo);
local v8 = require(l_Parent_0.Src.Actions.SetScreen);
local v9 = require(l_Parent_0.Src.Actions.SetIsPublishing);
local v10 = require(l_Parent_0.Src.Resources.Constants);
local l_StyleModifier_0 = v3.Util.StyleModifier;
local l_Button_0 = v3.UI.Button;
local v13 = require(l_Parent_0.Src.Network.Requests.SettingsImpl);
local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v16 = v1.PureComponent:extend("ScreenPublishFail");
v16.init = function(v17) --[[ Line: 40 ]] --[[ Name: init ]]
    v17.state = {};
    v17.finishedConnection = nil;
    v17.isMounted = false;
    v17.thumbnailUrl = string.format("rbxthumb://type=Asset&id=%i&w=%i&h=%i", v17.props.Id, 150, 150);
end;
v16.didMount = function(v18) --[[ Line: 50 ]] --[[ Name: didMount ]]
    -- upvalues: l_ContentProvider_0 (copy), l_StudioPublishService_0 (copy)
    v18.isMounted = true;
    spawn(function() --[[ Line: 52 ]]
        -- upvalues: v18 (copy), l_ContentProvider_0 (ref)
        local v19 = {
            v18.thumbnailUrl
        };
        l_ContentProvider_0:PreloadAsync(v19, function(_, v21) --[[ Line: 54 ]] --[[ Name: setStatus ]]
            -- upvalues: v18 (ref)
            if v18.isMounted then
                v18:setState({
                    assetFetchStatus = v21
                });
            end;
        end);
    end);
    v18.finishedConnection = l_StudioPublishService_0.GamePublishFinished:connect(function(v22) --[[ Line: 64 ]]
        -- upvalues: v18 (copy)
        if v22 then
            v18.props.OpenPublishSuccessfulPage(v18.props.Id, v18.props.Name, v18.props.ParentGameName);
        end;
    end);
end;
v16.willUnmount = function(v23) --[[ Line: 71 ]] --[[ Name: willUnmount ]]
    v23.isMounted = false;
    if v23.finishedConnection then
        v23.finishedConnection:disconnect();
    end;
end;
v16.render = function(v24) --[[ Line: 78 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v13 (copy), l_StudioPublishService_0 (copy), v1 (copy), l_Button_0 (copy), l_StyleModifier_0 (copy)
    local l_props_0 = v24.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_v6_0 = v6;
    local l_Id_0 = l_props_0.Id;
    local l_Name_0 = l_props_0.Name;
    local l_ParentGameId_0 = l_props_0.ParentGameId;
    local l_Settings_0 = l_props_0.Settings;
    local l_IsPublishing_0 = l_props_0.IsPublishing;
    local l_dispatchSetIsPublishing_0 = l_props_0.dispatchSetIsPublishing;
    local v35 = nil;
    v35 = if l_IsPublishing_0 then l_Localization_0:getText("PublishFail", "Fail") else l_Localization_0:getText("PublishFail", "SaveFail");
    local v36 = l_props_0.Message ~= nil;
    local function v37() --[[ Line: 101 ]] --[[ Name: onClick ]]
        -- upvalues: l_IsPublishing_0 (copy), l_ParentGameId_0 (copy), v13 (ref), l_Settings_0 (copy), l_Localization_0 (copy), l_v6_0 (copy), l_props_0 (copy), l_StudioPublishService_0 (ref), l_Id_0 (copy), l_dispatchSetIsPublishing_0 (copy)
        if not l_IsPublishing_0 then
            if l_ParentGameId_0 == 0 then
                v13.saveAll(l_Settings_0, l_Localization_0, l_v6_0, nil, l_props_0.IsPublish, l_props_0.OwnedGroups);
            else
                l_StudioPublishService_0:publishAs(l_ParentGameId_0, l_Id_0, 0, l_props_0.IsPublish, nil);
            end;
        end;
        l_dispatchSetIsPublishing_0(true);
    end;
    local v38 = {
        Icon = v1.createElement("ImageLabel", {
            Position = UDim2.new(0.5, 0, 0.2, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(0, 150, 0, 150), 
            Image = v24.state.assetFetchStatus == Enum.AssetFetchStatus.Success and v24.thumbnailUrl or l_Stylizer_0.icons.thumbnailPlaceHolder, 
            BorderSizePixel = 0
        }), 
        Name = v1.createElement("TextLabel", {
            Text = l_Name_0, 
            Position = UDim2.new(0.5, 0, 0.35, 0), 
            TextSize = 20, 
            BackgroundTransparency = 1, 
            TextColor3 = l_Stylizer_0.header.text, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            Font = l_Stylizer_0.header.font
        }), 
        Fail = v1.createElement("TextLabel", {
            Text = v35, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            TextSize = 24, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextColor3 = l_Stylizer_0.failText.text, 
            Font = l_Stylizer_0.failText.font
        }), 
        Retry = v1.createElement(l_Button_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            OnClick = v37, 
            Position = UDim2.new(0.5, 0, 0.8, 0), 
            Size = UDim2.new(0, 150, 0, 40), 
            Style = "Round", 
            StyleModifier = if l_IsPublishing_0 then l_StyleModifier_0.Disabled else nil, 
            Text = l_Localization_0:getText("Button", "Retry")
        }), 
        Message = v1.createElement("TextLabel", {
            Text = if v36 then l_props_0.Message else "", 
            TextSize = 24, 
            Position = UDim2.new(0.5, 0, 0.5, 32), 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextColor3 = l_Stylizer_0.failText.text, 
            Font = l_Stylizer_0.failText.font
        })
    };
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Stylizer_0.backgroundColor, 
        BorderSizePixel = 0
    }, v38);
end;
v16 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    API = l_ContextServices_0.API
})(v16);
return v2.connect(function(v39, _) --[[ Line: 176 ]] --[[ Name: mapStateToProps ]]
    local l_publishInfo_0 = v39.PublishedPlace.publishInfo;
    local l_ownedGroups_0 = v39.GroupsHavePermission.groupInfo.ownedGroups;
    return {
        Id = l_publishInfo_0.id, 
        Name = l_publishInfo_0.name, 
        ParentGameName = l_publishInfo_0.parentGameName, 
        ParentGameId = l_publishInfo_0.parentGameId, 
        Settings = l_publishInfo_0.settings, 
        IsPublishing = v39.PublishedPlace.isPublishing, 
        Message = l_publishInfo_0.message, 
        OwnedGroups = l_ownedGroups_0
    };
end, function(v43) --[[ Line: 191 ]] --[[ Name: useDispatchForProps ]]
    -- upvalues: v7 (copy), v8 (copy), v10 (copy), v9 (copy)
    return {
        OpenPublishSuccessfulPage = function(v44, v45, v46) --[[ Line: 193 ]] --[[ Name: OpenPublishSuccessfulPage ]]
            -- upvalues: v43 (copy), v7 (ref), v8 (ref), v10 (ref)
            v43(v7({
                id = v44, 
                name = v45, 
                parentGameName = v46
            }));
            v43(v8(v10.SCREENS.PUBLISH_SUCCESSFUL));
        end, 
        dispatchSetIsPublishing = function(v47) --[[ Line: 198 ]] --[[ Name: dispatchSetIsPublishing ]]
            -- upvalues: v43 (copy), v9 (ref)
            v43(v9(v47));
        end
    };
end)(v16);