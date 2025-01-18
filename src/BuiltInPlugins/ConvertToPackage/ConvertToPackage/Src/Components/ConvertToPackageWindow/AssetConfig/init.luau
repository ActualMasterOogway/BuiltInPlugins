local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Components_0 = l_Parent_0.Src.Components;
local l_ConvertToPackageWindow_0 = l_Components_0.ConvertToPackageWindow;
local v8 = require(l_ConvertToPackageWindow_0.PreviewArea);
local v9 = require(l_ConvertToPackageWindow_0.PublishAsset);
local v10 = require(l_ConvertToPackageWindow_0.AssetConfigFooter);
local v11 = require(l_Components_0.MessageBox.MessageBox);
local v12 = require(l_Parent_0.Src.Actions.SetAssetName);
local l_Util_0 = l_Parent_0.Src.Util;
local v14 = require(l_Util_0.Constants);
local v15 = require(l_Parent_0.Src.Util.getUserId);
local v16 = require(l_Parent_0.Src.Thunks.MakeChangeRequest);
local v17 = require(l_Parent_0.Src.Thunks.UploadConvertToPackageRequest);
local v18 = v2.PureComponent:extend("AssetConfig");
v18.init = function(v19, _) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v15 (copy)
    local v21 = nil;
    v21 = if game.CreatorId == 0 then {
        creatorId = v15()
    } else {
        creatorId = game.CreatorId
    };
    v19.state = {
        assetId = nil, 
        name = nil, 
        description = nil, 
        owner = v21, 
        genres = {
            "All"
        }, 
        allowCopy = false, 
        copyOn = false, 
        allowComment = true, 
        commentOn = nil, 
        status = nil, 
        isShowChangeDiscardMessageBox = false, 
        groupId = game.CreatorType == Enum.CreatorType.Group and game.CreatorId or nil
    };
    v19.tryPublish = function() --[[ Line: 66 ]]
        -- upvalues: v19 (copy)
        local l_props_0 = v19.props;
        local l_state_0 = v19.state;
        local v24 = (l_state_0.genres or {})[1];
        local v25 = Enum.Genre[v24].Value + 1;
        l_props_0.sendConvertToPackageItem(0, l_state_0.name or l_props_0.assetName, l_state_0.description, v25, l_state_0.copyOn, l_state_0.commentOn, l_state_0.groupId, l_props_0.instances, l_props_0.clonedInstances);
    end;
    v19.tryCancel = function(v26) --[[ Line: 84 ]]
        -- upvalues: v19 (copy)
        local v27 = v19.props.changeTable or {};
        if next(v27) ~= nil then
            local function v28() --[[ Line: 89 ]] --[[ Name: showDiscardMessageBox ]]
                -- upvalues: v19 (ref)
                v19:setState({
                    isShowChangeDiscardMessageBox = true
                });
            end;
            if v26 then
                v19:setState({
                    isShowChangeDiscardMessageBox = true
                });
                return;
            else
                spawn(v28);
                return;
            end;
        else
            v19.props.onClose();
            return;
        end;
    end;
    v19.tryCancelNoYield = function() --[[ Line: 105 ]]
        -- upvalues: v19 (copy)
        v19.tryCancel(false);
    end;
    v19.tryCancelWithYield = function() --[[ Line: 109 ]]
        -- upvalues: v19 (copy)
        v19.tryCancel(true);
    end;
    v19.onMessageBoxClosed = function() --[[ Line: 113 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            isShowChangeDiscardMessageBox = false
        });
    end;
    v19.closeAssetConfig = function() --[[ Line: 119 ]]
        -- upvalues: v19 (copy)
        v19.props.pluginGui.Enabled = false;
    end;
    local function _(v29, v30) --[[ Line: 126 ]] --[[ Name: getCurrent ]]
        -- upvalues: v19 (copy)
        return v19.props.assetConfigData and v19.props.assetConfigData[v29] or v30;
    end;
    v19.onNameChange = function(v32) --[[ Line: 130 ]]
        -- upvalues: v19 (copy)
        v19.props.makeChangeRequest("AssetConfigName", v19.props.assetConfigData and v19.props.assetConfigData.Name or "", v32);
        v19:setState({
            name = v32
        });
    end;
    v19.onDescChange = function(v33) --[[ Line: 137 ]]
        -- upvalues: v19 (copy)
        v19.props.makeChangeRequest("AssetConfigDesc", v19.props.assetConfigData and v19.props.assetConfigData.Description or "", v33);
        v19:setState({
            description = v33
        });
    end;
    v19.onAccessChange = function(v34) --[[ Line: 144 ]]
        -- upvalues: v19 (copy)
        local v35 = nil;
        if v34.creatorType == "Group" then
            v35 = v34.creatorId;
        end;
        v19:setState({
            owner = {
                creatorId = v34.creatorId
            }, 
            groupId = v35 or ""
        });
    end;
    v19.toggleComment = function(v36) --[[ Line: 156 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            commentOn = v36
        });
        v19.props.makeChangeRequest("AssetConfigComment", v19.props.assetConfigData.EnableComments or false, v36);
    end;
