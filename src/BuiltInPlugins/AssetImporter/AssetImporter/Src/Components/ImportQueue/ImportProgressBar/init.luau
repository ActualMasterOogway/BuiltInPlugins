local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_LoadingBar_0 = l_UI_0.LoadingBar;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImportQueueFixFileMiscount);
local v13 = v1.PureComponent:extend("ImportProgressBar");
v13._getText = function(v14) --[[ Line: 21 ]] --[[ Name: _getText ]]
    local l_props_0 = v14.props;
    local l_Localization_1 = l_props_0.Localization;
    local l_Progress_0 = l_props_0.Progress;
    local l_ProgressGoal_0 = l_props_0.ProgressGoal;
    local v19 = l_Progress_0 / l_ProgressGoal_0;
    local v20 = l_Localization_1:getText("ImportQueue", "FilesRemaining2", {
        currentFileIndex = tostring((math.ceil(l_Progress_0))), 
        totalFiles = tostring(l_ProgressGoal_0)
    });
    if v14.props.Parsing then
        return (("%* - %*"):format(v20, (l_Localization_1:getText("ImportQueue", "ParsingFiles"))));
    elseif v14.props.Uploading then
        local v21 = l_Localization_1:getText("ImportQueue", "Complete");
        return (("%* - %*%% %*"):format(v20, tostring((math.floor(v19 * 100))), v21));
    else
        return v20;
    end;
end;
v13.render = function(v22) --[[ Line: 46 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), v1 (copy), l_Pane_0 (copy), l_LoadingBar_0 (copy), l_TextLabel_0 (copy)
    local l_props_1 = v22.props;
    if not l_props_1.ShowProgress then
        return nil;
    else
        local l_Progress_1 = l_props_1.Progress;
        local l_ProgressGoal_1 = l_props_1.ProgressGoal;
        if v12() and (l_Progress_1 == nil or l_ProgressGoal_1 == nil) then
            return nil;
        elseif l_ProgressGoal_1 == 0 then
            return nil;
        else
            local v26 = v22:_getText();
            local l_ImportQueue_0 = l_props_1.Stylizer.ImportQueue;
            local l_Padding_0 = l_ImportQueue_0.Padding;
            local l_LoadingBarWidth_0 = l_ImportQueue_0.LoadingBarWidth;
            return v1.createElement(l_Pane_0, {
                Size = l_props_1.Size, 
                LayoutOrder = l_props_1.LayoutOrder, 
                Layout = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = l_Padding_0, 
                Spacing = l_Padding_0
            }, {
                LoadingBar = v1.createElement(l_LoadingBar_0, {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, l_LoadingBarWidth_0), 
                    Progress = l_Progress_1 / l_ProgressGoal_1
                }), 
                LoadingText = v1.createElement(l_TextLabel_0, {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Text = v26, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true
                })
            });
        end;
    end;
end;
v13 = l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v13);
return v2.connect(function(v30) --[[ Line: 101 ]] --[[ Name: mapStateToProps ]]
    return {
        SessionQueue = v30.Sessions.sessionQueue, 
        ShowProgress = v30.Dialogs.showProgress, 
        Progress = v30.Sessions.progress, 
        ProgressGoal = v30.Sessions.progressGoal, 
        Uploading = v30.Dialogs.uploading, 
        Parsing = v30.Sessions.parsing
    };
end, nil)(v13);