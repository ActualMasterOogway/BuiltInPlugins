local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Components.Contexts.ClassIconContext);
local v2 = require(l_script_FirstAncestor_0.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Components.FieldsList);
local v4 = require(script.IndentGuide);
local v5 = require(l_script_FirstAncestor_0.Util.Observable);
local v6 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v8 = require(l_script_FirstAncestor_0.Util.createNextOrder);
local v9 = require(script.getClassIcon);
local v10 = require(l_script_FirstAncestor_0.Util.profile);
local v11 = require(l_script_FirstAncestor_0.Util.setVisibleExplorerNodeTags);
local _ = require(l_script_FirstAncestor_0.Hooks.useDragAndDrop);
local v13 = require(l_script_FirstAncestor_0.Hooks.useImperativeTagger);
local v14 = require(l_script_FirstAncestor_0.Hooks.useRenameBoxActivity);
local _ = require(l_script_FirstAncestor_0.Hooks.useVisibleExplorerNodeRange);
local l_createElement_0 = v6.createElement;
local function _(v17, v18, v19) --[[ Line: 21 ]] --[[ Name: updateExpandTags ]]
    v19("expand", (("Explorer-%*"):format((v17.getExpandState(v18.datum.id)))));
end;
local v45 = v10(function(v21) --[[ Line: 36 ]] --[[ Name: ExplorerNodeRow ]]
    -- upvalues: v14 (copy), v6 (copy), v1 (copy), v9 (copy), v13 (copy), v11 (copy), v5 (copy), v8 (copy), l_createElement_0 (copy), v2 (copy), v4 (copy), v3 (copy)
    local l_visibleNodeObservable_0 = v21.visibleNodeObservable;
    local v23 = v14(l_visibleNodeObservable_0);
    local v28 = v6.useCallback(function(_, v25) --[[ Line: 48 ]]
        -- upvalues: l_visibleNodeObservable_0 (copy), v21 (copy)
        if v25.UserInputType ~= Enum.UserInputType.MouseButton1 and v25.UserInputType ~= Enum.UserInputType.Touch then
            return;
        else
            local v26 = l_visibleNodeObservable_0.get();
            local v27 = v21.session.getExpandState(v26.datum.id);
            if v25:IsModifierKeyDown(Enum.ModifierKey.Shift) then
                if v27 == "Collapsed" then
                    v21.session.expandAll({
                        v26.datum.id
                    });
                    return;
                elseif v27 == "Expanded" then
                    v21.session.collapseAll({
                        v26.datum.id
                    });
                    return;
                end;
            elseif v27 == "Collapsed" then
                v21.session.expandAsync(v26.datum.id);
                return;
            elseif v27 == "Expanded" then
                v21.session.unexpand(v26.datum.id);
            end;
            return;
        end;
    end, {
        l_visibleNodeObservable_0, 
        v21.session.getExpandState, 
        v21.session.expandAll, 
        v21.session.collapseAll, 
        v21.session.expandAsync, 
        v21.session.unexpand
    });
    local v29 = v6.useContext(v1.Context);
    local v31 = l_visibleNodeObservable_0.getBinding():map(function(v30) --[[ Line: 86 ]]
        -- upvalues: v9 (ref), v29 (copy)
        return v9(v29, v30);
    end);
    local v32 = v6.useRef(nil);
    local v33 = v6.useRef(nil);
    local v34 = v13(v32);
    local v35 = v13(v33);
    local v38 = v6.useCallback(function() --[[ Line: 97 ]]
        -- upvalues: v21 (copy), v11 (ref), v34 (copy), v35 (copy)
        local v36 = v21.visibleNodeObservable.get();
        v11(v36, v21.draggingTargetObservable.get(), v34);
        local l_session_0 = v21.session;
        v35("expand", (("Explorer-%*"):format((l_session_0.getExpandState(v36.datum.id)))));
    end, {
        v21.visibleNodeObservable, 
        v21.draggingTargetObservable, 
        v34, 
        v35
    });
    v5.useEffect(l_visibleNodeObservable_0, v38, {
        v38
    });
    v5.useEffect(v21.draggingTargetObservable, v38, {
        v38
    });
    local v39 = v8();
    return l_createElement_0("Frame", {
        BackgroundTransparency = 1, 
        Visible = l_visibleNodeObservable_0.getBinding():map(function(v40) --[[ Line: 113 ]]
            -- upvalues: v2 (ref)
            return v40.datum.id ~= v2.nilId;
        end), 
        ref = v32, 
        [v6.Tag] = "Explorer-ExplorerNodeRow X-FitX"
    }, {
        Contents = l_createElement_0("Frame", {
            BackgroundTransparency = 1, 
            ZIndex = v39(), 
            [v6.Tag] = "X-Row X-FitX"
        }, {
            IndentGuide = l_createElement_0(v4, {
                layoutOrder = v39(), 
                visibleNodeObservable = v21.visibleNodeObservable
            }), 
            Expand = l_createElement_0("TextButton", {
                LayoutOrder = v39(), 
                [v6.Event.InputBegan] = v28, 
                [v6.Tag] = "X-Fill Explorer-Button Explorer-Square", 
                ref = v33
            }, l_createElement_0("ImageLabel", {
                Size = UDim2.fromOffset(16, 16), 
                [v6.Tag] = "Explorer-View Explorer-Content-Muted Explorer-ArrowImage X-AnchorCenter"
            })), 
            Contents = l_createElement_0("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = v39(), 
                [v6.Tag] = "X-FitX Explorer-GrowX X-RowS X-Middle Explorer-ExplorerNodeRow-Display"
            }, {
                Icon = l_createElement_0("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = v31:map(function(v41) --[[ Line: 158 ]]
                        return v41.Image;
                    end), 
                    ImageRectOffset = v31:map(function(v42) --[[ Line: 161 ]]
                        return v42.ImageRectOffset;
                    end), 
                    ImageRectSize = v31:map(function(v43) --[[ Line: 164 ]]
                        return v43.ImageRectSize;
                    end), 
                    LayoutOrder = v39(), 
                    ScaleType = Enum.ScaleType.Tile, 
                    Size = UDim2.fromOffset(v2.iconSize, v2.iconSize), 
                    [v6.Tag] = "data-testid=ExplorerNodeRow-Icon"
                }), 
                Name = l_createElement_0("TextLabel", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = v39(), 
                    Text = l_visibleNodeObservable_0.getBinding():map(function(v44) --[[ Line: 179 ]]
                        return v44.datum.name;
                    end), 
                    TextTransparency = v23.enabled and 1 or nil, 
                    ref = v21.textLabelRef, 
                    [v6.Tag] = "X-FitX Explorer-Content-Muted Explorer-Text-Size-14 data-testid=ExplorerNodeRow-Name"
                })
            }), 
            Fields = l_createElement_0(v3, {
                visibleNodeObservable = l_visibleNodeObservable_0, 
                session = v21.session, 
                layoutOrder = v39()
            })
        })
    });
end);
return (v6.memo(v45));