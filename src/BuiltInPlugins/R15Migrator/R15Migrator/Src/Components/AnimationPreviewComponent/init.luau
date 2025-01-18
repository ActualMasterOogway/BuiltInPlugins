local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v2.ContextServices;
local v6 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_Signal_0 = v2.Util.Signal;
local v13 = require(l_script_FirstAncestor_0.Src.Modules.NpcManager);
local v14 = require(l_script_FirstAncestor_0.Src.Modules.NpcIdManager);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v16 = require(l_Components_0.DisplayAvatarsComponent);
local v17 = require(l_Components_0.MediaPlayerControls);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v19 = require(l_Actions_0.SetPreviewSpeed);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v21 = require(l_Thunks_0.CreateWorldModels);
local l_AnimationConversion_0 = l_script_FirstAncestor_0.Src.Util.AnimationConversion;
local v23 = require(l_AnimationConversion_0.resetCharacter);
local v24 = require(l_AnimationConversion_0.AnimationConversionManager);
local v25 = require(l_script_FirstAncestor_0.Src.Util.sanitizeString);
local l_PreviewSpeeds_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).PreviewSpeeds;
local v27 = v3.PureComponent:extend("AnimationPreviewComponent");
local function v35(v28) --[[ Line: 40 ]] --[[ Name: updateSelectionModels ]]
    -- upvalues: v6 (copy), v14 (copy), v13 (copy)
    local v29 = v6.Dictionary.values(v28.props.characters);
    local v30 = v6.Dictionary.values(v28.props.convertedCharacters);
    v28.selectionModels = v6.List.join(v28.defaultSelections, v29, v30);
    local v31 = #v28.defaultSelections + #v29;
    for v32, v33 in v30 do
        local v34 = v14.GetNpcFromId(v33.key);
        if v13.IsR15Complete(v34) then
            coroutine.wrap(function() --[[ Line: 51 ]]
                -- upvalues: v28 (copy), v33 (copy), v31 (copy), v32 (copy)
                v28.props.CreateWorldModels(v33.key, v33.model);
                v28:setState({
                    currentIndex = v31 + v32
                });
            end)();
            return;
        end;
    end;
    v28:setState({
        currentIndex = 1
    });
end;
local function v37() --[[ Line: 66 ]] --[[ Name: getBlockyHumanoidDescription ]]
    local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
    l_HumanoidDescription_0.HeadColor = BrickColor.new("Bright yellow").Color;
    l_HumanoidDescription_0.TorsoColor = BrickColor.new("Bright blue").Color;
    l_HumanoidDescription_0.LeftArmColor = BrickColor.new("Bright yellow").Color;
    l_HumanoidDescription_0.LeftLegColor = BrickColor.new("Bright yellow").Color;
    l_HumanoidDescription_0.RightLegColor = BrickColor.new("Bright yellow").Color;
    l_HumanoidDescription_0.RightArmColor = BrickColor.new("Bright yellow").Color;
    return l_HumanoidDescription_0;
