local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(script.Parent.TutorialStep);
local l_some_0 = require(l_Parent_0.Packages.Dash).some;
local v3 = v1.extend("Input");
v3.showComplete = true;
v3.bind = function(v4) --[[ Line: 11 ]] --[[ Name: bind ]]
    local l_UserInputService_0 = v4.tutorial.dataModel:GetService("UserInputService");
    v4.keys = {};
    if v4.data.keys then
        v4.hasKeys = true;
        for _, v7 in ipairs(v4.data.keys) do
            v4.keys[v7] = false;
        end;
    end;
    v4.inputs = {};
    if v4.data.inputs then
        v4.hasInputs = true;
        for _, v9 in ipairs(v4.data.inputs) do
            v4.inputs[v9] = false;
        end;
    end;
    v4.inputBeganConnection = l_UserInputService_0.InputBegan:Connect(function(v10) --[[ Line: 31 ]]
        -- upvalues: v4 (copy)
        if v10.UserInputType == Enum.UserInputType.Keyboard then
            if v4.keys[v10.KeyCode] == false then
                v4.keys[v10.KeyCode] = true;
                v4.tutorial.onKeyPressed(v10.KeyCode);
                v4:update();
                return;
            end;
        elseif v4.inputs[v10.UserInputType] == false then
            v4.inputs[v10.UserInputType] = true;
            v4:update();
        end;
    end);
    v4.inputChangedConnection = l_UserInputService_0.InputChanged:Connect(function(v11) --[[ Line: 44 ]]
        -- upvalues: v4 (copy)
        if v11.UserInputType == Enum.UserInputType.Keyboard then
            if v4.keys[v11.KeyCode] == false then
                v4.keys[v11.KeyCode] = true;
                v4:update();
                return;
            end;
        elseif v4.inputs[v11.UserInputType] == false then
            v4.inputs[v11.UserInputType] = true;
            v4:update();
        end;
    end);
end;
v3.update = function(v12) --[[ Line: 57 ]] --[[ Name: update ]]
    -- upvalues: l_some_0 (copy)
    if v12.hasKeys and not l_some_0(v12.keys, function(v13) --[[ Line: 58 ]]
        return v13 == false;
    end) then
        v12:complete();
    end;
    if v12.hasInputs and not l_some_0(v12.inputs, function(v14) --[[ Line: 63 ]]
        return v14 == false;
    end) then
        v12:complete();
    end;
end;
v3.unbind = function(v15) --[[ Line: 70 ]] --[[ Name: unbind ]]
    v15.inputBeganConnection:Disconnect();
    v15.inputChangedConnection:Disconnect();
end;
return v3;