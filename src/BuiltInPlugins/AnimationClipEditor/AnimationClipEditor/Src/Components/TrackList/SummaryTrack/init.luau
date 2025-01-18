local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = require(l_script_FirstAncestor_0.Src.Components.IK.IKController);
local v5 = require(l_script_FirstAncestor_0.Src.Components.FaceControlsEditor.FaceControlsEditorController);
local v6 = require(l_script_FirstAncestor_0.Src.Components.FacialAnimationRecorder.RecordingModeButton);
local v7 = require(l_script_FirstAncestor_0.Src.Components.TrackList.TrackListEntry);
local v8 = require(l_script_FirstAncestor_0.Src.Components.TrackList.AddTrackButton);
local v9 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v10 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v11 = require(l_script_FirstAncestor_0.Src.Util.StringUtils);
local v12 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagFacialAnimationRecordingInStudio);
local v13 = v1.PureComponent:extend("SummaryTrack");
v13.init = function(v14) --[[ Line: 38 ]] --[[ Name: init ]]
    v14.onTrackAdded = function(v15, v16, v17) --[[ Line: 39 ]]
        -- upvalues: v14 (copy)
        if v14.props.OnTrackAdded then
            v14.props.OnTrackAdded(v15, v16, v17);
        end;
    end;
end;
truncateAtMiddle = function(v18, v19, v20) --[[ Line: 46 ]] --[[ Name: truncateAtMiddle ]]
    if v19 < #v18 then
        local v21 = v20 or "...";
        local v22 = v19 - #v21;
        local v23 = math.ceil(v22 / 2);
        local v24 = math.floor(v22 / 2);
        return string.sub(v18, 0, v23) .. v21 .. string.sub(v18, #v18 - v24);
    else
        return v18;
    end;
end;
v13.render = function(v25) --[[ Line: 58 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v12 (copy), v10 (copy), v1 (copy), v7 (copy), v9 (copy), v4 (copy), v5 (copy), v6 (copy), v8 (copy)
    local l_props_0 = v25.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Name_0 = l_props_0.Name;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_UnusedTracks_0 = l_props_0.UnusedTracks;
    local l_UnusedFacs_0 = l_props_0.UnusedFacs;
    local l_trackTheme_0 = l_Stylizer_0.trackTheme;
    local v33 = "";
    local v34 = v11.getTextWidth(l_Name_0, l_trackTheme_0.textSize, l_Stylizer_0.font);
    if v12() then
        v33 = truncateAtMiddle(l_Name_0, 16);
        v34 = v11.getTextWidth(v33, l_trackTheme_0.textSize, l_Stylizer_0.font);
    end;
    local v35 = l_UnusedTracks_0 and not v10(l_UnusedTracks_0) or l_UnusedFacs_0 and not v10(l_UnusedFacs_0);
    return v1.createElement(v7, {
        Height = v9.SUMMARY_TRACK_HEIGHT, 
        Indent = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Primary = true
    }, {
        NameLabel = v1.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            Text = v12() and v33 or l_Name_0, 
            Font = l_Stylizer_0.font, 
            TextSize = l_trackTheme_0.textSize, 
            TextColor3 = l_trackTheme_0.textColor, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        LeftButtonsListContainer = v1.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 0.5), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 0, 
            Position = UDim2.new(0, v34 + 12, 0.5, 0)
        }, {
            LeftButtonsList = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 12)
            }), 
            IKController = v1.createElement(v4, {}), 
            FaceControlsEditorController = v1.createElement(v5, {}), 
            RecordingModeButton = v12() and v1.createElement(v6, {})
        }), 
        AddTrackButton = v35 and v1.createElement(v8, {
            Size = UDim2.new(0, v9.TRACKLIST_BUTTON_SIZE, 0, v9.TRACKLIST_BUTTON_SIZE), 
            Position = UDim2.new(1, -v9.TRACKLIST_RIGHT_PADDING, 0.5, 0), 
            Tracks = l_UnusedTracks_0, 
            Facs = l_UnusedFacs_0, 
            OnTrackSelected = v25.onTrackAdded
        }) or nil
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v13));