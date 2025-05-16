return {
  { 'akinsho/toggleterm.nvim', version = "*", opts = {} },
  {
    'Shatur/neovim-session-manager',
    init = function()
      local session_manager = require('session_manager')
      local config = require('session_manager.config')
      vim.g.currentSessionMode = config.AutoloadMode.LastSession

      session_manager.setup({
        autoload_mode = vim.g.currentSessionMode
      })

      local toggle = function()
        if vim.g.currentSessionMode == config.AutoloadMode.LastSession then
          vim.g.currentSessionMode = config.AutoloadMode.Disabled
        else
          vim.g.currentSessionMode = config.AutoloadMode.LastSession
        end
        session_manager.setup({ autoload_mode = vim.g.currentSessionMode })
      end
      vim.api.nvim_create_user_command("ToggleSaveSession", toggle, {})
    end
  }
}
