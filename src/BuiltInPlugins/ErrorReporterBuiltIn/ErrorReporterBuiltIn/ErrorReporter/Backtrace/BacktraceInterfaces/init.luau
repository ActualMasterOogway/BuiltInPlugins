local l_Parent_0 = script.Parent.Parent.Parent;
local l_t_0 = require(l_Parent_0.Packages.Framework).Util.Typecheck.t;
local v2 = l_t_0.strictInterface({
    guessed_frame = l_t_0.optional(l_t_0.boolean), 
    funcName = l_t_0.optional(l_t_0.string), 
    address = l_t_0.optional(l_t_0.string), 
    line = l_t_0.optional(l_t_0.string), 
    column = l_t_0.optional(l_t_0.string), 
    sourceCode = l_t_0.optional(l_t_0.string), 
    library = l_t_0.optional(l_t_0.string), 
    debug_identifier = l_t_0.optional(l_t_0.string), 
    faulted = l_t_0.optional(l_t_0.boolean), 
    registers = l_t_0.optional(l_t_0.map(l_t_0.string, l_t_0.some(l_t_0.string, l_t_0.number)))
});
local v3 = l_t_0.strictInterface({
    name = l_t_0.optional(l_t_0.string), 
    fault = l_t_0.optional(l_t_0.boolean), 
    stack = l_t_0.optional(l_t_0.array(v2))
});
local v4 = l_t_0.strictInterface({
    name = l_t_0.string, 
    registers = l_t_0.map(l_t_0.string, l_t_0.string)
});
local v5 = l_t_0.strictInterface({
    text = l_t_0.optional(l_t_0.string), 
    startLine = l_t_0.optional(l_t_0.number), 
    startColumn = l_t_0.optional(l_t_0.number), 
    startPos = l_t_0.optional(l_t_0.number), 
    path = l_t_0.optional(l_t_0.string), 
    tabWidth = l_t_0.optional(l_t_0.number)
});
local v6 = l_t_0.strictInterface({
    read = l_t_0.boolean, 
    write = l_t_0.boolean, 
    exec = l_t_0.boolean
});
local v7 = l_t_0.strictInterface({
    start = l_t_0.string, 
    size = l_t_0.optional(l_t_0.number), 
    data = l_t_0.optional(l_t_0.string), 
    perms = l_t_0.optional(v6)
});
local v8 = l_t_0.strictInterface({
    start = l_t_0.string, 
    size = l_t_0.number, 
    code_file = l_t_0.optional(l_t_0.string), 
    version = l_t_0.optional(l_t_0.string), 
    debug_file = l_t_0.optional(l_t_0.string), 
    debug_identifier = l_t_0.optional(l_t_0.string), 
    debug_file_exists = l_t_0.optional(l_t_0.boolean)
});
local v9 = l_t_0.optional(l_t_0.map(l_t_0.string, l_t_0.some(l_t_0.string, l_t_0.number, l_t_0.boolean)));
local function v17(v10) --[[ Line: 64 ]]
    -- upvalues: l_t_0 (copy)
    local function v11(v12) --[[ Line: 65 ]] --[[ Name: checkTypeRecursive ]]
        -- upvalues: v11 (copy), l_t_0 (ref)
        if type(v12) == "table" then
            for v13, v14 in pairs(v12) do
                local v15, v16 = v11(v14);
                if not v15 then
                    return false, string.format("error when checking key: %s - %s", v13, v16);
                end;
            end;
            return true;
        else
            return l_t_0.some(l_t_0.string, l_t_0.number, l_t_0.boolean)(v12);
        end;
    end;
    return v11(v10);
end;
local v18 = l_t_0.optional(l_t_0.map(l_t_0.string, v17));
local v27 = l_t_0.intersection(l_t_0.strictInterface({
    uuid = l_t_0.string, 
    timestamp = l_t_0.number, 
    lang = l_t_0.string, 
    langVersion = l_t_0.string, 
    agent = l_t_0.string, 
    agentVersion = l_t_0.string, 
    threads = l_t_0.map(l_t_0.string, v3), 
    mainThread = l_t_0.string, 
    attributes = v9, 
    annotations = v18, 
    symbolication = l_t_0.optional(l_t_0.literal("minidump")), 
    entryThread = l_t_0.optional(l_t_0.string), 
    arch = l_t_0.optional(v4), 
    fingerprint = l_t_0.optional(l_t_0.string), 
    classifiers = l_t_0.optional(l_t_0.array(l_t_0.string)), 
    sourceCode = l_t_0.optional(l_t_0.map(l_t_0.string, v5)), 
    memory = l_t_0.optional(l_t_0.array(v7)), 
    modules = l_t_0.optional(l_t_0.array(v8))
}), function(v19) --[[ Line: 109 ]]
    local v20 = false;
    local l_threads_0 = v19.threads;
    for _, v23 in pairs(l_threads_0) do
        local l_stack_0 = v23.stack;
        if l_stack_0 ~= nil then
            for _, v26 in ipairs(l_stack_0) do
                if v26.registers ~= nil then
                    v20 = true;
                    break;
                end;
            end;
        end;
        if v20 then
            break;
        end;
    end;
    if v20 and v19.arch == nil then
        return false, "arch must exist if you want to have registers in the stack";
    else
        return true;
    end;
end);
local v28 = l_t_0.strictInterface({
    networking = l_t_0.interface({
        request = l_t_0.callback, 
        post = l_t_0.callback
    }), 
    accessToken = l_t_0.string, 
    processErrorReportMethod = l_t_0.optional(l_t_0.callback), 
    queueOptions = l_t_0.optional(l_t_0.strictInterface({
        queueTimeLimit = l_t_0.optional(l_t_0.numberPositive), 
        queueErrorLimit = l_t_0.optional(l_t_0.numberPositive), 
        queueKeyLimit = l_t_0.optional(l_t_0.numberPositive)
    })), 
    generateLogMethod = l_t_0.optional(l_t_0.callback), 
    logIntervalInSeconds = l_t_0.optional(l_t_0.numberPositive)
});
return {
    IBacktraceStack = v2, 
    IBacktraceThread = v3, 
    IArch = v4, 
    ISourceCode = v5, 
    IPerm = v6, 
    IMemory = v7, 
    IModule = v8, 
    IAttributes = v9, 
    IAnnotation = v17, 
    IAnnotations = v18, 
    IBacktraceReport = v27, 
    IBacktraceReporter = v28
};