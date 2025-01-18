local v0 = {};
local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v2 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIFixStreamCreationTiming);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIFixEmptyBubbleBug);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIFixSpamOnReload);
local v5 = {};
local v6 = {};
local v7 = {};
local v8 = "";
v0.newRequest = function(v9) --[[ Line: 25 ]] --[[ Name: newRequest ]]
    -- upvalues: v5 (ref), v6 (ref)
    v5[v9] = {};
    v6[v9] = {};
end;
v0.activeStreamId = function() --[[ Line: 30 ]] --[[ Name: activeStreamId ]]
    -- upvalues: v8 (ref)
    return v8;
end;
v0.setActiveStreamId = function(v10) --[[ Line: 34 ]] --[[ Name: setActiveStreamId ]]
    -- upvalues: v8 (ref)
    v8 = v10;
end;
v0.requestStreamSubscription = function(v11, v12, v13, v14, v15, v16) --[[ Line: 43 ]] --[[ Name: requestStreamSubscription ]]
    -- upvalues: v5 (ref), v7 (ref), v6 (ref), v8 (ref)
    v5[v11][v12] = {};
    v7[v12] = {
        handlePacket = v14, 
        startActiveStream = v15, 
        streamEnded = v16
    };
    if v13 then
        table.insert(v6[v11], v12);
        if v8 == "" then
            v8 = v12;
            v15(v11);
        end;
    end;
end;
v0.storeStreamPacket = function(v17, v18, v19) --[[ Line: 68 ]] --[[ Name: storeStreamPacket ]]
    -- upvalues: v2 (copy), v5 (ref)
    if v2() then
        assert(not v5[v17].RequestEnded, "Cannot store packets after the request has ended");
    end;
    table.insert(v5[v17][v18], v19);
end;
local function _(v20) --[[ Line: 75 ]] --[[ Name: _clearRequestData ]]
    -- upvalues: v2 (copy), v5 (ref), v6 (ref), v8 (ref)
    assert(v2(), "This function should only be called when FFlagConvAIFixStreamCreationTiming is enabled");
    v5[v20] = nil;
    v6[v20] = nil;
    v8 = "";
end;
v0.activeStreamEnded = function(v22, v23) --[[ Line: 85 ]] --[[ Name: activeStreamEnded ]]
    -- upvalues: v7 (ref), v8 (ref), v5 (ref), v6 (ref), v2 (copy)
    if v7[v23].streamEnded then
        v7[v23].streamEnded();
    end;
    v8 = "";
    v5[v22][v23] = nil;
    v7[v23] = nil;
    table.remove(v6[v22], 1);
    local v24 = v6[v22][1];
    if v24 then
        v8 = v24;
        v7[v24].startActiveStream(v22);
    elseif v2() and v5[v22].RequestEnded then
        assert(v2(), "This function should only be called when FFlagConvAIFixStreamCreationTiming is enabled");
        v5[v22] = nil;
        v6[v22] = nil;
        v8 = "";
        return nil;
    end;
    return v6[v22][1];
end;
v0.isRequestEnded = function(v25) --[[ Line: 109 ]] --[[ Name: isRequestEnded ]]
    -- upvalues: v3 (copy), v5 (ref)
    assert(v3(), "This function should only be called when FFlagConvAIFixEmptyBubbleBug is enabled");
    return not v5[v25] or v5[v25].RequestEnded;
end;
v0.packetExists = function(v26, v27) --[[ Line: 117 ]] --[[ Name: packetExists ]]
    -- upvalues: v5 (ref)
    if v5[v26][v27] and #v5[v26][v27] > 0 then
        return true;
    else
        return false;
    end;
end;
v0.handleEarliestPacketForStream = function(v28, v29) --[[ Line: 124 ]] --[[ Name: handleEarliestPacketForStream ]]
    -- upvalues: v5 (ref), v7 (ref)
    local v30 = table.remove(v5[v28][v29], 1);
    if v7[v29].handlePacket then
        v7[v29].handlePacket(v30);
    end;
    return v30;
end;
v0.requestEnded = function(v31) --[[ Line: 132 ]] --[[ Name: requestEnded ]]
    -- upvalues: v2 (copy), v4 (copy), v5 (ref), v3 (copy), v0 (copy), v6 (ref), v8 (ref)
    if v2() then
        if v4() and not v5[v31] then
            return;
        else
            v5[v31].RequestEnded = nil;
            local v32 = next(v5[v31]) == nil;
            if v3() then
                v32 = true;
                for v33, _ in v5[v31] do
                    if v0.packetExists(v31, v33) then
                        v32 = false;
                        break;
                    end;
                end;
            end;
            if v32 then
                assert(v2(), "This function should only be called when FFlagConvAIFixStreamCreationTiming is enabled");
                v5[v31] = nil;
                v6[v31] = nil;
                v8 = "";
                return;
            else
                v5[v31].RequestEnded = true;
                return;
            end;
        end;
    else
        v5[v31] = nil;
        v6[v31] = nil;
        v8 = "";
        return;
    end;
end;
v0.clear = function() --[[ Line: 163 ]] --[[ Name: clear ]]
    -- upvalues: v5 (ref), v6 (ref), v7 (ref), v8 (ref)
    v5 = {};
    v6 = {};
    v7 = {};
    v8 = "";
end;
v0.getStreamCache = function() --[[ Line: 170 ]] --[[ Name: getStreamCache ]]
    -- upvalues: v5 (ref)
    return v5;
end;
return v0;