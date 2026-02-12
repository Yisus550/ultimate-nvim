local M = {}

function M.setup()
  local jdtls = require("jdtls")
  local lsp_utils = require("lsp_utils")

  -- Get the Mason installation path
  local mason_path = vim.fn.stdpath("data") .. "/mason"
  local jdtls_path = mason_path .. "/packages/jdtls"

  -- Dynamically find Java Debug and Test JARs using wildcards
  local function get_bundles()
    local bundles = {}

    -- Java Debug Adapter JARs
    local java_debug_path = mason_path .. "/packages/java-debug-adapter/extension/server"
    local java_debug_jars = vim.fn.glob(java_debug_path .. "/*.jar", true, true)
    vim.list_extend(bundles, java_debug_jars)

    -- Java Test JARs
    local java_test_path = mason_path .. "/packages/java-test/extension/server"
    local java_test_jars = vim.fn.glob(java_test_path .. "/*.jar", true, true)
    vim.list_extend(bundles, java_test_jars)

    return bundles
  end

  -- Determine the OS-specific config directory
  local function get_jdtls_config_dir()
    if vim.fn.has("mac") == 1 then
      return jdtls_path .. "/config_mac"
    elseif vim.fn.has("unix") == 1 then
      return jdtls_path .. "/config_linux"
    else
      return jdtls_path .. "/config_win"
    end
  end

  -- Per-project workspace directory
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

  -- Find the Java executable
  local java_cmd = "java"
  if os.getenv("JAVA_HOME") then
    java_cmd = os.getenv("JAVA_HOME") .. "/bin/java"
  end

  -- Extended capabilities for nvim-cmp and nvim-ufo
  local extendedClientCapabilities = jdtls.extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

  local config = {
    cmd = {
      java_cmd,
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-Xms1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens",
      "java.base/java.util=ALL-UNNAMED",
      "--add-opens",
      "java.base/java.lang=ALL-UNNAMED",
      "-jar",
      vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
      "-configuration",
      get_jdtls_config_dir(),
      "-data",
      workspace_dir,
    },
    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
    settings = {
      java = {
        eclipse = {
          downloadSources = true,
        },
        configuration = {
          updateBuildConfiguration = "interactive",
        },
        maven = {
          downloadSources = true,
        },
        implementationsCodeLens = {
          enabled = true,
        },
        referencesCodeLens = {
          enabled = true,
        },
        references = {
          includeDecompiledSources = true,
        },
        format = {
          enabled = true,
          settings = {
            url = vim.fn.stdpath("config") .. "/lang_servers/intellij-java-google-style.xml",
            profile = "GoogleStyle",
          },
        },
        signatureHelp = { enabled = true },
        contentProvider = { preferred = "fernflower" },
        completion = {
          favoriteStaticMembers = {
            "org.hamcrest.MatcherAssert.assertThat",
            "org.hamcrest.Matchers.*",
            "org.hamcrest.CoreMatchers.*",
            "org.junit.jupiter.api.Assertions.*",
            "java.util.Objects.requireNonNull",
            "java.util.Objects.requireNonNullElse",
            "org.mockito.Mockito.*",
          },
          importOrder = {
            "java",
            "javax",
            "com",
            "org",
          },
        },
        sources = {
          organizeImports = {
            starThreshold = 9999,
            staticStarThreshold = 9999,
          },
        },
        codeGeneration = {
          toString = {
            template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
          },
          useBlocks = true,
        },
      },
    },
    flags = {
      allow_incremental_sync = true,
    },
    capabilities = lsp_utils.get_default_capabilities(),
    init_options = {
      bundles = get_bundles(),
      extendedClientCapabilities = extendedClientCapabilities,
    },
    on_attach = function(client, bufnr)
      -- Enable jdtls-specific features
      jdtls.setup_dap({ hotcodereplace = "auto" })

      -- Organize imports on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.code_action({
            context = { only = { "source.organizeImports" } },
            apply = true,
          })
        end,
      })

      -- Java-specific keymaps
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "<leader>jo", jdtls.organize_imports, vim.tbl_extend("force", opts, { desc = "Organize imports" }))
      vim.keymap.set("n", "<leader>jv", jdtls.extract_variable, vim.tbl_extend("force", opts, { desc = "Extract variable" }))
      vim.keymap.set("v", "<leader>jv", function()
        jdtls.extract_variable({ visual = true })
      end, vim.tbl_extend("force", opts, { desc = "Extract variable" }))
      vim.keymap.set("n", "<leader>jc", jdtls.extract_constant, vim.tbl_extend("force", opts, { desc = "Extract constant" }))
      vim.keymap.set("v", "<leader>jc", function()
        jdtls.extract_constant({ visual = true })
      end, vim.tbl_extend("force", opts, { desc = "Extract constant" }))
      vim.keymap.set("v", "<leader>jm", function()
        jdtls.extract_method({ visual = true })
      end, vim.tbl_extend("force", opts, { desc = "Extract method" }))
      vim.keymap.set("n", "<leader>jtc", jdtls.test_class, vim.tbl_extend("force", opts, { desc = "Test class" }))
      vim.keymap.set("n", "<leader>jtm", jdtls.test_nearest_method, vim.tbl_extend("force", opts, { desc = "Test method" }))
    end,
  }

  return config
end

return M
