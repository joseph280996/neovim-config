local handlers = require("plugins.lsp.handlers")
local get_value_on_os = require("user.utils.get-values-on-os").get_values_on_os
local jdtls = require("jdtls")

local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local jdtls_path = require("mason-registry").get_package("jdtls"):get_install_path()
local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local java_path = get_value_on_os({
  Window = "C:/Program Files/Common Files/Oracle/Java/javapath/java",
  Linux = "usr/bin/java",
}, true)

local function get_config_dir()
  return get_value_on_os(
    { Window = "config_win", Linux = "config_linux", MacOS = "config_mac" },
    false
  )
end

jdtls.start_or_attach({
  capabilities = handlers.capabilities,
  on_attach = function()
    local map = vim.keymap.set
    map("n", "gD", vim.lsp.buf.declaration, { silent = true, buffer = true })
    map("n", "gd", vim.lsp.buf.definition, { silent = true, buffer = true })
    map("n", "K", vim.lsp.buf.hover, { silent = true, buffer = true })
    map("n", "<Leader>dj", vim.diagnostic.goto_next, { buffer = true })
    map("n", "<Leader>dk", vim.diagnostic.goto_prev, { buffer = true })
    map("n", "<Leader>dl", require("telescope.builtin").diagnostics, { buffer = true })
    map("n", "<Leader>r", require("utils").rename_var, { buffer = true })
    map("n", "<Leader>c", vim.lsp.buf.code_action, { buffer = true })
  end,
  cmd = {
    java_path,
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1G",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    launcher_jar,
    "-configuration",
    vim.fs.normalize(jdtls_path .. "/" .. get_config_dir()),
    "-data",
    vim.fn.expand("~/.cache/jdtls-workspace/") .. workspace_dir,
  },
  settings = {},
  init_options = {
    extendedClientCapabilities = jdtls.extendedClientCapabilities,
  },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
})
