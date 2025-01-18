local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v2 = require(l_script_FirstAncestor_0.Packages.Dev.Rhodium);
local v3 = require(l_script_FirstAncestor_0.Packages.Dev.ReactTestingLibrary);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v5 = require(l_Util_0.CircularBuffer);
local v6 = require(l_Util_0.Constants);
local v7 = require(l_Util_0.debugFlags);
local v8 = {};
v8.findDeepInstance = function(v9, v10) --[[ Line: 16 ]] --[[ Name: findDeepInstance ]]
    -- upvalues: v8 (copy)
    if v9 and v10 and #v10 > 0 then
        local v11 = table.remove(v10, 1);
        if v11 then
            local l_v9_FirstChild_0 = v9:FindFirstChild(v11);
            if l_v9_FirstChild_0 then
                return (v8.findDeepInstance(l_v9_FirstChild_0, v10));
            else
                return nil;
            end;
        else
            return nil;
        end;
    else
        return v9;
    end;
end;
v8.getLayerView = function(v13) --[[ Line: 28 ]] --[[ Name: getLayerView ]]
    -- upvalues: v8 (copy)
    return v8.findDeepInstance(v13, {
        "MainSplitPane", 
        "Contents", 
        "Pane 2", 
        "Child", 
        "LayerData"
    });
end;
v8.getLayerTree = function(v14) --[[ Line: 32 ]] --[[ Name: getLayerTree ]]
    -- upvalues: v8 (copy)
    return v8.findDeepInstance(v14, {
        "MainSplitPane", 
        "Contents", 
        "Pane 1", 
        "Child"
    });
end;
v8.getLayerViewItem = function(v15, v16) --[[ Line: 36 ]] --[[ Name: getLayerViewItem ]]
    -- upvalues: v7 (copy), v8 (copy)
    if v7.ShowLayerID then
        v16 = v16 + 1;
    end;
    return (v8.findDeepInstance(v15, {
        "Contents", 
        "List", 
        "Child", 
        (tostring(v16))
    }));
end;
v8.getLayerViewLabel = function(v17, v18) --[[ Line: 44 ]] --[[ Name: getLayerViewLabel ]]
    -- upvalues: v8 (copy)
    local v19 = v8.getLayerViewItem(v17, v18);
    return (v8.findDeepInstance(v19, {
        "1", 
        "Left", 
        "Text"
    }));
end;
v8.getLayerViewValue = function(v20, v21) --[[ Line: 49 ]] --[[ Name: getLayerViewValue ]]
    -- upvalues: v8 (copy)
    local v22 = v8.getLayerViewItem(v20, v21);
    return (v8.findDeepInstance(v22, {
        "2", 
        "Left", 
        "Text"
    }));
end;
v8.getLayerViewTextBox = function(v23, v24) --[[ Line: 54 ]] --[[ Name: getLayerViewTextBox ]]
    -- upvalues: v8 (copy)
    local v25 = v8.getLayerViewItem(v23, v24);
    return (v8.findDeepInstance(v25, {
        "2", 
        "Left", 
        "Text", 
        "PropertyCell", 
        "Content", 
        "TextInput", 
        "Contents", 
        "TextBox"
    }));
end;
v8.getLayerViewCheckBox = function(v26, v27) --[[ Line: 62 ]] --[[ Name: getLayerViewCheckBox ]]
    -- upvalues: v8 (copy)
    local v28 = v8.getLayerViewItem(v26, v27);
    return (v8.findDeepInstance(v28, {
        "2", 
        "Left", 
        "Text", 
        "Content", 
        "Contents", 
        "TextButton"
    }));
end;
v8.getLayerViewDeleteButton = function(v29, v30) --[[ Line: 70 ]] --[[ Name: getLayerViewDeleteButton ]]
    -- upvalues: v8 (copy), v6 (copy)
    local v31 = v8.getLayerViewItem(v29, v30);
    return (v8.findDeepInstance(v31, {
        "2", 
        "Right", 
        v6.LAYERVIEW_ACTIONS.Clear
    }));
end;
v8.getLayerViewHistoryButton = function(v32, v33) --[[ Line: 75 ]] --[[ Name: getLayerViewHistoryButton ]]
    -- upvalues: v8 (copy), v6 (copy)
    local v34 = v8.getLayerViewItem(v32, v33);
    return (v8.findDeepInstance(v34, {
        "2", 
        "Right", 
        v6.LAYERVIEW_ACTIONS.History
    }));
end;
v8.getLayerTreeItem = function(v35, v36) --[[ Line: 80 ]] --[[ Name: getLayerTreeItem ]]
    -- upvalues: v8 (copy)
    return (v8.findDeepInstance(v35, {
        "List", 
        (tostring(v36))
    }));
end;
v8.getLayerPanelTab = function(v37, v38) --[[ Line: 84 ]] --[[ Name: getLayerPanelTab ]]
    -- upvalues: v8 (copy)
    return v8.findDeepInstance(v37, {
        "Tabs", 
        (tostring(v38))
    });
