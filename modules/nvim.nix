{ pkgs, inputs, ... }:
{
	home.packages = with pkgs; [
		gopls
		neovim-nightly
	];

	# programs.neovim = {
	# 	enable = true;
	# 	viAlias = true;
    # 	vimAlias = true;
	# 	package = pkgs.neovim-nightly;

	# 	withPython3 = true;

	# };

	xdg.configFile."nvim/init.lua".source = ../configs/nvim/init.lua;
}
