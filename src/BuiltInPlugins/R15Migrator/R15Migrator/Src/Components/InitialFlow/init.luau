local l_GuiService_0 = game:GetService("GuiService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_AssetManagerService_0 = game:GetService("AssetManagerService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v5 = require(l_script_FirstAncestor_0.Packages.Framework);
local v6 = require(l_script_FirstAncestor_0.Packages.Roact);
local v7 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v8 = require(l_script_FirstAncestor_0.Src.Util.UILayoutHelpers);
local l_ContextServices_0 = v5.ContextServices;
local l_UI_0 = v5.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextWithLinks_0 = l_UI_0.TextWithLinks;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_LayoutOrderIterator_0 = v5.Util.LayoutOrderIterator;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v19 = require(l_Util_0.saveCopyOfExperience);
local v20 = require(l_Util_0.PluginSettings);
local v21 = require(l_Util_0.getExperienceData);
local v22 = require(l_Util_0.getLocalDateTime);
local l_R15MigShowLinkedText_0 = game:GetFastFlag("R15MigShowLinkedText");
local v24 = v6.PureComponent:extend("InitialFlow");
v24.getR15ConvertedExperienceData = function(v25, v26, v27) --[[ Line: 37 ]] --[[ Name: getR15ConvertedExperienceData ]]
    -- upvalues: v20 (copy), v21 (copy)
    local l_props_0 = v25.props;
    local v29 = l_props_0.Plugin:get();
    if not v25.isExperiencePublished and not v26 then
        v27();
        return;
    else
        if not v26 then
            v26 = v20.CorrespondingR15Experience:getSetting(v29, game.GameId);
        end;
        if not v26 then
            v27();
            return;
        else
            v21(v26, l_props_0.API:get(), function(v30) --[[ Line: 54 ]]
                -- upvalues: v27 (copy)
                v27(v30);
            end);
            return;
        end;
    end;
end;
v24.getGameName = function(v31, v32) --[[ Line: 59 ]] --[[ Name: getGameName ]]
    local v33 = false;
    if v31.isExperiencePublished ~= nil then
        v33 = v31.gameName;
    end;
    assert(v33);
    if v31.isExperiencePublished then
        return v31.gameName;
    else
        if v32 == nil then
            v32 = true;
        end;
        if v32 then
            return (string.gsub(v31.gameName, "%.rbxl$", ""));
        else
            return v31.gameName;
        end;
    end;
end;
v24.init = function(v34, _) --[[ Line: 68 ]] --[[ Name: init ]]
    -- upvalues: l_MarketplaceService_0 (copy), v22 (copy), v6 (copy), v19 (copy), v20 (copy), l_AssetManagerService_0 (copy)
    v34.state = {
        isGettingInitialData = true, 
        isConverting = false, 
        paneSize = Vector2.new()
    };
    v34.hasCreatedCopy = false;
    local v36 = false;
    if game.GameId ~= 0 then
        v36 = game.PlaceId ~= 0;
    end;
    v34.isExperiencePublished = v36;
    if v34.isExperiencePublished then
        v36 = l_MarketplaceService_0:GetProductInfo(game.PlaceId);
        v34.gameName = v36.Name;
        local v37 = v22((DateTime.fromIsoDate(v36.Created)));
        v34.gameCreatedDate = ("%*/%*/%*"):format(v37.month, v37.day, v37.year);
    else
        v34.gameName = game.Name;
    end;
    v34:getR15ConvertedExperienceData(nil, function(v38) --[[ Line: 87 ]]
        -- upvalues: v34 (copy), v6 (ref)
        v34:setState({
            isGettingInitialData = false, 
            convertedExperience = v38 or v6.None
        });
    end);
    v34.createNewExperience = function() --[[ Line: 94 ]]
        -- upvalues: v34 (copy), v19 (ref), v20 (ref), v6 (ref)
        local l_props_1 = v34.props;
        local l_Localization_0 = l_props_1.Localization;
        local v41 = l_props_1.API:get();
        local v42 = l_props_1.Plugin:get();
        v34:setState({
            isConverting = true
        });
        local function v49(v43) --[[ Line: 104 ]] --[[ Name: continueWithSave ]]
            -- upvalues: v34 (ref), l_Localization_0 (copy), v19 (ref), v41 (copy), v20 (ref), v42 (copy), v6 (ref)
            local l_convertedExperience_0 = v34.state.convertedExperience;
            local v45 = l_Localization_0:getText("InitialFlow", v34:isPublishedR15PlayerChoiceExperience() and "CopyR15" or "CopyR6Local", {
                experienceName = v34:getGameName()
            });
            if l_convertedExperience_0 and string.match(l_convertedExperience_0.name, "^" .. v45) then
                local v46 = tonumber(string.match(l_convertedExperience_0.name, "%[(%d+)%]$"));
                v45 = v45 .. "_[" .. (if v46 then tostring(v46 + 1) else "2") .. "]";
            end;
            v43.teamCreateEnabled = false;
            v43.name = v45;
            v43.universeAvatarType = "MorphToR15";
            local v47 = v19(l_Localization_0, v41, v43);
            if not v47 or v47 == 0 then
                warn("Failed to create new experience");
                v34:setState({
                    isConverting = false
                });
                return;
            else
                if v34.isExperiencePublished then
                    v20.CorrespondingR15Experience:setSetting(v42, game.GameId, v47);
                end;
                v20.IsR15ConvertedExperience:setSetting(v42, v47, true);
                v34:getR15ConvertedExperienceData(v47, function(v48) --[[ Line: 143 ]]
                    -- upvalues: v45 (ref), v34 (ref), v6 (ref)
                    if v48 then
                        v48.name = v45;
                    end;
                    v34.hasCreatedCopy = v48 and true or false;
                    v34:setState({
                        isConverting = false, 
                        convertedExperience = v48 or v6.None
                    });
                end);
                return;
            end;
        end;
        task.spawn(function() --[[ Line: 157 ]]
            -- upvalues: v34 (ref), v41 (copy), v49 (copy)
            if v34.isExperiencePublished then
                v41.Develop.V2.Universes.configuration(game.GameId):makeRequest():andThen(function(v50) --[[ Line: 159 ]]
                    -- upvalues: v49 (ref)
                    v49(v50.responseBody);
                end, function(v51) --[[ Line: 161 ]]
                    -- upvalues: v34 (ref)
                    warn("Unable to retrieve details of current experience", v51.responseBody);
                    v34:setState({
                        isConverting = false
                    });
                end);
                return;
            else
                v49({
                    description = "", 
                    genre = "All", 
                    name = v34:getGameName(), 
                    playableDevices = {
                        Computer = true, 
                        Phone = true, 
                        Tablet = true, 
                        VR = true
                    }, 
                    isFriendsOnly = false
                });
                return;
            end;
        end);
    end;
    v34.openExperience = function() --[[ Line: 185 ]]
        -- upvalues: v34 (copy), v20 (ref), l_AssetManagerService_0 (ref)
        local l_convertedExperience_1 = v34.state.convertedExperience;
        assert(l_convertedExperience_1, "Converted experience should be set");
        local v53 = v34.props.Plugin:get();
        v20.InitiallyEnabled:setSetting(v53, l_convertedExperience_1.experienceId, true);
        l_AssetManagerService_0:OpenPlace(l_convertedExperience_1.placeId);
    end;
    v34.ref = v6.createRef();
end;
v24.initRef = function(v54) --[[ Line: 200 ]] --[[ Name: initRef ]]
    local v55 = v54.ref:getValue();
    if not v55 then
        return;
    else
        v54:setState({
            paneSize = v55.AbsoluteSize
        });
        v54.onPaneSizeChanged = v55:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 210 ]]
            -- upvalues: v54 (copy), v55 (copy)
            v54:setState({
                paneSize = v55.AbsoluteSize
            });
        end);
        return;
    end;
