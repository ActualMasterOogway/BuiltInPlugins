local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local l_collect_0 = v1.collect;
local l_findIndex_0 = v1.findIndex;
local _ = require(l_Parent_0.Src.Util.TutorialTypes);
local v5 = require(l_Parent_0.Src.Util.TutorialSteps);
local v6 = require(l_Parent_0.Src.Util.TutorialSteps.TutorialStep);
local l_status_0, l_result_0 = pcall(function() --[[ Line: 10 ]]
    return game:GetService("TutorialService");
end);
local v9 = if l_status_0 then l_result_0 else nil;
local l_status_1, l_result_1 = pcall(function() --[[ Line: 16 ]]
    return game:GetService("StudioWidgetsService");
end);
local v12 = if l_status_1 then l_result_1 else nil;
local v13 = require(l_Parent_0.Src.Flags.getFFlagSpotlightManager)();
local v14 = require(l_Parent_0.Src.Flags.getFFlagTutorialsUseFinishTextOnLastStep)();
local v15 = {
    DataModel = "Edit", 
    PluginType = "Standalone", 
    PluginId = "Tutorials", 
    Category = "Panels", 
    ItemId = "TourWidget"
};
local v16 = {
    PluginId = "MainWindow", 
    Category = "Widgets", 
    ItemId = "Main"
};
local l_insert_0 = table.insert;
local l_find_0 = table.find;
local v19 = {};
local v20 = {
    __index = v19
};
local function v21() --[[ Line: 47 ]]

