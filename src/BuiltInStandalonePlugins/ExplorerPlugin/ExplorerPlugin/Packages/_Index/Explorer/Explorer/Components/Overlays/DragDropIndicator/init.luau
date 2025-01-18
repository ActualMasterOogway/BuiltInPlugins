local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Util.Observable);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v5 = require(l_script_FirstAncestor_0.Util.createNextOrder);
local v6 = require(l_script_FirstAncestor_0.Util.find);
local v7 = require(l_script_FirstAncestor_0.Util.joinAndMapBindings);
local v8 = require(l_script_FirstAncestor_0.Util.mapValues);
local _ = require(l_script_FirstAncestor_0.Hooks.useDragAndDrop);
local _ = require(l_script_FirstAncestor_0.Hooks.useVisibleExplorerNodeRange);
local l_createElement_0 = v3.createElement;
local function v16(v12, v13) --[[ Line: 20 ]] --[[ Name: visibleNodeByIdBinding ]]
    -- upvalues: v3 (copy), v6 (copy)
    return v3.joinBindings(v12):map(function(v14) --[[ Line: 25 ]]
        -- upvalues: v6 (ref), v13 (copy)
        return v6(v14, function(v15) --[[ Line: 26 ]]
            -- upvalues: v13 (ref)
            return v15.datum.id == v13;
        end);
    end);
end;
return function(v17) --[[ Line: 32 ]] --[[ Name: DragDropIndicator ]]
    -- upvalues: v2 (copy), v3 (copy), v8 (copy), v5 (copy), l_createElement_0 (copy), v7 (copy), v16 (copy), v1 (copy)
    local v18 = v2.use(v17.draggingTargetObservable);
    local v20 = v3.useMemo(function() --[[ Line: 42 ]]
        -- upvalues: v8 (ref), v17 (copy)
        return v8(v17.visibleNodeObservables, function(v19) --[[ Line: 43 ]]
            return v19.getBinding();
        end);
    end, {
        v17.visibleNodeObservables
    });
    if v18 == nil then
        return nil;
    else
        local v21 = v5();
        local l_l_createElement_0_0 = l_createElement_0;
        local l_Fragment_0 = v3.Fragment;
        local v24 = {};
        local v27 = {
            Target = l_createElement_0("Frame", {
                BackgroundTransparency = 1, 
                Position = v7(function(v25, v26) --[[ Line: 59 ]]
                    if v26 then
                        return UDim2.fromOffset(0, v26.yPixels - v25 + 2);
                    else
                        return UDim2.fromScale(0, -1000);
                    end;
                end, v17.scrollHeightObservable.getBinding(), v16(v20, v18.targetId)), 
                Size = UDim2.new(1, -4, 0, v1.explorerRowHeight - 4), 
                ZIndex = v21(), 
                [v3.Tag] = "Explorer-DragDropIndicator-Target"
            })
        };
        local v28 = false;
        if v18.type == "below" then
            v28 = l_createElement_0("Frame", {
                BorderSizePixel = 0, 
                Position = v7(function(v29, v30, v31) --[[ Line: 80 ]]
                    -- upvalues: v1 (ref), v18 (copy)
                    if v31 then
                        return UDim2.fromOffset(v1.indentWidth * (v18.targetDepth + 1) - v30, v31.yPixels - v29 + v1.explorerRowHeight - 1);
                    else
                        return UDim2.fromScale(0, -1000);
                    end;
                end, v17.scrollHeightObservable.getBinding(), v17.scrollWidthObservable.getBinding(), v16(v20, v18.belowId)), 
                Size = UDim2.new(1, 0, 0, 1), 
                ZIndex = v21(), 
                [v3.Tag] = "Explorer-BG-Shift300"
            });
        end;
        v27.Thumb = v28;
        return l_l_createElement_0_0(l_Fragment_0, v24, v27);
    end;
end;