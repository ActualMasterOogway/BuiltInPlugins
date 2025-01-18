local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.RoactGamepad);
local v6 = require(script.Parent.CursorContext);
local v7 = require(script.Parent.CursorComponent);
local v8 = require(script.Parent.Cursors.Cursor);
local v9 = require(l_script_FirstAncestor_0.Enums.CursorType);
local function v19(v10) --[[ Line: 20 ]]
    local v11 = 1e999;
    local v12 = 1e999;
    local v13 = 1e999;
    local v14 = 1e999;
    for v15, v16 in string.split(v10, " ") do
        local v17 = tonumber(v16);
        if v17 ~= nil then
            if v15 == 1 then
                v11 = v17;
            elseif v15 == 2 then
                v12 = v17;
            elseif v15 == 3 then
                v13 = v17;
            elseif v15 == 4 then
                v14 = v17;
            end;
        end;
    end;
    local v18 = false;
    if v11 ~= 1e999 then
        v18 = false;
        if v12 ~= 1e999 then
            v18 = false;
            if v13 ~= 1e999 then
                v18 = v14 ~= 1e999;
            end;
        end;
    end;
    assert(v18, "Error! Not all parameters are decoded.");
    return UDim.new(v11, (math.max(0, v12 + v13))), v13, v14;
end;
return function(v20) --[[ Line: 49 ]] --[[ Name: CursorProvider ]]
    -- upvalues: v4 (copy), v5 (copy), v9 (copy), v8 (copy), v19 (copy), v7 (copy), l_CoreGui_0 (copy), l_GuiService_0 (copy), v6 (copy)
    local v21, v22 = v4.useState({});
    local v23 = v4.useRef(nil);
    local v24, v25 = v4.useState(nil);
    local v26 = v5.useRefCache();
    local v27 = v4.useMemo(function() --[[ Line: 55 ]]
        -- upvalues: v26 (copy), v22 (copy)
        return {
            refCache = v26, 
            setMountedCursors = v22
        };
    end, {
        v26, 
        v22
    });
    local function v35() --[[ Line: 62 ]]
        -- upvalues: v21 (copy), v26 (copy), v24 (copy), v9 (ref), v4 (ref), v8 (ref), v19 (ref), v7 (ref)
        local v28 = {};
        for v29, _ in v21 do
            local v31 = false;
            if v26[v29] ~= nil then
                v31 = false;
                if v24 ~= nil then
                    v31 = v26[v29].current == v24;
                end;
            end;
            if v9[v29] ~= nil then
                v28[v29] = v4.createElement(v8, {
                    ref = v26[v29], 
                    isVisible = v31, 
                    cursorType = v29
                });
            else
                local v32, v33, v34 = v19(v29);
                v28[v29] = v4.createElement(v7, {
                    ref = v26[v29], 
                    isVisible = v31, 
                    cornerRadius = v32, 
                    offset = v33, 
                    borderWidth = v34
                });
            end;
        end;
        return v28;
    end;
    v4.useEffect(function() --[[ Line: 93 ]]
        -- upvalues: v23 (copy), l_CoreGui_0 (ref), l_GuiService_0 (ref), v25 (copy)
        if v23.current == nil or not v23.current:IsDescendantOf(game) then
            return;
        else
            local v36 = v23.current ~= nil and v23.current:IsDescendantOf(l_CoreGui_0);
            local function v37() --[[ Line: 102 ]] --[[ Name: setUpSelectionImageObjectConnection ]]
                -- upvalues: v36 (copy), l_GuiService_0 (ref), v25 (ref)
                if v36 then
                    return l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 107 ]]
                        -- upvalues: l_GuiService_0 (ref), v25 (ref)
                        if l_GuiService_0.SelectedCoreObject == nil then
                            v25(nil);
                            return;
                        else
                            v25(l_GuiService_0.SelectedCoreObject.SelectionImageObject);
                            return;
                        end;
                    end);
                else
                    return l_GuiService_0:GetPropertyChangedSignal("SelectedObject"):Connect(function() --[[ Line: 115 ]]
                        -- upvalues: l_GuiService_0 (ref), v25 (ref)
                        if l_GuiService_0.SelectedObject == nil then
                            v25(nil);
                            return;
                        else
                            v25(l_GuiService_0.SelectedObject.SelectionImageObject);
                            return;
                        end;
                    end);
                end;
            end;
            local v38 = v37();
            local v39 = if v23.current ~= nil then v23.current.AncestryChanged:Connect(function() --[[ Line: 127 ]]
                -- upvalues: v38 (ref), v37 (copy)
                v38:Disconnect();
                v38 = v37();
            end) else nil;
            return function() --[[ Line: 138 ]]
                -- upvalues: v38 (ref), v39 (copy)
                v38:Disconnect();
                if v39 ~= nil then
                    v39:Disconnect();
                end;
            end;
        end;
    end, {});
    return v4.createElement(v6.Provider, {
        value = v27
    }, {
        Children = v4.createElement(v4.Fragment, {}, v20.children), 
        FoundationInvisibleContainer = v4.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 0), 
            Visible = false, 
            ref = v23
        }, (v35()))
    });
end;