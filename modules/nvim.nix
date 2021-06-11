{ pkgs, inputs, ... }:
{
	home.packages = with pkgs; [
		gopls
		neovim-nightly
	];

	xdg.configFile."nvim/init.lua".source = ../configs/nvim/init.lua;
}