end;
v27.init = function(v38) --[[ Line: 77 ]] --[[ Name: init ]]
    -- upvalues: l_Signal_0 (copy), v37 (copy), l_Players_0 (copy), v23 (copy), v35 (copy)
    v38.state = {
        currentIndex = 0, 
        isPlaying = false, 
        isLoaded = false, 
        currentTime = 0, 
        length = 1
    };
    v38.selectionModels = {};
    v38.selectSpeed = function(v39) --[[ Line: 87 ]]
        -- upvalues: v38 (copy)
        v38.props.SetPreviewSpeed(v39.Id);
    end;
    v38.selectItem = function(_, v41) --[[ Line: 91 ]]
        -- upvalues: v38 (copy)
        if v38.state.currentIndex == v41 then
            return;
        else
            coroutine.wrap(function() --[[ Line: 96 ]]
                -- upvalues: v38 (ref), v41 (copy)
                if v38.selectionModels[v41].key then
                    local v42 = v38.selectionModels[v41];
                    v38.props.CreateWorldModels(v42.key, v42.model);
                end;
                v38:setState({
                    currentIndex = v41
                });
            end)();
            return;
        end;
    end;
    v38.loaded = l_Signal_0.new();
    v38.tracks = {};
    v38.animators = {};
    v38.loaded:Connect(function(v43, v44, v45) --[[ Line: 110 ]]
        -- upvalues: v38 (copy)
        if v38.isUnmounting then
            return;
        else
            if v43 then
                table.insert(v38.tracks, v44);
                table.insert(v38.animators, v45);
                if #v38.tracks > 1 then
                    for _, v47 in v38.tracks do
                        v47:Play();
                    end;
                    v38:load();
                    return;
                end;
            elseif v38.tracks[1] == v44 or v38.tracks[2] == v44 then
                v38:unload();
            end;
            return;
        end;
    end);
    task.spawn(function() --[[ Line: 132 ]]
        -- upvalues: v38 (copy), v37 (ref), l_Players_0 (ref), v23 (ref), v35 (ref)
        local v48 = {
            0, 
            320912307
        };
        v38.defaultSelections = {};
        for _, v50 in v48 do
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 136 ]]
                -- upvalues: v50 (copy), v37 (ref), l_Players_0 (ref)
                if v50 == 0 then
                    return (v37());
                else
                    return l_Players_0:GetHumanoidDescriptionFromOutfitId(v50);
                end;
            end);
            if not l_status_0 then
                l_result_0 = v37();
            end;
            local l_l_Players_0_HumanoidModelFromDescription_0 = l_Players_0:CreateHumanoidModelFromDescription(l_result_0, Enum.HumanoidRigType.R6);
            local l_l_Players_0_HumanoidModelFromDescription_1 = l_Players_0:CreateHumanoidModelFromDescription(l_result_0, Enum.HumanoidRigType.R15);
            v23(l_l_Players_0_HumanoidModelFromDescription_0);
            v23(l_l_Players_0_HumanoidModelFromDescription_1);
            local l_WorldModel_0 = Instance.new("WorldModel");
            local l_WorldModel_1 = Instance.new("WorldModel");
            l_l_Players_0_HumanoidModelFromDescription_0.Parent = l_WorldModel_0;
            l_l_Players_0_HumanoidModelFromDescription_1.Parent = l_WorldModel_1;
            table.insert(v38.defaultSelections, {
                resetPreviewModel = l_WorldModel_0, 
                resetConvertedModel = l_WorldModel_1
            });
        end;
        if v38.isUnmounting then
            return;
        else
            v35(v38);
            return;
        end;
    end);
end;
v27.start = function(v57) --[[ Line: 164 ]] --[[ Name: start ]]
    if v57.runningConnection then
        return;
    else
        v57.runningConnection = game:GetService("RunService").Heartbeat:Connect(function(v58) --[[ Line: 168 ]]
            -- upvalues: v57 (copy)
            local v59 = v58 * v57.props.previewSpeed;
            for _, v61 in v57.animators do
                v61:StepAnimations(v59);
            end;
            v57:setState({
                currentTime = (v57.state.currentTime + v59) % v57.state.length
            });
        end);
        return;
    end;
end;
v27.stop = function(v62) --[[ Line: 179 ]] --[[ Name: stop ]]
    if v62.runningConnection then
        v62.runningConnection:Disconnect();
    end;
    v62.runningConnection = nil;
end;
v27.load = function(v63) --[[ Line: 186 ]] --[[ Name: load ]]
    v63:start();
    v63:setState({
        currentTime = 0, 
        isPlaying = true, 
        isLoaded = true, 
        length = v63.tracks[1].Length < 1.0E-5 and 1 or v63.tracks[1].Length
    });
end;
v27.play = function(v64) --[[ Line: 198 ]] --[[ Name: play ]]
    v64:start();
    v64:setState({
        isPlaying = true
    });
end;
v27.pause = function(v65) --[[ Line: 205 ]] --[[ Name: pause ]]
    v65:stop();
    v65:setState({
        isPlaying = false
    });
end;
v27.unload = function(v66) --[[ Line: 212 ]] --[[ Name: unload ]]
    v66.tracks = {};
    v66.animators = {};
    v66:stop();
    v66:setState({
        currentTime = 0, 
        length = 1, 
        isPlaying = false, 
        isLoaded = false
    });
