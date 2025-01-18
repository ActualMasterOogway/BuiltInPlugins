local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.React);
local v2 = require(l_Parent_0.Util.ReactRoblox);
local _ = require(l_Parent_0.Types);
local v4 = require(l_Parent_0.Styling.joinTags);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local l_useCallback_0 = v1.useCallback;
local l_useEffect_0 = v1.useEffect;
local l_useRef_0 = v1.useRef;
local v9 = require(l_Parent_0.ContextServices);
local l_Design_0 = v9.Design;
local l_Plugin_0 = v9.Plugin;
local l_counter_0 = require(l_Parent_0.Util).counter;
local v13 = require(script.TooltipSettings);
local v14 = require(l_Parent_0.SharedFlags.getFFlagUseTooltipSizeAttachmentFixes)();
local function _(v15) --[[ Line: 54 ]] --[[ Name: stringifyShortcuts ]]
    local v16 = "";
    for v17, v18 in ipairs(v15) do
        if v17 > 1 then
            v16 = v16 .. ", ";
        end;
        v16 = v16 .. v18;
    end;
    return v16;
end;
local function _(v20, v21, v22, v23) --[[ Line: 65 ]] --[[ Name: getFrameSize ]]
    local v24 = 0;
    if v21.current then
        v24 = v21.current.AbsoluteSize.X;
    end;
    if v22.current then
        v24 = math.max(v24, v22.current.AbsoluteSize.X);
    end;
    if v23 then
        v24 = v24 + 24;
    end;
    return (Vector2.new(math.min(v20.X, v24) + 12, v20.Y));
end;
local function _(v26, v27) --[[ Line: 80 ]] --[[ Name: performDebouncedAction ]]
    -- upvalues: v13 (copy)
    local l_v13_0 = v13;
    l_v13_0.uniqueTooltipId = l_v13_0.uniqueTooltipId + 1;
    l_v13_0 = v13.uniqueTooltipId;
    delay(v26, function() --[[ Line: 83 ]]
        -- upvalues: v13 (ref), l_v13_0 (copy), v27 (copy)
        if v13.uniqueTooltipId == l_v13_0 then
            v27();
        end;
    end);