end;
v18.attachXButtonCallback = function(v37) --[[ Line: 169 ]] --[[ Name: attachXButtonCallback ]]
    if v37.props.pluginGui then
        v37.props.pluginGui:BindToClose(v37.tryCancelNoYield);
    end;
end;
v18.detachXButtonCallback = function(v38) --[[ Line: 175 ]] --[[ Name: detachXButtonCallback ]]
    if v38.props.pluginGui then
        v38.props.pluginGui:BindToClose(nil);
    end;
end;
v18.didUpdate = function(v39, _, _) --[[ Line: 181 ]] --[[ Name: didUpdate ]]
    v39:attachXButtonCallback();
end;
v18.didMount = function(v42) --[[ Line: 185 ]] --[[ Name: didMount ]]
    v42:attachXButtonCallback();
end;
v18.willUnmount = function(v43) --[[ Line: 189 ]] --[[ Name: willUnmount ]]
    v43:detachXButtonCallback();
end;
local function _(v44, v45) --[[ Line: 193 ]] --[[ Name: canSave ]]
    -- upvalues: v14 (copy)
    local v46 = false;
    if #v44 <= v14.NAME_CHARACTER_LIMIT then
        v46 = tostring(v44) ~= "";
    end;
    local v47 = #v45 <= v14.DESCRIPTION_CHARACTER_LIMIT;
    return v46 and v47;
end;
local function v52(v49, v50, v51) --[[ Line: 200 ]] --[[ Name: getMessageBoxProps ]]
    -- upvalues: v14 (copy)
    return {
        Name = "AssetConfigMessageBox", 
        TextSize = v14.FONT_SIZE_MEDIUM, 
        Font = v14.FONT, 
        onClose = v50, 
        Title = v49:getText("Action", "Discard"), 
        Text = v49:getText("General", "DiscardMessage"), 
        buttons = {
            {
                Text = v49:getText("Action", "Cancel"), 
                Font = v14.FONT, 
                TextSize = v14.FONT_SIZE_MEDIUM, 
                action = "no", 
                OnClick = v50
            }, 
            {
                Text = v49:getText("Action", "Discard"), 
                Font = v14.FONT, 
                TextSize = v14.FONT_SIZE_MEDIUM, 
                OnClick = v51
            }
        }
    };
