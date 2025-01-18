local function _(v0, v1, v2) --[[ Line: 5 ]] --[[ Name: lerp ]]
    return v2 * v1 + (1 - v2) * v0;
end;
local function _(v4, v5, v6) --[[ Line: 9 ]] --[[ Name: inverse ]]
    if v5 <= v6 then
        return 0;
    else
        return v4 / v6;
    end;
end;
local function _(v8, v9, v10) --[[ Line: 17 ]] --[[ Name: quadratic ]]
    if v9 <= v10 then
        return 0;
    elseif v9 == v8 then
        return 0;
    else
        return (math.pow(1 - (v10 - v8) / (v9 - v8), 2));
    end;
end;
return {
    isSoundApi = function(v12) --[[ Line: 29 ]] --[[ Name: isSoundApi ]]
        if not v12 then
            return false;
        else
            return v12:IsA("Sound") or v12:IsA("SoundGroup") or v12:IsA("SoundService");
        end;
    end, 
    is3d = function(v13) --[[ Line: 37 ]] --[[ Name: is3d ]]
        if not v13 then
            return false;
        else
            return (v13.Parent and (v13.Parent:IsA("BasePart") or v13.Parent:IsA("Attachment"))) == true;
        end;
    end, 
    getDestination = function(v14) --[[ Line: 45 ]] --[[ Name: getDestination ]]
        if v14:IsA("Sound") then
            if v14.SoundGroup then
                return v14.SoundGroup;
            else
                return game:GetService("SoundService");
            end;
        elseif v14:IsA("SoundGroup") then
            if v14.Parent and v14.Parent:IsA("SoundGroup") then
                return v14.Parent;
            else
                return game:GetService("SoundService");
            end;
        else
            return nil;
        end;
    end, 
    getEffects = function(v15) --[[ Line: 63 ]] --[[ Name: getEffects ]]
        local v16 = {};
        if v15:IsA("Sound") or v15:IsA("SoundGroup") then
            for _, v18 in v15:GetChildren() do
                if v18:IsA("SoundEffect") then
                    table.insert(v16, v18);
                end;
            end;
            if #v16 > 0 then
                table.sort(v16, function(v19, v20) --[[ Line: 73 ]]
                    return v19.Priority > v20.Priority;
                end);
            end;
        end;
        return v16;
    end, 
    serializeRolloffMode = function(v21, v22, v23) --[[ Line: 83 ]] --[[ Name: serializeRolloffMode ]]
        local v24 = {};
        if v21 == Enum.RollOffMode.Linear then
            v24[v22] = 1;
            v24[v23] = 0;
            return v24;
        elseif v21 == Enum.RollOffMode.Inverse then
            for v25 = 0, 100 do
                local v26 = v25 / 100;
                local v27 = v26 * v23 + (1 - v26) * v22;
                v24[v27] = v23 <= v27 and 0 or v22 / v27;
            end;
            return v24;
        elseif v21 == Enum.RollOffMode.LinearSquare then
            for v28 = 0, 100 do
                local v29 = v28 / 100;
                local v30 = v29 * v23 + (1 - v29) * v22;
                v24[v30] = v23 <= v30 and 0 or v23 == v22 and 0 or math.pow(1 - (v30 - v22) / (v23 - v22), 2);
            end;
            return v24;
        else
            if v21 == Enum.RollOffMode.InverseTapered then
                for v31 = 0, 100 do
                    local v32 = v31 / 100;
                    local v33 = v32 * v23 + (1 - v32) * v22;
                    v24[v33] = math.min(v23 <= v33 and 0 or v22 / v33, v23 <= v33 and 0 or v23 == v22 and 0 or math.pow(1 - (v33 - v22) / (v23 - v22), 2));
                end;
            end;
            return v24;
        end;
    end, 
    makeAutoplayScript = function(v34) --[[ Line: 112 ]] --[[ Name: makeAutoplayScript ]]
        local l_Script_0 = Instance.new("Script");
        l_Script_0.Name = "AutoPlay";
        l_Script_0.Parent = v34;
        l_Script_0.Enabled = true;
        l_Script_0.RunContext = Enum.RunContext.Legacy;
        l_Script_0.Source = "script.Parent:Play()\n";
        return l_Script_0;
    end, 
    makeListenerScript = function(v36) --[[ Line: 125 ]] --[[ Name: makeListenerScript ]]
        local l_Script_1 = Instance.new("Script");
        l_Script_1.Name = "ListenerScript";
        l_Script_1.Parent = v36;
        l_Script_1.Enabled = true;
        l_Script_1.RunContext = Enum.RunContext.Client;
        l_Script_1.Source = "local listener = script.Parent\nlocal camera = workspace.CurrentCamera\nlistener.Parent = camera\n";
        return l_Script_1;
    end, 
    makeTremoloScript = function(v38) --[[ Line: 140 ]] --[[ Name: makeTremoloScript ]]
        local l_Script_2 = Instance.new("Script");
        l_Script_2.Name = "TremoloScript";
        l_Script_2.Parent = v38;
        l_Script_2.Enabled = true;
        l_Script_2.RunContext = Enum.RunContext.Client;
        l_Script_2.Source = "local fader = script.Parent\nlocal RunService = game:GetService(\"RunService\")\nlocal radians = 0\n\nlocal function getFrequency() : number\n\tlocal frequency = fader:GetAttribute(\"Frequency\") or 5\n\treturn math.clamp(frequency, 0.1, 20)\nend\n\nlocal function getDepth() : number\n\tlocal depth = fader:GetAttribute(\"Depth\") or 1\n\treturn math.clamp(depth, 0, 1)\nend\n\nlocal function getDuty() : number\n\tlocal duty = fader:GetAttribute(\"Duty\") or 0.5\n\treturn math.clamp(duty, 0, 1)\nend\n\nlocal function update(deltaTime : number)\n\tlocal volume = 1 + getDepth() * math.sin(radians)\n\tradians += math.pi * getFrequency() / 24000 * deltaTime\n\tif radians > math.pi * 2 then\n\t\tradians -= math.pi * 2\n\tend\nend\n\nRunService.Heartbeat:Connect(update)\n";
        return l_Script_2;
    end
};