end;
v27.scrub = function(v67, v68) --[[ Line: 224 ]] --[[ Name: scrub ]]
    if v67.state.isPlaying then
        v67:pause();
    end;
    local v69 = nil;
    v69 = if v67.state.currentTime <= v68 then v68 - v67.state.currentTime else v67.state.length - v67.state.currentTime + v68;
    for _, v71 in v67.animators do
        v71:StepAnimations(v69);
    end;
    v67:setState({
        currentTime = v68
    });
end;
v27.willUnmount = function(v72) --[[ Line: 242 ]] --[[ Name: willUnmount ]]
    v72.isUnmounting = true;
    v72:stop();
end;
v27.buildItems = function(v73) --[[ Line: 247 ]] --[[ Name: buildItems ]]
    -- upvalues: v25 (copy)
    local l_Localization_0 = v73.props.Localization;
    local v75 = {};
    for v76, v77 in v73.selectionModels do
        if v77.key then
            local v78 = string.find(v77.fullName, ".[^.]*$") or 0;
            v75[v76] = string.sub(v77.fullName, v78 + 1, -1);
            v75[v76] = v25(v75[v76]);
        else
            v75[v76] = l_Localization_0:getText("AvatarSelection", "DefaultAvatar") .. " " .. v76;
        end;
    end;
    return v75;
end;
v27.buildSpeedItems = function(_) --[[ Line: 265 ]] --[[ Name: buildSpeedItems ]]
    -- upvalues: l_PreviewSpeeds_0 (copy)
    local v80 = {};
    for v81, v82 in l_PreviewSpeeds_0 do
        v80[v81] = {
            Id = v82, 
            Label = string.format("%.2f", v82)
        };
    end;
    return v80;
end;
v27.getModels = function(v83, v84) --[[ Line: 276 ]] --[[ Name: getModels ]]
    local l_worldModels_0 = v83.props.worldModels;
    if v84 == 0 then
        return nil, nil;
    else
        local v86 = v83.selectionModels[v84];
        if v86.key then
            local v87 = l_worldModels_0[v86.key];
            if not v87 then
                return nil, nil;
            else
                return v87.resetPreviewModel, v87.resetConvertedModel;
            end;
        else
            return v86.resetPreviewModel, v86.resetConvertedModel;
        end;
    end;
end;
v27.didUpdate = function(v88, v89) --[[ Line: 293 ]] --[[ Name: didUpdate ]]
    -- upvalues: v35 (copy)
    if v89.characterMetadataLoadedVersion ~= v88.props.characterMetadataLoadedVersion then
        v35(v88);
    end;