end;
v24.didMount = function(v56) --[[ Line: 217 ]] --[[ Name: didMount ]]
    v56:initRef();
end;
v24.willUnmount = function(v57) --[[ Line: 221 ]] --[[ Name: willUnmount ]]
    if v57.onPaneSizeChanged then
        v57.onPaneSizeChanged:Disconnect();
        v57.onPaneSizeChanged = nil;
    end;
end;
v24.didUpdate = function(v58) --[[ Line: 228 ]] --[[ Name: didUpdate ]]
    if v58.ref.current and not v58.onPaneSizeChanged then
        v58:initRef();
    end;
end;
v24.renderConvertingPanel = function(v59) --[[ Line: 234 ]] --[[ Name: renderConvertingPanel ]]
    -- upvalues: v6 (copy), l_TextWithLinks_0 (copy), v8 (copy), l_Pane_0 (copy), l_LoadingIndicator_0 (copy)
    local l_props_2 = v59.props;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_Localization_1 = l_props_2.Localization;
    return {
        v6.createElement(l_TextWithLinks_0, {
            Text = l_Localization_1:getText("InitialFlow", "InProgress", {
                experienceName = v59:getGameName(false)
            }), 
            Size = UDim2.new(1, 0, 0, v8.getTextHeight(l_Localization_1:getText("InitialFlow", "InProgress", {
                experienceName = v59:getGameName(false)
            }), l_Stylizer_0.TextSize, l_Stylizer_0.Font)), 
            BackgroundTransparency = 1, 
            TextWrapped = true, 
            TextProps = {
                TextSize = l_Stylizer_0.TextSize, 
                Font = l_Stylizer_0.Font, 
                RichText = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, 
            LinkMap = {}, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }); 
        LoadingIndicatorPane = v6.createElement(l_Pane_0, {
            Padding = {
                Top = l_Stylizer_0.LoadingIndicatorPadding
            }, 
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.LoadingIndicatorHeight + l_Stylizer_0.LoadingIndicatorPadding), 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            LoadingIndicator = v6.createElement(l_LoadingIndicator_0)
        })
    };