end;
local function v67(v30) --[[ Line: 90 ]] --[[ Name: Tooltip ]]
    -- upvalues: l_useRef_0 (copy), l_counter_0 (copy), l_useEffect_0 (copy), v14 (copy), v1 (copy), v4 (copy)
    local v31 = l_useRef_0(nil);
    local v32 = l_useRef_0(nil);
    local v33 = l_useRef_0(nil);
    local v34 = l_counter_0();
    l_useEffect_0(function() --[[ Line: 95 ]]
        -- upvalues: v14 (ref), v31 (copy), v32 (copy), v33 (copy), v30 (copy)
        if v14 then
            if v31.current then
                local l_AbsoluteSize_0 = v31.current.AbsoluteSize;
                local l_v32_0 = v32;
                local l_v33_0 = v33;
                local v38 = v30.Icon ~= nil;
                local v39 = 0;
                if l_v32_0.current then
                    v39 = l_v32_0.current.AbsoluteSize.X;
                end;
                if l_v33_0.current then
                    v39 = math.max(v39, l_v33_0.current.AbsoluteSize.X);
                end;
                if v38 then
                    v39 = v39 + 24;
                end;
                local v40 = Vector2.new(math.min(l_AbsoluteSize_0.X, v39) + 12, l_AbsoluteSize_0.Y);
                v30.OnResize(v40);
                return;
            end;
        elseif v30.DEPRECATED_OnResize and v31.current then
            v30.DEPRECATED_OnResize(v31.current);
        end;
    end, {
        v30.Title, 
        v30.Text, 
        v30.Icon
    });
    local l_createElement_0 = v1.createElement;
    local v42 = "Frame";
    local v50 = {
        ref = v31, 
        [v1.Change.AbsoluteSize] = function(v43) --[[ Line: 110 ]]
            -- upvalues: v14 (ref), v32 (copy), v33 (copy), v30 (copy)
            if v14 then
                local l_AbsoluteSize_1 = v43.AbsoluteSize;
                local l_v32_1 = v32;
                local l_v33_1 = v33;
                local v47 = v30.Icon ~= nil;
                local v48 = 0;
                if l_v32_1.current then
                    v48 = l_v32_1.current.AbsoluteSize.X;
                end;
                if l_v33_1.current then
                    v48 = math.max(v48, l_v33_1.current.AbsoluteSize.X);
                end;
                if v47 then
                    v48 = v48 + 24;
                end;
                local v49 = Vector2.new(math.min(l_AbsoluteSize_1.X, v48) + 12, l_AbsoluteSize_1.Y);
                v30.OnResize(v49);
                return;
            else
                v30.DEPRECATED_OnResize(v43);
                return;
            end;
        end, 
        [v1.Tag] = v14 and "TooltipBackground X-RowSpace50 X-FitY X-PadTooltip X-Middle" or "TooltipBackground X-RowSpace50 X-Fit X-PadTooltip X-Middle", 
        Size = if v14 then UDim2.new(0, 1000, 0, 0) else nil
    };
    local v51 = {
        Icon = if v30.Icon then v1.createElement("ImageLabel", {
            Image = v30.Icon, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(24, 24), 
            LayoutOrder = v34()
        }) else nil
    };
    local l_createElement_1 = v1.createElement;
    local v53 = "Frame";
    local v54 = {
        LayoutOrder = v34(), 
        [v1.Tag] = "Role-Surface X-Fit X-ColumnSpace25"
    };
    local v55 = {};
    local l_createElement_2 = v1.createElement;
    local v57 = "Frame";
    local v58 = {
        ref = if v14 then v33 else nil, 
        LayoutOrder = v34(), 
        [v1.Tag] = "Role-Surface X-Fit X-RowSpace50"
    };
    local v59 = {
        Title = if v30.Title then v1.createElement("TextLabel", {
            LayoutOrder = v34(), 
            Text = v30.Title, 
            [v1.Tag] = "X-Fit Text-Title"
        }) else nil
    };
    local v60;
    if v30.Shortcuts then
        v60 = v1.createElement;
        local v61 = "TextLabel";
        local v62 = {
            LayoutOrder = v34()
        };
        local l_Shortcuts_0 = v30.Shortcuts;
        local v64 = "";
        for v65, v66 in ipairs(l_Shortcuts_0) do
            if v65 > 1 then
                v64 = v64 .. ", ";
            end;
            v64 = v64 .. v66;
        end;
        v62.Text = v64;
        v62[v1.Tag] = "X-Fit Text-Label";
        v60 = v60(v61, v62);
    else
        v60 = nil;
    end;
    v59.Shortcuts = v60;
    v55.TitleFrame = l_createElement_2(v57, v58, v59);
    v55.Text = if v30.Text then v1.createElement("TextLabel", {
        ref = if v14 then v32 else nil, 
        LayoutOrder = v34(), 
        Text = v30.Text, 
        [v1.Tag] = v4("Text-Label X-Fit", v14 and "TooltipTextBounds" or nil)
    }) else nil;
    v51.Content = l_createElement_1(v53, v54, v55);
    v51.StyleLink = v1.createElement("StyleLink", {
        StyleSheet = v30.Design
    });
    return l_createElement_0(v42, v50, v51);
end;
local v68 = nil;
local v69 = nil;
local function v71(v70) --[[ Line: 175 ]] --[[ Name: loadTooltipPanel ]]
    -- upvalues: v68 (ref), v69 (ref), v2 (copy)
    if v68 then
        return v68;
    else
        v68 = v70:CreateQWidgetPluginGui("Tooltip", {
            Id = "Tooltip", 
            InitialEnabled = false, 
            MinSize = Vector2.new(50, 50), 
            Modal = false, 
            Tooltip = true, 
            Resizable = true, 
            Size = Vector2.new(220, 224), 
            Title = "Tooltip"
        });
        v68.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        v69 = v2.createRoot(v68);
        return v68;
    end;
