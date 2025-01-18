local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.JestTypes);
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local l_inspect_0 = v2.util.inspect;
local l_Set_0 = v2.Set;
local v7 = {};
local v8 = {
    bail = 0, 
    changedFilesWithAncestor = false, 
    changedSince = "", 
    ci = false, 
    collectCoverage = false, 
    collectCoverageFrom = {}, 
    collectCoverageOnlyFrom = l_Object_0.None, 
    coverageDirectory = "coverage", 
    coverageProvider = "babel", 
    coverageReporters = {}, 
    coverageThreshold = {
        global = {}
    }, 
    detectLeaks = false, 
    detectOpenHandles = false, 
    errorOnDeprecated = false, 
    expand = false, 
    filter = l_Object_0.None, 
    findRelatedTests = false, 
    forceExit = false, 
    globalSetup = l_Object_0.None, 
    globalTeardown = l_Object_0.None, 
    json = false, 
    lastCommit = false, 
    listTests = false, 
    logHeapUsage = false, 
    maxConcurrency = 5, 
    maxWorkers = 2, 
    noSCM = l_Object_0.None, 
    noStackTrace = false, 
    nonFlagArgs = {}, 
    notify = false, 
    notifyMode = "failure-change", 
    onlyChanged = false, 
    onlyFailures = false, 
    outputFile = l_Object_0.None, 
    passWithNoTests = false, 
    projects = {}, 
    replname = l_Object_0.None, 
    reporters = {}, 
    rootDir = "/test_root_dir/", 
    runTestsByPath = false, 
    silent = false, 
    skipFilter = false, 
    snapshotFormat = {}, 
    testFailureExitCode = 1, 
    testNamePattern = "", 
    testPathPattern = "", 
    testResultsProcessor = l_Object_0.None, 
    testSequencer = "@jest/test-sequencer", 
    testTimeout = 5000, 
    updateSnapshot = "none", 
    useStderr = false, 
    verbose = false, 
    watch = false, 
    watchAll = false, 
    watchPlugins = {}, 
    watchman = false
};
local v9 = {
    automock = false, 
    cache = false, 
    clearMocks = false, 
    coveragePathIgnorePatterns = {}, 
    cwd = "/test_root_dir/", 
    detectLeaks = false, 
    detectOpenHandles = false, 
    displayName = l_Object_0.None, 
    errorOnDeprecated = false, 
    extensionsToTreatAsEsm = {}, 
    fakeTimers = {
        enableGlobally = false
    }, 
    filter = l_Object_0.None, 
    forceCoverageMatch = {}, 
    globalSetup = l_Object_0.None, 
    globalTeardown = l_Object_0.None, 
    globals = {}, 
    haste = {}, 
    id = "test_name", 
    injectGlobals = true, 
    moduleDirectories = {}, 
    moduleFileExtensions = {
        "js"
    }, 
    moduleNameMapper = {}, 
    modulePathIgnorePatterns = {}, 
    modulePaths = {}, 
    prettierPath = "prettier", 
    resetMocks = false, 
    resetModules = false, 
    resolver = l_Object_0.None, 
    restoreMocks = false, 
    rootDir = "/test_root_dir/", 
    roots = {}, 
    runner = "jest-runner", 
    runtime = "/test_module_loader_path", 
    sandboxInjectedGlobals = {}, 
    setupFiles = {}, 
    setupFilesAfterEnv = {}, 
    skipFilter = false, 
    skipNodeResolution = false, 
    slowTestThreshold = 5, 
    snapshotFormat = {}, 
    snapshotResolver = l_Object_0.None, 
    snapshotSerializers = {}, 
    testEnvironment = l_Parent_0.JestEnvironmentLuau, 
    testEnvironmentOptions = {}, 
    testLocationInResults = false, 
    testMatch = {}, 
    testPathIgnorePatterns = {}, 
    testRegex = {
        "\\.test\\.js$"
    }, 
    testRunner = "jest-circus/runner", 
    testURL = "http =//localhost", 
    timers = "real", 
    transform = {}, 
    transformIgnorePatterns = {}, 
    unmockedModulePathPatterns = l_Object_0.None, 
    watchPathIgnorePatterns = {}
};
v7.makeGlobalConfig = function(v10) --[[ Line: 144 ]]
    -- upvalues: l_Set_0 (copy), l_Object_0 (copy), l_Array_0 (copy), v8 (copy), l_inspect_0 (copy)
    local v11 = v10 or {};
    local v12 = l_Set_0.new(l_Object_0.keys(v11));
    l_Array_0.forEach(l_Object_0.keys(v8), function(v13) --[[ Line: 148 ]]
        -- upvalues: v12 (copy)
        v12:delete(v13);
    end);
    if v12.size > 0 then
        error("Properties that are not part of GlobalConfig type were passed:" .. l_inspect_0(l_Array_0.from(v12)));
    end;
    return l_Object_0.assign({}, v8, v11);
end;
v7.makeProjectConfig = function(v14) --[[ Line: 159 ]]
    -- upvalues: l_Set_0 (copy), l_Object_0 (copy), l_Array_0 (copy), v9 (copy), l_inspect_0 (copy)
    v14 = v14 or {};
    local v15 = l_Set_0.new(l_Object_0.keys(v14));
    l_Array_0.forEach(l_Object_0.keys(v9), function(v16) --[[ Line: 163 ]]
        -- upvalues: v15 (copy)
        v15:delete(v16);
    end);
    if v15.size > 0 then
        error("Properties that are not part of ProjectConfig type were passed:" .. l_inspect_0(l_Array_0.from(v15)));
    end;
    return l_Object_0.assign({}, v9, v14);
end;
return v7;