end;
v24.renderOpenPanel = function(v63) --[[ Line: 282 ]] --[[ Name: renderOpenPanel ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v6 (copy), l_TextWithLinks_0 (copy), v8 (copy), l_TextLabel_0 (copy), l_Pane_0 (copy), l_Button_0 (copy)
    local l_props_3 = v63.props;
    local l_Stylizer_1 = l_props_3.Stylizer;
    local l_Localization_2 = l_props_3.Localization;
    local l_convertedExperience_2 = v63.state.convertedExperience;
    assert(l_convertedExperience_2, "Converted experience should be set");
    local v68 = l_Localization_2:getText("InitialFlow", "Confirmation", {
        experienceNameR15Font = ("<font color = \"%*\"> %*_R15 </font>"):format(l_Stylizer_1.ConfirmationExperienceNameColor, (v63:getGameName())), 
        date = v63.gameCreatedDate
    });
    local v69 = l_LayoutOrderIterator_0.new();
    return {
        CompleteLabel = v6.createElement(l_TextWithLinks_0, {
            LayoutOrder = v69:getNextOrder(), 
            Text = l_Localization_2:getText("InitialFlow", "Ready", {
                experienceName = l_convertedExperience_2.name
            }), 
            Size = UDim2.new(1, 0, 0, v8.getTextHeight(l_Localization_2:getText("InitialFlow", "Ready", {
                experienceName = l_convertedExperience_2.name
            }), l_Stylizer_1.TextSize, l_Stylizer_1.Font)), 
            BackgroundTransparency = 1, 
            TextWrapped = true, 
            TextProps = {
                TextSize = l_Stylizer_1.ReadyTextSize, 
                Font = l_Stylizer_1.Font, 
                RichText = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, 
            LinkMap = {}, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        ConfirmationLabel = v6.createElement(l_TextLabel_0, {
            LayoutOrder = v69:getNextOrder(), 
            Text = v68, 
            Size = UDim2.new(1, 0, 0, l_Stylizer_1.ConfirmationLabelYPadding * v8.getTextHeight(v68, l_Stylizer_1.TextSize, l_Stylizer_1.Font)), 
            BackgroundTransparency = 1, 
            TextWrapped = true, 
            TextSize = l_Stylizer_1.TextSize, 
            Font = l_Stylizer_1.Font, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            RichText = true
        }), 
        OpenButtonPane = v6.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, v8.getTextHeight(l_Localization_2:getText("InitialFlow", "OpenR15Copy"), l_Stylizer_1.TextSize, l_Stylizer_1.Font, l_Stylizer_1.ButtonPanePadding)), 
            LayoutOrder = v69:getNextOrder(), 
            BackgroundTransparency = 1, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            Layout = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Spacing = l_Stylizer_1.OpenPaneButtonsSpaceing
        }, {
            CreateNewCopyButton = if v63.hasCreatedCopy then nil else v6.createElement(l_Button_0, {
                Size = v8.getTextSize(l_Localization_2:getText("InitialFlow", "CreateNewR15Copy"), l_Stylizer_1.TextSize, l_Stylizer_1.Font, l_Stylizer_1.ButtonPadding), 
                Text = l_Localization_2:getText("InitialFlow", "CreateNewR15Copy"), 
                OnClick = v63.createNewExperience, 
                Style = "Round", 
                LayoutOrder = v69:getNextOrder()
            }), 
            OpenButton = v6.createElement(l_Button_0, {
                Size = v8.getTextSize(l_Localization_2:getText("InitialFlow", "OpenR15Copy"), l_Stylizer_1.TextSize, l_Stylizer_1.Font, l_Stylizer_1.ButtonPadding), 
                Text = l_Localization_2:getText("InitialFlow", "OpenR15Copy"), 
                OnClick = v63.openExperience, 
                Style = "RoundPrimary"
            })
        }), 
        CreateNewCopyButtonPane = if v63.hasCreatedCopy then nil else v6.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, v8.getTextHeight(l_Localization_2:getText("InitialFlow", "CreateNewR15Copy"), l_Stylizer_1.TextSize, l_Stylizer_1.Font, l_Stylizer_1.ButtonPanePadding)), 
            LayoutOrder = v69:getNextOrder(), 
            BackgroundTransparency = 1, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            Layout = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }, {
            CreateNewCopyButton = v6.createElement(l_Button_0, {
                Size = v8.getTextSize(l_Localization_2:getText("InitialFlow", "CreateNewR15Copy"), l_Stylizer_1.TextSize, l_Stylizer_1.Font, l_Stylizer_1.ButtonPadding), 
                Text = l_Localization_2:getText("InitialFlow", "CreateNewR15Copy"), 
                OnClick = v63.createNewExperience, 
                Style = "RoundPrimary"
            })
        })
    };