end;
v18.render = function(v53) --[[ Line: 230 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v11 (copy), v52 (copy), v8 (copy), v9 (copy), v10 (copy), v14 (copy)
    local l_props_1 = v53.props;
    local l_Localization_0 = l_props_1.Localization;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_state_1 = v53.state;
    local l_Size_0 = l_props_1.Size;
    local l_assetId_0 = l_props_1.assetId;
    local v60 = l_state_1.name or l_props_1.assetName or "";
    local v61 = l_state_1.description or "";
    local l_owner_0 = l_state_1.owner;
    local l_allowComment_0 = l_state_1.allowComment;
    local l_commentOn_0 = l_state_1.commentOn;
    local l_isShowChangeDiscardMessageBox_0 = l_state_1.isShowChangeDiscardMessageBox;
    local l_createElement_0 = v2.createElement;
    local v67 = "Frame";
    local v68 = {
        Size = l_Size_0, 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_Stylizer_0.assetConfig.backgroundColor, 
        BorderSizePixel = 0
    };
    local v69 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        AssetConfigMessageBox = l_isShowChangeDiscardMessageBox_0 and v2.createElement(v11, (v52(l_Localization_0, v53.onMessageBoxClosed, v53.closeAssetConfig))), 
        MainPage = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -65), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 0)
            }), 
            Preview = v2.createElement(v8, {
                TotalWidth = 240, 
                LayoutOrder = 1
            }), 
            VerticalLine = v2.createElement("Frame", {
                Size = UDim2.new(0, 2, 1, 0), 
                BackgroundTransparency = 0, 
                BackgroundColor3 = l_Stylizer_0.divider.verticalLineColor, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }), 
            PublishAsset = v2.createElement(v9, {
                Size = UDim2.new(1, -240, 1, 0), 
                assetId = l_assetId_0, 
                name = v60, 
                description = v61, 
                owner = l_owner_0, 
                allowComment = l_allowComment_0, 
                commentOn = l_commentOn_0, 
                onNameChange = v53.onNameChange, 
                onDescChange = v53.onDescChange, 
                onOwnerSelected = v53.onAccessChange, 
                toggleComment = v53.toggleComment, 
                LayoutOrder = 3
            })
        })
    };
    local l_createElement_1 = v2.createElement;
    local l_v10_0 = v10;
    local v72 = {
        Size = UDim2.new(1, 0, 0, 65)
    };
    local v73 = false;
    if #v60 <= v14.NAME_CHARACTER_LIMIT then
        v73 = tostring(v60) ~= "";
    end;
    local v74 = #v61 <= v14.DESCRIPTION_CHARACTER_LIMIT;
    v72.CanSave = v73 and v74;
    v72.tryCancel = v53.tryCancelWithYield;
    v72.tryPublish = v53.tryPublish;
    v72.LayoutOrder = 2;
    v69.Footer = l_createElement_1(l_v10_0, v72);
    return l_createElement_0(v67, v68, v69);
end;
v18 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v18);
return v3.connect(function(v75, _) --[[ Line: 327 ]] --[[ Name: mapStateToProps ]]
    v75 = v75 or {};
    local v77 = v75.AssetConfigReducer.assetConfigData or {};
    local l_changed_0 = v75.AssetConfigReducer.changed;
    return {
        assetConfigData = v77, 
        currentScreen = v75.AssetConfigReducer.currentScreen, 
        changeTable = l_changed_0, 
        networkError = v75.NetworkReducer.networkError, 
        networkErrorAction = v75.NetworkReducer.networkErrorAction, 
        instances = v75.AssetConfigReducer.instances, 
        clonedInstances = v75.AssetConfigReducer.clonedInstances
    };
end, function(v79) --[[ Line: 344 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v16 (copy), v12 (copy), v17 (copy)
    return {
        makeChangeRequest = function(v80, v81, v82) --[[ Line: 346 ]] --[[ Name: makeChangeRequest ]]
            -- upvalues: v79 (copy), v16 (ref)
            v79(v16(v80, v81, v82));
        end, 
        sendConvertToPackageItem = function(v83, v84, v85, v86, v87, v88, v89, v90, v91) --[[ Line: 349 ]] --[[ Name: sendConvertToPackageItem ]]
            -- upvalues: v79 (copy), v12 (ref), v17 (ref)
            v79(v12(v84));
            v79(v17(v83, v84, v85, v86, v87, v88, v89, v90, v91));
        end
    };
end)(v18);