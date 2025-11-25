{pkgs, inputs, ...}: {
# kinda barebones lol
	hardware.bluetooth = {
		enable = true;
	};

	services.blueman = {
		enable = true;
	};
}