end;
local function v47(v39, v40, v41, v42, v43) --[[ Line: 91 ]] --[[ Name: makeHistory ]]
    -- upvalues: v5 (copy)
    local v44 = v5.new(60);
    for v45 = 1, v42 do
        local v46 = {
            layerMap = {
                [v39] = {
                    [v40] = {
                        number = math.random(), 
                        vector2 = Vector2.new(math.random(), math.random()), 
                        vector3 = Vector3.new(math.random(), math.random(), math.random())
                    }
                }
            }, 
            timestamp = (v45 - 1) * 0.1
        };
        if v46.layerMap[v39][v40][v41] == nil then
            if v43 == "number" then
                v46.layerMap[v39][v40][v41] = math.random();
            elseif v43 == "Vector2" then
                v46.layerMap[v39][v40][v41] = Vector2.new(math.random(), math.random());
            elseif v43 == "Vector3" then
                v46.layerMap[v39][v40][v41] = Vector3.new(math.random(), math.random(), math.random());
            end;
        end;
        v44:push(v46);
    end;
    return v44;
end;
v8.makeHistoryGraphProperties = function(v48, v49, v50, v51, v52) --[[ Line: 126 ]] --[[ Name: makeHistoryGraphProperties ]]
    -- upvalues: v47 (copy)
    return {
        FrameBuffer = v47(v48, v49, v50, v51, v52), 
        HistoryField = {
            id = v48, 
            section = v49, 
            field = v50
        }
    };
end;
v8.clickComponent = function(v53, v54) --[[ Line: 139 ]] --[[ Name: clickComponent ]]
    -- upvalues: v1 (copy), v3 (copy)
    v1.act(function() --[[ Line: 140 ]]
        -- upvalues: v54 (copy), v3 (ref), v53 (copy)
        for _ = 1, v54 or 1 do
            v3.fireEvent.click(v53);
        end;
    end);
end;
v8.clearText = function(v56) --[[ Line: 147 ]] --[[ Name: clearText ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v57 = v2.Element.new(v56);
    v1.act(function() --[[ Line: 149 ]]
        -- upvalues: v57 (copy)
        v57:click(2);
        v57:sendKey(Enum.KeyCode.Delete);
        task.wait(0.1);
    end);
end;
v8.sendText = function(v58, v59) --[[ Line: 156 ]] --[[ Name: sendText ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v60 = v2.Element.new(v58);
    v1.act(function() --[[ Line: 158 ]]
        -- upvalues: v60 (copy), v59 (copy)
        v60:sendText(v59);
        task.wait(0.1);
        v60:sendKey(Enum.KeyCode.Return);
        task.wait(0.1);
    end);
end;
v8.dragComponent = function(v61, v62) --[[ Line: 166 ]] --[[ Name: dragComponent ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v63 = v2.Element.new(v61):getCenter();
    v1.act(function() --[[ Line: 169 ]]
        -- upvalues: v2 (ref), v63 (copy), v62 (copy)
        v2.VirtualInput.Mouse.mouseLeftDown(v63);
        v2.VirtualInput.Mouse.mouseDrag(v63, v63 + v62, 5);
        v2.VirtualInput.Mouse.mouseLeftUp(v63);
    end);
end;
v8.getLayerViewCell = function(v64, v65, v66) --[[ Line: 177 ]] --[[ Name: getLayerViewCell ]]
    -- upvalues: v8 (copy)
    local v67 = v8.getLayerViewItem(v64, v65);
    local v68 = v8.findDeepInstance(v67, {
        tostring(v66), 
        "Left", 
        "Text"
    });
    if v68 then
        return v68.Text;
    else
        return nil;
    end;
end;
v8.checkLayerViewItemLabels = function(v69, v70, v71, v72) --[[ Line: 183 ]] --[[ Name: checkLayerViewItemLabels ]]
    -- upvalues: v8 (copy)
    local v73 = v8.getLayerViewLabel(v69, v70);
    assert(v73);
    if v73.Text ~= v71 then
        return false;
    else
        local v74 = v8.getLayerViewValue(v69, v70);
        if v72 then
            assert(v74);
            return v74.Text == v72;
        else
            return v74 == nil;
        end;
    end;
end;
v8.getBlendDots = function(v75) --[[ Line: 204 ]] --[[ Name: getBlendDots ]]
    -- upvalues: v8 (copy)
    local v76 = v8.findDeepInstance(v75, {
        "Content", 
        "1"
    });
    if not v76 then
        return {};
    else
        local v77 = {};
        for _, v79 in v76:GetChildren() do
            if v79:IsA("ImageButton") then
                v77[v79.Name] = v79;
            end;
        end;
        return v77;
    end;
end;
v8.repeatFlakyTest = function(v80, v81, v82) --[[ Line: 219 ]] --[[ Name: repeatFlakyTest ]]
    local v83 = v82 or 3;
    for v84 = 1, v83 - 1 do
        if pcall(v80) then
            return;
        else
            print(string.format("WARN: Flaky test [%d/%d]", v84, v83));
            if v81 then
                v81();
            end;
        end;
    end;
    v80();
end;
return v8;