end;
v27.render = function(v90) --[[ Line: 299 ]] --[[ Name: render ]]
    -- upvalues: v24 (copy), l_LayoutOrderIterator_0 (copy), v3 (copy), l_Pane_0 (copy), v16 (copy), l_TextLabel_0 (copy), l_SelectInput_0 (copy), v17 (copy)
    local l_props_0 = v90.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_previewSelection_0 = l_props_0.previewSelection;
    local l_previewSpeed_0 = l_props_0.previewSpeed;
    local l_Localization_1 = l_props_0.Localization;
    local v96 = if l_previewSelection_0 then v24.getAnimationAssetInfo(l_previewSelection_0) else nil;
    local v97 = if v96 then v96.url else nil;
    local l_url_0 = v24.getConvertedAnimationAssetInfo(v96).url;
    local l_currentIndex_0 = v90.state.currentIndex;
    local v100, v101 = v90:getModels(l_currentIndex_0);
    local l_state_0 = v90.state;
    local l_isPlaying_0 = l_state_0.isPlaying;
    local l_isLoaded_0 = l_state_0.isLoaded;
    local l_currentTime_0 = l_state_0.currentTime;
    local l_length_0 = l_state_0.length;
    local v107 = l_LayoutOrderIterator_0.new();
    return v3.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Spacing = l_Stylizer_0.Spacing
    }, {
        PreviewContainer = v3.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v107:getNextOrder(), 
            Size = l_Stylizer_0.PreviewContainerSize
        }, {
            Avatars = v3.createElement(v16, {
                Animation1 = v97, 
                Animation2 = l_url_0, 
                Model1 = v100, 
                Model2 = v101, 
                Loaded = v90.loaded
            })
        }), 
        PlaybackContainer = v3.createElement(l_Pane_0, {
            Padding = 10, 
            LayoutOrder = v107:getNextOrder(), 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Spacing = l_Stylizer_0.Spacing, 
            BackgroundColor3 = l_Stylizer_0.BackgroundColor, 
            BorderColor3 = l_Stylizer_0.PlaybackContainerBorderColor, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 1
        }, {
            SelectContainer = v3.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v107:getNextOrder()
            }, {
                Title = if v96 and v90.props.animations[v96.id] then v3.createElement(l_TextLabel_0, {
                    Text = v90.props.animations[v96.id].name, 
                    LayoutOrder = v107:getNextOrder(), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Size = UDim2.fromScale(0.5, 0)
                }) else nil, 
                SelectContainer = v3.createElement(l_Pane_0, {
                    Layout = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.fromScale(0.5, 0), 
                    Spacing = l_Stylizer_0.Spacing, 
                    LayoutOrder = v107:getNextOrder()
                }, {
                    SpeedLabel = v3.createElement(l_TextLabel_0, {
                        Text = l_Localization_1:getText("AnimationPreview", "PreviewSpeed"), 
                        LayoutOrder = v107:getNextOrder(), 
                        AutomaticSize = Enum.AutomaticSize.XY
                    }), 
                    SpeedInput = v3.createElement(l_SelectInput_0, {
                        SelectedId = l_previewSpeed_0, 
                        Items = v90:buildSpeedItems(), 
                        OnItemActivated = v90.selectSpeed, 
                        LayoutOrder = v107:getNextOrder(), 
                        Width = 75
                    }), 
                    SelectLabel = v3.createElement(l_TextLabel_0, {
                        Text = l_Localization_1:getText("AvatarSelection", "Character"), 
                        LayoutOrder = v107:getNextOrder(), 
                        AutomaticSize = Enum.AutomaticSize.XY
                    }), 
                    SelectInput = v3.createElement(l_SelectInput_0, {
                        PlaceholderText = l_Localization_1:getText("AvatarSelection", "ChooseAvatarPlaceholder"), 
                        SelectedIndex = l_currentIndex_0, 
                        Items = v90:buildItems(), 
                        OnItemActivated = v90.selectItem, 
                        LayoutOrder = v107:getNextOrder(), 
                        Width = 150
                    })
                })
            }), 
            Controls = v3.createElement(v17, {
                LayoutOrder = v107:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, 32), 
                CurrentTime = l_currentTime_0, 
                TimeLength = l_length_0, 
                IsPlaying = l_isPlaying_0, 
                IsLoaded = l_isLoaded_0, 
                OnPlay = function() --[[ Line: 417 ]] --[[ Name: OnPlay ]]
                    -- upvalues: v90 (copy)
                    v90:play();
                end, 
                OnPause = function() --[[ Line: 420 ]] --[[ Name: OnPause ]]
                    -- upvalues: v90 (copy)
                    v90:pause();
                end, 
                OnScrub = function(v108) --[[ Line: 423 ]] --[[ Name: OnScrub ]]
                    -- upvalues: v90 (copy)
                    v90:scrub(v108);
                end
            })
        })
    });
end;
local function v111(v109, _) --[[ Line: 431 ]] --[[ Name: mapStateToProps ]]
    return {
        animations = v109.AnimationConversion.animations, 
        previewSelection = v109.AnimationConversion.previewSelection, 
        previewSpeed = v109.AnimationConversion.previewSpeed, 
        characters = v109.CharacterConversion.characters, 
        convertedCharacters = v109.CharacterConversion.convertedCharacters, 
        characterMetadataLoadedVersion = v109.CharacterConversion.characterMetadataLoadedVersion, 
        worldModels = v109.CharacterConversion.worldModels
    };
end;
v27 = l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v27);
return v4.connect(v111, function(v112) --[[ Line: 448 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v21 (copy), v19 (copy)
    return {
        CreateWorldModels = function(v113, v114) --[[ Line: 450 ]] --[[ Name: CreateWorldModels ]]
            -- upvalues: v112 (copy), v21 (ref)
            v112(v21(v113, v114));
        end, 
        SetPreviewSpeed = function(v115) --[[ Line: 453 ]] --[[ Name: SetPreviewSpeed ]]
            -- upvalues: v112 (copy), v19 (ref)
            v112(v19(v115));
        end
    };
end)(v27);