end;
v19.new = function(v22, v23, v24, v25, v26) --[[ Line: 61 ]] --[[ Name: new ]]
    -- upvalues: v21 (copy), v13 (copy), v5 (copy), l_insert_0 (copy), v6 (copy), v20 (copy)
    local v27 = {};
    local v28 = {
        completed = false, 
        dataModel = v22, 
        currentStep = 0, 
        data = v23, 
        steps = v27, 
        instances = {}, 
        localization = v24, 
        incrementing = false, 
        toolboxConnection = v25, 
        toolboxLimits = nil, 
        callouts = {}, 
        topics = {}, 
        onStepChanged = v21, 
        onKeyPressed = v21, 
        onCompleted = v21, 
        widget = nil, 
        Panels = v26:GetPluginComponent("Panels")
    };
    if v13 then
        v28.Spotlight = v26:GetPluginComponent("Spotlight");
    end;
    for _, v30 in ipairs(v23.steps) do
        local v31 = v5[v30.kind];
        local v32 = v24:getText(v23.id, ("%s_Title"):format(v30.id));
        local v33 = v24:getText(v23.id, ("%s_Description"):format(v30.id));
        v30.title = v32;
        v30.description = v33;
        if v30.topic ~= v28.topics[#v28.topics] then
            l_insert_0(v28.topics, v30.topic);
        end;
        if v31 then
            l_insert_0(v27, v31.new(v28, v30));
        elseif v30.kind then
            warn("Missing step class: " .. v30.kind);
        else
            l_insert_0(v27, v6.new(v28, v30));
        end;
    end;
    return (setmetatable(v28, v20));
end;
v19.start = function(v34) --[[ Line: 106 ]] --[[ Name: start ]]
    if v34.data.onStart then
        v34.data.onStart(v34);
    end;
    v34:setStep(1);
end;
v19.setWidget = function(v35, v36) --[[ Line: 113 ]] --[[ Name: setWidget ]]
    v35.widget = v36;
    v35:resetAttachment();
end;
v19.resetAttachment = function(v37) --[[ Line: 118 ]] --[[ Name: resetAttachment ]]
    -- upvalues: v16 (copy)
    if not v37.widget then
        return;
    else
        v37:attachTo({
            TargetWidgetUri = v16, 
            SubjectAnchorPoint = Vector2.new(0, 0), 
            TargetAnchorPoint = Vector2.new(0, 0), 
            Offset = Vector2.new(20, 20)
        });
        return;
    end;
end;
v19.attachTo = function(v38, v39) --[[ Line: 130 ]] --[[ Name: attachTo ]]
    -- upvalues: v16 (copy), v15 (copy)
    v39.TargetWidgetUri = v39.TargetWidgetUri or v16;
    v39.SubjectAnchorPoint = v39.SubjectAnchorPoint or Vector2.new(0.5, 0);
    v39.TargetAnchorPoint = v39.TargetAnchorPoint or Vector2.new(0.5, 1);
    v39.Offset = v39.Offset or Vector2.new(0, 0);
    v38.Panels:SetAttachmentAsync(v15, v39);
end;
v19.setStep = function(v40, v41) --[[ Line: 140 ]] --[[ Name: setStep ]]
    -- upvalues: v9 (copy), v13 (copy), v12 (copy), l_collect_0 (copy)
    local v42 = v40.steps[v41];
    local l_data_0 = v42.data;
    if v40.currentCallout then
        v40.currentCallout:Destroy();
        v40.currentCallout = nil;
    end;
    v40.currentStep = v41;
    if l_data_0.hideWidgets then
        v9:HideWidgets(l_data_0.hideWidgets);
    end;
    if l_data_0.widgets then
        v9:ShowWidgets(l_data_0.widgets);
    end;
    v40:setToolboxLimits(l_data_0.toolboxLimits);
    if l_data_0.callout then
        v40:attachTo(l_data_0.callout);
    else
        v40:resetAttachment();
    end;
    if v13 then
        v40.Spotlight:HideSpotlightAsync();
    end;
    v12:HideSpotlight();
    v42:setCameraFocus();
    v42:bind();
    if l_data_0.onBind then
        l_data_0.onBind(v40);
    end;
    if v40.showSpotlightTask then
        task.cancel(v40.showSpotlightTask);
    end;
    v40.showSpotlightTask = task.delay(0.5, function() --[[ Line: 176 ]]
        -- upvalues: v40 (copy)
        v40:showSpotlight();
    end);
    local v44 = v40:getCurrentStepData();
    v44.step = l_collect_0(l_data_0, function(v45, v46) --[[ Line: 180 ]]
        if typeof(v46) == "function" then
            return nil;
        else
            return v45, v46;
        end;
    end);
    v40.onStepChanged(v44);
end;
v19.showCallout = function(v47, v48) --[[ Line: 190 ]] --[[ Name: showCallout ]]
    -- upvalues: v9 (copy)
    local l_v9_StudioWidgetFromLabel_0 = v9:GetStudioWidgetFromLabel(v48.target);
    local l_StudioCallout_0 = Instance.new("StudioCallout");
    l_StudioCallout_0.Title = v48.title;
    l_StudioCallout_0.Text = v48.description;
    l_StudioCallout_0.IsNextVisible = v48.showNext or false;
    l_StudioCallout_0.IsArrowVisible = not v48.hideArrow or false;
    l_StudioCallout_0:SetOnNextClicked(function() --[[ Line: 198 ]]
        -- upvalues: l_StudioCallout_0 (copy), v47 (copy)
        l_StudioCallout_0:Destroy();
        v47:increment();
        v47.callouts[l_StudioCallout_0] = nil;
    end);
    if v48.rowName then
        l_StudioCallout_0.RowName = v48.rowName;
    end;
    l_StudioCallout_0.AnchorPoint = v48.anchorPoint or Vector2.new(1, 0.5);
    l_StudioCallout_0.Parent = l_v9_StudioWidgetFromLabel_0;
    v47.callouts[l_StudioCallout_0] = true;
    return l_StudioCallout_0;
end;
v19.getCurrentStep = function(v51) --[[ Line: 212 ]] --[[ Name: getCurrentStep ]]
    return v51.steps[v51.currentStep];
end;
v19.getCurrentStepData = function(v52) --[[ Line: 216 ]] --[[ Name: getCurrentStepData ]]
    -- upvalues: l_find_0 (copy)
    local v53 = v52:getCurrentStep();
    local v54 = {
        id = v52.data.id, 
        currentStep = v52.currentStep, 
        stepCount = #v52.steps, 
        showNext = v53.data.showNext, 
        topics = v52.topics, 
        topic = l_find_0(v52.topics, v53.data.topic), 
        topicStepCount = 0
    };
    for _, v56 in v52.steps do
        if v56.data.topic == v53.data.topic then
            v54.topicStepCount = v54.topicStepCount + 1;
        end;
        if v56 == v53 then
            v54.topicStep = v54.topicStepCount;
        end;
    end;
    return v54;
end;
v19.increment = function(v57, v58) --[[ Line: 238 ]] --[[ Name: increment ]]
    -- upvalues: v14 (copy)
    if v57.incrementing then
        return;
    else
        v57.incrementing = true;
        local v59 = v57:getCurrentStep();
        if v59 then
            if v59.data.onUnbind then
                v59.data.onUnbind(v57);
            end;
            v59:unbind();
        end;
        local v60 = v57:getCurrentStepData();
        local v61 = false;
        if v60.topic == #v60.topics then
            v61 = v60.topicStep == v60.topicStepCount;
        end;
        if v61 and v14 then
            v57:finishIncrement();
            return;
        elseif v58 then
            if v57.skipping then
                return;
            else
                v57.skipping = true;
                v60.step = {
                    id = v59.data.id, 
                    kind = "Skipped", 
                    description = v57.localization:getText("Tutorial", "StepSkipped")
                };
                v59:skip(v57);
                v57.onStepChanged(v60);
                if v57.currentCallout then
                    v57.currentCallout:Destroy();
                    v57.currentCallout = nil;
                end;
                task.delay(1.5, function() --[[ Line: 276 ]]
                    -- upvalues: v57 (copy)
                    v57.skipping = false;
                    v57:finishIncrement();
                end);
                return;
            end;
        elseif v59.showComplete then
            task.delay(0.4, function() --[[ Line: 282 ]]
                -- upvalues: v60 (copy), v59 (copy), v57 (copy)
                v60.step = {
                    id = v59.data.id, 
                    kind = "Completed", 
                    title = v57.localization:getText(v57.data.id, ("%s_Title"):format(v59.data.id))
                };
                v57.onStepChanged(v60);
                task.delay(2, function() --[[ Line: 290 ]]
                    -- upvalues: v57 (ref)
                    v57:finishIncrement();
                end);
            end);
            return;
        else
            v57:finishIncrement();
            return;
        end;
    end;
end;
v19.back = function(v62) --[[ Line: 299 ]] --[[ Name: back ]]
    if v62.currentStep == 1 then
        return;
    else
        v62:setStep(v62.currentStep - 1);
        return;
    end;
end;
v19.finishIncrement = function(v63) --[[ Line: 306 ]] --[[ Name: finishIncrement ]]
    if v63.currentStep == #v63.steps then
        v63.completed = true;
        if v63.data.onComplete then
            v63.data.onComplete(v63);
        end;
        v63.onCompleted();
    else
        v63:setStep(v63.currentStep + 1);
    end;
    v63.incrementing = false;
end;
v19.selectTopic = function(v64, v65) --[[ Line: 319 ]] --[[ Name: selectTopic ]]
    local v66 = v64:getTopicStep(v65);
    if v66 then
        if v66 < v64.currentStep then
            v64:setStep(v66);
            return;
        elseif v64.currentStep < v66 then
            for v67 = v64.currentStep, v66 - 1 do
                v64.steps[v67]:skip(v64);
            end;
            v64:setStep(v66);
        end;
    end;
end;
v19.getTopicStep = function(v68, v69) --[[ Line: 333 ]] --[[ Name: getTopicStep ]]
    -- upvalues: l_findIndex_0 (copy)
    local v70 = v68.topics[v69];
    return l_findIndex_0(v68.steps, function(v71) --[[ Line: 335 ]]
        -- upvalues: v70 (copy)
        return v71.data.topic == v70;
    end);
end;
v19.showSpotlight = function(v72) --[[ Line: 340 ]] --[[ Name: showSpotlight ]]
    -- upvalues: v13 (copy), v12 (copy)
    local v73 = v72:getCurrentStep();
    local v74 = if v73 then v73.data else nil;
    if not v74.spotlight then
        return;
    else
        if v13 and v74.spotlight.TargetWidgetUri then
            if v74.spotlight.ShowShadows then
                v72.Spotlight:ApplyShadowsAsync();
                v72.Spotlight:ApplySpotlightAsync(v74.spotlight.TargetWidgetUri);
            end;
            if v74.spotlight.ShowBox then
                v72.Spotlight:ApplyFillInBoxAsync(v74.spotlight.TargetWidgetUri);
            end;
            if v74.spotlight.ShowHighlight then
                v72.Spotlight:ApplyHighlightAsync(v74.spotlight.TargetWidgetUri);
                return;
            end;
        else
            local l_v12_WidgetFromLabel_0 = v12:GetWidgetFromLabel(v74.spotlight.target);
            if v74.spotlight.showShadows then
                v12:ApplyShadows();
                v12:ApplySpotlight(l_v12_WidgetFromLabel_0, v74.spotlight.rowName);
            end;
            if v74.spotlight.showBox then
                v12:ApplyFillInBox(l_v12_WidgetFromLabel_0, v74.spotlight.rowName);
            end;
            if v74.spotlight.showHighlight then
                v12:ApplyHighlight(l_v12_WidgetFromLabel_0, v74.spotlight.rowName);
            end;
        end;
        return;
    end;
end;
v19.setToolboxLimits = function(v76, v77) --[[ Line: 373 ]] --[[ Name: setToolboxLimits ]]
    if v76.toolboxLimits == v77 then
        return;
    else
        v76.toolboxLimits = v77;
        local l_toolboxConnection_0 = v76.toolboxConnection;
        if l_toolboxConnection_0:getNamespaceFolder():WaitForChild("SetTutorialLimits", 2) then
            l_toolboxConnection_0:Invoke("SetTutorialLimits", if v77 then {
                assetIds = v77.assetIds, 
                positionOverride = v77.positionOverride, 
                scriptWarningOverride = v77.scriptWarningOverride
            } else {});
        end;
        return;
    end;
end;
v19.syncChildren = function(_, v80, v81, v82) --[[ Line: 395 ]] --[[ Name: syncChildren ]]
    for _, v84 in ipairs(v80:GetChildren()) do
        if v84:IsA(v81) then
            v82(v84);
        end;
    end;
    return v80.ChildAdded:Connect(function(v85) --[[ Line: 401 ]]
        -- upvalues: v81 (copy), v82 (copy)
        if v85:IsA(v81) then
            v82(v85);
        end;
    end);
end;
return v19;