end;
v24.renderGetStartedPanel = function(v70) --[[ Line: 428 ]] --[[ Name: renderGetStartedPanel ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), l_R15MigShowLinkedText_0 (copy), v6 (copy), l_Pane_0 (copy), l_TextWithLinks_0 (copy), v8 (copy), l_TextLabel_0 (copy), l_GuiService_0 (copy), l_HttpRbxApiService_0 (copy), l_Button_0 (copy)
    local l_props_4 = v70.props;
    local l_Stylizer_2 = l_props_4.Stylizer;
    local l_Localization_3 = l_props_4.Localization;
    local v74 = l_LayoutOrderIterator_0.new();
    local v75 = nil;
    local v76 = nil;
    local v77 = nil;
    assert(not v70:isWaitingForInitialData());
    if v70:isLocalPlace() then
        v75 = l_Localization_3:getText("InitialFlow", "PlacefileExplanation");
        v76 = l_Localization_3:getText("InitialFlow", "PlacefileInstructions");
        v77 = l_Localization_3:getText("InitialFlow", "PlacefileGetStartedButton");
    elseif v70:isPublishedR6Experience() then
        v75 = l_Localization_3:getText("InitialFlow", "ExperienceExplanationR6", {
            experienceName = v70:getGameName()
        });
        v76 = l_Localization_3:getText("InitialFlow", "ExperienceInstructionsR6");
        v77 = l_Localization_3:getText("InitialFlow", "ExperienceGetStartedButtonR6");
    else
        assert(v70:isPublishedR15PlayerChoiceExperience());
        v75 = l_Localization_3:getText("InitialFlow", "ExperienceExplanationR15");
        v76 = l_Localization_3:getText("InitialFlow", "ExperienceInstructionsR15");
        v77 = l_Localization_3:getText("InitialFlow", "ExperienceGetStartedButtonR15");
    end;
    if not l_R15MigShowLinkedText_0 then
        v75 = string.gsub(v75, "%[link1%]", "");
    end;
    return {
        ThumbnailPane = v6.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_2.ThumbnailPanelHeight), 
            LayoutOrder = v74:getNextOrder(), 
            BackgroundTransparency = 1, 
            Spacing = l_Stylizer_2.ThumbnailPanelVerticalTextSpacing, 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            ImagePane = v6.createElement(l_Pane_0, {
                Size = UDim2.new(1, 0, 0, l_Stylizer_2.ThumbnailHeight), 
                LayoutOrder = v74:getNextOrder(), 
                BackgroundColor = Color3.fromRGB(0, 0, 0), 
                BackgroundTransparency = 0
            }, {
                v6.createElement("VideoFrame", {
                    Video = "rbxasset://textures/R15Migrator/start-page-anim.mp4", 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Looped = true, 
                    Playing = true
                })
            }), 
            ThumbnailSubTextLabel = v6.createElement(l_TextWithLinks_0, {
                LayoutOrder = v74:getNextOrder(), 
                Text = l_Localization_3:getText("InitialFlow", "ThumbnailSubText"), 
                Size = UDim2.new(1, 0, 0, v8.getTextHeight(l_Localization_3:getText("InitialFlow", "ThumbnailSubText"), l_Stylizer_2.SubTextSize, l_Stylizer_2.Font)), 
                BackgroundTransparency = 1, 
                TextWrapped = true, 
                TextProps = {
                    TextSize = l_Stylizer_2.SubTextSize, 
                    Font = l_Stylizer_2.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }, 
                LinkMap = {}, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            })
        }), 
        ExplanationLabelR15Only = if v70:isPublishedR15PlayerChoiceExperience() then v6.createElement(l_TextLabel_0, {
            LayoutOrder = v74:getNextOrder(), 
            Text = l_Localization_3:getText("InitialFlow", "R15OnlyMessage", {
                experienceName = v70:getGameName()
            }), 
            Size = UDim2.new(1, 0, 0, v8.getTextHeight(l_Localization_3:getText("InitialFlow", "R15OnlyMessage", {
                experienceName = v70:getGameName()
            }), l_Stylizer_2.TextSize, l_Stylizer_2.Font)), 
            BackgroundTransparency = 1, 
            TextWrapped = true, 
            TextSize = l_Stylizer_2.TextSize, 
            Font = l_Stylizer_2.Font, 
            RichText = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }) else nil, 
        ExplanationLabel = v6.createElement(l_TextWithLinks_0, {
            LayoutOrder = v74:getNextOrder(), 
            Text = v75, 
            BackgroundTransparency = 1, 
            TextWrapped = true, 
            TextProps = {
                TextSize = l_Stylizer_2.TextSize, 
                Font = l_Stylizer_2.Font, 
                RichText = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, 
            LinkMap = {
                ["[link1]"] = {
                    LinkText = l_Localization_3:getText("AdapterPane", "LearnMore"), 
                    LinkCallback = function() --[[ Line: 556 ]] --[[ Name: LinkCallback ]]
                        -- upvalues: l_GuiService_0 (ref), l_HttpRbxApiService_0 (ref)
                        l_GuiService_0:OpenBrowserWindow(l_HttpRbxApiService_0:GetDocumentationUrl(""));
                    end
                }
            }, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        InstructionLabel = v6.createElement(l_TextWithLinks_0, {
            LayoutOrder = v74:getNextOrder(), 
            Text = v76, 
            BackgroundTransparency = 1, 
            TextWrapped = true, 
            TextProps = {
                TextSize = l_Stylizer_2.TextSize, 
                Font = l_Stylizer_2.Font, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, 
            LinkMap = {}, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        GetStartedButtonPane = v6.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, v8.getTextHeight(v77, l_Stylizer_2.TextSize, l_Stylizer_2.Font, l_Stylizer_2.ButtonPanePadding)), 
            LayoutOrder = v74:getNextOrder(), 
            BackgroundTransparency = 1, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            Layout = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }, {
            GetStartedButton = v6.createElement(l_Button_0, {
                Size = v8.getTextSize(v77, l_Stylizer_2.TextSize, l_Stylizer_2.Font, l_Stylizer_2.ButtonPadding), 
                Text = v77, 
                OnClick = v70.createNewExperience, 
                Style = "RoundPrimary"
            })
        })
    };
end;
v24.isWaitingForInitialData = function(v78) --[[ Line: 601 ]] --[[ Name: isWaitingForInitialData ]]
    local l_isGettingInitialData_0 = v78.state.isGettingInitialData;
    local l_avatarType_0 = v78.props.avatarType;
    if l_isGettingInitialData_0 or v78.isExperiencePublished and not l_avatarType_0 then
        return true;
    else
        return false;
    end;
end;
v24.isPublishedR6Experience = function(v81) --[[ Line: 611 ]] --[[ Name: isPublishedR6Experience ]]
    local l_avatarType_1 = v81.props.avatarType;
    assert(not v81:isWaitingForInitialData());
    if v81.isExperiencePublished then
        return l_avatarType_1 == Enum.GameAvatarType.R6;
    else
        return false;
    end;
end;
v24.isPublishedR15PlayerChoiceExperience = function(v83) --[[ Line: 618 ]] --[[ Name: isPublishedR15PlayerChoiceExperience ]]
    local l_avatarType_2 = v83.props.avatarType;
    assert(not v83:isWaitingForInitialData());
    if v83.isExperiencePublished then
        return l_avatarType_2 ~= Enum.GameAvatarType.R6;
    else
        return false;
    end;
end;
v24.isLocalPlace = function(v85) --[[ Line: 625 ]] --[[ Name: isLocalPlace ]]
    return not v85.isExperiencePublished;
end;
v24.render = function(v86) --[[ Line: 629 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), l_Pane_0 (copy), l_Image_0 (copy)
    local l_state_0 = v86.state;
    local l_isConverting_0 = l_state_0.isConverting;
    local l_convertedExperience_3 = l_state_0.convertedExperience;
    local l_Stylizer_3 = v86.props.Stylizer;
    local v91 = nil;
    local v92 = false;
    if l_isConverting_0 then
        v91 = v86:renderConvertingPanel();
    elseif l_convertedExperience_3 then
        v92 = true;
        v91 = v86:renderOpenPanel();
    elseif not v86:isWaitingForInitialData() then
        v91 = v86:renderGetStartedPanel();
    end;
    return v6.createElement(l_Pane_0, {
        BackgroundTransparency = 0, 
        BackgroundColor = l_Stylizer_3.BackgroundColor, 
        Padding = {
            Top = l_Stylizer_3.PanePadding.Top
        }, 
        [v6.Ref] = v86.ref
    }, {
        IconPane = if v92 then v6.createElement(l_Pane_0, {
            Size = UDim2.new(0, (l_state_0.paneSize.X - l_Stylizer_3.Width) / 2, 1, 0)
        }, {
            v6.createElement(l_Image_0, {
                Size = l_Stylizer_3.IconSize, 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, 0), 
                BackgroundTransparency = 1, 
                Image = l_Stylizer_3.CompleteIcon
            })
        }) else nil, 
        MainPane = v6.createElement(l_Pane_0, {
            BackgroundTransparency = 0, 
            BackgroundColor = l_Stylizer_3.BackgroundColor, 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = {
                Left = l_Stylizer_3.PanePadding.Left
            }, 
            Spacing = l_Stylizer_3.Spacing
        }, {
            ContentPane = v6.createElement(l_Pane_0, {
                Size = UDim2.new(0, l_Stylizer_3.Width, 1, 0), 
                Spacing = l_Stylizer_3.VerticalTextSpacing, 
                Layout = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, v91)
        })
    });
end;
local function v94(v93) --[[ Line: 693 ]] --[[ Name: mapStateToProps ]]
    return {
        avatarType = v93.AvatarType
    };
end;
v24 = l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    API = l_ContextServices_0.API, 
    Plugin = l_ContextServices_0.Plugin
})(v24);
return v7.connect(v94)(v24);