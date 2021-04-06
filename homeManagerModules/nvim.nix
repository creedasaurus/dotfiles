{ pkgs, inputs, ... }:
{
	programs.neovim = {
		enable = true;
		viAlias = true;
    	vimAlias = true;
		package = pkgs.neovim-nightly;

		withPython3 = true;

		# extraConfig = builtins.readFile ../config/nvim/init.vim;
	};
}
