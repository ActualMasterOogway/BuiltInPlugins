local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_keys_0 = require(l_Parent_1.Dash).keys;
local l_Util_0 = l_Parent_0.Util;
local v4 = require(l_Util_0.Constants);
local v5 = {};
v5.__index = v5;
v5.new = function(v6) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), l_keys_0 (copy), v4 (copy)
    local v7 = setmetatable({}, v5);
    local v8 = nil;
    local v9 = nil;
    local v10 = nil;
    local function v11() --[[ Line: 29 ]] --[[ Name: folderChangedWrapper ]]
        -- upvalues: v10 (ref)
        if v10 then
            v10();
        end;
    end;
    local function _() --[[ Line: 35 ]] --[[ Name: _connect ]]
        -- upvalues: v8 (ref), v7 (copy), v11 (copy), v9 (ref)
        v8 = v7.controlPointAdornees.ControlPoints.Instance.AncestryChanged:Connect(v11);
        v9 = v7.controlPointAdornees.ControlPoints.Instance.ChildRemoved:Connect(v11);
    end;
    v7.controlPointAdornees = {};
    v7.meshNames = l_keys_0(v6:getVertexData());
    v7.context = v6;
    v7.getAdornee = function(v13, v14) --[[ Line: 48 ]] --[[ Name: getAdornee ]]
        if not v13.controlPointAdornees or not v13.controlPointAdornees.ControlPoints or not v13.controlPointAdornees.ControlPoints.Children then
            error("No Adornees exist.");
            return;
        else
            local l_Children_0 = v13.controlPointAdornees.ControlPoints.Children;
            if l_Children_0[v14] and l_Children_0[v14].Instance then
                return l_Children_0[v14].Instance;
            else
                return;
            end;
        end;
    end;
    v7.render = function(v16, v17) --[[ Line: 64 ]] --[[ Name: render ]]
        -- upvalues: v10 (ref), v4 (ref), v8 (ref), v7 (copy), v11 (copy), v9 (ref)
        if v17 then
            v10 = v17.FolderChangedCallback;
        end;
        if next(v16.controlPointAdornees) == nil or v16.controlPointAdornees.ControlPoints == nil or v16.controlPointAdornees.ControlPoints.Instance == nil then
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Parent = game.Workspace;
            l_Folder_0.Name = v4.ToolAdorneesFolderName;
            local l_l_Folder_0_0 = l_Folder_0 --[[ copy: 2 -> 11 ]];
            l_Folder_0:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 76 ]]
                -- upvalues: l_l_Folder_0_0 (copy), v4 (ref)
                if l_l_Folder_0_0.Name ~= v4.ToolAdorneesFolderName then
                    l_l_Folder_0_0.Name = v4.ToolAdorneesFolderName;
                end;
            end);
            l_Folder_0.Archivable = false;
            v16.controlPointAdornees = {
                ControlPoints = {
                    Instance = l_Folder_0, 
                    Children = {}
                }
            };
            v8 = v7.controlPointAdornees.ControlPoints.Instance.AncestryChanged:Connect(v11);
            v9 = v7.controlPointAdornees.ControlPoints.Instance.ChildRemoved:Connect(v11);
        end;
        local l_Instance_0 = v16.controlPointAdornees.ControlPoints.Instance;
        local l_Children_1 = v16.controlPointAdornees.ControlPoints.Children;
        for _, v23 in pairs(v16.meshNames) do
            local v24 = v16.context:getMeshOrigin(v23);
            local v25 = l_Children_1[v23];
            do
                local l_v25_0 = v25;
                if not l_v25_0 or not l_v25_0.Instance then
                    l_v25_0 = Instance.new("Part", l_Instance_0);
                    l_v25_0.Name = v23;
                    l_v25_0:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 99 ]]
                        -- upvalues: l_v25_0 (ref), v23 (copy)
                        if l_v25_0.Name ~= v23 then
                            l_v25_0.Name = v23;
                        end;
                    end);
                    l_v25_0.CFrame = v24;
                    l_v25_0.Transparency = 1;
                    l_v25_0.CanCollide = false;
                    l_v25_0.Archivable = false;
                    l_Children_1[v23] = {
                        Instance = l_v25_0
                    };
                end;
            end;
        end;
    end;
    v7.disconnect = function(_) --[[ Line: 115 ]] --[[ Name: disconnect ]]
        -- upvalues: v8 (ref), v9 (ref)
        if v8 then
            v8:Disconnect();
            v8 = nil;
        end;
        if v9 then
            v9:Disconnect();
            v9 = nil;
        end;
    end;
    v7.cleanup = function(v28) --[[ Line: 126 ]] --[[ Name: cleanup ]]
        v28:disconnect();
        if v28.controlPointAdornees and v28.controlPointAdornees.ControlPoints then
            local l_Instance_1 = v28.controlPointAdornees.ControlPoints.Instance;
            if l_Instance_1 then
                l_Instance_1:Destroy();
            end;
            v28.controlPointAdornees = {};
            v28.meshNames = {};
            v28.context = nil;
        end;
    end;
    return v7;
end;
return v5;