local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
if require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagDevFrameworkRibbonHooks)() then
    return v3.UI.Hooks.useTooltip;
else
    local l_StudioRibbonHideOldTooltips_0 = game:GetFastFlag("StudioRibbonHideOldTooltips");
    local v5 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagUseTooltipSizeAttachmentFixes)();
    local _ = require(l_script_FirstAncestor_0.Src.Types);
    local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
    local l_useCallback_0 = v1.useCallback;
    local l_useEffect_0 = v1.useEffect;
    local l_useRef_0 = v1.useRef;
    local l_Plugin_0 = v3.ContextServices.Plugin;
    local v12 = require(l_script_FirstAncestor_0.Src.Util.DesignContext);
    local l_counter_0 = v3.Util.counter;
    local l_joinTags_0 = v3.Styling.joinTags;
    local v15 = require(script.Parent.TooltipSettings);
    local function _(v16) --[[ Line: 54 ]] --[[ Name: stringifyShortcuts ]]
        local v17 = "";
        for v18, v19 in ipairs(v16) do
            if v18 > 1 then
                v17 = v17 .. ", ";
            end;
            v17 = v17 .. v19;
        end;
        return v17;
    end;
    local function _(v21, v22, v23, v24) --[[ Line: 65 ]] --[[ Name: getFrameSize ]]
        local v25 = 0;
        if v22.current then
            v25 = v22.current.AbsoluteSize.X;
        end;
        if v23.current then
            v25 = math.max(v25, v23.current.AbsoluteSize.X);
        end;
        if v24 then
            v25 = v25 + 24;
        end;
        return (Vector2.new(math.min(v21.X, v25) + 12, v21.Y));
    end;
    local function v64(v27) --[[ Line: 80 ]] --[[ Name: Tooltip ]]
        -- upvalues: l_useRef_0 (copy), l_counter_0 (copy), l_useEffect_0 (copy), v5 (copy), v1 (copy), l_joinTags_0 (copy)
        local v28 = l_useRef_0(nil);
        local v29 = l_useRef_0(nil);
        local v30 = l_useRef_0(nil);
        local v31 = l_counter_0();
        l_useEffect_0(function() --[[ Line: 85 ]]
            -- upvalues: v5 (ref), v28 (copy), v29 (copy), v30 (copy), v27 (copy)
            if v5 then
                if v28.current then
                    local l_AbsoluteSize_0 = v28.current.AbsoluteSize;
                    local l_v29_0 = v29;
                    local l_v30_0 = v30;
                    local v35 = v27.Icon ~= nil;
                    local v36 = 0;
                    if l_v29_0.current then
                        v36 = l_v29_0.current.AbsoluteSize.X;
                    end;
                    if l_v30_0.current then
                        v36 = math.max(v36, l_v30_0.current.AbsoluteSize.X);
                    end;
                    if v35 then
                        v36 = v36 + 24;
                    end;
                    local v37 = Vector2.new(math.min(l_AbsoluteSize_0.X, v36) + 12, l_AbsoluteSize_0.Y);
                    v27.OnResize(v37);
                    return;
                end;
            elseif v27.DEPRECATED_OnResize and v28.current then
                v27.DEPRECATED_OnResize(v28.current);
            end;
        end, {
            v27.Title, 
            v27.Text, 
            v27.Icon
        });
        local l_createElement_0 = v1.createElement;
        local v39 = "Frame";
        local v47 = {
            ref = v28, 
            [v1.Change.AbsoluteSize] = function(v40) --[[ Line: 100 ]]
                -- upvalues: v5 (ref), v29 (copy), v30 (copy), v27 (copy)
                if v5 then
                    local l_AbsoluteSize_1 = v40.AbsoluteSize;
                    local l_v29_1 = v29;
                    local l_v30_1 = v30;
                    local v44 = v27.Icon ~= nil;
                    local v45 = 0;
                    if l_v29_1.current then
                        v45 = l_v29_1.current.AbsoluteSize.X;
                    end;
                    if l_v30_1.current then
                        v45 = math.max(v45, l_v30_1.current.AbsoluteSize.X);
                    end;
                    if v44 then
                        v45 = v45 + 24;
                    end;
                    local v46 = Vector2.new(math.min(l_AbsoluteSize_1.X, v45) + 12, l_AbsoluteSize_1.Y);
                    v27.OnResize(v46);
                    return;
                else
                    v27.DEPRECATED_OnResize(v40);
                    return;
                end;
            end, 
            [v1.Tag] = v5 and "TooltipBackground X-RowSpace50 X-FitY X-PadTooltip X-Middle" or "TooltipBackground X-RowSpace50 X-Fit X-PadTooltip X-Middle", 
            Size = if v5 then UDim2.new(0, 1000, 0, 0) else nil
        };
        local v48 = {
            Icon = if v27.Icon then v1.createElement("ImageLabel", {
                Image = v27.Icon, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(24, 24), 
                LayoutOrder = v31()
            }) else nil
        };
        local l_createElement_1 = v1.createElement;
        local v50 = "Frame";
        local v51 = {
            LayoutOrder = v31(), 
            [v1.Tag] = "Role-Surface X-Fit X-ColumnSpace25"
        };
        local v52 = {};
        local l_createElement_2 = v1.createElement;
        local v54 = "Frame";
        local v55 = {
            ref = if v5 then v30 else nil, 
            LayoutOrder = v31(), 
            [v1.Tag] = "Role-Surface X-Fit X-RowSpace50"
        };
        local v56 = {
            Title = if v27.Title then v1.createElement("TextLabel", {
                LayoutOrder = v31(), 
                Text = v27.Title, 
                [v1.Tag] = "X-Fit Text-Title"
            }) else nil
        };
        local v57;
        if v27.Shortcuts then
            v57 = v1.createElement;
            local v58 = "TextLabel";
            local v59 = {
                LayoutOrder = v31()
            };
            local l_Shortcuts_0 = v27.Shortcuts;
            local v61 = "";
            for v62, v63 in ipairs(l_Shortcuts_0) do
                if v62 > 1 then
                    v61 = v61 .. ", ";
                end;
                v61 = v61 .. v63;
            end;
            v59.Text = v61;
            v59[v1.Tag] = "X-Fit Text-Label";
            v57 = v57(v58, v59);
        else
            v57 = nil;
        end;
        v56.Shortcuts = v57;
        v52.TitleFrame = l_createElement_2(v54, v55, v56);
        v52.Text = if v27.Text then v1.createElement("TextLabel", {
            ref = if v5 then v29 else nil, 
            LayoutOrder = v31(), 
            Text = v27.Text, 
            [v1.Tag] = l_joinTags_0("Text-Label X-Fit", v5 and "TooltipTextBounds" or nil)
        }) else nil;
        v48.Content = l_createElement_1(v50, v51, v52);
        v48.StyleLink = v1.createElement("StyleLink", {
            StyleSheet = v27.Design
        });
        return l_createElement_0(v39, v47, v48);
    end;
    local v65 = nil;
    local v66 = nil;
    local function v68(v67) --[[ Line: 165 ]] --[[ Name: loadTooltipPanel ]]
        -- upvalues: v65 (ref), v66 (ref), v2 (copy)
        if v65 then
            return v65;
        else
            v65 = v67:CreateQWidgetPluginGui("Tooltip", {
                Id = "Tooltip", 
                InitialEnabled = false, 
                MinSize = Vector2.new(50, 50), 
                Modal = false, 
                Tooltip = true, 
                Resizable = true, 
                Size = Vector2.new(220, 224), 
                Title = "Tooltip"
            });
            v65.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            v66 = v2.createRoot(v65);
            return v65;
        end;
    end;
    local function v81(v69, v70, v71) --[[ Line: 184 ]] --[[ Name: showTooltip ]]
        -- upvalues: v68 (copy), l_join_0 (copy), v66 (ref), v1 (copy), v64 (copy), v5 (copy), v15 (copy), l_StudioRibbonHideOldTooltips_0 (copy)
        local v72 = v68(v69);
        local l_v69_Uri_0 = v69:GetUri();
        local v74 = l_join_0(l_v69_Uri_0, {
            Category = "Panels", 
            ItemId = "Tooltip"
        });
        local l_v69_PluginComponent_0 = v69:GetPluginComponent("Panels");
        v66:render(v1.createElement(v64, l_join_0(v70, {
            Design = v71, 
            OnResize = v5 and function(v76) --[[ Line: 201 ]]
                -- upvalues: l_v69_PluginComponent_0 (copy), v74 (copy)
                l_v69_PluginComponent_0:SetSizeAsync(v74, v76);
            end or nil, 
            DEPRECATED_OnResize = if v5 then nil else function(v77) --[[ Line: 207 ]]
                -- upvalues: l_v69_PluginComponent_0 (copy), v74 (copy)
                l_v69_PluginComponent_0:SetSizeAsync(v74, v77.AbsoluteSize);
            end
        })));
        local v78 = Vector2.new(0, 1);
        local v79 = Vector2.new(0, 0);
        if v5 and v70.Location then
            if v70.Location == "Above" then
                v78 = Vector2.new(0, 0);
                v79 = Vector2.new(0, 1);
            elseif v70.Location == "Below" then
                v78 = Vector2.new(0, 1);
                v79 = Vector2.new(0, 0);
            elseif v70.Location == "Left" then
                v78 = Vector2.new(0, 0);
                v79 = Vector2.new(1, 0);
            elseif v70.Location == "Right" then
                v78 = Vector2.new(1, 0);
                v79 = Vector2.new(0, 0);
            end;
        end;
        l_v69_PluginComponent_0:SetAttachmentAsync(v74, {
            TargetWidgetUri = v70.Uri, 
            TargetAnchorPoint = v78, 
            SubjectAnchorPoint = v79, 
            Offset = Vector2.new(0, 0)
        });
        local l_v15_0 = v15;
        l_v15_0.uniqueTooltipId = l_v15_0.uniqueTooltipId + 1;
        l_v15_0 = v15.uniqueTooltipId;
        delay(v15.showDelay, function() --[[ Line: 243 ]]
            -- upvalues: v15 (ref), l_v15_0 (copy), l_StudioRibbonHideOldTooltips_0 (ref), l_v69_PluginComponent_0 (copy), v74 (copy), v72 (copy)
            if v15.uniqueTooltipId == l_v15_0 then
                if l_StudioRibbonHideOldTooltips_0 then
                    l_v69_PluginComponent_0:ShowIfAttachedAsync(v74);
                    return;
                else
                    v72.Enabled = true;
                end;
            end;
        end);
    end;
    local function _(v82) --[[ Line: 255 ]] --[[ Name: hideTooltip ]]
        -- upvalues: v15 (copy), v68 (copy), v66 (ref)
        local l_v15_1 = v15;
        l_v15_1.uniqueTooltipId = l_v15_1.uniqueTooltipId + 1;
        l_v15_1 = v15.uniqueTooltipId;
        delay(v15.hideDelay, function() --[[ Line: 259 ]]
            -- upvalues: v15 (ref), l_v15_1 (copy), v68 (ref), v82 (copy), v66 (ref)
            if v15.uniqueTooltipId == l_v15_1 then
                v68(v82).Enabled = false;
                v66:render(nil);
            end;
        end);
    end;
    return function(v85) --[[ Line: 268 ]] --[[ Name: useTooltip ]]
        -- upvalues: l_Plugin_0 (copy), v12 (copy), l_useRef_0 (copy), l_useCallback_0 (copy), v15 (copy), v81 (copy), v68 (copy), v66 (ref)
        local v86 = l_Plugin_0.use();
        local v87 = v12.use();
        local v88 = l_useRef_0(false);
        local v89 = {
            v85.Uri, 
            v85.Title, 
            v85.Icon, 
            v85.Text
        };
        return l_useCallback_0(function() --[[ Line: 274 ]]
            -- upvalues: v88 (copy), v15 (ref), v85 (copy), v86 (copy), v87 (copy), v81 (ref)
            if v88.current then
                return;
            elseif v15.disableAllTooltips then
                return;
            elseif not v85.Text then
                return;
            else
                v88.current = true;
                local v90 = v86:get();
                local v91 = v87:get();
                v81(v90, v85, v91);
                return;
            end;
        end, v89), (l_useCallback_0(function() --[[ Line: 293 ]]
            -- upvalues: v88 (copy), v86 (copy), v15 (ref), v68 (ref), v66 (ref)
            if not v88.current then
                return;
            else
                v88.current = false;
                local v92 = v86:get();
                local l_v15_2 = v15;
                l_v15_2.uniqueTooltipId = l_v15_2.uniqueTooltipId + 1;
                l_v15_2 = v15.uniqueTooltipId;
                delay(v15.hideDelay, function() --[[ Line: 259 ]]
                    -- upvalues: v15 (ref), l_v15_2 (copy), v68 (ref), v92 (copy), v66 (ref)
                    if v15.uniqueTooltipId == l_v15_2 then
                        v68(v92).Enabled = false;
                        v66:render(nil);
                    end;
                end);
                return;
            end;
        end, v89));
    end;
end;