end;
local function v86(v72, v73, v74) --[[ Line: 194 ]] --[[ Name: showTooltip ]]
    -- upvalues: v71 (copy), l_join_0 (copy), v69 (ref), v1 (copy), v67 (copy), v14 (copy), v13 (copy)
    local v75 = v71(v72);
    local l_v72_Uri_0 = v72:GetUri();
    local v77 = l_join_0(l_v72_Uri_0, {
        Category = "Panels", 
        ItemId = "Tooltip"
    });
    local l_v72_PluginComponent_0 = v72:GetPluginComponent("Panels");
    v69:render(v1.createElement(v67, l_join_0(v73, {
        Design = v74, 
        OnResize = v14 and function(v79) --[[ Line: 208 ]]
            -- upvalues: l_v72_PluginComponent_0 (copy), v77 (copy)
            l_v72_PluginComponent_0:SetSizeAsync(v77, v79);
        end or nil, 
        DEPRECATED_OnResize = if v14 then nil else function(v80) --[[ Line: 214 ]]
            -- upvalues: l_v72_PluginComponent_0 (copy), v77 (copy)
            l_v72_PluginComponent_0:SetSizeAsync(v77, v80.AbsoluteSize);
        end
    })));
    local v81 = Vector2.new(0, 1);
    local v82 = Vector2.new(0, 0);
    if v14 and v73.Location then
        if v73.Location == "Above" then
            v81 = Vector2.new(0, 0);
            v82 = Vector2.new(0, 1);
        elseif v73.Location == "Below" then
            v81 = Vector2.new(0, 1);
            v82 = Vector2.new(0, 0);
        elseif v73.Location == "Left" then
            v81 = Vector2.new(0, 0);
            v82 = Vector2.new(1, 0);
        elseif v73.Location == "Right" then
            v81 = Vector2.new(1, 0);
            v82 = Vector2.new(0, 0);
        end;
    end;
    l_v72_PluginComponent_0:SetAttachmentAsync(v77, {
        TargetWidgetUri = v73.Uri, 
        TargetAnchorPoint = v81, 
        SubjectAnchorPoint = v82, 
        Offset = Vector2.new(0, 0)
    });
    local l_showDelay_0 = v13.showDelay;
    local function v84() --[[ Line: 247 ]]
        -- upvalues: v75 (copy)
        v75.Enabled = true;
    end;
    local l_v13_1 = v13;
    l_v13_1.uniqueTooltipId = l_v13_1.uniqueTooltipId + 1;
    l_v13_1 = v13.uniqueTooltipId;
    delay(l_showDelay_0, function() --[[ Line: 83 ]]
        -- upvalues: v13 (ref), l_v13_1 (copy), v84 (copy)
        if v13.uniqueTooltipId == l_v13_1 then
            v84();
        end;
    end);
end;
local function _(v87) --[[ Line: 252 ]] --[[ Name: hideTooltip ]]
    -- upvalues: v13 (copy), v71 (copy), v69 (ref)
    local l_hideDelay_0 = v13.hideDelay;
    local function v89() --[[ Line: 254 ]]
        -- upvalues: v71 (ref), v87 (copy), v69 (ref)
        v71(v87).Enabled = false;
        v69:render(nil);
    end;
    local l_v13_2 = v13;
    l_v13_2.uniqueTooltipId = l_v13_2.uniqueTooltipId + 1;
    l_v13_2 = v13.uniqueTooltipId;
    delay(l_hideDelay_0, function() --[[ Line: 83 ]]
        -- upvalues: v13 (ref), l_v13_2 (copy), v89 (copy)
        if v13.uniqueTooltipId == l_v13_2 then
            v89();
        end;
    end);
end;
return function(v92) --[[ Line: 261 ]] --[[ Name: useTooltip ]]
    -- upvalues: l_Plugin_0 (copy), l_Design_0 (copy), l_useRef_0 (copy), l_useCallback_0 (copy), v13 (copy), v86 (copy), v71 (copy), v69 (ref)
    local v93 = l_Plugin_0.use();
    local v94 = l_Design_0.use();
    local v95 = l_useRef_0(false);
    local v96 = {
        v92.Uri, 
        v92.Title, 
        v92.Icon, 
        v92.Text
    };
    return l_useCallback_0(function() --[[ Line: 267 ]]
        -- upvalues: v95 (copy), v13 (ref), v92 (copy), v93 (copy), v94 (copy), v86 (ref)
        if v95.current then
            return;
        elseif v13.disableAllTooltips then
            return;
        elseif not v92.Text then
            return;
        else
            v95.current = true;
            local v97 = v93:get();
            local v98 = v94:get();
            v86(v97, v92, v98);
            return;
        end;
    end, v96), (l_useCallback_0(function() --[[ Line: 286 ]]
        -- upvalues: v95 (copy), v93 (copy), v13 (ref), v71 (ref), v69 (ref)
        if not v95.current then
            return;
        else
            v95.current = false;
            local v99 = v93:get();
            local l_hideDelay_1 = v13.hideDelay;
            local function v101() --[[ Line: 254 ]]
                -- upvalues: v71 (ref), v99 (copy), v69 (ref)
                v71(v99).Enabled = false;
                v69:render(nil);
            end;
            local l_v13_3 = v13;
            l_v13_3.uniqueTooltipId = l_v13_3.uniqueTooltipId + 1;
            l_v13_3 = v13.uniqueTooltipId;
            delay(l_hideDelay_1, function() --[[ Line: 83 ]]
                -- upvalues: v13 (ref), l_v13_3 (copy), v101 (copy)
                if v13.uniqueTooltipId == l_v13_3 then
                    v101();
                end;
            end);
            return;
        end;
    end, v96));
end;