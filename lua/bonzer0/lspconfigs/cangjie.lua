local M = {}

-- My ancestors are disgusted of me for those actions
local function parse_toml(toml_path, root_dir)
    local pkg_name = vim.fs.basename(root_dir)
    local f = vim.uv.fs_open(toml_path, "r", 438)

    if f then
        local stat = vim.uv.fs_fstat(f)
        if stat then
            local data = vim.uv.fs_read(f, stat.size, 0)
            if data then
                for v in tostring(data):gmatch('name%s*=%s*"([%w_]+)"') do
                    pkg_name = v
                end
            end
        end
        vim.uv.fs_close(f)
    end

    -- TODO: requires, deps, bin-deps
    return {
        pkg_name = pkg_name
    }
end

local function MakeInitializationOptions(root_dir, pkg_name)
    local j = vim.fs.joinpath
    local prj = function(name)
        return j(root_dir, name)
    end

    local root_uri = vim.uri_from_fname(root_dir)
    local mm = {}
    mm[root_uri] = {
        name = pkg_name,
        package_requires = {
            package_option = vim.empty_dict(),
            path_option = {}
        },
        requires = vim.empty_dict()
    }

    return {
        multiModuleOption = mm,
        targetLib = prj(j("target/release"))
    }
end


local function PathSplit(path)
    local result = {}

    if path ~= nil then
        for x in string.gmatch(path, "[^:]+") do
            if string.len(x) > 0 then
                table.insert(result, x)
            end
        end
    end

    return result
end

local function CollectPaths(root_dir, pkg_name, sdk_path)
    local j = vim.fs.joinpath()
    local sdk = function(name)
        if sdk_path == nil then
            return name
        end
        return j(sdk_path, name)
    end
    local prj = function(name)
        return j(root_dir, name)
    end

    local existing_paths = PathSplit(os.getenv('PATH'))
    local initial_libs = {
        sdk("runtime/lib/linux_x86_64_cjnative"),
        sdk("tools/lib"),
        prj(j("target/release")),
        prj(j("target/release", pkg_name))
    }
    local initial_paths = {
        sdk("bin"),
        sdk("tools/bin"),
        unpack(initial_libs),
        unpack(existing_paths)
    }

    return {
        CANGJIE_HOME = (sdk_path or "."),
        PATH = table.concat(initial_paths, ":"),
        LD_LIBRARY_PATH = table.concat(initial_libs, ":")
    }
end

function OnNewConfig(new_config, new_root_dir, sdk_path)
    local toml_path = vim.fs.joinpath(new_root_dir, "cjpm.toml")
    local toml = parse_toml(toml_path)


    local lsp_path = "LSPServer"
    if sdk_path == nil then
        print("[WARNING]: no CANGJIE_HOME found, LSPServer will unlikely work")
    else
        lsp_path = sdk_path .. "/tools/bin/LSPServer"
    end

    new_config.cmd = { lsp_path, "src", "-V", "--disableAutoImport", "--enable-log=false" }

    for k, v in pairs(CollectPaths(new_root_dir, toml.pkg_name, sdk_path)) do
        new_config.cmd_env[k] = v
    end

    new_config.init_options = MakeInitializationOptions(new_root_dir, toml.pkg_name)
    return new_config
end

function M.CangjieConfig()
    local sdk_path = os.getenv("CANGJIE_HOME")
    if sdk_path == nil then
        print("[ERROR]: no CANGJIE_HOME found, LSP server is disabled")
        return { defauld_config = { cmd = { 'true' } }, enabled = false }
    end

    ---@type vim.lsp.Config
    return {
        cmd = { "LSPServer", "--unconfigured" },
        name = 'Cangjie',
        filetypes = { 'cangjie' },
        get_language_id =function (_, _)
            return "Cangjie"
        end,
        root_markers = { 'cjpm.toml', '.git' },
        init_options = { },
        offset_encoding = 'utf-8',
        settings = {
            Cangjie = { }
        },
        on_new_config = function (new_config, new_root_dir)
            return OnNewConfig(new_config, new_root_dir, sdk_path)
        end
    }
end

vim.lsp.config('cangjie', M.CangjieConfig())
